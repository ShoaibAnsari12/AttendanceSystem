using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AttendanceSystem
{
    public partial class AddSubject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSaveSubject_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "INSERT INTO Subjects (SubjectName) VALUES (@SubName)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@SubName", txtSubjectName.Text);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            lblMsg.Text = "Subject added successfully!";
            lblMsg.ForeColor = System.Drawing.Color.Green;
            txtSubjectName.Text = "";
        }
    }
}