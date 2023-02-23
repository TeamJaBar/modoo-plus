package com.spring.biz.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/*인코딩 필터*/
/* .jsp, .do 요청이 올 때마다 실행 */
@WebFilter({ "*.jsp", "*.do" })
public class EncFilter implements Filter {

	private String encoding;

	public EncFilter() {

	}

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding(this.encoding);
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// web.xml에 있는 encoding context 가져오기
		this.encoding = fConfig.getServletContext().getInitParameter("encoding");
	}

}
