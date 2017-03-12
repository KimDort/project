package com.project.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.vo.MemberVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		logger.info("LoginInterceptor login access");
		HttpSession session = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		Object MemberVO = modelMap.get("MemberVO");
		Object login=null;
		Object confirm=null;
		Object level=null;
		MemberVO vo=(com.project.vo.MemberVO) MemberVO;
		if(modelMap.get("false")!=null){
			login=modelMap.get("false");
			if(login.equals("false")){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('아이디 또는 암호가 틀렸습니다.');history.back();</script>");
			out.flush();
			}
		}else if(modelMap.get("confirm")!=null){
			confirm=modelMap.get("confirm");			
			if(confirm.equals('N') || confirm.toString().charAt(0)=='N' || confirm.equals("N")){
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('귀하의 메일로 인증코드를 전송하였습니다.'); location.herf='http://localhost:9090';</script>");
				response.sendRedirect("/mail/mailSend?id="+vo.getId());
				out.flush();			
			}
			if(confirm.equals('Y') && MemberVO != null){
				session.setAttribute("MemberVO", MemberVO);
				if (session.getAttribute("dest") != null) {
					Object dest = session.getAttribute("dest");
					String uri=(String) dest;
					String[] checkUri=uri.split("/");
					if(!checkUri.equals("administrator")){
						if (request.getSession().getAttribute("tno") != null) {
							Object[] tno = (Object[]) request.getSession().getAttribute("tno");
							Object[] orderStock = (Object[]) request.getSession().getAttribute("orderStock");
							Object sno=request.getSession().getAttribute("sno");

							request.getSession().setAttribute("MemberVO", MemberVO);	
							request.getSession().setAttribute("tno", tno);
							request.getSession().setAttribute("orderStock", orderStock);
							request.getSession().setAttribute("sno", sno);
							response.sendRedirect((String) dest);
						}else{
							level=modelMap.get("level");
							char mlevel=(char) level;
							
						}
					}
				}else {
					request.getSession().setAttribute("MemberVO", MemberVO);
					response.sendRedirect("/");
				}
			}
		}
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		if (session.getAttribute("MemberVO") != null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('잘못된 접속 경로입니다.'); location.href='http://localhost:9090';</script>");
			out.flush();			
		}
		return true;
	}

}
