<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="DoAn_ASP.admin.register" enableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="css" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="p-5">
                <div class="text-center">
                    <%--<h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>--%>
                    <asp:Label ID="lbl_NamePage" CssClass="h4 text-gray-900 mb-4" runat="server" Text="Create an Account!"></asp:Label>
                </div>

                <div class="form-group row">
                    <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
                        <asp:Label ID="Label3" runat="server" Text="Username"></asp:Label>
                        <asp:TextBox ID="UserName" runat="server" placeholder="User Name" CssClass="form-control form-control-user"></asp:TextBox>
                        <asp:Label ID="lbl_checkUser" runat="server" Text="" CssClass="text-danger"></asp:Label>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid User Format (a-zA-Z, 6-32)" ControlToValidate="UserName" CssClass="text-warning" ValidationExpression="[a-zA-Z0-9]{6,32}"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfv_username" runat="server" ErrorMessage="Username không được bỏ trống" ControlToValidate="UserName" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <asp:Label ID="Label4" runat="server" Text="Name"></asp:Label>
                        <asp:TextBox ID="Name" runat="server" placeholder="Name" CssClass="form-control form-control-user"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_name" runat="server" ErrorMessage="Name không được bỏ trống" ControlToValidate="Name" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <asp:Label ID="Label5" runat="server" Text="Email"></asp:Label>
                        <asp:TextBox ID="exampleInputEmail" TextMode="Email" runat="server" CssClass="form-control form-control-user" placeholder="Email Address"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_email" runat="server" ErrorMessage="Email không được bỏ trống" ControlToValidate="exampleInputEmail" CssClass="text-danger"></asp:RequiredFieldValidator>
                        &nbsp;<br />
                        <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="exampleInputEmail" ErrorMessage="Invalid Email Format" CssClass="text-warning"></asp:RegularExpressionValidator>

                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
                        <asp:Label ID="Label6" runat="server" Text="Password"></asp:Label>
                        <asp:TextBox ID="exampleInputPassword" TextMode="Password" runat="server" CssClass="form-control form-control-user" placeholder="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_pass" runat="server" ErrorMessage="Password không được bỏ trống" ControlToValidate="exampleInputPassword" CssClass="text-danger"></asp:RequiredFieldValidator>

                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <asp:Label ID="Label7" runat="server" Text="Re-Password"></asp:Label>
                        <asp:TextBox ID="exampleRepeatPassword" TextMode="Password" CssClass="form-control form-control-user" placeholder="Repeat Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_prepass" runat="server" ErrorMessage="Pre-Password không được bỏ trống" ControlToValidate="exampleRepeatPassword" CssClass="text-danger"></asp:RequiredFieldValidator>
                        <br />
                        <asp:CompareValidator ID="cv_prepass" runat="server" ErrorMessage="Re-Pass không trùng với password" ControlToCompare="exampleInputPassword" ControlToValidate="exampleRepeatPassword" CssClass="text-warning"></asp:CompareValidator>

                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <asp:Label ID="Label8" runat="server" Text="Phone"></asp:Label>
                        <asp:TextBox ID="phone" runat="server" CssClass="form-control form-control-user" placeholder="Phone number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_phone" runat="server" ErrorMessage="Phone không được bỏ trống" ControlToValidate="phone" CssClass="text-danger"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="rev_phong" runat="server" ErrorMessage="Invalid Phone Format" ControlToValidate="phone" CssClass="text-warning" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                        <br />

                    </div>
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                <div class="form-group row">
                    <div class="col-lg-6  mb-3 mb-sm-0">
                        <asp:Label ID="Label1" runat="server" Text="Label">Status:</asp:Label>
                        <asp:DropDownList ID="listStatus" runat="server" CssClass="form-control form-control-user">
                            <asp:ListItem Enabled="true" Value="-1">--Select Status--</asp:ListItem>
                            <asp:ListItem Value="0">Active</asp:ListItem>
                            <asp:ListItem Value="1">Lock</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-lg-6">
                        <asp:Label ID="Label2" runat="server" Text="Label">Role:</asp:Label>
                        <asp:DropDownList ID="listRole" runat="server" CssClass="form-control form-control-user">
                            <asp:ListItem Enabled="true" Value="-1">--Select Role--</asp:ListItem>
                            <asp:ListItem Value="0">Admin</asp:ListItem>
                            <asp:ListItem Value="1">User</asp:ListItem>
                        </asp:DropDownList>
                    </div>



                </div>
                <asp:Button ID="btnAdd" CssClass="btn btn-primary btn-user btn-block" runat="server" Text="Register Account" OnClick="Button1_Click" />
                <asp:Button ID="btnUpdate" CssClass="btn btn-primary btn-user btn-block" runat="server" Text="Cập nhật"  OnClick="btnUpdate_Click" />
                <%--<hr>
                <a href="index.html" class="btn btn-google btn-user btn-block">
                    <i class="fab fa-google fa-fw"></i>Register with Google
                </a>
                <a href="index.html" class="btn btn-facebook btn-user btn-block">
                    <i class="fab fa-facebook-f fa-fw"></i>Register with Facebook
                </a>
                <hr>
                <div class="text-center">
                    <a class="small" href="forgot-password.html">Forgot Password?</a>
                </div>
                <div class="text-center">
                    <a class="small" href="login.html">Already have an account? Login!</a>
                </div>--%>
                <div runat="server" id="txtkq"></div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <%--<script type="text/javascript">
        $(document).ready(function () {
            $('#btnAdd').click(function () {
                $('#lbl_checkuser').show();
                //if there is on text
                if ($('#UserName').val().length == 0) {
                    $('#lbl_checkuser').html("Type Uasername");
                    $('#lbl_checkuser').css("background-color", "#ffff00");
                }
                else {
                    $('#lbl_checkuser').html("Checking,,");
                    $.ajax({
                        type: "POST",
                        url: "WebService.asmx/checkUsername", //web service and funtion name
                        data: "{Username:'" + $('#UserName').val() + "'}", // passing parameter
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            var result = response.d;
                            $('#lbl_checkuser').html(result);
                            if (result == "Đã tồn tại")
                                $('#lbl_checkuser').css("background-color", "#00db00");
                            else
                                $('#lbl_checkuser').css("background-color", "#ff0000");
                        },
                        error: function (msg) {
                            $('#lbl_checkuser').html("Try again");
                        }
                    });
                }
            });
        });
</script>--%>
</asp:Content>
