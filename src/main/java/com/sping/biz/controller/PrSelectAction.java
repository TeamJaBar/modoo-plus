package com.sping.biz.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sping.biz.product.ProductDAO;
import com.sping.biz.product.ProductVO;

public class PrSelectAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("/view/admin/admin-product-update.jsp");
		forward.setRedirect(false);

		ProductVO pvo = new ProductVO();
		ProductDAO pdao = new ProductDAO();

		System.out.println("로그: " + request.getParameter("pNum"));
		pvo.setpNum(Integer.parseInt(request.getParameter("pNum")));
		request.setAttribute("infoproduct", pdao.selectOne(pvo));

		return forward;
	}

}
