package com.spring.biz.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spring.biz.member.AddressDAO;
import com.spring.biz.member.AddressVO;
import com.spring.biz.member.MemberDAO;
import com.spring.biz.member.MemberVO;
import com.spring.biz.product.ProductDAO;
import com.spring.biz.product.ProductVO;

public class OrderAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();

		forward.setPath("order.jsp");
		forward.setRedirect(false);

		MemberVO mvo = new MemberVO();
		MemberDAO mdao = new MemberDAO();
		AddressVO avo = new AddressVO();
		AddressDAO adao = new AddressDAO();
		ProductVO pvo = new ProductVO();
		ProductDAO pdao = new ProductDAO();
		ArrayList<ProductVO> prodList = new ArrayList<ProductVO>();

		String[] arpNum = request.getParameterValues("chk");
		String[] arpCnt = request.getParameterValues("num-product");

		for (int i = 0; i < arpNum.length; i++) {
			pvo.setpNum(Integer.parseInt(arpNum[i]));
			pvo = pdao.selectOne(pvo);
			pvo.setpCnt(Integer.parseInt(arpCnt[i]));
			prodList.add(pvo);
		}
		System.out.println("\t주문서 상품 로그: " + prodList);

		mvo.setmNum((Integer)request.getSession().getAttribute("mNum"));
		avo.setmNum((Integer)request.getSession().getAttribute("mNum"));

		request.setAttribute("member", mdao.selectOneInfo(mvo));
		request.setAttribute("defAddr", adao.selectOne(avo));
		request.setAttribute("prodList", prodList);

		return forward;
	}
}
