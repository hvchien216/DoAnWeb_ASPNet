<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="DSMember.aspx.cs" Inherits="admin_DSMember" enableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="css" Runat="Server">
      <link href="<%=Page.ResolveUrl("~/admin/") %>vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">
    <h3 class="m-0 font-weight-bold text-primary" style="text-align:center">Danh sách Member</h3>
            
              <div class="table-responsive" style="margin-top:8px">
                  <div class="card shadow mb-4">
                      
                      <asp:SqlDataSource ID="danhsachMember" runat="server" ConnectionString="<%$ ConnectionStrings:doan_asp_DBConnectionString2 %>" SelectCommand="SELECT [username], [name], [phone], [role], [status], [email] FROM [member] WHERE ([xoa] = @xoa)">
                          <SelectParameters>
                              <asp:Parameter DefaultValue="false" Name="xoa" Type="Boolean" />
                          </SelectParameters>
                      </asp:SqlDataSource>
                      <div class="card-body">
                          <div class="table-responsive">
                              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                  <thead style="background-color:greenyellow">
                                      <tr>
                                          <th style="text-align:center">Username</th>
                                          <th style="text-align:center">Name</th>
                                          <th style="text-align:center">Phone</th>
                                          <th style="text-align:center">Email</th>
                                          <th style="text-align:center">Role</th>
                                          <th style="text-align:center">Status</th>
                                          <th style="text-align:center">Edit</th>
                                          <th style="text-align:center">Delete</th>
                                      </tr>
                                  </thead>
                                  <tbody>
                                      <asp:Repeater ID="Repeater1" runat="server" DataSourceID="danhsachMember" OnItemCommand="Repeater1_ItemCommand">
                                          <ItemTemplate>
                                              <tr>
                                                  <td>
                                                      <asp:Label ID="username" runat="server" Text='<%# Eval("username") %>' ></asp:Label>

                                                  </td>
                                                  <td>
                                                      <asp:Label ID="name" runat="server" Text='<%# Eval("name") %>' ></asp:Label>

                                                  </td>
                                                  <td>
                                                      <asp:Label ID="phone" runat="server" Text='<%# Eval("phone") %>' ></asp:Label>

                                                  </td>
                                                   <td>
                                                      <asp:Label ID="email" runat="server" Text='<%# Eval("email") %>' ></asp:Label>

                                                  </td>
                                                  <td>
                                                      <asp:Label ID="role" runat="server" Text='<%# (Eval("role").ToString()=="0"?"Admin":"User") %>' ></asp:Label>

                                                  </td>
                                                  <td>
                                                      <asp:Label ID="status" runat="server" Text='<%# (Eval("status").ToString()=="0"?"Active":"Lock") %>' ></asp:Label>

                                                  </td>
                                                 
                                                  <td style="text-align:center">
                                                      <%--<a href="#" class="btn btn-purple waves-effect waves-light"><i class=" mdi mdi-pencil-outline"></i></a>
                                                      <button onclick="del()" type="button" class="btn btn-danger waves-effect waves-light "><i cl3ass="fe-trash-2"></i></button>--%>
                                                      <%--<button type="button" cssClass="btn btn-warning waves-effect waves-light"></button>--%>
                                                      <asp:HyperLink ID="HyperLink1" cssClass="btn btn-warning waves-effect waves-light" runat="server" NavigateUrl='<%# Eval("username","update_Member.aspx?id={0}") %>'><i class="fas fa-pencil-alt"></i></asp:HyperLink>
                                                  </td>
                                                  <td style="text-align:center">
                                                      <%--<a href="#" class="btn btn-purple waves-effect waves-light"><i class=" mdi mdi-pencil-outline"></i></a>
                                                      <button onclick="del()" type="button" class="btn btn-danger waves-effect waves-light "><i cl3ass="fe-trash-2"></i></button>--%>
                                                      <%--<asp:Button ID="btn_xoa" cssClass="btn btn-danger waves-effect waves-light " runat="server" Text="X" OnClick="DelMemBer"  />--%>
                                                      <%--<asp:HyperLink ID="HyperLink2" cssClass="btn btn-danger waves-effect waves-light" runat="server" NavigateUrl='<%# Eval("username","DSMember.aspx?id={0}") %>'><i class="fas fa-trash-alt"></i></asp:HyperLink>--%>
                                                      <asp:Button ID="btnDel" cssClass="btn btn-danger waves-effect waves-light" runat="server" Text="X" CommandName="will_del"  CommandArgument='<%# Eval("username") %>' />
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
            <%--</div>--%>
          <%--</div>--%>
    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" Runat="Server">
    <script src="<%=Page.ResolveUrl("~/admin/") %>vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="<%=Page.ResolveUrl("~/admin/") %>vendor/datatables/dataTables.bootstrap4.min.js"></script>
      <script src="<%=Page.ResolveUrl("~/admin/") %>js/demo/datatables-demo.js"></script>
</asp:Content>

