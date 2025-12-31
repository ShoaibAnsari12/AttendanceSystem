using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AttendanceSystem
{
    public partial class MarkAttendance : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
                LoadSubjects();
                LoadStudents();
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

        private void LoadStudents()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT StudentId, FullName, RollNo FROM Students", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvAttendance.DataSource = dt;
                gvAttendance.DataBind();
            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (ddlSubjects.SelectedValue == "0")
            {
                lblMsg.Text = "Please select a subject!";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                foreach (GridViewRow row in gvAttendance.Rows)
                {
                    // 1. Get the Student ID from DataKeys
                    int studentId = Convert.ToInt32(gvAttendance.DataKeys[row.RowIndex].Value);

                    // 2. Find the CheckBox
                    CheckBox chk = (CheckBox)row.FindControl("chkStatus");

                    // 3. Determine Status: Checked = Present, Unchecked = Absent
                    string status = chk.Checked ? "Present" : "Absent";

                    string query = "INSERT INTO Attendance (StudentId, SubjectId, Status, AttendanceDate) VALUES (@SID, @SubID, @Status, @Date)";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@SID", studentId);
                        cmd.Parameters.AddWithValue("@SubID", ddlSubjects.SelectedValue);
                        cmd.Parameters.AddWithValue("@Status", status);
                        cmd.Parameters.AddWithValue("@Date", txtDate.Text);
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            lblMsg.Text = "Attendance saved successfully!";
            lblMsg.ForeColor = System.Drawing.Color.Green;
        }
    }
    }
