package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class MemSelectAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=new ActionForward();
		forward.setPath("/view/admin/admin-member-update.jsp");
		forward.setRedirect(false);
		
		MemberVO mvo=new MemberVO();
		MemberDAO mdao=new MemberDAO();
		
		mvo.setmNum(Integer.parseInt(request.getParameter("mNum")));
		request.setAttribute("infomember", mdao.selectOneInfo(mvo));
		
		
		return forward;
	}

}
