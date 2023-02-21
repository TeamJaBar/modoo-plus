package controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("main.do");
		forward.setRedirect(true);

		MemberDAO mdao = new MemberDAO();
		MemberVO mvo = new MemberVO();
		String mId = request.getParameter("mId");//mId 입력값을 Parmeter로 가져온거
		mvo.setmId(mId);
		mvo.setmPw(request.getParameter("mPw"));
		MemberVO member = mdao.selectOneLogin(mvo);
		
		String saveId=request.getParameter("saveId");
		
		System.out.println("체크박스 : " + saveId);
		
		Cookie cookie=new Cookie("mId",mId);

		
		if(member == null) {
			cookie.setMaxAge(0);
			response.addCookie(cookie);
			forward.setRedirect(false);
			forward.setPath("alert.jsp");		
			request.setAttribute("title", "가입된 정보가 없습니다.");
			request.setAttribute("msg", "아이디 혹은 비밀번호를 확인하세요.");
			request.setAttribute("url", "login.jsp");
		} else {
			//로그인 성공
			if(saveId !=null) {//saveId가 있을때(아이디저장 체크가 되어있을때)
				cookie.setMaxAge(60*60*24*30);
				response.addCookie(cookie);
			} else {//체크가 되어있지 않을때
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			request.getSession().setAttribute("mNum", member.getmNum());
			request.getSession().setAttribute("mId", member.getmId());
			request.getSession().setAttribute("mName", member.getmName());
		}

		return forward;
	}

}
