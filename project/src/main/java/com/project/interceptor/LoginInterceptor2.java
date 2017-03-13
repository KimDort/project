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

public class LoginInterceptor2 extends HandlerInterceptorAdapter {
	private static Logger logger = LoggerFactory.getLogger(LoginInterceptor2.class);

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		logger.info("LoginInterceptor login access");
		HttpSession session = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		Object MemberVO = modelMap.get("MemberVO");
		String dest=(String) request.getSession().getAttribute("dest");
		String url=null;
		
		//request.getSession().setAttribute("MemberVO", MemberVO);
		
		Object login=modelMap.get("false") !=null ?modelMap.get("false"):true;
		Object confirm=modelMap.get("confirm");
		Object level=null;
		//요청 url 확인
		System.out.println("먼저 들어온 dest : "+dest);
		
		if(MemberVO !=null){
			if(confirm != null && confirm.equals('N')){
				MemberVO vo=(com.project.vo.MemberVO) MemberVO;
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('귀하의 메일로 인증코드를 전송하였습니다.'); location.href='http://localhost:9090';</script>");
				response.sendRedirect("/mail/mailSend?id="+vo.getId());
				out.flush();
			}else if(confirm != null && confirm.equals('Y')){
				session.setAttribute("MemberVO", MemberVO);
				if(dest!=null){
					String[] reqUrl=dest.split("/");	
					if(reqUrl[1].equals("administrator")){
						int page= (int) request.getSession().getAttribute("page");
						int perPageNum=(int) request.getSession().getAttribute("perPageNum");
						url=dest+"?page="+page+"&perPageNum="+perPageNum;
						System.out.println("요청 수정된 url : "+ url);
						response.sendRedirect(url);
					}else if(reqUrl[2].equals("shoporder")){
						url=dest;
						Object[] tno = (Object[]) request.getSession().getAttribute("tno");
						Object[] orderStock = (Object[]) request.getSession().getAttribute("orderStock");
						Object sno=request.getSession().getAttribute("sno");					
							
						request.getSession().setAttribute("tno", tno);
						request.getSession().setAttribute("orderStock", orderStock);
						request.getSession().setAttribute("sno", sno);
						System.out.println("요청 수정된 url : "+ url);
						response.sendRedirect(url);
					}					
				}else{
					response.sendRedirect("/");
				}				
			}
		}else if(login != null && (boolean)login==false){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('아이디 또는 암호가 틀렸습니다.');history.back();</script>");
			out.flush();	
		}		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		logger.info("login interceptor prehandle");
		
		return true;
	}

}
