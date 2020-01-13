<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeBehind="DSTypeFood.aspx.cs" Inherits="DoAn_ASP.admin.DSTypeFood" enableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="css" runat="server">
    <link href="<%=Page.ResolveUrl("~/admin/") %>vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
         <h3 class="m-0 font-weight-bold text-primary" style="text-align:center">Danh sách loại sản phẩm</h3>
              <div class="table-responsive" style="margin-top:8px">
                  <div class="card shadow mb-4">
                      <div class="card-body">
                          <div class="table-responsive">
                              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                  <thead style="background-color:greenyellow">
                                      <tr>
                                          <th style="text-align:center">ID</th>
                                          <th style="text-align:center">Type Name</th>
                                          <th style="text-align:center">Type Post</th>
                                          <th style="text-align:center">Review Image</th>
                                          <th style="text-align:center">Status</th>
                                          <th style="text-align:center">User Name</th>
                                          <th style="text-align:center">Modified</th>
                                          <th style="text-align:center">Edit</th>
                                          <th style="text-align:center">Delete</th>
                                      </tr>
                                  </thead>
                                  <tbody>
                                      <asp:Repeater ID="Repeater1" runat="server" DataSourceID="DanhSachFoodType" OnItemCommand="Repeater1_ItemCommand">
                                          <ItemTemplate>
                                              <tr>
                                                  <td>
                                                      <asp:Label ID="username" runat="server" Text='<%# Eval("type_id") %>'></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:Label ID="Label1" runat="server" Text='<%# Eval("type_name") %>'></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:Label ID="Label2" runat="server" Text='<%# Eval("type_pos") %>'></asp:Label>
                                                  </td>
                                                  <td style="text-align:center">
                                                      <img src="<%# Eval("type_img","/admin/img/{0}") %>" width="50px" height="50px" />
                                                  </td>
                                                  <td>
                                                      <asp:Label ID="Label4" runat="server" Text='<%# Eval("status") %>'></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:Label ID="Label5" runat="server" Text='<%# Eval("username") %>'></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:Label ID="Label6" runat="server" Text='<%# Eval("modified") %>'></asp:Label>
                                                  </td>
                                                  <td style="text-align: center">
                                                      <%--<a href="#" class="btn btn-purple waves-effect waves-light"><i class=" mdi mdi-pencil-outline"></i></a>
                                                    <button onclick="del()" type="button" class="btn btn-danger waves-effect waves-light "><i cl3ass="fe-trash-2"></i></button>--%>
                                                      <%--<button type="button" cssClass="btn btn-warning waves-effect waves-light"></button>--%>
                                                      <asp:HyperLink ID="HyperLink1" CssClass="btn btn-warning waves-effect waves-light" runat="server" NavigateUrl='<%# Eval("type_id","update_TypeFood.aspx?id={0}") %>'><i class="fas fa-pencil-alt"></i></asp:HyperLink>
                                                  </td>
                                                  <td style="text-align: center">
                                                      <%--<a href="#" class="btn btn-purple waves-effect waves-light"><i class=" mdi mdi-pencil-outline"></i></a>
                                                    <button onclick="del()" type="button" class="btn btn-danger waves-effect waves-light "><i cl3ass="fe-trash-2"></i></button>--%>
                                                      <asp:Button ID="btnDel" cssClass="btn btn-danger waves-effect waves-light" runat="server" Text="X" CommandName="will_del"  CommandArgument='<%# Eval("type_id") %>' />
                                                      <%--<asp:HyperLink ID="HyperLink2" cssClass="btn btn-danger waves-effect waves-light" runat="server" NavigateUrl='<%# Eval("username","DSMember.aspx?id={0}") %>'><i class="fas fa-trash-alt"></i></asp:HyperLink>--%>
                                                  </td>
                                          </tr>
                                          </ItemTemplate>
                                      </asp:Repeater>
            <asp:SqlDataSource ID="DanhSachFoodType" runat="server" ConnectionString="<%$ ConnectionStrings:doan_asp_DBConnectionString3 %>" SelectCommand="SELECT * FROM [food_type] WHERE ([xoa] = @xoa)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="false" Name="xoa" Type="Boolean" />
                </SelectParameters>
                                      </asp:SqlDataSource>
                                        
                                  </tbody>
                              </table>
                          </div>
                      </div>
                  </div>
          
              </div>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
     <script src="<%=Page.ResolveUrl("~/admin/") %>vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="<%=Page.ResolveUrl("~/admin/") %>vendor/datatables/dataTables.bootstrap4.min.js"></script>
      <script src="<%=Page.ResolveUrl("~/admin/") %>js/demo/datatables-demo.js"></script>
</asp:Content>
