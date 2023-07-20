<%@page import="com.deewan.Multi_Shop.service.ProductService"%>
<%@page import="com.deewan.Multi_Shop.dto.Product"%>
<%@page import="com.deewan.Multi_Shop.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="/common/headSection"%>
</head>
<body>

	<%@ include file="/common/topbar"%>

	<%@ include file="/common/navbar.jsp"%>
	<%!
	int productId;
	%>
	<%
	Product product=null; 
	Object object3 = session.getAttribute("userInfo");
	UserDto data = (UserDto) object3;
	ProductService productService = new ProductService();
	productId=Integer.parseInt(request.getParameter("productId"));
	if(productId>0){		
	product = productService.getSingleProductService(productId);
	}
	%>
	<%
	if (data != null && product!=null)  {
	%>
	<form action="checkout" method="post">
		<!-- Checkout Start -->
		<div class="container-fluid">
			<div class="row px-xl-5">
				<div class="col-lg-8">
					<h5 class="section-title position-relative text-uppercase mb-3">
						<span class="bg-secondary pr-3">Billing Address</span>
					</h5>
					<div class="bg-light p-30 mb-5">
						<div class="row">
							<div class="col-md-6 form-group">
								<label>First Name</label> <input class="form-control"
									type="text" placeholder="John" name="firstName"
									value="<%=data.getUserFirstname()%>">
							</div>
							<div class="col-md-6 form-group">
								<label>Last Name</label> <input class="form-control" type="text"
									placeholder="Doe" name="lastName"
									value="<%=data.getUserLastname()%>">
							</div>
							<div class="col-md-6 form-group">
								<label>E-mail</label> <input class="form-control" type="text"
									placeholder="example@email.com" name="email"
									value="<%=data.getUserEmail()%>">
							</div>
							<div class="col-md-6 form-group">
								<label>Mobile No</label> <input class="form-control" type="text"
									placeholder="+123 456 789" name="mobileNo"
									value="<%=data.getUserMobile()%>">
							</div>
							<div class="col-md-6 form-group">
								<label>Address </label> <input class="form-control" type="text"
									placeholder="123 Street" name="address"
									value="<%=data.getUserFirstname()%>">
							</div>

							<div class="col-md-6 form-group">
								<label>Country</label> <select class="custom-select"
									name="country">
									<option selected value="united states">United States</option>
									<option value="afghanistan">Afghanistan</option>
									<option value="albania">Albania</option>
									<option value="algeria">Algeria</option>
								</select>
							</div>
							<div class="col-md-6 form-group">
								<label>City</label> <input class="form-control" type="text"
									placeholder="New York" name="city"
									value="<%=data.getUserCity()%>">
							</div>
							<div class="col-md-6 form-group">
								<label>State</label> <input class="form-control" type="text"
									placeholder="New York" name="state"
									value="<%=data.getUserState()%>">
							</div>
							<div class="col-md-6 form-group">
								<label>ZIP Code</label> <input class="form-control" type="text"
									placeholder="123" name="zipCode"
									value="<%=data.getUserZipCode()%>">
							</div>
							<div class="col-md-12 form-group">
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input"
										id="newaccount" name="createAccount" value="yes" >
									<label class="custom-control-label" for="newaccount">Create
										an account</label>
								</div>
											<%if(request.getAttribute("accountResult")!=null){%>
								<p class="text-danger"><%=request.getAttribute("accountResult")%></p>
						<%} %>
																		</div>
						</div>
					</div>

				</div>
				<div class="col-lg-4">
					<h5 class="section-title position-relative text-uppercase mb-3">
						<span class="bg-secondary pr-3">Order Summery</span>
					</h5>
					<div class="bg-light p-30 mb-5">
						<div class="border-bottom">
							<div class="d-flex justify-content-between">
								<p class="text-dark mb-3">Product Name</p>
								<p class="text-dark mb-3">Price</p>
							</div>
							<div class="d-flex justify-content-between">
								<p><%=product.getProductName()%></p>
								<p><%=product.getProductPrice()%></p>
							</div>
						</div>
						<div class="border-bottom">
							<div class="d-flex justify-content-between">
								<p class="text-dark mt-3 mb-3">Product Quentity</p>
								<p class="text-dark mb-3 mt-3">Total Price</p>
							</div>
							<div class="d-flex justify-content-between">
								<p><%=product.getProductQuentity()%></p>
								<p><%=product.getProductPrice()%></p>
								<input type="hidden" name="productQuentity" value="<%=product.getProductQuentity()%>">
								<input type="hidden" name="productName" value="<%=product.getProductPrice()%>">
							</div>
						</div>
					</div>
					<br>
					<div class="mb-5">
						<h5 class="section-title position-relative text-uppercase mb-3">
							<span class="bg-secondary pr-3">Payment</span>
						</h5>
						<div class="bg-light p-30">
							<div class="form-group"></div>
							<div class="form-group mb-4">
								<div class="custom-control custom-radio">
									<input type="radio" class="custom-control-input" name="payment"
										value="castOnDelivery" id="banktransfer" required="required"> <label
										class="custom-control-label" for="banktransfer">Cash
										on delivery (COD)</label>
								</div>
							</div>
							<input type="hidden" name="productId" value="<%=productId %>">
							<button type="submit"
								class="btn btn-block btn-primary font-weight-bold py-3">Place
								Order</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Checkout End -->
	</form>

	<%
	} else if(data==null && product!=null){
	%>
	<form action="checkout" method="post">
		<!-- Checkout Start -->
		<div class="container-fluid">
			<div class="row px-xl-5">
				<div class="col-lg-8">
					<h5 class="section-title position-relative text-uppercase mb-3">
						<span class="bg-secondary pr-3">Billing Address</span>
					</h5>
					<div class="bg-light p-30 mb-5">
						<div class="row">
							<div class="col-md-6 form-group">
								<label>First Name</label> <input class="form-control"
									type="text" placeholder="John" name="firstName" required="required">
							</div>
							<div class="col-md-6 form-group">
								<label>Last Name</label> <input class="form-control" type="text"
									placeholder="Doe" name="lastName" required="required">
							</div>
							<div class="col-md-6 form-group">
								<label>E-mail</label> <input class="form-control" type="text"
									placeholder="example@email.com" name="email" required="required">
							</div>
							<div class="col-md-6 form-group">
								<label>Mobile No</label> <input class="form-control" type="text"
									placeholder="+123 456 789" name="mobileNo" required="required">
							</div>
							<div class="col-md-6 form-group">
								<label>Address </label> <input class="form-control" type="text"
									placeholder="123 Street" name="address" required="required">
							</div>

							<div class="col-md-6 form-group">
								<label>Country</label> <select class="custom-select"
									name="country" required="required">
									<option selected value="united states">United States</option>
									<option value="afghanistan">Afghanistan</option>
									<option value="albania">Albania</option>
									<option value="algeria">Algeria</option>
								</select>
							</div>
							<div class="col-md-6 form-group">
								<label>City</label> <input class="form-control" type="text"
									placeholder="New York" name="city" required="required">
							</div>
							<div class="col-md-6 form-group">
								<label>State</label> <input class="form-control" type="text"
									placeholder="New York" name="state" required="required">
							</div>
							<div class="col-md-6 form-group">
								<label>ZIP Code</label> <input class="form-control" type="text"
									placeholder="123" name="zipCode" required="required">
							</div>
							<div class="col-md-12 form-group">
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input"
										id="newaccount" name="createAccount" value="yes">
									<label class="custom-control-label" for="newaccount">Create
										an account</label>
								</div>
											<%if(request.getAttribute("accountResult")!=null){%>
								<p class="text-danger"><%=request.getAttribute("accountResult")%></p>
						<%} %>
							</div>
						</div>
					</div>

				</div>
				<div class="col-lg-4">
					<h5 class="section-title position-relative text-uppercase mb-3">
						<span class="bg-secondary pr-3">Order Summery</span>
					</h5>
					<div class="bg-light p-30 mb-5">
						<div class="border-bottom">
							<div class="d-flex justify-content-between">
								<p class="text-dark mb-3">Product Name</p>
								<p class="text-dark mb-3">Price</p>
							</div>
							<div class="d-flex justify-content-between">
								<p class="m-3"><%=product.getProductName()%></p>
								<p><%= product.getProductPrice()%></p>
							</div>
						</div>
						<div class="border-bottom">
							<div class="d-flex justify-content-between">
								<p class="text-dark mt-3 mb-3">Product Quentity</p>
								<p class="text-dark mb-3 mt-3">Total Price</p>
							</div>
							<div class="d-flex justify-content-between">
								<p><%= product.getProductQuentity()%></p>
								<p><%= product.getProductPrice()%></p>
							</div>
						</div>
					</div>
					<br>
					<div class="mb-5">
						<h5 class="section-title position-relative text-uppercase mb-3">
							<span class="bg-secondary pr-3">Payment</span>
						</h5>
						<div class="bg-light p-30">
							<div class="form-group"></div>
							<div class="form-group mb-4">
								<div class="custom-control custom-radio">
									<input type="radio" class="custom-control-input" name="payment"
										value="castOnDelivery" id="banktransfer" required="required"> <label
										class="custom-control-label" for="banktransfer" >Cash
										on delivery (COD)</label>
								</div>
							</div>
							<input type="hidden" name="productId" value="<%=productId %>">
							<button type="submit"
								class="btn btn-block btn-primary font-weight-bold py-3">Place
								Order</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Checkout End -->
	</form>
	<%
	}else if(data!=null && product == null){
	%>
	<form action="checkout" method="post">
		<!-- Checkout Start -->
		<div class="container-fluid">
			<div class="row px-xl-5">
				<div class="col-lg-8">
					<h5 class="section-title position-relative text-uppercase mb-3">
						<span class="bg-secondary pr-3">Billing Address</span>
					</h5>
					<div class="bg-light p-30 mb-5">
						<div class="row">
							<div class="col-md-6 form-group">
								<label>First Name</label> <input class="form-control"
									type="text" placeholder="John" name="firstName" value="<%=data.getUserFirstname()%>">
							</div>
							<div class="col-md-6 form-group">
								<label>Last Name</label> <input class="form-control" type="text"
									placeholder="Doe" name="lastName" value="<%=data.getUserLastname()%>">
							</div>
							<div class="col-md-6 form-group">
								<label>E-mail</label> <input class="form-control" type="text"
									placeholder="example@email.com" name="email" value="<%=data.getUserEmail()%>">
							
							</div>
							<div class="col-md-6 form-group">
								<label>Mobile No</label> <input class="form-control" type="text"
									placeholder="+123 456 789" name="mobileNo" value="<%=data.getUserMobile()%>">
							</div>
							<div class="col-md-6 form-group">
								<label>Address </label> <input class="form-control" type="text"
									placeholder="123 Street" name="address" value="<%=data.getUserAddress()%>">
							</div>

							<div class="col-md-6 form-group">
								<label>Country</label> <select class="custom-select"
									name="country">
									<option selected value="united states">United States</option>
									<option value="afghanistan">Afghanistan</option>
									<option value="albania">Albania</option>
									<option value="algeria">Algeria</option>
								</select>
							</div>
							<div class="col-md-6 form-group">
								<label>City</label> <input class="form-control" type="text"
									placeholder="New York" name="city" value="<%=data.getUserCity()%>">
							</div>
							<div class="col-md-6 form-group">
								<label>State</label> <input class="form-control" type="text"
									placeholder="New York" name="state" value="<%=data.getUserState()%>">
							</div>
							<div class="col-md-6 form-group">
								<label>ZIP Code</label> <input class="form-control" type="text"
									placeholder="123" name="zipCode" value="<%=data.getUserZipCode()%>">
							</div>
							<div class="col-md-12 form-group">
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input"
										id="newaccount" name="createAccount" value="yes" >
									<label class="custom-control-label" for="newaccount">Create
										an account</label>
								</div>
											<%if(request.getAttribute("accountResult")!=null){%>
								<p class="text-danger"><%=request.getAttribute("accountResult")%></p>
						<%} %>
							
							</div>
						</div>
					</div>

				</div>
				<div class="col-lg-4">
					<h5 class="section-title position-relative text-uppercase mb-3">
						<span class="bg-secondary pr-3">Order Summery</span>
					</h5>
					<div class="bg-light p-30 mb-5">
						<div class="border-bottom">
							<div class="d-flex justify-content-between">
								<p class="text-dark mb-3">Product Name</p>
								<p class="text-dark mb-3">Price</p>
							</div>
							<div class="d-flex justify-content-between">
								<p class="m-3"><a href="index.jsp" class="text-danger">Add Product <i class="fa fa-plus m-3"></i></a></p>
								<p></p>
							</div>
								<%if(request.getAttribute("result")!=null){%>
								<p class="text-danger"><%=request.getAttribute("result")%></p>
						<%} %>
						</div>
						<div class="border-bottom">
							<div class="d-flex justify-content-between">
								<p class="text-dark mt-3 mb-3">Product Quentity</p>
								<p class="text-dark mb-3 mt-3">Total Price</p>
							</div>
							<div class="d-flex justify-content-between">
								<p></p>
								<p></p>
							</div>
						</div>
					</div>
					<br>
					<div class="mb-5">
						<h5 class="section-title position-relative text-uppercase mb-3">
							<span class="bg-secondary pr-3">Payment</span>
						</h5>
						<div class="bg-light p-30">
							<div class="form-group"></div>
							<div class="form-group mb-4">
								<div class="custom-control custom-radio">
									<input type="radio" class="custom-control-input" name="payment"
										value="castOnDelivery" id="banktransfer" required="required"> <label
										class="custom-control-label" for="banktransfer">Cash
										on delivery (COD)</label>
								</div>
							</div>
							<input type="hidden" name="productId" value="<%=productId %>">
							<button type="submit"
								class="btn btn-block btn-primary font-weight-bold py-3">Place
								Order</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Checkout End -->
	</form>

	<%
	} else{
	%>
<form action="checkout" method="post">
		<!-- Checkout Start -->
		<div class="container-fluid">
			<div class="row px-xl-5">
				<div class="col-lg-8">
					<h5 class="section-title position-relative text-uppercase mb-3">
						<span class="bg-secondary pr-3">Billing Address</span>
					</h5>
					<div class="bg-light p-30 mb-5">
						<div class="row">
							<div class="col-md-6 form-group">
								<label>First Name</label> <input class="form-control"
									type="text" placeholder="John" name="firstName" required="required">
							</div>
							<div class="col-md-6 form-group">
								<label>Last Name</label> <input class="form-control" type="text"
									placeholder="Doe" name="lastName" required="required">
							</div>
							<div class="col-md-6 form-group">
								<label>E-mail</label> <input class="form-control" type="text"
									placeholder="example@email.com" name="email" required="required">
							</div>
							<div class="col-md-6 form-group">
								<label>Mobile No</label> <input class="form-control" type="text"
									placeholder="+123 456 789" name="mobileNo" required="required">
							</div>
							<div class="col-md-6 form-group">
								<label>Address </label> <input class="form-control" type="text"
									placeholder="123 Street" name="address" required="required">
							</div>

							<div class="col-md-6 form-group">
								<label>Country</label> <select class="custom-select"
									name="country" required="required">
									<option selected value="united states">United States</option>
									<option value="afghanistan">Afghanistan</option>
									<option value="albania">Albania</option>
									<option value="algeria">Algeria</option>
								</select>
							</div>
							<div class="col-md-6 form-group">
								<label>City</label> <input class="form-control" type="text"
									placeholder="New York" name="city" required="required">
							</div>
							<div class="col-md-6 form-group">
								<label>State</label> <input class="form-control" type="text"
									placeholder="New York" name="state" required="required">
							</div>
							<div class="col-md-6 form-group">
								<label>ZIP Code</label> <input class="form-control" type="text"
									placeholder="123" name="zipCode" required="required">
							</div>
							<div class="col-md-12 form-group">
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input"
										id="newaccount" name="createAccount" value="yes">
									<label class="custom-control-label" for="newaccount">Create
										an account</label>
											<%if(request.getAttribute("accountResult")!=null){%>
								<p class="text-danger"><%=request.getAttribute("accountResult")%></p>
						<%} %>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<h5 class="section-title position-relative text-uppercase mb-3">
						<span class="bg-secondary pr-3">Order Summery</span>
					</h5>
					<div class="bg-light p-30 mb-5">
						<div class="border-bottom">
							<div class="d-flex justify-content-between">
								<p class="text-dark mb-3">Product Name</p>
								<p class="text-dark mb-3">Price</p>
							</div>
							<div class="d-flex justify-content-between">
								<p class="m-3">Click The Icon To Add Product</p>
								<p><a href="index.jsp"><i class="fa fa-plus m-3 text-danger"></i></a></p>
							</div>
							
						</div>
						<div class="border-bottom">
							<div class="d-flex justify-content-between">
								<p class="text-dark mt-3 mb-3">Product Quentity</p>
								<p class="text-dark mb-3 mt-3">Total Price</p>
							</div>
							<div class="d-flex justify-content-between">
								<p></p>
								<p></p>
							</div>
						</div>
					</div>
					<br>
					<div class="mb-5">
						<h5 class="section-title position-relative text-uppercase mb-3">
							<span class="bg-secondary pr-3">Payment</span>
						</h5>
						<div class="bg-light p-30">
							<div class="form-group"></div>
							<div class="form-group mb-4">
								<div class="custom-control custom-radio">
									<input type="radio" class="custom-control-input" name="payment"
										value="castOnDelivery" id="banktransfer" required="required"> <label
										class="custom-control-label" for="banktransfer">Cash
										on delivery (COD)</label>
								</div>
							</div>
							<input type="hidden" name="productId" value="<%=request.getParameter("productId") %>">
							<button type="submit" 
 								class="btn btn-block btn-primary font-weight-bold py-3">Place
								Order</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Checkout End -->
	</form>
	
	<%
	}
	%>
	<%@ include file="/common/footer"%>

	<%@ include file="/common/javascriptLibraries"%>


</body>
</html>