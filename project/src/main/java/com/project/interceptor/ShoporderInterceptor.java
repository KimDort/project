package com.project.interceptor;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ShoporderInterceptor extends HandlerInterceptorAdapter {
	private static Logger logger = LoggerFactory.getLogger(ShoporderInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		logger.info("get in order complete interceptor prehandle method");
		System.out.println("인터셉터 처음 발생 : " + request.getSession().getAttribute("token"));
		if (request.getSession().getAttribute("token") != null) {
			if ((boolean) request.getSession().getAttribute("token") != true
					|| request.getSession().getAttribute("MemberVO") == null) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println(
						"<script>alert('잘못 된 접근 경로 입니다.'); location.href='http://happyrecipek.iptime.org:9090';</script>");
				out.flush();
			}
		}else{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println(
					"<script>alert('잘못 된 접근 경로 입니다.'); location.href='http://happyrecipek.iptime.org:9090';</script>");
			out.flush();
		}
		return true;
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		logger.info("get in order complete interceptor aftercompletion method");
		request.getSession().setAttribute("token", false);
		System.out.println("인터셉터 마지막 발생 : " + request.getSession().getAttribute("token"));
	}

	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
	}

}
