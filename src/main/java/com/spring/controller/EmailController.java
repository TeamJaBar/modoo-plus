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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.common.EmailSender;
import com.spring.biz.common.EmailVO;
import com.spring.biz.member.MemberService;
import com.spring.biz.member.MemberVO;

@Controller
@RequestMapping(value = "/view")
public class EmailController {
	@Autowired
	private EmailSender emailSender;

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

}
