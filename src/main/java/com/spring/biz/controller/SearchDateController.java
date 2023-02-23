package com.spring.biz.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spring.biz.member.OrderDAO;
import com.spring.biz.member.OrderVO;

/**
 * Servlet implementation class SearchDateController
 */
@WebServlet("/view/searchDate")
public class SearchDateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SearchDateController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		OrderVO ovo = new OrderVO();
		OrderDAO odao = new OrderDAO();

		ovo.setmNum((Integer)(request.getSession().getAttribute("mNum")));
		ovo.setSearchCal(Integer.parseInt(request.getParameter("searchCal")));

		// Ajax로 배열을 이렇게 넘기는 게 맞나?
		response.getWriter().print(odao.selectAll(ovo));

	}

}
