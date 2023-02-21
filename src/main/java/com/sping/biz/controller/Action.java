package com.sping.biz.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 오버라이딩을 강제하기위한 인터페이스
// action의 execute 메서드는 모두 같은 메서드시그니쳐를 가짐
// 상속관계가 아니므로 interface로 작성
public interface Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}