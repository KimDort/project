package com.project.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ShopreadInterceptor extends HandlerInterceptorAdapter {
	private static Logger logger = LoggerFactory.getLogger(ShopreadInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		logger.info("get in intercetor shop read");
		if (request.getSession().getAttribute("tno") != null) {
			request.getSession().removeAttribute("tno");
			request.getSession().removeAttribute("sno");
			request.getSession().removeAttribute("orderStock");
		}
		if (request.getSession().getAttribute("token") != null) {
			if ((boolean) request.getSession().getAttribute("token") == false) {
				System.out.println("read interceptor에서 토큰 체크 : "+request.getSession().getAttribute("token"));
				request.getSession().removeAttribute("token");
				request.getSession().setAttribute("token", true);
				System.out.println("read interceptor에서 토큰 삭제 체크 : "+request.getSession().getAttribute("token"));
			}
		}else{
			request.getSession().setAttribute("token", true);
		}
		return true;
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}
}
