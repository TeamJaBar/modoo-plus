package com.spring.controller;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.biz.common.SweetAlertDTO;
import com.spring.biz.member.MemberService;
import com.spring.biz.member.MemberVO;

@Controller
@RequestMapping(value="/view")
public class AccountController {

	@Autowired
	private MemberService memberService;
	
	// 로그아웃
	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session) {
		System.out.println("LogoutController 입장");

		session.removeAttribute("mNum");
		session.removeAttribute("mId");
		session.removeAttribute("mName");

		return "redirect:main.do";
	}

	// 회원가입
	@RequestMapping(value = "/join.do")
	public String join(MemberVO mvo, Model model) {
		if (mvo.getKakao() != null) {
			mvo.setKakao("kakao");
		} else {
			mvo.setKakao("일반");
		}

		if (memberService.insert(mvo)) {
			model.addAttribute("mName", mvo.getmName());
			return "join-ok.jsp";
		}
		return null;
	}

	// 로그인
	@RequestMapping(value = "/login.do")
	public String login(MemberVO mvo, SweetAlertDTO sweet, HttpServletResponse response, HttpSession session) {
		mvo = memberService.selectOneLogin(mvo);
		System.out.println("체크박스 : " + mvo.getSaveId());
		Cookie cookie = new Cookie("mId", mvo.getmId());

		if (mvo.getmId() == null) {
			cookie.setMaxAge(0);
			response.addCookie(cookie);
			sweet.setTitle("가입된 정보가 없습니다.");
			sweet.setMsg("아이디 혹은 비밀번호를 확인하세요.");
			sweet.setUrl("login.jsp");
			return "alert.jsp";
		} else {
			// 로그인 성공
			if (mvo.getSaveId() != null) {// saveId가 있을때(아이디저장 체크가 되어있을때)
				cookie.setMaxAge(60 * 60 * 24 * 30);
				response.addCookie(cookie);
			} else {// 체크가 되어있지 않을때
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			session.setAttribute("mNum", mvo.getmNum());
			session.setAttribute("mId", mvo.getmId());
			session.setAttribute("mName", mvo.getmName());
		}
		return "main.do";
	}

	// 아이디 찾기
	@RequestMapping(value = "/idFind.do")
	public String idFind(MemberVO mvo, SweetAlertDTO sweet, Model model) {
		mvo = memberService.selectOneId(mvo);

		if (mvo == null) {
			sweet.setTitle("가입된 정보가 없습니다.");
			sweet.setMsg("아이디 혹은 비밀번호를 확인하세요.");
			sweet.setUrl("id-find.jsp");
			return "alert.jsp";
		} else {
			model.addAttribute("mName", mvo.getmName());
			model.addAttribute("mId", mvo.getmId());
		}

		return "id-find-ok.jsp";
	}

	// 비밀번호 찾기 - 01. 조회
	@RequestMapping(value = "/pwFind.do")
	public String pwFind(MemberVO mvo, SweetAlertDTO sweet, Model model) {
		mvo = memberService.selectOneId(mvo);
		model.addAttribute("mId", mvo.getmId());

		mvo = memberService.selectOneFindPw(mvo);
		model.addAttribute("mEmail", mvo.getmEmail());
		model.addAttribute("findPw", mvo.getFindPw());

		return "pw-find-02.jsp";
	}

	// 비밀번호 찾기 - 02. 이메일 전송
	@RequestMapping(value = "/sendEmail.do")
	public String sendEmail(MemberVO mvo, Random rand, Properties props, MimeMessage message, Session session, Model model) {
		model.addAttribute("mId", mvo.getmId());

		// 랜덤 인증번호 생성
		final int CIPHER = 5; // 자릿수
		int range = (int)Math.pow(10, CIPHER);// 10의 5승
		int trim = (int)Math.pow(10, CIPHER - 1);// 10의 4승
		int result = rand.nextInt(range) + trim; // 5자리 숫자 생성

		if (result > range) { // 자릿수가 넘었다면
			result = result - trim;
		}

		System.out.println("로그 : 랜덤 인증번호 생성 - " + result);

		model.addAttribute("code", result);

		String host = "smtp.gmail.com"; // 구글
		final String user = "modoo.shop.3@gmail.com"; // 이메일 주소
		final String password = "xzikqxicctfulsii"; // 앱 비밀번호

//      String host = "smtp.naver.com"; // 네이버
//      final String user = "발신자 이메일"; // 이메일 주소
//      final String password = "이메일 비밀번호"; // 이메일 비밀번호

		String to = mvo.getmEmail(); // 사용자의 이메일 주소

		// 설정
		props.put("mail.smtp.host", host); // STMP 서버 설정
		props.put("mail.smtp.starttls.enable", "true"); // 두 컴퓨터 사이의 연결 암호화 표준 기술
		props.put("mail.smtp.ssl.protocols", "TLSv1.2"); // TLS 버전정보 설정
		props.put("mail.smtp.auth", "true"); // 인증을 필요로 하는 SMTP에 접속하기위해 필요한 설정
		props.put("mail.smtp.port", "587"); // 포트 번호 설정

		// [1] Session 인스턴스 생성
		session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password); // 인증을 필요로 하기 때문에 이메일 주소와 앱 비밀번호를 Session에 넘겨줘야 함
			}
		});

		// [2] 메세지 작성
		try {
			message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			// 제목
			message.setSubject("[모두의 보드] 인증번호 발송");

			// 내용
			message.setText("안녕하세요 모두의 보드입니다." + "\n인증번호: " + result + "\n요청하신 페이지에 해당 인증번호를 입력해 주세요.");
			// setText의 parameter는 String 타입

			// [3] 메세지 전송
			Transport.send(message);
			System.out.println("이메일 전송 성공!");

		} catch (MessagingException e) {
			e.printStackTrace();
		}

		return "pw-find-03.jsp";
	}

	// 회원정보 변경
	@RequestMapping(value = "/update.do")
	public String update(MemberVO mvo, HttpSession session) {
		String path = "";

		mvo.setmNum((Integer)session.getAttribute("mNum"));
		if (session.getAttribute("mId") == null) { // pw-find
			path = "login.jsp";
		} else { // change-inform
			path = "changeInfo.do";
		}

		if (memberService.update(mvo)) {
			return path;
		}
		return null;
	}

	// 회원탈퇴
	@RequestMapping(value = "/withdrawal.do")
	public String delete(MemberVO mvo, SweetAlertDTO sweet, HttpSession session, HttpServletResponse response) {
		String mId = (String)session.getAttribute("mId");
		mvo.setmId(mId);

		mvo = memberService.selectOneLogin(mvo);// 탈퇴하려는 id랑 pw랑 같고 그게 멤버 테이블에 있으면
		if (mvo != null) {
			if (memberService.delete(mvo)) {
				Cookie cookie = new Cookie("mId", mId);
				cookie.setMaxAge(0);
				response.addCookie(cookie);

				session.removeAttribute("mNum");
				session.removeAttribute("mId");
				session.removeAttribute("mName");
				return "redirect:main.do";
			}
		} else {
			sweet.setTitle("탈퇴 실패");
			sweet.setMsg("비밀번호를 확인하세요");
			sweet.setUrl("withdrawal.jsp");
			return "alert.jsp";
		}
		return null;
	}
	
	// 회원정보 변경 페이지 이동
	@RequestMapping(value = "/changeInfo.do")
	public String selectOneChangeInfo(MemberVO mvo, HttpSession session, Model model) {
		mvo.setmNum((Integer)session.getAttribute("mNum"));
		model.addAttribute("member", memberService.selectOneInfo(mvo));

		return "change-inform.jsp";
	}
	
	// inform - 아이디 중복 검사
	// pw-find-01 - 아이디 실재 검사
	@ResponseBody
	@RequestMapping(value = "/check.do", method = RequestMethod.POST)
	public String selectOneCheck(MemberVO mvo) {
		boolean checkFlag = false;

		if (mvo.getMode().equals("idCHK") || mvo.getMode().equals("findPW")) {
			// 아이디 중복검사, 비밀번호 찾기, 아이디 찾기
			if (memberService.selectOneId(mvo) == null) {
				checkFlag = true;
			}
		} else if (mvo.getMode().equals("emailCHK")) {
			// 이메일 중복검사
			if (memberService.selectOneEmailCHK(mvo) == null) {
				checkFlag = true;
			}
		}

		if (checkFlag) {
			return "1"; // 응답할 때 getWriter()를 사용
		}
		return "-1";
	}
	

}
