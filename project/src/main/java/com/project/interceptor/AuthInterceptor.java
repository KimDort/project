package com.project.interceptor;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	private static Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		logger.info("interceptor login access");
		HttpSession session = request.getSession();
		if (session.getAttribute("MemberVO") == null) {
			saveDest(request);
			response.sendRedirect("/member/signin");
			return false;
		}
		/*
		 * if(request.getSession().getAttribute("tno")==null){
		 * response.setContentType("text/html; charset=UTF-8"); PrintWriter out
		 * = response.getWriter(); out.
		 * println("<script>alert('새로고침시 결제를 완료하실 수 없습니다.'); location.herf='http://localhost:9090';</script>"
		 * ); out.flush(); }
		 */
		return true;
	}

	private void saveDest(HttpServletRequest req) {
		String uri = req.getRequestURI();
		Enumeration<String> paramNames = req.getParameterNames();
		if (paramNames != null) {
			while (paramNames.hasMoreElements()) {
				String tno[] = null;
				String orderStock[] = null;
				String sno = null;
				String key = (String) paramNames.nextElement();
				if (key.equals("tno")) {
					tno = req.getParameterValues(key);
					req.getSession().setAttribute("tno", tno);
				}
				if (key.equals("orderStock")) {
					orderStock = req.getParameterValues(key);
					req.getSession().setAttribute("orderStock", orderStock);
				}
				if (key.equals("sno")) {
					sno = req.getParameter("sno");
					req.getSession().setAttribute("sno", sno);
				}
			}
			if (req.getMethod().equals("POST")) {
				req.getSession().setAttribute("dest", uri);
			}
		} else {
			if (req.getMethod().equals("POST")) {
				req.getSession().setAttribute("dest", uri);
			}
		}
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		if (request.getSession().getAttribute("tno") == null && request.getSession().getAttribute("MemberVO") == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println(
					"<script>alert('잘못 된 접근 경로 입니다.'); location.href='http://happyrecipek.iptime.org:9090';</script>");
			out.flush();
		}
	}

}
