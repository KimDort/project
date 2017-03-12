package com.project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.service.MemberService;
import com.project.tool.Tool;
import com.project.tool.Upload;
import com.project.vo.MemberVO;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Inject
	private MemberService service;

	@RequestMapping(value = "/member/create", method = RequestMethod.GET)
	public void createGET() throws Exception {
		logger.info("member get ");
	}

	@RequestMapping(value = "/member/create", method = RequestMethod.POST)
	public String createPOST(MemberVO vo, RedirectAttributes rttr,HttpServletRequest request) throws Exception {
		logger.info("member post");
		vo.setId(vo.getEmail1()+"@"+vo.getEmail2());
		vo.setPhone(vo.getPhone1()+"-"+vo.getPhone2()+"-"+vo.getPhone3());
		
		vo.setAuth(Tool.key());
		MultipartFile file1MF=vo.getFile1MF();
		String thumb="";
		long size1=0;
		String file1="";
		
		String upDir = Tool.getRealPath(request, "/photo_upload/member");
		
		size1=file1MF.getSize();
		if(size1 > 0){
			Tool tool=new Tool();
			String Folder="/photo_upload/member";
			tool.CheckFolder(request, Folder);
			file1=Upload.saveFileSpring(file1MF, upDir);
			vo.setFile1(file1);
			vo.setSize1(size1);
			if (Tool.isImage(file1)) {
				thumb=tool.preview(upDir, file1, 50, 50);
			}else{
				thumb = "";
			}
		}else if(size1==0){
		      thumb="no_image.jpg";
	    }
		vo.setThumb(thumb);
		
		service.resister(vo);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/";
	}

	@RequestMapping(value = "/member/signin", method = RequestMethod.GET)
	public void signinGET(@ModelAttribute("vo")MemberVO vo) throws Exception {
		logger.info("login get");
	}

	/*@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public ModelAndView signinPOST(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			MemberVO vo,RedirectAttributes rttr,Model model) throws Exception {
		logger.info("login post inside ID : " + vo.getId() + ", PASSWORD : " + vo.getPassword());
		ModelAndView mav = new ModelAndView();
		if (service.signin(vo) == 1) {
			vo = service.info(vo.getId());
			switch (vo.getConfirm()) {
			case 'Y':
				session.setAttribute("MemberVO", vo);
				mav.setViewName("redirect:/");
				break;

			case 'N':
				logger.info("Confirm is not Confirm");
				mav.addObject(vo.getId());
				mav.setViewName("redirect:/mail/mailSend?id=" + vo.getId());
				break;
			}

		}else {
			//mav.addObject("msg", "FAILED");
			rttr.addFlashAttribute("msg", "FAILED");
			//mav.setViewName("redirect:/");
		}
		return mav;
	}*/
	
	@RequestMapping(value = "/member/signin", method = RequestMethod.POST)
	public void signinPOST(MemberVO vo, HttpSession session,Model model ) throws Exception {
		logger.info("login post inside ID : " + vo.getId() + ", PASSWORD : " + vo.getPassword());
		if (service.signin(vo) == 1) {
			vo = service.info(vo.getId());
			model.addAttribute("MemberVO",vo);
			model.addAttribute("confirm",vo.getConfirm());
			model.addAttribute("level",vo.getMlevel());
			//setViewName("redirect:/mail/mailSend?id=" + vo.getId());
		}else{
			model.addAttribute("false",false);
		}
	}

	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logoutGET(HttpSession session, Model model) throws Exception {
		logger.info("login get");
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/member/userinfo", method = RequestMethod.GET)
	public void userinfoGET(HttpSession session, Model model) throws Exception {
		logger.info("userinfo get");
		model.addAttribute(service.info((String) session.getAttribute("id")));
	}

	@RequestMapping(value = "/member/confirm", method = RequestMethod.GET)
	public String userConfrimGET(@RequestParam("id") String id, @RequestParam("auth") String auth,
			@RequestParam("auth2")String auth2, RedirectAttributes rttr,Model model)
			throws Exception {
	  String address="";
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo=service.info(id);
		switch (vo.getConfirm()) {
    case 'N':
      vo.setAuth(auth);
      vo.setAuth2(auth2);
      if(service.confirm(vo)==1){  
        model.addAttribute(service.info(id));
        rttr.addFlashAttribute("msg","SUCCESS");
        address="redirect:/";
      }
      break;

    case 'Y':
      rttr.addFlashAttribute("msg","CONFIRM_ERROR");
      address="redirect:/";
      break;
    }
		return address;
	}
}
