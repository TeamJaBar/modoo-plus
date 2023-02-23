package com.spring.biz.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spring.biz.product.ProductDAO;
import com.spring.biz.product.ProductVO;

public class PrUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("prSelectAll.do");
		forward.setRedirect(true);

		ProductVO pvo = new ProductVO();
		ProductDAO pdao = new ProductDAO();

		System.out.println("로그 카테고리 액션: " + request.getParameter("cateNum"));
		System.out.println("로그 상품번호 액션: " + request.getParameter("pNum"));
		pvo.setCateNum(Integer.parseInt(request.getParameter("cateNum")));
		pvo.setpName(request.getParameter("pName"));
		pvo.setFixPrice(Integer.parseInt(request.getParameter("fixPrice")));
		pvo.setSelPrice(Integer.parseInt(request.getParameter("selPrice")));
		pvo.setRePerson(request.getParameter("rePerson"));
		pvo.setReAge(Integer.parseInt(request.getParameter("reAge")));
		pvo.setBrand(request.getParameter("brand"));
		// pvo.setpImg(request.getParameter("pImg"));
		// pvo.setInfoImg(request.getParameter("infoImg"));
		pvo.setProductCnt(Integer.parseInt(request.getParameter("productCnt")));
		pvo.setpNum(Integer.parseInt(request.getParameter("pNum")));

		pdao.update(pvo);

		return forward;
	}

}
