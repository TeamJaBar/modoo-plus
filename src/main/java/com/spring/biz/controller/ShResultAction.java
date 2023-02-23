package com.spring.biz.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spring.biz.product.ProductDAO;
import com.spring.biz.product.ProductVO;

public class ShResultAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("search-result.jsp");
		forward.setRedirect(false);

		ProductVO pvo = new ProductVO();
		ProductDAO pdao = new ProductDAO();

		pvo.setCateNum(Integer.parseInt(request.getParameter("cateNum")));

		String brand = request.getParameter("brand");
		if (brand.equals("브랜드")) {
			pvo.setBrand(null);
		} else {
			pvo.setBrand(brand);
		}

		pvo.setLowNum(Integer.parseInt(request.getParameter("lowNum")));
		pvo.setHighNum(Integer.parseInt(request.getParameter("highNum")));
		String searchContent = request.getParameter("pName");
		pvo.setpName(searchContent);

		request.setAttribute("rList", pdao.selectAllSearch(pvo));
		request.setAttribute("searchContent", searchContent);

		return forward;
	}

}
