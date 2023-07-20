package com.deewan.Multi_Shop.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.deewan.Multi_Shop.dto.OrderDto;
import com.deewan.Multi_Shop.dto.Product;
import com.deewan.Multi_Shop.dto.UserDto;
import com.deewan.Multi_Shop.service.OrderService;
import com.deewan.Multi_Shop.service.ProductService;
import com.deewan.Multi_Shop.service.UserService;

@SuppressWarnings("serial")
@WebServlet("/checkout")
public class Checkout extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession httpSession = null;
		UserDto userDto = null;
		UserService userService = null;
		ProductService productService = null;
		Product product = null;
		OrderDto orderDto = null;
//		OrderService orderService = null;
		userDto = new UserDto();
		userService = new UserService();
		productService = new ProductService();
		userDto.setUserFirstname(req.getParameter("firstName"));
		userDto.setUserLastname(req.getParameter("lastName"));
		userDto.setUserEmail(req.getParameter("email"));
		userDto.setUserMobile(Long.parseLong(req.getParameter("mobileNo")));
		userDto.setUserAddress(req.getParameter("address"));
		userDto.setUserCountry(req.getParameter("country"));
		userDto.setUserState(req.getParameter("state"));
		userDto.setUserCity(req.getParameter("city"));
		userDto.setUserZipCode(Integer.parseInt(req.getParameter("zipCode")));
		httpSession = req.getSession();
		httpSession.setAttribute("userInfo", userDto);
		httpSession.setAttribute("email", userDto.getUserEmail());

		if (Integer.parseInt(req.getParameter("productId")) == 0) {
			req.setAttribute("result", "* please add product first");
			RequestDispatcher dispatcher = req.getRequestDispatcher("checkout.jsp");
			dispatcher.forward(req, resp);

		} else {
			if(req.getParameter("createAccount")!=null) {
				String tableEmail = userService.getUserEmailService(userDto.getUserEmail());
				if (tableEmail!=null) {
					req.setAttribute("accountResult", "* already you have an account");
					RequestDispatcher dispatcher = req.getRequestDispatcher("checkout.jsp");
					dispatcher.forward(req, resp);
				}
				else {
					UserService userService1=new UserService();
					userService1.saveUserService(userDto);
					product = productService.getSingleProductService(Integer.parseInt(req.getParameter("productId")));
					orderDto = new OrderDto();
					OrderService orderService = new OrderService();
					orderDto.setOrderItemProductId(product.getProductId());
					orderDto.setOrderItemName(product.getProductName());
					orderDto.setOrderItemPrice(product.getProductPrice());
					orderDto.setOrderItemQuentity(product.getProductQuentity());
					orderDto.setOrderItemImage(product.getProductImage());
					orderDto.setProductCategories(product.getProductCategories());
					orderDto.setOrderItemUserEmail(userDto.getUserEmail());
					orderService.saveOrderService(orderDto);
					req.setAttribute("email", userDto.getUserEmail());
					RequestDispatcher dispatcherRequestDispatcher = req.getRequestDispatcher("orders.jsp");
					dispatcherRequestDispatcher.forward(req, resp);
					resp.sendRedirect("orders.jsp");
				}
			}
			else {
				String tableEmail = userService.getUserEmailService(userDto.getUserEmail());

				if ( tableEmail!=null) {
					product = productService.getSingleProductService(Integer.parseInt(req.getParameter("productId")));
					orderDto = new OrderDto();
					OrderService orderService = new OrderService();
					orderDto.setOrderItemProductId(product.getProductId());
					orderDto.setOrderItemName(product.getProductName());
					orderDto.setOrderItemPrice(product.getProductPrice());
					orderDto.setOrderItemQuentity(product.getProductQuentity());
					orderDto.setOrderItemImage(product.getProductImage());
					orderDto.setProductCategories(product.getProductCategories());
					orderDto.setOrderItemUserEmail(userDto.getUserEmail());
					orderService.saveOrderService(orderDto);

//					req.setAttribute("email", userDto.getUserEmail());
//					RequestDispatcher dispatcherRequestDispatcher =// req.getRequestDispatcher("orders.jsp");
//					dispatcherRequestDispatcher.forward(req, resp);
					resp.sendRedirect("orders.jsp?email="+userDto.getUserEmail());

				}
			}
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("checkout.jsp");
		dispatcher.forward(req, resp);
	}
}
