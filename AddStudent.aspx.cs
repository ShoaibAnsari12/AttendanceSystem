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
    public partial class AddStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                // Pulls the connection string we fixed in your Web.config
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string sql = "INSERT INTO Students (FullName, RollNo) VALUES (@Name, @Roll)";

                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        // Using Parameters prevents SQL Injection (Crucial for MCA projects)
                        cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Roll", txtRoll.Text.Trim());

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                // Success Feedback
                lblMsg.Text = "Student added successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;

                // Clear the textboxes for the next entry
                txtName.Text = "";
                txtRoll.Text = "";
            }
            catch (Exception ex)
            {
                // Error Feedback
                lblMsg.Text = "Error: " + ex.Message;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}