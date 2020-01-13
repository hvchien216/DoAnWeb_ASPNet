<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="DSFood.aspx.cs" Inherits="DoAn_ASP.admin.DSFood" %>
<asp:Content ID="Content1" ContentPlaceHolderID="css" runat="server">
    <link href="<%=Page.ResolveUrl("~/admin/") %>vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h3 class="m-0 font-weight-bold text-primary" style="text-align:center">Danh sách Food</h3>
            
              <div class="table-responsive" style="margin-top:8px">
                  <div class="card shadow mb-4">
                      <div class="card-body">
                          <div class="table-responsive">
                              <table class="table table-bordered table-striped" id="dataTable" width="100%" cellspacing="0">
                                  <thead style="background-color:greenyellow">
                                      <tr>
                                          <th style="text-align:center">ID</th>
                                          <th style="text-align:center">Name</th>
                                          <th style="text-align:center">Description</th>
                                          <th style="text-align:center">Price</th>
                                          <%--<th style="text-align:center">Price promo</th>
                                          <th style="text-align:center">Thumb</th>--%>
                                          <th style="text-align:center">Image</th>
                                          <th style="text-align:center">Unit</th>
                                          <%--<th style="text-align:center">Percent promo</th>
                                          <th style="text-align:center">Rating</th>--%>
                                          <th style="text-align:center">Sold</th>
                                          <%--<th style="text-align:center">Point</th>--%>
                                          <th style="text-align:center">Type</th>
                                          <th style="text-align:center">Status</th>
                                          <%--<th style="text-align:center">Username</th>
                                          <th style="text-align:center">Modified</th>--%>
                                          <th style="text-align:center">Edit</th>
                                          <th style="text-align:center">Delete</th>
                                      </tr>
                                  </thead>
                                  <tbody>
                                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand" >
                                          <ItemTemplate>
                                              <tr>
                                                  <td>
                                                      <asp:Label ID="username" runat="server" Text='<%# Eval("id") %>' ></asp:Label>

                                                  </td>
                                                  <td>
                                                      <asp:Label ID="name" runat="server" Text='<%# Eval("name") %>' ></asp:Label>

                                                  </td>
                                                  <td>
                                                      <asp:Label ID="phone" runat="server" Text='<%# Eval("description") %>' ></asp:Label>

                                                  </td>
                                                   <td>
                                                      <asp:Label ID="email" runat="server" Text='<%# Eval("price") %>' ></asp:Label>

                                                  </td>
                                                  <%--<td>
                                                      <asp:Label ID="role" runat="server" Text='<%# Eval("price_promo") %>' ></asp:Label>

                                                  </td>--%>
                                                  <%--<td>
                                                      <asp:Label ID="status" runat="server" Text='<%# Eval("thumb") %>' ></asp:Label>

                                                  </td>--%>
                                                  <td>
                                                      <%--<asp:Label ID="Label1" runat="server" Text='<%# Eval("img") %>'></asp:Label>--%>
                                                      <img src="<%# Eval("img","/admin/img/{0}") %>" width="50px" height="50px" />
                                                  </td>
                                                  <td>
                                                      <asp:Label ID="Label2" runat="server" Text='<%# Eval("unit") %>'></asp:Label>

                                                  </td>
                                                  <%--<td>
                                                      <asp:Label ID="Label3" runat="server" Text='<%# Eval("percent_promo") %>'></asp:Label>

                                                  </td>
                                                  <td>
                                                      <asp:Label ID="Label4" runat="server" Text='<%# Eval("rating") %>'></asp:Label>

                                                  </td>--%>
                                                  <td>
                                                      <asp:Label ID="Label5" runat="server" Text='<%# Eval("sold") %>'></asp:Label>

                                                  </td>
                                                  <%--<td>
                                                      <asp:Label ID="Label6" runat="server" Text='<%# Eval("point") %>'></asp:Label>

                                                  </td>--%>
                                                  <td>
                                                      <asp:Label ID="Label7" runat="server" Text='<%# Eval("type") %>'></asp:Label>

                                                  </td>
                                                  <td>
                                                      <asp:Label ID="Label8" runat="server" Text='<%# Eval("status") %>'></asp:Label>

                                                  </td>

                                                 <%-- <td>
                                                      <asp:Label ID="Label9" runat="server" Text='<%# Eval("username") %>'></asp:Label>

                                                  </td>
                                                  <td>
                                                      <asp:Label ID="Label10" runat="server" Text='<%# Eval("modified") %>'></asp:Label>

                                                  </td>--%>
                                                  <td style="text-align:center">
                                                      <asp:HyperLink ID="HyperLink1" cssClass="btn btn-warning waves-effect waves-light" runat="server" NavigateUrl='<%# Eval("id","update_Food.aspx?id={0}") %>'><i class="fas fa-pencil-alt"></i></asp:HyperLink>
                                                  </td>
                                                  <td style="text-align:center">
                                                      <%--<asp:HyperLink ID="HyperLink2" cssClass="btn btn-danger waves-effect waves-light" runat="server" NavigateUrl='<%# Eval("id","DSFood.aspx?id={0}") %>'><i class="fas fa-trash-alt"></i></asp:HyperLink>--%>
                                                      <asp:Button ID="btnDel" cssClass="btn btn-danger waves-effect waves-light" runat="server" Text="X" CommandName="will_del"  CommandArgument='<%# Eval("id") %>' />
                                                  </td>
                                              </tr>

                                          </ItemTemplate>
                                      </asp:Repeater>
                                  </tbody>
                              </table>
                          </div>
                      </div>
                  </div>
              </div>
    
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:doan_asp_DBConnectionString4 %>" SelectCommand="SELECT * FROM [food] WHERE ([xoa] = @xoa)">
    <SelectParameters>
        <asp:Parameter DefaultValue="false" Name="xoa" Type="Boolean" />
    </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
        <script src="<%=Page.ResolveUrl("~/admin/") %>vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="<%=Page.ResolveUrl("~/admin/") %>vendor/datatables/dataTables.bootstrap4.min.js"></script>
      <script src="<%=Page.ResolveUrl("~/admin/") %>js/demo/datatables-demo.js"></script>
</asp:Content>
