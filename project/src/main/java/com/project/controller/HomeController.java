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

import com.project.service.CookService;
import com.project.service.EventService;
import com.project.service.NoticeService;
import com.project.service.ShopService;
import com.project.service.ThingService;
import com.project.tool.Criteria;
import com.project.tool.PageMaker;
import com.project.tool.Tool;
import com.project.vo.CookVO;
import com.project.vo.EventVO;
import com.project.vo.NoticeVO;
import com.project.vo.ShopVO;
import com.project.vo.ThingVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Inject
	private CookService cookService;

	@Inject
	private ThingService thingService;
	
	@Inject
	private EventService eventService;
	
	@Inject
	private ShopService shopService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request) throws Exception {
		logger.info("Home get In ip:"+request.getLocalAddr());
		List<EventVO> eventBannerList = new ArrayList<EventVO>();
		List<ThingVO> thingAllList = new ArrayList<ThingVO>();
		List<ThingVO> thingStrongList = new ArrayList<ThingVO>();
		List<CookVO> cookIndexList = new ArrayList<CookVO>();
		List<ShopVO> shopAllList=new ArrayList<ShopVO>();
				
		thingAllList=thingService.listAll();
		cookIndexList=cookService.indexList();
		eventBannerList = eventService.listBanner();
		if(shopAllList.size()<=32){
			shopAllList=shopService.listAll();
		}
		model.addAttribute("event", eventBannerList);
		model.addAttribute("thingAll", thingAllList);
		model.addAttribute("thingStrong",thingStrongList);
		model.addAttribute("cookIndex",cookIndexList);
		model.addAttribute("shop",shopAllList);
		return "home";
	}
}
