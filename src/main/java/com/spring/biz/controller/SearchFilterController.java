package com.spring.biz.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spring.biz.product.CategoryVO;
import com.spring.biz.product.ProductDAO;
import com.spring.biz.product.ProductVO;

@WebServlet("/view/searchFilter")
public class SearchFilterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SearchFilterController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	} 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductVO pvo = new ProductVO();
		ProductDAO pdao = new ProductDAO();
		CategoryVO cvo = new CategoryVO();

		if (request.getSession().getAttribute("mNum") != null) {
			pvo.setDib((Integer)request.getSession().getAttribute("mNum"));
		}

		int cateNum = Integer.parseInt(request.getParameter("cateNum"));

		cvo.setCateNum(cateNum);
		cvo.setLowNum(cateNum);
		cvo.setHighNum(cateNum);
		System.out.println(pdao.selectAllCateNum(cvo));
		request.setAttribute("cList", pdao.selectAllCateNum(cvo));

		pvo.setpName(request.getParameter("pName"));
		pvo.setFilterPrice(Integer.parseInt(request.getParameter("filterPrice")));
		pvo.setFilterTags(Integer.parseInt(request.getParameter("filterTags")));
		pvo.setFilterSortBy(Integer.parseInt(request.getParameter("filterSortBy")));
		pvo.setCateNum(cateNum);

		System.out.println("로그 : 필터 검색 :" + request.getSession().getAttribute("mNum") + " " + request.getParameter("pName") + " " + Integer.parseInt(request.getParameter("filterPrice")) + " "
				+ Integer.parseInt(request.getParameter("filterTags")) + " " + Integer.parseInt(request.getParameter("filterSortBy")) + " " + Integer.parseInt(request.getParameter("cateNum")));

		ArrayList<ProductVO> searchResult = pdao.selectAllFilter(pvo);

		System.out.println("로그 - 데이터 가져오기 성공 : " + searchResult.size());

		request.setAttribute("searchResult", pdao.selectAllFilter(pvo));

		RequestDispatcher dispatcher = request.getRequestDispatcher("product-list.jsp");
		dispatcher.forward(request, response);
	}
}
