
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Page</title>
<%@ include file="/common/headSection"%>

</head>
<body>

	<%@ include file="/common/topbar"%>

	<%@ include file="/common/navbar.jsp"%>

	<!-- Breadcrumb Start -->
	<div class="container-fluid">
		<div class="row px-xl-5">
			<div class="col-12">
				<nav class="breadcrumb bg-light mb-30">
					<a class="breadcrumb-item text-dark" href="index.jsp">Home</a> <span
						class="breadcrumb-item active">Shopping Cart</span>
				</nav>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Cart Start -->
	<div class="container-fluid">
		<div class="row ">
			<div class="col table-responsive mb-5">
				<table
					class="table table-light table-borderless table-hover text-center mb-0">
					<thead class="thead-dark">
						<tr>
							<th>Products</th>
							<th>Price</th>
							<th>Quantity</th>
							<th>Total</th>
							<th>Remove</th>
							<th>Buy Now</th>
						</tr>
					</thead>

					<tbody class="align-middle">
						<%
						Object object2 = session.getAttribute("cartData");
						@SuppressWarnings("unchecked")
						ArrayList<CartItem> data = (ArrayList<CartItem>) object2;
						%>
						<%
						if (data != null) { for (CartItem d : data) { %>
						<tr>
							<td class="align-middle"><img
								src="img/<%=d.getCartItemImage()%>" alt="" style="width: 50px;"></td>
							<td class="align-middle quantity"><%=d.getCartItemPrice()%></td>
							<td class="align-middle">
								<div class="input-group quantity mx-auto" style="width: 100px;">
									<div class="input-group-btn">
										<button class="btn btn-sm btn-primary btn-minus">
											<i class="fa fa-minus"></i>
										</button>
									</div>
									<input type="text"
										class="form-control form-control-sm bg-secondary border-0 text-center"
										value="<%=d.getCartItemQuentity()%>">
									<div class="input-group-btn">
										<button class="btn btn-sm btn-primary btn-plus">
											<i class="fa fa-plus"></i>
										</button>
									</div>
								</div>
							</td>
							<td class="align-middle" id="data1"><%=d.getCartItemPrice()%>
							</td>
							<td class="align-middle"><a class="btn btn-sm btn-danger"
								href="removeCart?productId=<%=d.getCartItemId()%>"> REMOVE </a></td>
							<td class="align-middle"><a class="btn btn-sm btn-danger"
								href="checkout?productId=<%=d.getCartItemId()%>"> BUY NOW </a></td>
						</tr>
						<%} } else if(data==null){ %>
						<tr>
							<td>null</td>
						</tr>
						<% } %>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<%@ include file="/common/footer"%>

	<%@ include file="/common/javascriptLibraries"%>

</body>
</html>