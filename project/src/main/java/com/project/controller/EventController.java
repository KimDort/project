package com.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.service.EventService;
import com.project.tool.Tool;
import com.project.tool.Upload;
import com.project.vo.EventVO;

public class EventController {
  private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

  private EventService service;
  
  @RequestMapping(value="/create", method = RequestMethod.GET)
  public void createGET(EventVO vo, Model model)throws Exception{
    logger.info("event create get");
  }
  @RequestMapping(value="/create", method = RequestMethod.POST)
  public String createPOST(EventVO vo, RedirectAttributes rttr,HttpServletRequest request)throws Exception{
    logger.info("event create post");
    List<MultipartFile> fileMF=vo.getFile1MF();
    List<String> fileName=new ArrayList<String>();
    String convert=vo.getContent();
    String upDir = Tool.getRealPath(request, "/photo_upload/event");
    String file1="";
    String file2="";
    String thumb1="";
    String thumb2="";
    long size1=0;
    long size2=0;
    
    if(null!=fileMF && fileMF.size()>0){
      for(int i=0;i<fileMF.size();i++){
        fileName.add(i,Upload.saveFileSpring(fileMF.get(i), upDir));
      }
      file1=fileName.get(0).toString();
      file2=fileName.get(1).toString();
      size1=fileMF.get(0).getSize();
      size2=fileMF.get(1).getSize();
      if(Tool.isImage(file1)){
        thumb1=Tool.preview(upDir,file1 , 400, 400);
      }else{
        thumb1="no_image.jpg";
      }
      if(Tool.isImage(file2)){
        thumb2=Tool.preview(upDir, file2, 375, 200);
      }else{
        thumb2="no_banner.jpg";
      }
    }
    vo.setContent(Tool.convertChar(convert));
    vo.setFile1(file1);
    vo.setFile2(file2);
    vo.setSize1(size1);
    vo.setSize2(size2);
    vo.setThumb1(thumb1);
    vo.setThumb2(thumb2);
    
    service.createEvent(vo);
    rttr.addFlashAttribute("msg","SUCCESS");
    return "redirect:/";
  }
}
