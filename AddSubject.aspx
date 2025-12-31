<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSubject.aspx.cs" Inherits="AttendanceSystem.AddSubject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       <div class="container" style="margin-top:20px;">
    <div class="panel panel-primary">
        <div class="panel-heading"><h4>Add New Subject / Project</h4></div>
        <div class="panel-body">
            <div class="form-group">
                <label>Subject Name:</label>
                <asp:TextBox ID="txtSubjectName" runat="server" CssClass="form-control" placeholder="e.g. Java, Python, OS"></asp:TextBox>
            </div>
            <asp:Button ID="btnSaveSubject" runat="server" Text="Save Subject" OnClick="btnSaveSubject_Click" CssClass="btn btn-success" />
            <br />
            <asp:Label ID="lblMsg" runat="server" style="display:block; margin-top:10px;"></asp:Label>
        </div>
    </div>
</div>
    </form>
</body>
</html>
