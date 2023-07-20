<%@page import="com.deewan.Multi_Shop.dto.OrderDto"%>
<%@page import="com.deewan.Multi_Shop.service.OrderService"%>
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

	<!-- Breadcrumb Start -->
	<div class="container-fluid">
		<div class="row px-xl-5">
			<div class="col-12">
				<nav class="breadcrumb bg-light mb-30">
					<a class="breadcrumb-item text-dark" href="index.jsp">Home</a> <span
						class="breadcrumb-item active">Orders</span>
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
							<th>Name</th>
							<th>Price</th>
							<th>Quentity</th>
							<th>Cancel Order</th>
						</tr>
					</thead>
					<tbody class="align-middle">
						<%
					//	Object object2 = session.getAttribute("email");
					//	System.out.println(request.getAttribute("email"));
					//	String string = (String) object2;
					//	System.out.println(object2);
						
						OrderService orderService = new OrderService();
						ArrayList<OrderDto> arrayList = orderService.getOrderService(request.getParameter("email"));
						%>
						<%
						if (arrayList != null) {
							for (OrderDto d : arrayList) {
						%>
						<tr>
							<td class="align-middle"><img
								src="img/<%=d.getOrderItemImage()%>" alt="" style="width: 50px;"></td>
							<td class="align-middle quantity"><%=d.getOrderItemName()%></td>
							<td class="align-middle" id="data1"><%=d.getOrderItemPrice()%>
							</td>
							<td class="align-middle"><%=d.getOrderItemQuentity()%></td>
							<td class="align-middle"><a class="btn btn-sm btn-danger"
								href="orders?productId=<%=d.getOrderItemProductId()%>">
									CANCEL </a></td>
						</tr>
						<%
						}
						} else {
						%>
						<tr>
							<td>this is null table<h1>this is null table</h1></td>
						</tr>
						<%
						}
						%>

					</tbody>
				</table>
			</div>
		</div>
	</div>
	<%@ include file="/common/footer"%>

	<%@ include file="/common/javascriptLibraries"%>
</body>
</html>