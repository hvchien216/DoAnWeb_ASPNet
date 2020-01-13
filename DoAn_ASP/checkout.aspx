<%@ Page Title="" Language="C#" MasterPageFile="~/vegefoods.Master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="DoAn_ASP.checkout1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="css" runat="server">
    <link href="<%=Page.ResolveUrl("~/admin/") %>css/sb-admin-2.min.css" rel="stylesheet" />
    <link href="<%=Page.ResolveUrl("~/admin/") %>dist/sweetalert2.min.css" rel="stylesheet" />
    <script src="<%=Page.ResolveUrl("~/admin/") %>dist/sweetalert2.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
      <div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Checkout</span></p>
            <h1 class="mb-0 bread">Checkout</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-xl-7 ftco-animate">
						
							<h3 class="mb-4 billing-heading">Billing Details</h3>
	          	<div class="row align-items-end">
	          		<div class="col-md-6">
                  <div class="form-group">
                      <label for="firstname">Firt Name</label>
                      <asp:TextBox ID="txt_cus_name" CssClass="form-control" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator CssClass="text-danger" ID="rfv_txt_cus_name" ControlToValidate="txt_cus_name" runat="server" Display="Dynamic" ErrorMessage="Vui lòng nhập họ tên"></asp:RequiredFieldValidator>
                  </div>
              </div>
              <div class="col-md-6">
                  <div class="form-group">
                      <label for="phone">Phone</label>
                      <asp:TextBox ID="txt_cus_phone" CssClass="form-control" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator1" ControlToValidate="txt_cus_phone" runat="server" Display="Dynamic" ErrorMessage="Vui lòng nhập số điện thoại"></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ID="rev_phong" runat="server" ErrorMessage="Invalid Phone Format" ControlToValidate="txt_cus_phone" CssClass="text-danger" ValidationExpression="[0-9]{10}" Display="Dynamic"></asp:RegularExpressionValidator>
                  </div>
              </div>
              <div class="col-md-6">
                  <div class="form-group">
                      <label for="streetaddress">Street Address</label>
                      <asp:TextBox ID="txt_cus_address" CssClass="form-control" placeholder="House number and street name" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator2" Display="Dynamic" ControlToValidate="txt_cus_address" runat="server" ErrorMessage="Vui lòng nhập địa chỉ "></asp:RequiredFieldValidator>
                  </div>
              </div>
              <div class="col-md-6">
                  <div class="form-group">
                      <label for="towncity">Town / City</label>
                      <asp:TextBox ID="txt_cus_city" CssClass="form-control" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator3" Display="Dynamic" ControlToValidate="txt_cus_city" runat="server" ErrorMessage="Vui lòng nhập thành phố hoặc tòa nhà "></asp:RequiredFieldValidator>
                  </div>
		            </div>
		          
                
                
	            </div>
	          
					</div>
					<div class="col-xl-5">
	          <div class="row mt-5 pt-3">
	          	<div class="col-md-12 d-flex mb-5">
	          		<div class="cart-detail cart-total p-3 p-md-4">
	          			<h3 class="billing-heading mb-4">Cart Total</h3>
	          			<p class="d-flex">
    						<span>Subtotal</span>
    						<span><asp:Label ID="lbl_Subtotal" runat="server" Text=""></asp:Label></span>
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
    						<span><asp:Label ID="lbl_Total" runat="server" Text=""></asp:Label></span>
    					</p>
								</div>
	          	</div>
	          	<div class="col-md-12">
	          		<div class="cart-detail p-3 p-md-4">
	          			<h3 class="billing-heading mb-4">Payment Method</h3>
									<div class="form-group">
										<div class="col-md-12">
											<div class="radio">
											   <label>
                                                   <asp:RadioButton Checked="true" ID="rad_tranfer_bank" GroupName="optradio" CssClass="mr-2" runat="server" />Direct Bank Tranfer</label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-12">
											<div class="radio">
											   <label>
                                                   <asp:RadioButton ID="rad_check_payment" GroupName="optradio" CssClass="mr-2" runat="server" />Check Payment</label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-12">
											<div class="radio">
											   <label>
                                                   <asp:RadioButton ID="rad_paypal" GroupName="optradio" CssClass="mr-2" runat="server" />Paypal</label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-12">
											<div class="checkbox">
											   <label>
                                                   <asp:CheckBox Checked="true" ID="chk_accept" CssClass="mr-2" runat="server" />
                                                   I have read and accept the terms and conditions
											   </label>
											</div>
										</div>
									</div>
									<p>
                                        <%--<a href="#" class="btn btn-primary py-3 px-4">Place an order</a>--%>
                                        <asp:Button ID="btn_thanhtoan" CssClass="btn btn-primary py-3 px-4" runat="server" Text="Place an order" OnClick="btn_thanhtoan_Click" />
									</p>
								</div>
	          	</div>
	          </div>
          </div> <!-- .col-md-8 -->
        </div>
      </div>
    </section> <!-- .section -->

		<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
      <div class="container py-4">
        <div class="row d-flex justify-content-center py-5">
          <div class="col-md-6">
          	<h2 style="font-size: 22px;" class="mb-0">Subcribe to our Newsletter</h2>
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
