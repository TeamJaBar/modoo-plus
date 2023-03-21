package com.spring.biz.common;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service("SMSService")
public class SMSService {
	public boolean sendOne(String phoneNumber, int result) {
		String api_key = "";
		String api_secret = "";
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phoneNumber); // 수신전화번호
		params.put("from", ""); // 발신전화번호
		params.put("type", "SMS");
		params.put("text", "[모두의보드] 본인확인 인증번호 [" + result + "]를 화면에 입력해주세요");
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject)coolsms.send(params);
			System.out.println(obj.toString());
			return true;
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		return false;
	}
}
