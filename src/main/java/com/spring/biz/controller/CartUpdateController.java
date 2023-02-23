package com.spring.biz.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spring.biz.product.ProductDAO;
import com.spring.biz.product.ProductVO;

@WebServlet("/view/cartUpdate")
public class CartUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CartUpdateController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductVO pvo = new ProductVO();
		ProductDAO pdao = new ProductDAO();
		ArrayList<ProductVO> cart = (ArrayList<ProductVO>)request.getSession().getAttribute("cart");

		// pNum, pCnt
		int pNum = Integer.parseInt(request.getParameter("pNum"));
		int pCnt = Integer.parseInt(request.getParameter("pCnt"));

		for (int i = 0; i < cart.size(); i++) {
			if (cart.get(i).getpNum() == pNum) { // 추가하려는 상품이 장바구니에 있다면
				cart.get(i).setpCnt(pCnt); // 기존 장바구니 구매 수량 + pCnt
				break;
			}
		}

		request.getSession().setAttribute("cart", cart);
		response.getWriter().println("1");
	}

}
