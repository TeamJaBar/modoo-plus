package com.sping.biz.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sping.biz.member.MemberDAO;
import com.sping.biz.member.MemberVO;

public class AdMemberMainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("/view/admin/admin-member.jsp");
		forward.setRedirect(false);

		MemberVO mvo = new MemberVO();
		MemberDAO mdao = new MemberDAO();

		ArrayList<MemberVO> members = mdao.selectAllMember(mvo);

		request.setAttribute("members", members);

		return forward;
	}

}
