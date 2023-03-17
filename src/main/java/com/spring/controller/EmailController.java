package com.spring.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.common.EmailSender;
import com.spring.biz.common.EmailVO;
import com.spring.biz.member.MemberService;
import com.spring.biz.member.MemberVO;
import com.spring.biz.sue.SueService;
import com.spring.biz.sue.SueVO;

@Controller
@RequestMapping(value = "/view")
public class EmailController {
	@Autowired
	private EmailSender emailSender;
	@Autowired
	private SueService sueService;
	@Autowired
	private MemberService memberService;

	// 비밀번호 찾기 - 02. 이메일 전송
	@RequestMapping(value = "/sendEmail.do")
	public String sendEmailAction(MemberVO mvo, Random rand, Model model, EmailVO email) throws Exception {
		System.out.println("비밀번호 메일 전송 준비");
		model.addAttribute("mId", mvo.getmId());

		// 랜덤 인증번호 생성
		final int CIPHER = 5; // 자릿수
		int range = (int) Math.pow(10, CIPHER);// 10의 5승
		int trim = (int) Math.pow(10, CIPHER - 1);// 10의 4승
		int result = rand.nextInt(range) + trim; // 5자리 숫자 생성

		if (result > range) { // 자릿수가 넘었다면
			result = result - trim;
		}

		System.out.println("로그 : 랜덤 인증번호 생성 - " + result);

		model.addAttribute("code", result);

		email.setReceiver(mvo.getmEmail()); // 받는사람의 이메일
		email.setSubject("[모두의 보드] 인증번호 발송"); // 제목
		email.setContent("안녕하세요 모두의 보드입니다." + "\n인증번호: " + result + "\n요청하신 페이지에 해당 인증번호를 입력해 주세요."); // 내용

		emailSender.SendEmail(email);
		System.out.println("이메일 전송 성공!");
		return "pw-find-03.jsp";

	}
	// 회원 정지 - 이메일 전송
		@RequestMapping(value = "/sendFreezeEmail.do")
		public String freezeMember(MemberVO mvo, SueVO svo, EmailVO email) throws Exception {
			System.out.println("비밀번호 메일 전송 준비");
			// 맴버 scName 가져오기
			SueVO sue = sueService.selectEmail(svo);
			mvo.setmId(sue.getSmId()); // 신고당한 사람의 이메일 찾기 위한 세팅
			String smEmail = memberService.selectOneEmail(mvo).getmEmail(); // 신고당한 사람의 이메일 찾기
			
			System.out.println("신고당한 이메일"+smEmail);
			email.setReceiver(smEmail); // 받는사람의 이메일
			email.setSubject("[모두의 보드] 회원정지 안내 메일"); // 제목
			email.setContent("안녕하세요 모두의 보드입니다. \n 귀하께서는 " + sue.getScName() + "의 이유로 신고를 당하여 계정이 3일 정지 되셨습니다."); // 내용

			emailSender.SendEmail(email); // 신고당한 사람 이메일 발송
			
			mvo.setmId(sue.getmId()); // 신고한 사람의 이메일을 찾기 위한 세팅
			String mEmail = memberService.selectOneEmail(mvo).getmEmail(); // 신고한 사람의 이메일 찾기
			String bTitle = sueService.selectOneSue(svo).getbTitle(); // 신고당한 게시글
			
			System.out.println("신고한 이메일"+mEmail);
			email.setReceiver(mEmail);
			email.setSubject("[모두의 보드] 회원정지 안내 메일");
			email.setContent("안녕하세요 모두의 보드입니다. \n"+ mvo.getmId() + "님께서 신고하신 내역의 게시글 \n"+ bTitle +"이 조치 완료 되었습니다.");
			
			emailSender.SendEmail(email); // 신고한 사람에게 이메일 발송
			
			System.out.println("이메일 전송 성공!");
			return "redirect:/view/plus/adMoveSue.do";

		}

}
