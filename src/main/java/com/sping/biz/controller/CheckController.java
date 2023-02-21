package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

// inform - 아이디 중복 검사
// pw-find-01 - 아이디 실재 검사
@WebServlet("/view/check")
public class CheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CheckController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO mdao = new MemberDAO();
		MemberVO mvo = new MemberVO();
		
		String mode = request.getParameter("mode");
		boolean checkFlag = false;
		
		if(mode.equals("idCHK") || mode.equals("findPW")||mode.equals("findID")) {
			//아이디 중복검사, 비밀번호 찾기, 아이디 찾기
			if(mode.equals("findID")) {
				//아이디 찾기
				mvo.setmName(request.getParameter("mName"));
				mvo.setmEmail(request.getParameter("mEmail"));
			} else {
				mvo.setmId(request.getParameter("mId"));
			}
			
			if (mdao.selectOneId(mvo) == null) {
				checkFlag = true;
			}
			
		} else if(mode.equals("emailCHK")) {
			//이메일 중복검사
			mvo.setmEmail(request.getParameter("mEmail"));
			if (mdao.selectOneEmailCHK(mvo) == null) {
				checkFlag = true;
			}
		}
		
		if(checkFlag) {
			response.getWriter().println("1"); // 응답할 때 getWriter()를 사용
		}
	}
}
