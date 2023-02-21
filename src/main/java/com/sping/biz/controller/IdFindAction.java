package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class IdFindAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		forward.setPath("id-find-ok.jsp");
		forward.setRedirect(false);

		MemberDAO mdao = new MemberDAO();
		MemberVO mvo = new MemberVO();
		
		mvo.setmName(request.getParameter("mName"));
		mvo.setmEmail(request.getParameter("mEmail"));
		MemberVO member = mdao.selectOneId(mvo);
		
		if(member == null) {
			request.setAttribute("title", "가입된 정보가 없습니다.");
			request.setAttribute("msg", "아이디 혹은 이메일을 확인하세요.");
			request.setAttribute("url", "id-find.jsp");
			forward.setPath("alert.jsp");			
		} else {
			request.setAttribute("mName", request.getParameter("mName"));
			request.setAttribute("mId", member.getmId());
		}


		return forward;
	}

}
