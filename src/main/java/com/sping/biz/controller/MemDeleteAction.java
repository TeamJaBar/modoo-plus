package com.sping.biz.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sping.biz.member.MemberDAO;
import com.sping.biz.member.MemberVO;

public class MemDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("adMemberMain.do");
		forward.setRedirect(true);

		MemberVO mvo = new MemberVO();
		MemberDAO mdao = new MemberDAO();

		System.out.println(request.getParameter("mNum"));
		System.out.println(Integer.parseInt(request.getParameter("mNum")));

		mvo.setmNum(Integer.parseInt(request.getParameter("mNum")));

		if (mdao.delete(mvo)) {
			return forward;
		}

		return null;
	}

}
