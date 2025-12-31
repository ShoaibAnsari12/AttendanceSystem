<%@ Page Title="Mark Attendance" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MarkAttendance.aspx.cs" Inherits="AttendanceSystem.MarkAttendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="margin-top:20px;">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h4>Mark Daily Attendance (Check for Present)</h4>
            </div>
            <div class="panel-body">
                <div class="row" style="margin-bottom:20px;">
                    <div class="col-md-6">
                        <label>Select Subject/Project:</label>
                        <asp:DropDownList ID="ddlSubjects" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-md-6">
                        <label>Date:</label>
                        <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>
                </div>

                <asp:GridView ID="gvAttendance" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="StudentId" CssClass="table table-striped table-bordered">
                    <Columns>
                        <asp:BoundField DataField="RollNo" HeaderText="Roll No" />
                        <asp:BoundField DataField="FullName" HeaderText="Student Name" />
                        
                        <%-- NEW CHECKBOX COLUMN --%>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <input type="checkbox" id="checkAll" onclick="toggleCheckboxes(this)" checked /> <strong>Present All</strong>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkStatus" runat="server" Checked="true" Text="&nbsp;Present" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <div style="margin-top: 20px;">
                    <asp:Button ID="btnSubmit" runat="server" Text="Save Attendance" 
                        OnClick="btnSubmit_Click" CssClass="btn btn-success btn-lg" />
                    <br />
                    <asp:Label ID="lblMsg" runat="server" style="display:block; margin-top:10px;"></asp:Label> 
                </div>
            </div>
        </div>
    </div>

    <%-- JAVASCRIPT FOR SELECT ALL --%>
    <script type="text/javascript">
        function toggleCheckboxes(source) {
            var checkboxes = document.querySelectorAll('input[type="checkbox"]');
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i] != source) {
                    checkboxes[i].checked = source.checked;
                }
            }
        }
    </script>
</asp:Content>