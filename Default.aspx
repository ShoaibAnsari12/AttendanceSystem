    <%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AttendanceSystem._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-top: 50px;">
        <div class="jumbotron" style="background-color: #ecf0f1; border-radius: 15px; padding: 40px;">
            <h1 style="color: #2c3e50;">Student Attendance System</h1>
            <p class="lead">Manage your classroom attendance efficiently. Quick, reliable, and easy to use.</p>
            <hr />
            <div class="row">
                <div class="col-md-4">
                    <a href="AddStudent.aspx" class="btn btn-primary btn-lg btn-block">Add New Students &raquo;</a>
                </div>
                <div class="col-md-4">
                    <a href="MarkAttendance.aspx" class="btn btn-success btn-lg btn-block">Take Attendance &raquo;</a>
                </div>
                <div class="col-md-4">
                    <a href="Reports.aspx" class="btn btn-warning btn-lg btn-block">View Reports &raquo;</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>