package com.spring.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.common.EmailService;
import com.spring.biz.common.EmailVO;
import com.spring.biz.member.MemberService;
import com.spring.biz.member.MemberVO;
import com.spring.biz.sue.SueService;
import com.spring.biz.sue.SueVO;

@Controller
@RequestMapping(value = "/view")
public class EmailController {
	@Autowired
	private EmailService emailService;
	@Autowired
	private SueService sueService;
	@Autowired
	private MemberService memberService;

	// 비밀번호 찾기 - 02. 이메일 전송
	@RequestMapping(value = "/sendEmail.do")
	public String sendEmailAction(MemberVO mvo, Random rand, Model model, EmailVO email) throws Exception {
		System.out.println("비밀번호 메일 전송 준비");
		model.addAttribute("mId", mvo.getmId());
		boolean log;

		// 랜덤 인증번호 생성
		final int CIPHER = 5; // 자릿수
		int range = (int)Math.pow(10, CIPHER); // 10의 5승
		int trim = (int)Math.pow(10, CIPHER - 1); // 10의 4승
		int result = rand.nextInt(range) + trim; // 5자리 숫자 생성

		if (result > range) { // 자릿수가 넘었다면
			result = result - trim;
		}

		System.out.println("로그 : 랜덤 인증번호 생성 - " + result);

		model.addAttribute("code", result);

		email.setReceiver(mvo.getmEmail()); // 받는 사람의 이메일
		email.setSubject("[모두의 보드] 인증번호 발송"); // 제목
		email.setContent("안녕하세요 모두의 보드입니다." + "\n인증번호: " + result + "\n요청하신 페이지에 해당 인증번호를 입력해 주세요."); // 내용

		log = emailService.SendEmail(email);
		System.out.println("이메일 전송 결과: " + log);
		return "pw-find-03.jsp";

	}

	// 회원 정지 - 이메일 전송
	@RequestMapping(value = "/sendFreezeEmail.do")
	public String freezeMember(MemberVO mvo, SueVO svo, EmailVO email) throws Exception {
		System.out.println("회원 정지 메일 전송 준비");
		// 맴버 scName 가져오기
		System.out.println(svo);
		svo = sueService.selectOneSue(svo);
		System.out.println(svo);
		mvo.setmId(svo.getSmId()); // 신고당한 사람의 이메일 찾기 위한 세팅
		String smEmail = memberService.selectOneEmailTel(mvo).getmEmail(); // 신고당한 사람의 이메일 찾기

		System.out.println("피신고인 이메일 : " + smEmail);
		email.setReceiver(smEmail); // 받는사람의 이메일
		email.setSubject("[모두의 보드] 회원정지 안내 메일"); // 제목
		email.setContent("안녕하세요 " + svo.getSmId() + "님, 모두의 보드입니다.\n귀하께서 작성하신 게시글 중 " + svo.getScName() + "의 사유로 접수되었던 신고가 처리되어 계정이 3일 정지되셨습니다."); // 내용

		// 신고당한 사람 이메일 발송
		if (emailService.SendEmail(email)) {
			System.out.println("피신고인 메일 발송 성공");
		}

		mvo.setmId(svo.getmId()); // 신고한 사람의 이메일을 찾기 위한 세팅
		String mEmail = memberService.selectOneEmailTel(mvo).getmEmail(); // 신고한 사람의 이메일 찾기

		System.out.println("신고인 : " + mEmail);
		email.setReceiver(mEmail);
		email.setSubject("[모두의 보드] 신고 처리 결과 안내 메일");
		email.setContent("안녕하세요 " + svo.getmId() + "님, 모두의 보드입니다.\n" + mvo.getmId() + "님께서 신고하신 내역의 게시글 \"" + svo.getbTitle() + "\"(이)가 조치 완료되었습니다.");

		// 신고한 사람에게 이메일 발송
		if (emailService.SendEmail(email)) {
			System.out.println("신고인 메일 발송 성공");
		}

		System.out.println("이메일 전송 성공!");
		return "redirect:selectSue.do?sNum=" + svo.getsNum();
	}

}
