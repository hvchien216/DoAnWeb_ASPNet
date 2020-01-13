<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeBehind="ThemLoaiSanPham.aspx.cs" Inherits="DoAn_ASP.admin.ThemLoaiSanPham" enableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="css" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="p-5">
                <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Add type food</h1>
                </div>

                <div class="form-group row">
                    
                    <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
                        <asp:Label ID="Label1" runat="server" Text="Type name"></asp:Label>
                        <asp:TextBox ID="type_name" TextMode="SingleLine" runat="server" CssClass="form-control form-control-user"></asp:TextBox>                        
                        <asp:RequiredFieldValidator ID="rfv_typename" runat="server" ErrorMessage="Vui lòng nhập vào" ControlToValidate="type_name" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <asp:Label ID="Label2" runat="server" Text="Type post"></asp:Label>
                        <asp:TextBox ID="type_pos" TextMode="Number" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_type_pos" runat="server" ErrorMessage="Vui lòng nhập vào" ControlToValidate="type_pos" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator6" CssClass="text-danger" runat="server" ErrorMessage="Dữ liệu không hợp lệ" ControlToValidate="type_pos" Display="Dynamic" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator>
                    </div>
                    <div class="col-lg-4 col-sm-6" style="display:flexbox;justify-content:center;align-items:center">
                        <asp:Image ID="show_img" Width="70" Height="70"  runat="server" BackColor="#336600"  BorderColor="#0033CC" ImageUrl=".." />
                        <asp:Label ID="Label3" runat="server" Text="Image review"></asp:Label>
                        <asp:FileUpload ID="type_img" onchange="ImagePreview(this);" runat="server" />
                        <asp:RequiredFieldValidator ID="rfv_type_img" runat="server" ErrorMessage="Vui lòng chọn ảnh" ControlToValidate="type_img" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regex_typeIMG" runat="server" ErrorMessage="Ảnh không đúng định dạng ảnh" CssClass="text-danger" ControlToValidate="type_img" ValidationExpression="(.*?)\.(jpg|png|jpeg)$"  Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-lg-6  mb-3 mb-sm-0">
                        <asp:Label ID="Label4" runat="server" Text="Username"></asp:Label>
                        <asp:TextBox ID="Username" TextMode="SingleLine" runat="server"  CssClass="form-control form-control-user"></asp:TextBox>                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập vào" ControlToValidate="Username" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-6">
                        <asp:Label ID="Label5" runat="server" Text="Status"></asp:Label>
                        <asp:DropDownList ID="listStatus" runat="server" CssClass="form-control form-control-user">
                            <%--<asp:ListItem Enabled="true" Value="-1">--Select Status--</asp:ListItem>--%>
                            <asp:ListItem Value="0">Hết</asp:ListItem>
                            <asp:ListItem Value="1">Còn</asp:ListItem>
                        </asp:DropDownList>
                    </div>



                </div>
                <asp:Button ID="btnAdd" CssClass="btn btn-primary btn-user btn-block" runat="server" Text="Thêm" OnClick="ThemTypeFood" />                
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
       <%-- function thumbImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=show_img.ClientID%>').prop('src', e.target.result).width(100).height(100);
                };
                reader.readAsDataURL(input.files[0]);
                }
        }--%>
    </script>
</asp:Content>
