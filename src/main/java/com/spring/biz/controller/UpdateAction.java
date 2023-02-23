package com.spring.biz.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spring.biz.member.MemberDAO;
import com.spring.biz.member.MemberVO;

// pw-find - 비밀번호 재설정
// change-inform - 회원 정보 변경
public class UpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();

		forward.setRedirect(false);

		MemberDAO mdao = new MemberDAO();
		MemberVO mvo = new MemberVO();
		String mId = (String)request.getSession().getAttribute("mId");
		mvo.setmId(mId);

		if (mId == null) { // pw-find
			forward.setPath("login.jsp");
			mvo.setmId(request.getParameter("mId"));
			mvo.setmPw(request.getParameter("mPw"));
		} else { // change-inform
			forward.setPath("changeInfo.do");
			mvo.setmNum((Integer)request.getSession().getAttribute("mNum"));
			mvo.setmPw(request.getParameter("mPw"));
			mvo.setmEmail(request.getParameter("mEmail"));
			mvo.setmTel(request.getParameter("mTel"));
			mvo.setZipCode(request.getParameter("zipCode"));
			mvo.setUserAddr(request.getParameter("userAddr"));
			mvo.setDetailAddr(request.getParameter("detailAddr"));
		}

		if (mdao.update(mvo)) {
			return forward;
		}

		return null;
	}
}
