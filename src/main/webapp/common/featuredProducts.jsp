<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.deewan.Multi_Shop.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.deewan.Multi_Shop.service.ProductService"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<!-- Products Start -->
	<div class="container-fluid pt-5 pb-3">
		<h2
			class="section-title position-relative text-uppercase mx-xl-5 mb-4">
			<span class="bg-secondary pr-3">FEATURED PRODUCTS</span>
		</h2>
		<div class="row px-xl-5">
			<%!
			ProductService productService2 = new ProductService();
			List<Product> products2 = productService2.getAllProductService();
			%>

			<%
			if (products2 != null) {
				for (Product product : products2) {
					if (product.getProductCategories().equals("recentProducts")) {
			%>
			<div class="col-lg-3 col-md-4 col-sm-6 pb-1">
				<div class="product-item bg-light mb-4">
					<div class="product-img position-relative overflow-hidden">
						<img class="img-fluid w-100" src="img/<%=product.getProductImage()%>" alt="">
						<div class="product-action">
							<a class="btn btn-outline-dark" href="index?productId=<%= product.getProductId() %>" >Add To Cart</a> <a
								class="btn btn-outline-dark" href="checkout?productId=<%= product.getProductId() %>">Buy Now</a>
						</div>
					</div>
					<div class="text-center py-4">
						<a class="h6 text-decoration-none text-truncate" href=""> <%=product.getProductName()%>
						</a>
						<div class="d-flex align-items-center justify-content-center mt-2">
							<h5><%=product.getProductPrice()%></h5>
							<h6 class="text-muted ml-2">
								<del><%=product.getProductActualPrice()%></del>
							</h6>
						</div>
						<div class="d-flex align-items-center justify-content-center mb-1">
							<small class="fa fa-star text-primary mr-1"></small> <small
								class="fa fa-star text-primary mr-1"></small> <small
								class="fa fa-star text-primary mr-1"></small> <small
								class="fa fa-star-half-alt text-primary mr-1"></small> <small
								class="far fa-star text-primary mr-1"></small> <small><%=product.getProductCategories()%></small>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			}
			} else {
					out.println("error");
			}
			%>
		</div>
	</div>
	<!-- Products End -->


</body>
</html>