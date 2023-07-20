package com.deewan.Multi_Shop.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.deewan.Multi_Shop.dto.CartItem;
import com.deewan.Multi_Shop.dto.Product;
import com.deewan.Multi_Shop.service.ProductService;

@SuppressWarnings("serial")
@WebServlet("/index")
public class AddToCart extends HttpServlet {
	ArrayList<CartItem> listdata=new ArrayList<>();
	ProductService productService = new ProductService();
	Product product ;
	HttpSession httpSession;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CartItem cartRecord=new CartItem();
		product = productService.getSingleProductService(Integer.parseInt(req.getParameter("productId")));
		cartRecord.setCartItemId(product.getProductId());
		cartRecord.setCartItemName(product.getProductName());
		cartRecord.setCartItemPrice(product.getProductPrice());
		cartRecord.setCartItemImage(product.getProductImage());
		cartRecord.setCartItemQuentity(1);
		httpSession=req.getSession();
		listdata.add(cartRecord);
			httpSession.setAttribute("cartData", listdata);
			resp.sendRedirect("index.jsp");
//			System.out.println(httpSession+"sessionis creatwd");
	}
}
