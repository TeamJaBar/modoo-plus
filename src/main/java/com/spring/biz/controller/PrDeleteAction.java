package com.spring.biz.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spring.biz.product.ProductDAO;
import com.spring.biz.product.ProductVO;

public class PrDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("prSelectAll.do");
		forward.setRedirect(true);

		ProductVO pvo = new ProductVO();
		ProductDAO pdao = new ProductDAO();
		pvo.setpNum(Integer.parseInt(request.getParameter("pNum")));

		// System.out.println("로그: "+request.getParameter("pNum"));

		if (pdao.delete(pvo)) {
			return forward;
		}
		;
		return null;
	}

}
