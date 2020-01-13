<%@ Page Title="" Language="C#" enableEventValidation="false" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeBehind="update_TypeFood.aspx.cs" Inherits="DoAn_ASP.admin.update_TypeFood" %>
<asp:Content ID="Content1" ContentPlaceHolderID="css" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="p-5">
                <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Update information type food</h1>
                </div>

                <div class="form-group row">
                    
                    <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
                        <asp:Label ID="Label1" runat="server" Text="Type name"></asp:Label>
                        <asp:TextBox ID="typename" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Vui lòng nhập vào" ControlToValidate="typename" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <asp:Label ID="Label2" runat="server" Text="Type post"></asp:Label>
                        <asp:TextBox ID="typepos" TextMode="Number" runat="server" CssClass="form-control form-control-user" OnTextChanged="typepos_TextChanged"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_type_pos" runat="server" ErrorMessage="Vui lòng nhập vào" ControlToValidate="typepos" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <asp:Image ID="show_img" Width="70" Height="70"  runat="server"  BorderColor="#0033CC" ImageUrl="..." />
                        <asp:Label ID="Label3" runat="server" Text="Image review"></asp:Label>
                        <asp:FileUpload ID="type_img" onchange="ImagePreview(this);" runat="server" CssClass="form-control form-control-user"/>
                        <asp:RequiredFieldValidator ID="rfv_type_img" runat="server" ErrorMessage="Vui lòng chọn ảnh" ControlToValidate="type_img" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regex_typeIMG" runat="server" ErrorMessage="Ảnh không đúng định dạng ảnh" CssClass="text-danger" ControlToValidate="type_img" ValidationExpression="(.*?)\.(jpg|png|jpeg)$"  Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-lg-6  mb-3 mb-sm-0">
                        <asp:Label ID="Label4" runat="server" Text="Username"></asp:Label>
                        <asp:TextBox ID="Username" runat="server" placeholder="Username" CssClass="form-control form-control-user"></asp:TextBox>                        
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
                <asp:Button ID="btnUpdate" CssClass="btn btn-primary btn-user btn-block" runat="server" Text="Update" OnClick="update_click"  />                
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
    </script>
</asp:Content>
