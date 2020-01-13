 <%@ Page Title="" Language="C#" MasterPageFile="~/vegefoods.Master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="DoAn_ASP.cart1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="css" runat="server">
    <style>
        .thongbao{
            font-size:72px;
            color:greenyellow;
            font-weight:bold;
            text-align:center;
            margin-top:40px;
        }
    </style>
     <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/ajax.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Cart</span></p>
            <h1 class="mb-0 bread">My Cart</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section ftco-cart">
			<div class="container">
				<div class="row">
    			<div class="col-md-12 ftco-animate">
    				<div class="cart-list">
	    				<table class="table">
						    <thead class="thead-primary">
						      <tr class="text-center">
						        <th>&nbsp;</th>
						        <th>&nbsp;</th>
						        <th>Product name</th>
						        <th>Price</th>
						        <th>Quantity</th>
						        <th>Total</th>
						      </tr>
						    </thead>
						    <tbody id="cart-data">
                                
						      <asp:Repeater ID="reapeater_Cart" runat="server" OnItemCommand="reapeater_Cart_ItemCommand">
                                  <ItemTemplate>
                                      <tr class="text-center">
                                          <td class="product-remove">
                                              <%--<a href="#"><span class="ion-ios-close"></span></a>--%>
                                              <asp:Button ID="btnDel" runat="server" Text="X" CommandName="will_del"  CommandArgument='<%# Eval("stt") %>' />
                                          </td>

                                          <td class="image-prod">
                                              <div class="img" style="background-image: url('<%# Eval("thumb","/admin/img/{0}") %>'); width: 100px; height: 100px"></div>
                                              <%--<div class="img" ><img src="<%# Eval("thumb","/admin/img/{0}") %>" width="100px" height="100px"/></div>--%>
                                          </td>

                                          <td class="product-name">
                                              <h3><%# Eval("name") %></h3>
                                              <p><%# Eval("des") %></p>
                                          </td>

                                          <td class="price">$<%# Eval("price") %>.00</td>

                                          <td class="quantity">
                                              <div class="input-group mb-3">
                                                  <input type="text" name="quantity" readonly="True" class="quantity form-control input-number" value="<%# Eval("soluong") %>" min="1" max="100">
                                              </div>
                                          </td>

                                          <td class="total">$<%# Int32.Parse(Eval("price").ToString())*Int32.Parse(Eval("soluong").ToString()) %>.00</td>
                                      </tr>
                                      <!-- END TR-->
                                  </ItemTemplate>
						      </asp:Repeater>
                                
						    </tbody>
						  </table>
					  </div>
    			</div>
                    <div style="display: flexbox; justify-content: center; align-items: center;">
                        <asp:Label ID="lbl_cart" CssClass="thongbao"  runat="server" Text=""></asp:Label>
                    </div>
    		</div>
                
    		<div class="row justify-content-end">
    			<%--<div class="col-lg-4 mt-5 cart-wrap ftco-animate">
    				<div class="cart-total mb-3">
    					<h3>Coupon Code</h3>
    					<p>Enter your coupon code if you have one</p>
  						
	              <div class="form-group">
	              	<label for="">Coupon code</label>
	                <input type="text" class="form-control text-left px-3" placeholder="">
	              </div>
	            
    				</div>
    				<p><a href="checkout.html" class="btn btn-primary py-3 px-4">Apply Coupon</a></p>
    			</div>
    			<div class="col-lg-4 mt-5 cart-wrap ftco-animate">
    				<div class="cart-total mb-3">
    					<h3>Estimate shipping and tax</h3>
    					<p>Enter your destination to get a shipping estimate</p>
  						
	              <div class="form-group">
	              	<label for="">Country</label>
	                <input type="text" class="form-control text-left px-3" placeholder="">
	              </div>
	              <div class="form-group">
	              	<label for="country">State/Province</label>
	                <input type="text" class="form-control text-left px-3" placeholder="">
	              </div>
	              <div class="form-group">
	              	<label for="country">Zip/Postal Code</label>
	                <input type="text" class="form-control text-left px-3" placeholder="">
	              </div>
	            
    				</div>
    				<p><a href="checkout.html" class="btn btn-primary py-3 px-4">Estimate</a></p>
    			</div>--%>
    			<div class="col-lg-4 mt-5 cart-wrap ftco-animate">
    				<div class="cart-total mb-3">
    					<h3>Cart Totals</h3>
    					<p class="d-flex">
    						<span>Subtotal</span>
    						<%--<span><asp:Label ID="lbl_Subtotal" runat="server" Text=""></asp:Label></span>--%>
                            <span id="lbl_Subtotal"></span>
    					</p>
    					<p class="d-flex">
    						<span>Delivery</span>
    						<span>$0.00</span>
    					</p>
    					<p class="d-flex">
    						<span>Discount</span>
    						<span>$0.00</span>
    					</p>
    					<hr>
    					<p class="d-flex total-price">
    						<span>Total</span>
    						<%--<span ><asp:Label ID="lbl_Total" runat="server" Text=""></asp:Label></span>--%>
                            <span id="lbl_Total"></span>
    					</p>
    				</div>
    				<p>
                        <a href="checkout.aspx" class="btn btn-primary py-3 px-4">Proceed to Checkout</a>
                        <%--<asp:Button ID="btn_checkout" CssClass="btn btn-primary py-3 px-4" runat="server" Text="Proceed to Checkout" OnClick="btn_checkout_Click" />--%>
    				</p>
    			</div>
    		</div>
			</div>
		</section>

		<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
      <div class="container py-4">
        <div class="row d-flex justify-content-center py-5">
          <div class="col-md-6">
          	<h2 style="font-size: 22px;" class="mb-0">Subcribe to our Newsletter</h2>
          	<span>Get e-mail updates about our latest shops and special offers</span>
          </div>
          <div class="col-md-6 d-flex align-items-center">
            
              <div class="form-group d-flex">
                <input type="text" class="form-control" placeholder="Enter email address">
                <input type="submit" value="Subscribe" class="submit px-3">
              </div>
           
          </div>
        </div>
      </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
    
</asp:Content>
