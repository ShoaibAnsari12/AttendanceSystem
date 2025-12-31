<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="AttendanceSystem.Reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="margin-top:20px;">
        <div class="panel panel-info">
            <div class="panel-heading"><h4>Attendance Reports (Subject, Monthly & Overall)</h4></div>
            <div class="panel-body">
                <div class="row" style="margin-bottom:20px;">
                    <div class="col-md-3">
                        <label>Report Type:</label>
                        <asp:DropDownList ID="ddlReportType" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlReportType_SelectedIndexChanged">
                            <asp:ListItem Text="Subject Wise" Value="Subject"></asp:ListItem>
                            <asp:ListItem Text="Monthly (All Subjects)" Value="Monthly"></asp:ListItem>
                            <asp:ListItem Text="Overall (All Subjects)" Value="Overall"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    
                    <div class="col-md-3" id="divSubject" runat="server">
                        <label>Select Subject:</label>
                        <asp:DropDownList ID="ddlSubjects" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>

                    <div class="col-md-3" id="divMonth" runat="server">
                        <label>Select Month:</label>
                        <asp:DropDownList ID="ddlMonth" runat="server" CssClass="form-control">
                            <asp:ListItem Value="1">January</asp:ListItem>
                            <asp:ListItem Value="2">February</asp:ListItem>
                            <asp:ListItem Value="3">March</asp:ListItem>
                            <asp:ListItem Value="4">April</asp:ListItem>
                            <asp:ListItem Value="5">May</asp:ListItem>
                            <asp:ListItem Value="6">June</asp:ListItem>
                            <asp:ListItem Value="7">July</asp:ListItem>
                            <asp:ListItem Value="8">August</asp:ListItem>
                            <asp:ListItem Value="9">September</asp:ListItem>
                            <asp:ListItem Value="10">October</asp:ListItem>
                            <asp:ListItem Value="11">November</asp:ListItem>
                            <asp:ListItem Value="12">December</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    
                    <div class="col-md-3">
                        <label>&nbsp;</label>
                        <asp:Button ID="btnGenerate" runat="server" Text="Generate Report" OnClick="btnGenerate_Click" CssClass="btn btn-primary btn-block" />
                    </div>
                </div>

                <hr />
                <asp:GridView ID="gvReport" runat="server" AutoGenerateColumns="true" CssClass="table table-striped table-bordered"></asp:GridView>
                <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
