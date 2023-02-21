package com.sping.biz.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sping.biz.product.ProductDAO;
import com.sping.biz.product.ProductVO;

public class PrSelectAllAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("/view/admin/admin-product.jsp");
		forward.setRedirect(false);

		ProductVO pvo = new ProductVO();
		ProductDAO pdao = new ProductDAO();

		pvo.setCateNum(100);

		ArrayList<ProductVO> products = pdao.selectAll(pvo);

		request.setAttribute("products", products);

		return forward;
	}

}
