package com.spring.biz.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spring.biz.member.MemberDAO;
import com.spring.biz.member.MemberVO;

public class JoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();

		forward.setPath("join-ok.jsp");
		forward.setRedirect(false);

		MemberDAO mdao = new MemberDAO();
		MemberVO mvo = new MemberVO();

		mvo.setmId(request.getParameter("mId"));
		mvo.setmPw(request.getParameter("mPw"));
		mvo.setmName(request.getParameter("mName"));
		mvo.setmEmail(request.getParameter("mEmail"));
		mvo.setmTel(request.getParameter("mTel"));
		mvo.setZipCode(request.getParameter("zipCode"));
		mvo.setUserAddr(request.getParameter("userAddr"));
		mvo.setDetailAddr(request.getParameter("detailAddr"));
		if (request.getParameter("kakao") != null) {
			mvo.setKakao("kakao");
		} else {
			mvo.setKakao("일반");
		}

		if (mdao.insert(mvo)) {
			request.setAttribute("mName", mvo.getmName());
			return forward;
		}

		return null;
	}
}
