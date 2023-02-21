package com.sping.biz.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sping.biz.member.MemberDAO;
import com.sping.biz.member.MemberVO;

public class ChangeInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();

		forward.setPath("change-inform.jsp");
		forward.setRedirect(false);

		MemberDAO mdao = new MemberDAO();
		MemberVO mvo = new MemberVO();
		mvo.setmNum((Integer)request.getSession().getAttribute("mNum"));

		request.setAttribute("member", mdao.selectOneInfo(mvo));

		return forward;
	}
}
