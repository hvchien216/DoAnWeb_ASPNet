<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="update_Member.aspx.cs" Inherits="DoAn_ASP.admin.update_Member" %>
<asp:Content ID="Content1" ContentPlaceHolderID="css" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="p-5">
                <div class="text-center">
                    <%--<h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>--%>
                    <asp:Label ID="lbl_NamePage" CssClass="h4 text-gray-900 mb-4" runat="server" Text="Update information member"></asp:Label>
                </div>
                <div class="form-group row">
                    <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <asp:Label ID="Label3" runat="server" Text="Username"></asp:Label>
                        <asp:TextBox ID="UserName" runat="server" CssClass="form-control form-control-user" ReadOnly="True"></asp:TextBox>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-lg-6  mb-3 mb-sm-0">
                        <asp:Label ID="Label1" runat="server" Text="Label">Status:</asp:Label>
                        <asp:DropDownList ID="listStatus" runat="server" CssClass="form-control form-control-user">
                            <%--<asp:ListItem Enabled="True" Value="-1" Selected="True">Select Status</asp:ListItem>--%>
                            <asp:ListItem Value="0">Active</asp:ListItem>
                            <asp:ListItem Value="1">Lock</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-lg-6">
                        <asp:Label ID="Label2" runat="server" Text="Label">Role:</asp:Label>
                        <asp:DropDownList ID="listRole" runat="server" CssClass="form-control form-control-user">
                            <%--<asp:ListItem Enabled="true" Value="-1">Select Role</asp:ListItem>--%>
                            <asp:ListItem Value="0">Admin</asp:ListItem>
                            <asp:ListItem Value="1">User</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-lg-4 col-sm-6">
                        <asp:Label ID="Label4" runat="server" Text="Name"></asp:Label>
                        <asp:TextBox ID="Name" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_name" runat="server" ErrorMessage="Name không được bỏ trống" ControlToValidate="Name" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
                        <asp:Label ID="Label8" runat="server" Text="Phone"></asp:Label>
                        <asp:TextBox ID="phone" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_phone" runat="server" ErrorMessage="Phone không được bỏ trống" ControlToValidate="phone" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev_phong" runat="server" ErrorMessage="Invalid Phone Format" ControlToValidate="phone" CssClass="text-warning" ValidationExpression="[0-9]{10}" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <asp:Label ID="Label5" runat="server" Text="Email"></asp:Label>
                        <asp:TextBox ID="exampleInputEmail" TextMode="Email" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_email" runat="server" ErrorMessage="Email không được bỏ trống" ControlToValidate="exampleInputEmail" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="exampleInputEmail" ErrorMessage="Invalid Email Format" CssClass="text-warning" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                </div>
                
                <asp:Button ID="btnUpdate" CssClass="btn btn-primary btn-user btn-block" runat="server" Text="Update" OnClick="update_Click" />
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
