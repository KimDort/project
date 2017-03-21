package com.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mysql.fabric.xmlrpc.base.Member;
import com.project.service.CategoryService;
import com.project.service.CookMoreService;
import com.project.service.CookService;
import com.project.service.CtgroupService;
import com.project.service.MemberService;
import com.project.service.ShopMoreService;
import com.project.service.ShopOrderService;
import com.project.service.ShopService;
import com.project.service.ThingService;
import com.project.tool.Tool;
import com.project.vo.CategoryVO;
import com.project.vo.CookMoreThingVO;
import com.project.vo.CookVO;
import com.project.vo.CtgroupVO;
import com.project.vo.MemberVO;
import com.project.vo.ShopOderVO;
import com.project.vo.ShopOrderCompleteVO;
import com.project.vo.ShopVO;
import com.project.vo.ThingVO;
import com.sun.tracing.dtrace.ModuleAttributes;

@Controller
@RequestMapping("/cook/*")
public class CookController {
	private static final Logger logger = LoggerFactory.getLogger(CookController.class);

	@Inject
	private CookService cookService;
	
	@Inject
	private MemberService mService;

	@Inject
	private ShopService shService;

	@Inject
	private ThingService thService;

	@Inject
	private CategoryService ctService;

	@Inject
	private CtgroupService ctgService;

	@Inject
	private CookMoreService ckmService;
	

	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void gerRead(@RequestParam("cno") int cno, Model model) throws Exception {
		logger.info("get in cook read");
		CookVO vo=new CookVO();
		ThingVO tvo = new ThingVO();
		ShopVO sVO = new ShopVO();
		List<ShopVO>shopList =new ArrayList<>();
		List<CookMoreThingVO> moreThing=new ArrayList<>();

		vo=cookService.read(cno);
		
		moreThing=ckmService.list(cno);
		
		for(int i=0;i<moreThing.size();i++){
			shopList.add(i, shService.read(moreThing.get(i).getSno()));
		}
		for(int i=0;i<moreThing.size();i++){
			System.out.println("cooking class sno : "+shopList.get(i).getSno());
		}
		model.addAttribute("shopmore",shopList);
		model.addAttribute("cook", vo);
	}

	@RequestMapping(value = "/shoporder", method = { RequestMethod.GET, RequestMethod.POST })
	public void getBuyOrder(HttpServletRequest request, Model model, @SessionAttribute("tno") String[] tno,
			@SessionAttribute("MemberVO") MemberVO mvo, @SessionAttribute("orderStock") String[] orderStock,
			@SessionAttribute("sno") String sno) {

		List<ShopOderVO> soList = new ArrayList<>();
		ThingVO tvo = new ThingVO();

		try {
			for (int i = 0; i < tno.length; i++) {
				ShopOderVO sovo = new ShopOderVO();
				tvo = thService.read(Integer.parseInt(tno[i]));
				sovo.setName(tvo.getName());
				sovo.setTno(tvo.getTno());
				sovo.setSno(Integer.parseInt(sno));
				sovo.setZipcode(mvo.getZipcode());
				sovo.setAddress1(mvo.getAddress1());
				sovo.setAddress2(mvo.getAddress2());
				sovo.setThumb(tvo.getThumb());
				sovo.setQuantity(Integer.parseInt(orderStock[i]));
				sovo.setSellcost(tvo.getSellcost());
				sovo.setSumcost(Integer.parseInt(orderStock[i]) * tvo.getSellcost());
				soList.add(i, sovo);
			}

			model.addAttribute("mInfo", mvo);
			model.addAttribute("order", soList);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
