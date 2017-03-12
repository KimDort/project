package com.project.interceptor;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminAuthInterceptor extends HandlerInterceptorAdapter {
	private static Logger logger = LoggerFactory.getLogger(AdminAuthInterceptor.class);

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
		return true;
	}

	private void saveDest(HttpServletRequest req) {
		String uri = req.getRequestURI();
		Enumeration<String> paramNames = req.getParameterNames();
		int page=0;
		int perPageNum=0;
		while (paramNames.hasMoreElements()) {
				String key = (String) paramNames.nextElement();				
				if(key.equals("page")){page=Integer.parseInt(req.getParameter(key));}
				if(key.equals("perPageNum")){perPageNum=Integer.parseInt(req.getParameter(key));}
				
				req.getSession().setAttribute("dest", uri);
				req.getSession().setAttribute("page", page);
				req.getSession().setAttribute("perPageNum", perPageNum);
		}		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
}
