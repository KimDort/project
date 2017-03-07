package com.project.controller;

import java.util.ArrayList;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.service.MemberService;
import com.project.tool.Tool;
import com.project.vo.MemberVO;

@Controller
@RequestMapping("/mail/*")
public class MailController {
	ArrayList<String> msgs = new ArrayList<String>();
	ArrayList<String> links = new ArrayList<String>();

	@Inject
	private JavaMailSender mailSender;

	@Inject
	private MemberService service;

	@RequestMapping(value = "/mailSend", method = RequestMethod.GET)
	public String Mail(@RequestParam("id") String id, RedirectAttributes rttr, Locale locale) throws Exception {
		SimpleMailMessage message = new SimpleMailMessage();
		MemberVO vo = new MemberVO();
		Tool tool=new Tool();
		vo.setId(id);
		vo.setAuth2(tool.key());
		service.confirm2(vo);
		vo = service.info(vo.getId());
		if (vo.getConfirm() == 'N') {			
			message.setFrom("projectconfirmtest@gmail.com");
			message.setTo(vo.getId());
			message.setSubject("인증코드 전송");
			String reg = vo.getRegdate().replaceAll("-", "");
			reg = reg.replaceAll(":", "");
			reg = reg.replaceAll(" ", "");
			reg = reg.trim();
			message.setText("http://http://happyrecipek.iptime.org:9090/member/confirm?id=" + vo.getId() + "&auth=" + vo.getAuth()+"&auth2="+vo.getAuth2() 
			+ "&reg="+ reg + "&confirm=" + vo.getConfirm());
			mailSender.send(message);
			rttr.addFlashAttribute("msg", "CONFIRM");
		}
		return "redirect:/";
	}
}
