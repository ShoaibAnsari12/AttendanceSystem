using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AttendanceSystem
{
    public partial class Reports : System.Web.UI.Page
    {
        // Global connection string
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Fill the subjects dropdown on first load
                LoadSubjects();
                // Default visibility: Show subject and month for 'Subject Wise'
                divSubject.Visible = true;
                divMonth.Visible = true;
            }
        }

        private void LoadSubjects()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT SubjectId, SubjectName FROM Subjects", con);
                con.Open();
                ddlSubjects.DataSource = cmd.ExecuteReader();
                ddlSubjects.DataTextField = "SubjectName";
                ddlSubjects.DataValueField = "SubjectId";
                ddlSubjects.DataBind();
                ddlSubjects.Items.Insert(0, new ListItem("-- Select Subject --", "0"));
            }
        }

        // Logic to hide/show dropdowns based on report type
        protected void ddlReportType_SelectedIndexChanged(object sender, EventArgs e)
        {
            string type = ddlReportType.SelectedValue;
            divSubject.Visible = (type == "Subject");
            divMonth.Visible = (type == "Subject" || type == "Monthly");
        }

        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "";
                string reportType = ddlReportType.SelectedValue;

                // FIXED: Using consistent column names for gvReport binding
                if (reportType == "Subject")
                {
                    query = @"SELECT s.RollNo, s.FullName, 
                              COUNT(a.AttendanceId) as TotalClasses,
                              SUM(CASE WHEN a.Status = 'Present' THEN 1 ELSE 0 END) as AttendedSoFar,
                              ROUND((CAST(SUM(CASE WHEN a.Status = 'Present' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(a.AttendanceId) * 100), 2) as [Percentage]
                              FROM Students s
                              JOIN Attendance a ON s.StudentId = a.StudentId
                              WHERE a.SubjectId = @SubID AND MONTH(a.AttendanceDate) = @Month
                              GROUP BY s.RollNo, s.FullName";
                }
                else if (reportType == "Monthly")
                {
                    query = @"SELECT s.RollNo, s.FullName, 
                              COUNT(a.AttendanceId) as TotalClasses,
                              SUM(CASE WHEN a.Status = 'Present' THEN 1 ELSE 0 END) as AttendedSoFar,
                              ROUND((CAST(SUM(CASE WHEN a.Status = 'Present' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(a.AttendanceId) * 100), 2) as [Percentage]
                              FROM Students s
                              JOIN Attendance a ON s.StudentId = a.StudentId
                              WHERE MONTH(a.AttendanceDate) = @Month
                              GROUP BY s.RollNo, s.FullName";
                }
                else // Overall
                {
                    query = @"SELECT s.RollNo, s.FullName, 
                              COUNT(a.AttendanceId) as TotalClasses,
                              SUM(CASE WHEN a.Status = 'Present' THEN 1 ELSE 0 END) as AttendedSoFar,
                              ROUND((CAST(SUM(CASE WHEN a.Status = 'Present' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(a.AttendanceId) * 100), 2) as [Percentage]
                              FROM Students s
                              JOIN Attendance a ON s.StudentId = a.StudentId
                              GROUP BY s.RollNo, s.FullName";
                }

                SqlCommand cmd = new SqlCommand(query, con);

                // FIXED: Parameters added based on logic
                if (reportType == "Subject")
                    cmd.Parameters.AddWithValue("@SubID", ddlSubjects.SelectedValue);

                if (reportType == "Subject" || reportType == "Monthly")
                    cmd.Parameters.AddWithValue("@Month", ddlMonth.SelectedValue);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvReport.DataSource = dt;
                gvReport.DataBind();

                lblMsg.Text = dt.Rows.Count == 0 ? "No records found." : "";
                lblMsg.ForeColor = System.Drawing.Color.Red;

            }
        }
    }
}