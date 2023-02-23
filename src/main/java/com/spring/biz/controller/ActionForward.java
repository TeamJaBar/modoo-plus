package com.spring.biz.controller;

public class ActionForward {
	private String path; // 어디로 이동해야하는지
	private boolean redirect; // 어떤 방식으로 이동해야하는지

	public ActionForward() {

	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public boolean isRedirect() {
		return redirect;
	}

	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}

	// 로그를 위한 toString() 오버라이딩
	@Override
	public String toString() {
		return "ActionForward [path=" + path + ", redirect=" + redirect + "]";
	}
}
