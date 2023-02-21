package controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class WithdrawalAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
	
		forward.setPath("main.do");
		forward.setRedirect(true);

		MemberDAO mdao = new MemberDAO();
		MemberVO mvo = new MemberVO();
		String mId = (String)request.getSession().getAttribute("mId");
		mvo.setmPw(request.getParameter("mPw"));
		mvo.setmId(mId);

		mvo=mdao.selectOneLogin(mvo);//탈퇴하려는 id랑 pw랑 같고 그게 멤버 테이블에 있으면
		if(mvo !=null) {
			if (mdao.delete(mvo)) {
				Cookie cookie=new Cookie("mId",mId);
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				request.getSession().invalidate();
			}
		} else {
			forward.setRedirect(false);
			forward.setPath("alert.jsp");		
			request.setAttribute("title", "탈퇴 실패");
			request.setAttribute("msg", "비밀번호를 확인하세요");
			request.setAttribute("url", "withdrawal.jsp");
		}
		return forward;
	}

}
