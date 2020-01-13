<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DoAn_ASP.admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="<%=Page.ResolveUrl("~/admin/") %>css/sb-admin-2.min.css" rel="stylesheet" />
    <link href="<%=Page.ResolveUrl("~/admin/") %>css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=Page.ResolveUrl("~/admin/") %>css/app.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=Page.ResolveUrl("~/admin/") %>dist/sweetalert2.min.css" rel="stylesheet" />
    <script src="<%=Page.ResolveUrl("~/admin/") %>dist/sweetalert2.min.js"></script>
</head>
    <%--#4e7bec--%>
<body style="background-color:black">
    <form id="form1" runat="server">
        <div class="account-pages mt-5 mb-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5">
                        <div class="card">

                            <div class="card-body p-4">
                                <h5 class="auth-title">Sign In</h5>
                                <div class="form-group mb-3">
                                    <label for="user_name">Username</label>
                                    <asp:TextBox ID="user_name" CssClass="form-control"  required="" placeholder="Enter your username" runat="server"></asp:TextBox>   
                                </div>
                                <div class="form-group mb-3">
                                    <label for="password">Password</label>
                                    <asp:TextBox ID="pwd" CssClass="form-control" TextMode="Password" required="" placeholder="Enter your password" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group mb-0 text-center">
                                    <asp:Button ID="btnLogin" runat="server"  CssClass="btn btn-danger btn-block" Text="Log In" OnClick="Login_Click" />
                                </div>
                            </div>
                            <!-- end card-body -->
                        </div>
                        <!-- end card -->
                    </div>
                    <!-- end col -->
                </div>
                <!-- end row -->
            </div>
            <!-- end container -->
        </div>
        <!-- end page -->
    </form>
</body>
</html>
