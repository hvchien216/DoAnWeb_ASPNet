<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="DoiMatKhau.aspx.cs" Inherits="DoAn_ASP.admin.DoiMatKhau" %>
<asp:Content ID="Content1" ContentPlaceHolderID="css" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="p-5">
                <div class="text-center">
                    <asp:Label ID="lbl_NamePage" CssClass="h4 text-gray-900 mb-4" runat="server" Text="Change Your Password"></asp:Label>
                </div>

                <div class="form-group row">
                    <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
                        <asp:Label ID="Label3" runat="server" Text="Username"></asp:Label>
                        <asp:TextBox ID="UserName" runat="server"  CssClass="form-control form-control-user"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid User Format (a-zA-Z, 6-32)" ControlToValidate="UserName" CssClass="text-warning" ValidationExpression="[a-zA-Z0-9]{6,32}" Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfv_username" runat="server" ErrorMessage="Username không được bỏ trống" ControlToValidate="UserName" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
                        <asp:Label ID="Label6" runat="server" Text="Password"></asp:Label>
                        <asp:TextBox ID="exampleInputPassword" TextMode="Password" runat="server" CssClass="form-control form-control-user" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_pass" runat="server" ErrorMessage="Password không được bỏ trống" ControlToValidate="exampleInputPassword" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>

                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <asp:Label ID="Label7" runat="server" Text="Repeat Password"></asp:Label>
                        <asp:TextBox ID="exampleRepeatPassword" TextMode="Password" CssClass="form-control form-control-user"  runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_prepass" runat="server" ErrorMessage="Pre-Password không được bỏ trống" ControlToValidate="exampleRepeatPassword" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cv_prepass" runat="server" ErrorMessage="Re-Pass không trùng với password" ControlToCompare="exampleInputPassword" ControlToValidate="exampleRepeatPassword" CssClass="text-warning" Display="Dynamic"></asp:CompareValidator>

                    </div>
                </div>
                <asp:Button ID="btnChangPwd" CssClass="btn btn-primary btn-user btn-block" runat="server" Text="Change password" OnClick="Button1_Click" />
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
