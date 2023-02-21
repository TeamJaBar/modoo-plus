package com.sping.biz.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sping.biz.member.DibDAO;
import com.sping.biz.member.DibVO;

/**
 * Servlet implementation class InsertDibController
 */
@WebServlet("/view/dibInsert")
public class InsertDibController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InsertDibController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DibVO dvo = new DibVO();
		DibDAO ddao = new DibDAO();

		dvo.setpNum(Integer.parseInt(request.getParameter("pNum")));

		if (request.getSession().getAttribute("mNum") != null) {
			dvo.setmNum((Integer)(request.getSession().getAttribute("mNum")));
			if (ddao.insert(dvo)) {
				response.getWriter().println("1");
			}
		} else {
			response.getWriter().println("-1");
		}
	}
}
