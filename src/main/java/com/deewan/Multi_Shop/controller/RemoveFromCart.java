package com.deewan.Multi_Shop.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.deewan.Multi_Shop.dto.CartItem;


@SuppressWarnings("serial")
@WebServlet("/removeCart")
public class RemoveFromCart extends HttpServlet {
	HttpSession httpSession;
	CartItem cartItem= new CartItem();
	ArrayList<CartItem> cartItems;
	Object object;
	@SuppressWarnings("unchecked")
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		httpSession=req.getSession();
		object=httpSession.getAttribute("cartData");
		cartItems=(ArrayList<CartItem>) object;
		Iterator<CartItem> iterator=cartItems.iterator();
		while (iterator.hasNext()) {
			CartItem cartItem= iterator.next();
			if(cartItem.getCartItemId()==Integer.parseInt(req.getParameter("productId"))) {
				System.out.println(cartItem);
				iterator.remove();
		}
	}
		resp.sendRedirect("cart.jsp");
	}
}