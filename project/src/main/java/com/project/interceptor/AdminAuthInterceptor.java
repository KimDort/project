package com.project.interceptor;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.vo.MemberVO;

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
		}else if(session.getAttribute("MemberVO") != null){
			MemberVO vo=(MemberVO) session.getAttribute("MemberVO");
			char level=vo.getMlevel();
			if(level == 'N'){
				System.out.println(level);
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('접근 권한이 없습니다.'); location.href='http://happyrecipek.iptime.org:9090';</script>");
				out.flush();
				return false;
			}
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
