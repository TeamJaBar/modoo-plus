package com.spring.biz.controller;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SendEmailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("pw-find-03.jsp");
		forward.setRedirect(false);

		request.setAttribute("mId", request.getParameter("mId"));

		// 랜덤 인증번호 생성
		Random rand = new Random();
		final int CIPHER = 5; // 자릿수
		int range = (int)Math.pow(10, CIPHER);// 10의 5승
		int trim = (int)Math.pow(10, CIPHER - 1);// 10의 4승
		int result = rand.nextInt(range) + trim; // 5자리 숫자 생성

		if (result > range) { // 자릿수가 넘었다면
			result = result - trim;
		}

		System.out.println("로그 : 랜덤 인증번호 생성 - " + result);

		request.setAttribute("code", result);

		String host = "smtp.gmail.com"; // 구글
		final String user = "modoo.shop.3@gmail.com"; // 이메일 주소
		final String password = "xzikqxicctfulsii"; // 앱 비밀번호

//      String host = "smtp.naver.com"; // 네이버
//      final String user = "발신자 이메일"; // 이메일 주소
//      final String password = "이메일 비밀번호"; // 이메일 비밀번호

		String to = request.getParameter("mEmail"); // 사용자의 이메일 주소

		// 설정
		Properties props = new Properties();
		props.put("mail.smtp.host", host); // STMP 서버 설정
		props.put("mail.smtp.starttls.enable", "true"); // 두 컴퓨터 사이의 연결 암호화 표준 기술
		props.put("mail.smtp.ssl.protocols", "TLSv1.2"); // TLS 버전정보 설정
		props.put("mail.smtp.auth", "true"); // 인증을 필요로 하는 SMTP에 접속하기위해 필요한 설정
		props.put("mail.smtp.port", "587"); // 포트 번호 설정

		// [1] Session 인스턴스 생성
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password); // 인증을 필요로 하기 때문에 이메일 주소와 앱 비밀번호를 Session에 넘겨줘야 함
			}
		});

		// [2] 메세지 작성
		try {
			MimeMessage message = new MimeMessage(session);
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

		return forward;
	}

}
