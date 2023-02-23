package com.spring.biz.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spring.biz.member.MemberDAO;
import com.spring.biz.member.MemberVO;

public class PwFindAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();

		forward.setPath("pw-find-02.jsp");
		forward.setRedirect(false);

		MemberDAO mdao = new MemberDAO();
		MemberVO mvo = new MemberVO();

		mvo.setmId(request.getParameter("mId"));
		MemberVO member = mdao.selectOneId(mvo);
		request.setAttribute("mId", member.getmId());

		member = mdao.selectOneFindPw(mvo);
		request.setAttribute("mEmail", member.getmEmail());
		request.setAttribute("findPw", member.getFindPw());

		return forward;
	}

}
