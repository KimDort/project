package com.project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.service.NoticeService;
import com.project.tool.Criteria;
import com.project.tool.PageMaker;
import com.project.tool.Upload;
import com.project.vo.NoticeVO;

import com.project.tool.Tool;

public class NoticeController {
  private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
  @Inject
  private NoticeService service;
  
  
  @RequestMapping(value = "/create", method = RequestMethod.GET)
  public void createGET(NoticeVO vo, Model model) throws Exception {
    logger.info("notice get ");
  }  
  
  @RequestMapping(value = "/create", method = RequestMethod.POST)
  public String createPOST(NoticeVO vo, RedirectAttributes rttr, HttpServletRequest request) 
      throws Exception {
    logger.info("notice post ");
    
    String convert=vo.getContent();
    String thumb = "";
    String file1 = "";
    long size1 = 0;
    String upDir = Tool.getRealPath(request, "/photo_upload/notice");
    MultipartFile file1MF = vo.getFile1MF();
    size1 = file1MF.getSize();
    if (size1 > 0) {
      String Folder="/photo_upload/notice";
      Tool tool=new Tool();
      tool.CheckFolder(request, Folder);
        file1 = Upload.saveFileSpring(file1MF, upDir);
        vo.setFile1(file1);
        vo.setSize1(size1);
        if (Tool.isImage(file1)) {
            thumb = Tool.preview(upDir, file1, 400, 400);
          } else {
            thumb = "";
          }
    }else if(size1==0){
      thumb="no_image.jpg";
    }
    vo.setNno(service.maxNum());
    vo.setContent(Tool.convertChar(convert));
    vo.setThumb(thumb);
    vo.setFile1(file1);
    vo.setSize1(size1);
    service.regisertNotice(vo);
    rttr.addFlashAttribute("msg","SUCCESS");
    return "redirect:/";
  }  
  @RequestMapping(value = "/list", method = RequestMethod.GET)
  public void listGET(@ModelAttribute("cri")Criteria cri, Model model ) throws Exception {
   model.addAttribute("list",service.list(cri));
   
   PageMaker pageMaker=new PageMaker();
   pageMaker.setCri(cri);
   pageMaker.setTotalCount(service.listCountPaging(cri));
   model.addAttribute("pageMaker",pageMaker);
  }
  
  @RequestMapping(value = "/read", method = RequestMethod.GET)
  public void readGET(@RequestParam("nno")int nno, @ModelAttribute("cri")Criteria cri, Model model)throws Exception{
    model.addAttribute(service.read(nno));
  }
}
