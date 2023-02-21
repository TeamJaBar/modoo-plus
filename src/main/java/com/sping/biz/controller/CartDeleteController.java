package com.sping.biz.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sping.biz.product.ProductVO;uct.ProductVO;

@WebServlet("/view/cartDelete")
public class CartDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CartDeleteController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<ProductVO> cart = (ArrayList<ProductVO>)request.getSession().getAttribute("cart");

		String[] arDelete = request.getParameterValues("arProduct");
		for (int i = 0; i < arDelete.length; i++) {
			int pNum = Integer.parseInt(arDelete[i]);
			System.out.println("pNum : " + pNum);

			for (int j = 0; j < cart.size(); j++) {
				if (cart.get(j).getpNum() == pNum) {
					cart.remove(j); // 해당 인덱스의 상품 제거
					break;
				}
			}
		}

		request.getSession().setAttribute("cart", cart);
		response.getWriter().println("1");
	}

}
