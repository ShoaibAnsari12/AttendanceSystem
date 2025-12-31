<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddStudent.aspx.cs" Inherits="AttendanceSystem.AddStudent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="margin-top:30px;">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Add New Student</h3>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <label>Full Name:</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter full name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Name is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>Roll Number:</label>
                        <asp:TextBox ID="txtRoll" runat="server" CssClass="form-control" placeholder="Enter roll number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvRoll" runat="server" ControlToValidate="txtRoll" ErrorMessage="Roll number is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <asp:Button ID="btnSave" runat="server" Text="Register Student" OnClick="btnSave_Click" CssClass="btn btn-success btn-block" />
                    <hr />
                    <asp:Label ID="lblMsg" runat="server" style="display:block; text-align:center; font-weight:bold;"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
