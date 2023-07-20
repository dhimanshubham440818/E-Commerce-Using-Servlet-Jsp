<%@page import="javax.annotation.processing.SupportedAnnotationTypes"%>
<%@page import="java.util.List"%>
<%@page import="com.deewan.Multi_Shop.dto.CartItem"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<!-- Navbar Start -->
	<div class="container-fluid bg-dark mb-30">
		<div class="row px-xl-5">
			<div class="col-lg-12">
				<nav
					class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
					<a href="" class="text-decoration-none d-block d-lg-none"> <span
						class="h1 text-uppercase text-dark bg-light px-2">Multi</span> <span
						class="h1 text-uppercase text-light bg-primary px-2 ml-n1">Shop</span>
					</a>
					<button type="button" class="navbar-toggler" data-toggle="collapse"
						data-target="#navbarCollapse">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-between"
						id="navbarCollapse">
						<div class="navbar-nav mr-auto py-0">
							<a href="index.jsp" class="nav-item nav-link active">Home</a> <a
								href="shop.html" class="nav-item nav-link"></a>
							<div class="nav-item dropdown">
								<a href="#" class="nav-link dropdown-toggle"
									data-toggle="dropdown">Pages <i
									class="fa fa-angle-down mt-1"></i></a>
								<div class="dropdown-menu bg-primary rounded-0 border-0 m-0">
									<a href="cart.jsp" class="dropdown-item">Shopping Cart</a> <a
										href="checkout?productId=0" class="dropdown-item">Checkout</a> <a
										href="orders.jsp" class="dropdown-item">My orders</a>
								</div>
							</div>
							<a href="contact.jsp" class="nav-item nav-link">Contact</a>
						</div>
						<div class="navbar-nav ml-auto py-0 d-none d-lg-block">
							<a href="cart.jsp" class="btn px-0 ml-3"> <i
								class="fas fa-shopping-cart text-primary"></i> <span
								class="badge text-secondary border border-secondary rounded-circle"
								style="padding-bottom: 2px;">
						<%
						Object object = session.getAttribute("cartData");
						ArrayList<CartItem> cart_list = (ArrayList<CartItem>) object;
						 if (cart_list != null) {
						 %> <%=cart_list.size()%> <%
						 } else {
						 %> 0 <%
						 }
						 %>
							</span>
							</a>
						</div>
					</div>
				</nav>
			</div>
		</div>
	</div>
	<!-- Navbar End -->
</body>
</html>
