<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AttendanceSystem.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="margin-top:100px;">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="panel panel-default" style="box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
                    <div class="panel-heading" style="background-color: #2c3e50; color: white; text-align: center;">
                        <h3>Admin Login</h3>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label>Username:</label>
                            <asp:TextBox ID="txtUser" runat="server" CssClass="form-control" placeholder="admin"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Password:</label>
                            <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" TextMode="Password" placeholder="12345"></asp:TextBox>
                        </div>
                        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn btn-primary btn-block" />
                        <hr />
                        <asp:Label ID="lblError" runat="server" ForeColor="Red" style="display:block; text-align:center;"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
