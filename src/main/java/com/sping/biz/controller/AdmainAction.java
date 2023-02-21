package com.sping.biz.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sping.biz.member.MemberDAO;
import com.sping.biz.member.MemberVO;
import com.sping.biz.member.OrderDAO;
import com.sping.biz.member.OrderVO;

public class AdmainAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("/view/admin/admin-home.jsp");
		forward.setRedirect(false);

		// 쇼핑몰 현황
		OrderVO ovo = new OrderVO();
		OrderDAO odao = new OrderDAO();
		request.setAttribute("statusList", odao.selectAll_ADMIN(ovo));

		// 일별 매출 현황
		request.setAttribute("salesList", odao.selectAll_SALES(ovo));

		// 신규 회원가입 현황
		MemberVO mvo = new MemberVO();
		MemberDAO mdao = new MemberDAO();
		request.setAttribute("mList", mdao.selectAll(mvo));

		return forward;
	}
}
