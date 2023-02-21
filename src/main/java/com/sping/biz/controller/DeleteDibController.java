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
 * Servlet implementation class DeleteDibController
 */
@WebServlet("/view/dibDelete")
public class DeleteDibController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteDibController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DibVO dvo = new DibVO();
		DibDAO ddao = new DibDAO();

		boolean checkFlag = true;

		if (request.getParameter("pNum") != null) {
			dvo.setpNum(Integer.parseInt(request.getParameter("pNum")));
			System.out.println("로그 : DeleteDibController - pNum: " + Integer.parseInt(request.getParameter("pNum")));

			dvo.setmNum((Integer)(request.getSession().getAttribute("mNum")));
			System.out.println("로그 : DeleteDibController - mNum: " + (Integer)(request.getSession().getAttribute("mNum")));

			if (!ddao.delete(dvo)) {
				checkFlag = false;
			}
		} else {
			// ArrayList<String> dib = (ArrayList<String>)(request.getParameter("dibProduct");
			String[] dib = request.getParameterValues("dibProduct");
			for (int i = 0; i < dib.length; i++) {
				dvo.setDibNum(Integer.parseInt(dib[i]));
				if (!ddao.delete(dvo)) {
					checkFlag = false;
				}
			}
		}

		if (checkFlag) {
			response.getWriter().println("1");
		}
	}

}
