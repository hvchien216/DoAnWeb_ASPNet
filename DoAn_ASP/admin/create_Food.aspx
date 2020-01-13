<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="create_Food.aspx.cs" Inherits="DoAn_ASP.admin.create_Food" %>
<asp:Content ID="Content1" ContentPlaceHolderID="css" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="p-5">
                <div class="text-center">
                    <asp:Label ID="lbl_NamePage" CssClass="h4 text-gray-900 mb-4" runat="server" Text="Add Food"></asp:Label>
                </div>

                <div class="form-group row">
                    <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
                        <asp:Label ID="Label3" runat="server" Text="Name food"></asp:Label>
                        <asp:TextBox ID="namefood" runat="server"  CssClass="form-control form-control-user"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="aaa" runat="server" ErrorMessage="Vui lòng nhập thông tin sản phẩm" ControlToValidate="namefood" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <asp:Label ID="Label4" runat="server" Text="Description"></asp:Label>
                        <asp:TextBox ID="description" runat="server"  CssClass="form-control form-control-user"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập thông tin sản phẩm" ControlToValidate="description" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <asp:Label ID="Label5" runat="server" Text="Price"></asp:Label>
                        <asp:TextBox ID="price" TextMode="Number" runat="server" CssClass="form-control form-control-user" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Vui lòng nhập thông tin sản phẩm" ControlToValidate="price" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator2" CssClass="text-danger" runat="server" ErrorMessage="Dữ liệu phải lớn hơn 0" ControlToValidate="price" Display="Dynamic" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
                        <asp:Label ID="Label1" runat="server" Text="Price promo"></asp:Label>
                        <asp:TextBox ID="pricepromo" TextMode="Number" runat="server"  CssClass="form-control form-control-user"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Vui lòng nhập thông tin sản phẩm" ControlToValidate="pricepromo" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" CssClass="text-danger" runat="server" ErrorMessage="Dữ liệu phải lớn hơn 0" ControlToValidate="pricepromo" Display="Dynamic" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <asp:Image ID="show_thumb" Width="70" Height="70"  runat="server"  BorderColor="#0033CC" ImageUrl="..." BackColor="#336600" />
                        <asp:Label ID="Label2" runat="server" Text="Thumb"></asp:Label>
                        <asp:FileUpload ID="thumb" onchange="thumbImagePreview(this);" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Vui lòng nhập thông tin sản phẩm" ControlToValidate="thumb" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <asp:Image ID="show_img" Width="70" Height="70"  runat="server"  BorderColor="#0033CC" ImageUrl="..." BackColor="#336600" EnableTheming="True" />
                        <asp:Label ID="Label6" runat="server" Text="Image"></asp:Label>
                        <asp:FileUpload ID="img" onchange="ImagePreview(this);"  runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Vui lòng nhập thông tin sản phẩm" ControlToValidate="img" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
                        <asp:Label ID="Label7" runat="server" Text="Unit"></asp:Label>
                        <asp:TextBox ID="unit" TextMode="Number" runat="server"  CssClass="form-control form-control-user"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Vui lòng nhập thông tin sản phẩm" ControlToValidate="unit" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                       <asp:CompareValidator ID="CompareValidator3" CssClass="text-danger" runat="server" ErrorMessage="Dữ liệu phải lớn hơn 0" ControlToValidate="unit" Display="Dynamic" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <asp:Label ID="Label8" runat="server" Text="Percent promo"></asp:Label>
                        <asp:TextBox ID="percentpromo" runat="server"  CssClass="form-control form-control-user"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Vui lòng nhập thông tin sản phẩm" ControlToValidate="percentpromo" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator4" CssClass="text-danger" runat="server" ErrorMessage="Dữ liệu phải lớn hơn 0" ControlToValidate="percentpromo" Display="Dynamic" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <asp:Label ID="Label9" runat="server" Text="Rating"></asp:Label>
                        <asp:TextBox ID="rating" TextMode="Number"  runat="server" CssClass="form-control form-control-user" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Vui lòng nhập thông tin sản phẩm" ControlToValidate="rating" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator5" CssClass="text-danger" runat="server" ErrorMessage="Dữ liệu phải lớn hơn 0" ControlToValidate="rating" Display="Dynamic" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
                        <asp:Label ID="Label10" runat="server" Text="Sold"></asp:Label>
                        <asp:TextBox ID="sold"  runat="server"  CssClass="form-control form-control-user"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Vui lòng nhập thông tin sản phẩm" ControlToValidate="sold" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator6" CssClass="text-danger" runat="server" ErrorMessage="Dữ liệu phải lớn hơn 0" ControlToValidate="sold" Display="Dynamic" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <asp:Label ID="Label11" runat="server" Text="Point"></asp:Label>
                        <asp:TextBox ID="point" TextMode="Number" runat="server"  CssClass="form-control form-control-user"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Vui lòng nhập thông tin sản phẩm" ControlToValidate="point" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <asp:Label ID="Label12" runat="server" Text="Type"></asp:Label>
                        <%--<asp:TextBox ID="type" TextMode="Number" runat="server" CssClass="form-control form-control-user" ></asp:TextBox>--%>
                        <asp:DropDownList ID="typefood" CssClass="form-control form-control-user" runat="server"></asp:DropDownList>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Vui lòng nhập thông tin sản phẩm" ControlToValidate="type" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                    </div>
                </div>
                  <div class="form-group row">
                    <div class="col-lg-6 col-sm-6 mb-3 mb-sm-0">
                        <asp:Label ID="Label13" runat="server" Text="Status"></asp:Label>
                        <asp:DropDownList ID="listStatus" runat="server" CssClass="form-control form-control-user">
                            <asp:ListItem Value="0">Đã nhập</asp:ListItem>
                            <asp:ListItem Value="1">Chưa nhập</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-lg-6 col-sm-6">
                        <asp:Label ID="Label14" runat="server" Text="User name"></asp:Label>
                        <asp:TextBox ID="username"  runat="server"  CssClass="form-control form-control-user"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Vui lòng nhập thông tin sản phẩm" ControlToValidate="username" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <asp:Button ID="btnAdd" CssClass="btn btn-primary btn-user btn-block" runat="server" Text="Create" OnClick="Button1_Click" />
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script type="text/javascript">
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=show_img.ClientID%>').prop('src', e.target.result).width(70).height(70);
                };
                reader.readAsDataURL(input.files[0]);
                }
            }
        function thumbImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=show_thumb.ClientID%>').prop('src', e.target.result).width(70).height(70);
                };
                reader.readAsDataURL(input.files[0]);
                }
        }
    </script>
</asp:Content>
