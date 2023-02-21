package com.sping.biz.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sping.biz.product.ProductDAO;
import com.sping.biz.product.ProductVO;

@WebServlet("/view/quickView")
public class QuickViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public QuickViewController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO pdao = new ProductDAO();
		ProductVO pvo = new ProductVO();

		pvo.setpNum(Integer.parseInt(request.getParameter("pNum")));
		if (request.getSession().getAttribute("mNum") != null) {
			pvo.setDib((Integer)(request.getSession().getAttribute("mNum")));
		}

		pvo = pdao.selectOne(pvo);

		if (pvo != null) {
			Gson gson = new Gson();
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().print(gson.toJson(pvo));
			System.out.println(gson.toJson(pvo));
		}
	}
}
