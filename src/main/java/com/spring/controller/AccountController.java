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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.biz.common.ImageUploadUtil;
import com.spring.biz.common.SweetAlertDTO;
import com.spring.biz.member.MemberService;
import com.spring.biz.member.MemberVO;

@Controller
@RequestMapping(value = "/view")
public class AccountController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private BCryptPasswordEncoder bCryptEncoder;

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
	public String join(MemberVO mvo, Model model, HttpServletRequest request) {
		if (mvo.getKakao() != null) {
			mvo.setKakao("kakao");
		} else {
			mvo.setKakao("일반");
		}
		MultipartFile uploadProfile = mvo.getUploadFile();
		String mImg = "default.png";
		if (!uploadProfile.isEmpty()) {
			mImg = ImageUploadUtil.getImgFileName(request, uploadProfile, "profile");
		}
		mvo.setmImg(mImg);

		// 암호화
		mvo.setmPw(bCryptEncoder.encode(mvo.getmPw()));

		if (memberService.insert(mvo)) {
			model.addAttribute("mName", mvo.getmName());
			return "join-ok.jsp";
		}
		return null;
	}

	// 로그인
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginView(HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		System.out.println("referer: " + referer);
		request.getSession().setAttribute("redirectURI", referer);
		
		return "redirect:login.jsp";
	}

	// 로그인
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(MemberVO mvo, SweetAlertDTO sweet, HttpServletResponse response, HttpSession session, Model model) {
		String redirectURI = (String)session.getAttribute("redirectURI");
		Cookie cookie;
		if (mvo.getmId() != null) {
			cookie = new Cookie("mId", mvo.getmId());
			if (mvo.getSaveId() != null) {// saveId가 있을때(아이디저장 체크가 되어있을때)
				cookie.setMaxAge(60 * 60 * 24 * 30);
				response.addCookie(cookie);
			} else {// 체크가 되어있지 않을때
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}

			MemberVO vo = memberService.selectOneLogin(mvo);
			if (bCryptEncoder.matches(mvo.getmPw(), vo.getmPw())) {
				mvo.setmPw(vo.getmPw());
			}
			mvo = memberService.selectOneMember(mvo);

			if (mvo == null) {
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				sweet.setTitle("가입된 정보가 없습니다.");
				sweet.setMsg("아이디 혹은 비밀번호를 확인하세요.");
				sweet.setUrl("login.jsp");
				model.addAttribute("sweet", sweet);
				return "alert.jsp";
			} else if (mvo.getmStatus().equals("1")) {
				sweet.setTitle("사용자의 신고로 정지당한 계정입니다.");
				sweet.setMsg("관리자에게 문의하세요.");
				sweet.setUrl("login.jsp");
				model.addAttribute("sweet", sweet);
				return "alert.jsp";
			} else {
				// 로그인 성공
				session.setAttribute("mNum", mvo.getmNum());
				session.setAttribute("mId", mvo.getmId());
				session.setAttribute("mName", mvo.getmName());
				session.setAttribute("mImg", mvo.getmImg());
				session.removeAttribute("redirectURI");
			}
			// 카카오 로그인시
		} else {
			String email = mvo.getmEmail();
			mvo.setKakao("kakao");
			mvo = memberService.selectOneMember(mvo);
			System.out.println(mvo);
			if (mvo == null) {
				System.out.println(email);
				model.addAttribute("mEmail", email);
				return "inform.jsp";
			} else if (mvo.getmStatus().equals("1")) {
				sweet.setTitle("사용자의 신고로 정지당한 계정입니다.");
				sweet.setMsg("관리자에게 문의하세요.");
				sweet.setUrl("login.jsp");
				model.addAttribute("sweet", sweet);
				return "alert.jsp";
			} else if (mvo.getKakao() == null) {
				sweet.setTitle("이미 가입되어있는 이메일 주소입니다.");
				sweet.setMsg("기존에 가입한 회원아이디로 로그인해주세요.");
				sweet.setUrl("login.jsp");
				model.addAttribute("sweet", sweet);
				return "alert.jsp";
			} else {
				// 로그인 성공
				session.setAttribute("mNum", mvo.getmNum());
				session.setAttribute("mId", mvo.getmId());
				session.setAttribute("mName", mvo.getmName());
				session.setAttribute("mImg", mvo.getmImg());
				session.removeAttribute("redirectURI");
			}
		}

		if (redirectURI.contains("join")) {
			return "redirect:main.do";
		}
		return "redirect:" + redirectURI;
	}

	// 아이디 찾기
	@RequestMapping(value = "/idFind.do")
	public String idFind(MemberVO mvo, SweetAlertDTO sweet, Model model) {
		mvo = memberService.selectOneMember(mvo);

		if (mvo == null) {
			sweet.setTitle("가입된 정보가 없습니다.");
			sweet.setMsg("아이디 혹은 비밀번호를 확인하세요.");
			sweet.setUrl("id-find.jsp");
			model.addAttribute("sweet", sweet);
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
		mvo = memberService.selectOneMember(mvo);
		model.addAttribute("mId", mvo.getmId());

		mvo = memberService.selectOneEmailTel(mvo);
		model.addAttribute("mTel", mvo.getmTel());
		model.addAttribute("mEmail", mvo.getmEmail());

		return "pw-find-02.jsp";
	}

	// 비밀번호 찾기 - 02. 이메일 전송
	// EmailController 참조

	// 회원정보 변경
	@RequestMapping(value = "/update.do")
	public String update(MemberVO mvo, HttpServletRequest request) {
		String path = "";
		if (request.getSession().getAttribute("mId") == null) { // pw-find
			path = "redirect:main.do";
		} else { // change-inform
			MultipartFile uploadProfile = mvo.getUploadFile();
			String mImg = mvo.getmImg();
			if (!uploadProfile.isEmpty()) {
				mImg = ImageUploadUtil.getImgFileName(request, uploadProfile, "profile");
			}
			mvo.setmImg(mImg);
			mvo.setmNum((Integer)request.getSession().getAttribute("mNum"));
			path = "redirect:changeInfo.do";
		}

		// 암호화
		mvo.setmPw(bCryptEncoder.encode(mvo.getmPw()));

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

		mvo = memberService.selectOneMember(mvo);// 탈퇴하려는 id랑 pw랑 같고 그게 멤버 테이블에 있으면
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
		model.addAttribute("member", memberService.selectOneMember(mvo));

		return "change-inform.jsp";
	}

	// inform - 아이디 중복 검사
	// pw-find-01 - 아이디 실재 검사
	@ResponseBody
	@RequestMapping(value = "/check.do", method = RequestMethod.POST)
	public String selectOneCheck(MemberVO mvo) {

		if (memberService.selectOneMember(mvo) == null) {
			return "1";
		}

		return "-1";
	}

}
