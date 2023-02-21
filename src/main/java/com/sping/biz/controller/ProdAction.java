package com.sping.biz.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sping.biz.product.CategoryVO;
import com.sping.biz.product.ProductDAO;
import com.sping.biz.product.ProductVO;

public class ProdAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();

		forward.setRedirect(false);

		CategoryVO cvo = new CategoryVO();
		ProductVO pvo = new ProductVO();
		ProductDAO pdao = new ProductDAO();

		int initPageCnt = 41;
		int cateNum = Integer.parseInt(request.getParameter("cateNum"));
		int lowNum = cateNum;
		int highNum = cateNum;
		System.out.println(cateNum);

		// 카테고리 목록
		cvo.setCateNum(cateNum);
		cvo.setLowNum(lowNum);
		cvo.setHighNum(highNum);
		System.out.println(pdao.selectAllCateNum(cvo));
		request.setAttribute("cList", pdao.selectAllCateNum(cvo));

		// 상품 목록
		pvo.setCateNum(cateNum);
		pvo.setLowNum(lowNum);
		pvo.setHighNum(highNum);
		pvo.setPageCnt(initPageCnt);
		if (request.getSession().getAttribute("mNum") != null) {
			pvo.setDib((Integer)request.getSession().getAttribute("mNum"));
		}

		request.setAttribute("prodList", pdao.selectAll(pvo));

		forward.setPath("product.jsp");

		return forward;
	}

}
