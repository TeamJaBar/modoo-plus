package com.sping.biz.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sping.biz.product.CategoryVO;
import com.sping.biz.product.ProductDAO;
import com.sping.biz.product.ProductVO;

public class MainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("main.jsp");
		forward.setRedirect(false);

		final int newCategory = 1000;
		final int mdCategory = 300;
		final int lowNum = 300;
		final int highNum = 600;
		int initPageCnt = 16;
		int newPageCnt = 8;

		// 장바구니
		if (request.getSession().getAttribute("cart") == null) {
			ArrayList<ProductVO> cart = new ArrayList<ProductVO>();
			request.getSession().setAttribute("cart", cart);
			System.out.println("\t로그: cart 생성 완료");
		}

		// NEW 상품 목록
		ProductVO pvo = new ProductVO();
		ProductDAO pdao = new ProductDAO();
		pvo.setCateNum(newCategory);
		pvo.setPageCnt(newPageCnt);
		request.setAttribute("newList", pdao.selectAll(pvo));

		// MD 추천 목록
		pvo.setCateNum(mdCategory);
		pvo.setLowNum(lowNum);
		pvo.setHighNum(highNum);
		pvo.setPageCnt(initPageCnt);

		if (request.getSession().getAttribute("mNum") != null) {
			pvo.setDib((Integer)request.getSession().getAttribute("mNum"));
		}

		request.setAttribute("cateNum", mdCategory);
		request.setAttribute("lowNum", lowNum);
		request.setAttribute("highNum", highNum);
		request.setAttribute("pageCnt", initPageCnt);
		request.setAttribute("pList", pdao.selectAll(pvo));

		// MD 추천 목록 카테고리 대분류
		CategoryVO cvo = new CategoryVO();
		cvo.setLowNum(lowNum);
		cvo.setHighNum(highNum);
		request.setAttribute("cList", pdao.selectAll(cvo));

		return forward;
	}
}
