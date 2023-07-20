package com.deewan.Multi_Shop.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.deewan.Multi_Shop.dto.ContactDto;
import com.deewan.Multi_Shop.service.ContactService;

@SuppressWarnings("serial")
@WebServlet("/contact")
public class Contact extends HttpServlet {
ContactService contactService=new ContactService();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ContactDto contactDto=new ContactDto();
		contactDto.setName(req.getParameter("name"));
		contactDto.setEmail(req.getParameter("email"));
		contactDto.setSubject(req.getParameter("subject"));
		contactDto.setMessaage(req.getParameter("message"));
		contactService.saveContactDaoService(contactDto);

	}
}
