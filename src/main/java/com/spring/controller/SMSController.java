package com.spring.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.common.SMSService;
import com.spring.biz.member.MemberVO;

@Controller
@RequestMapping(value = "/view")
public class SMSController {

	@Autowired
	private SMSService smsService;

	@RequestMapping(value = "/sendSMS.do")
	public String sendSMS(MemberVO mvo, Random rand, Model model) {
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

		log = smsService.sendOne(mvo.getmTel(), result);
		System.out.println("문자 전송 결과: " + log);
		return "pw-find-03.jsp";
	}
}
