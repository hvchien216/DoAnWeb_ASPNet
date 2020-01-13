<%@ Page Title="" Language="C#" MasterPageFile="~/vegefoods.Master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="shop.aspx.cs" Inherits="DoAn_ASP.shop1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="css" runat="server">
    <style>
        .add-to-cart{
            width: 50px;
            height:50px;
            background-color:#82ae46;
            border: none;
            border-radius:999px;
            position:relative;
            color:#ffffff;
            font-size:32px;
            font-weight:bold;
            display:flexbox;
            justify-content:center;
            align-items:center;
            outline:none;
        }
          
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="shop.aspx">Home</a></span> <span>Products</span></p>
            <h1 class="mb-0 bread">Products</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center">
    			<div class="col-md-10 mb-5 text-center">
    				<ul class="product-category">
                        <%--<li><a href="shop.aspx?filter=all" class="active">All</a></li>--%>
                        <asp:Repeater ID="repeater_filter" runat="server">
                            <ItemTemplate>
                                <li>
                                    <a href="shop.aspx<%# (Eval("type_id").ToString()=="0"?"":"?filter="+ Eval("type_id").ToString())%>" class="<%# (Convert.ToInt32(Eval("active").ToString())==1?"active":"not_active")%>"><%# Eval("type_name") %></a>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                        <%--<li><a href="#" class="active">All</a></li>
                        <li><a href="#">Vegetables</a></li>
                        <li><a href="#">Fruits</a></li>
                        <li><a href="#">Juice</a></li>
                        <li><a href="#">Dried</a></li>--%>
    				</ul>
    			</div>
    		</div>
    		<div class="row">
                <asp:Repeater ID="repeater_product" runat="server" OnItemCommand="repeater_product_ItemCommand">
                    <ItemTemplate>
                        <div class="col-md-6 col-lg-3 ftco-animate">
                            <div class="product">
                                <a href="product-single.aspx?id=<%# Eval("id") %>" class="img-prod">
                                    <img class="img-fluid" style="width:253px;height:202px" src="<%# Eval("img","/admin/img/{0}") %>" alt="Colorlib Template">
                                    <%--<span class="status">30%</span>
    						<div class="overlay"></div>--%>
                                </a>
                                &nbsp;<div class="text py-3 pb-4 px-3 text-center">
                                    <h3><a href="product-single.aspx?id=<%# Eval("id") %>"><%# Eval("name") %></a></h3>
                                    <div class="d-flex">
                                        <div class="pricing">
                                            <p class="price"><span class="price-sale">$<%# Eval("price") %>.00</span></p>
                                        </div>
                                    </div>
                                    <div class="bottom-area d-flex px-3">
                                        <div class="m-auto d-flex">
                                            <%--<a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                                <span><i class="ion-ios-menu"></i></span>
                                            </a>
                                            <a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
                                                <span><i class="ion-ios-cart"></i></span>
                                            </a>
                                            <a href="#" class="heart d-flex justify-content-center align-items-center ">
                                                <span><i class="ion-ios-heart"></i></span>
                                            </a>--%>
                                            <asp:HiddenField ID="hf_id" Value='<%# Eval("id") %>' runat="server" />
                                            <asp:HiddenField ID="hf_name" Value='<%# Eval("name") %>' runat="server" />
                                            <asp:HiddenField ID="hf_des" Value='<%# Eval("description") %>' runat="server" />
                                            <asp:HiddenField ID="hf_price" Value='<%# Eval("price") %>' runat="server" />
                                            <asp:HiddenField ID="hf_unit" Value='<%# Eval("unit") %>' runat="server" />
                                            <asp:HiddenField ID="hf_thumb" Value='<%# Eval("thumb") %>' runat="server" />
                                            <asp:Button ID="btn_cart" CssClass="add-to-cart" CommandName="Add_To_Cart" runat="server" Text="+" />
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
    		</div>
    		<div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
                <ul>
                    <li><a href="#">&lt;</a></li>
                    <%--<li class="active"><span>1</span></li>--%>
                    <asp:Repeater ID="repeater_phantrang" runat="server">
                        <ItemTemplate>
                            <li>
                            <a href="?page=<%#Eval("index") %>
                                <% if (Request["filter"] != null) Response.Write("&filter=" + Request["filter"]); %>"
                                class="<%# (Eval("active").ToString()=="1"?"active":"haven't")%>" 
                                style=" background-color:<%# (Eval("active").ToString()=="1"?"#82ae46":"")%>;color:<%# (Eval("active").ToString()=="1"?"#ffffff":"")%>">
                                <%#Eval("index") %>
                            </a>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                    <li><a href="#">&gt;</a></li>
                </ul>
              <%--<ul>
                <li><a href="#">&lt;</a></li>
                <li class="active"><span>1</span></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&gt;</a></li>
              </ul>--%>
            </div>
          </div>
        </div>
    	</div>
    </section>

		<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
      <div class="container py-4">
        <div class="row d-flex justify-content-center py-5">
          <div class="col-md-6">
          	<h2 style="font-size: 22px;" class="mb-0">Subcribe to our Newsletter
          	<span>Get e-mail updates about our latest shops and special offers</span>
          </div>
          <div class="col-md-6 d-flex align-items-center">
            <form action="#" class="subscribe-form">
              <div class="form-group d-flex">
                <input type="text" class="form-control" placeholder="Enter email address">
                <input type="submit" value="Subscribe" class="submit px-3">
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
</asp:Content>
