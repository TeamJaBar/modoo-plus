package com.sping.biz.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sping.biz.product.ProductDAO;
import com.sping.biz.product.ProductVO;

// 찜 목록
@WebServlet("/view/cartInsertDibs")
public class CartInsertDibsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CartInsertDibsController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductVO pvo = new ProductVO();
		ProductDAO pdao = new ProductDAO();
		ArrayList<ProductVO> cart = (ArrayList<ProductVO>)request.getSession().getAttribute("cart");
//		System.out.println("dListparamval: " + request.getParameterValues("dibProduct"));

		String[] arDibs = request.getParameterValues("dibProduct");
//		for (int i = 0; i < arDib.length; i++) {
//			System.out.println("arDib[" + i + "]: " + arDib[i]);
//		}

		for (int i = 0; i < arDibs.length; i++) {
			boolean isExisting = false;
			int pNum = Integer.parseInt(arDibs[i]);

			for (int j = 0; j < cart.size(); j++) {
				if (cart.get(j).getpNum() == pNum) { // 추가하려는 상품이 장바구니에 있다면
					isExisting = true;
					cart.get(i).setpCnt(cart.get(i).getpCnt() + 1); // 기존 장바구니 구매 수량 + pCnt
					break;
				}
			}

			if (!isExisting) { // 장바구니에 없다면
				pvo.setpNum(pNum); // 상품 번호(PK)
				cart.add(pdao.selectOne(pvo)); // 해당 상품 정보 추가
				cart.get(cart.size() - 1).setpCnt(1); // 구매 수량 = 1
			}
		}

		request.getSession().setAttribute("cart", cart);
		response.getWriter().println("1");

	}
}
