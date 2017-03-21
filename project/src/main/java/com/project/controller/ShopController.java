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
import com.project.service.CtgroupService;
import com.project.service.MemberService;
import com.project.service.ShopMoreService;
import com.project.service.ShopOrderService;
import com.project.service.ShopService;
import com.project.service.ThingService;
import com.project.tool.Tool;
import com.project.vo.CategoryVO;
import com.project.vo.CtgroupVO;
import com.project.vo.MemberVO;
import com.project.vo.ShopOderVO;
import com.project.vo.ShopOrderCompleteVO;
import com.project.vo.ShopVO;
import com.project.vo.ThingVO;
import com.sun.tracing.dtrace.ModuleAttributes;

@Controller
@RequestMapping("/shop/*")
public class ShopController {
	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);

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
	private ShopMoreService smService;

	@Inject
	private ShopOrderService soService;

	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void gerRead(@RequestParam("sno") int sno, Model model) throws Exception {
		logger.info("get in shop read");
		ShopVO svo = new ShopVO();
		ThingVO tvo = new ThingVO();
		CategoryVO ctvo = new CategoryVO();
		CategoryVO getVo = new CategoryVO();
		CtgroupVO ctgvo = new CtgroupVO();
		List<ThingVO> smvo = new ArrayList<ThingVO>();

		svo = shService.read(sno);
		smvo = smService.selectone(svo.getSno());
		tvo = thService.read(svo.getTno());

		ctvo.setCtgroup(tvo.getCtgroup());
		ctvo.setCtno(tvo.getCategory());

		getVo = ctService.OneList(ctvo);
		ctgvo = ctgService.OneList(getVo.getCtgroup());

		model.addAttribute("shopone", svo);
		model.addAttribute("thing", tvo);
		model.addAttribute("category", getVo);
		model.addAttribute("ctgroup", ctgvo);
		model.addAttribute("smore", smvo);
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

	/*
	 * @RequestMapping(value="/shoporder",method = {RequestMethod.GET,
	 * RequestMethod.POST}) public void getBuyOrder(HttpServletRequest request,
	 * Model model, HttpSession session){ String[] tno=null; String[]
	 * orderStock=null; String sno=null; try { List<ShopOderVO> soList=new
	 * ArrayList<>(); ThingVO tvo=new ThingVO(); MemberVO mvo=new MemberVO();
	 * mvo=(MemberVO) session.getAttribute("MemberVO");
	 * 
	 * if(request.getSession().getAttribute("tno")!=null
	 * ||request.getSession().getAttribute("orderStock")!=null){ Object[]
	 * tno1=(Object[]) request.getSession().getAttribute("tno"); Object[]
	 * orderStock1=(Object[]) request.getSession().getAttribute("orderStock");
	 * sno=(String) request.getSession().getAttribute("sno");
	 * orderStock=(String[]) orderStock1; tno=(String[]) tno1;
	 * request.getSession().removeAttribute("tno");
	 * request.getSession().removeAttribute("orderStock");
	 * request.getSession().removeAttribute("sno"); }else{
	 * tno=request.getParameterValues("tno");
	 * orderStock=request.getParameterValues("orderStock");
	 * sno=request.getParameter("sno"); }
	 * 
	 * for(int i=0;i<orderStock.length;i++){ ShopOderVO sovo=new ShopOderVO();
	 * tvo=thService.read(Integer.parseInt(tno[i]));
	 * sovo.setName(tvo.getName()); sovo.setTno(tvo.getTno());
	 * sovo.setSno(Integer.parseInt(sno)); sovo.setZipcode(mvo.getZipcode());
	 * sovo.setAddress1(mvo.getAddress1()); sovo.setAddress2(mvo.getAddress2());
	 * sovo.setThumb(tvo.getThumb());
	 * sovo.setQuantity(Integer.parseInt(orderStock[i]));
	 * sovo.setSellcost(tvo.getSellcost());
	 * sovo.setSumcost(Integer.parseInt(orderStock[i])*tvo.getSellcost());
	 * soList.add(i,sovo); } model.addAttribute("order",soList);
	 * model.addAttribute("mInfo",mvo); } catch (Exception e) { // TODO: handle
	 * exception e.printStackTrace(); } }
	 */
	@RequestMapping(value = "/shopordercomplete", method = RequestMethod.POST)
	public void orderComple(ShopOrderCompleteVO scVO, @RequestParam("tno") int[] tno, HttpServletRequest request,
			Model model, HttpSession session, @RequestParam("orderstock") int[] orderstock,
			@SessionAttribute("MemberVO") MemberVO mvo, @RequestParam("sno") int sno, @RequestParam("cost") int[] cost,
			@SessionAttribute("token") boolean token) throws Exception {

		logger.info("get in ordercomplte");
		List<ShopOrderCompleteVO> orderList = new ArrayList<ShopOrderCompleteVO>();
		List<ThingVO> thingList = new ArrayList<ThingVO>();

		// newscVO=scVO;
		if (token) {
			for (int i = 0; i < tno.length; i++) {
				ShopOrderCompleteVO newscVO = new ShopOrderCompleteVO();
				newscVO.setTno(tno[i]);
				newscVO.setOrderstock(orderstock[i]);
				newscVO.setTotalcost(cost[i] * orderstock[i]);
				newscVO.setOrdernum(Tool.getToday() + String.valueOf(tno[0]) + String.valueOf(sno));
				newscVO.setOrderdate(Tool.getTodayMinus());
				newscVO.setBank(scVO.getBank());
				newscVO.setBankname(scVO.getBankname());
				newscVO.setMethod(scVO.getMethod());
				newscVO.setAddress1(scVO.getAddress1());
				newscVO.setAddress2(scVO.getAddress2());
				newscVO.setZipcode(scVO.getZipcode());
				newscVO.setPhone(scVO.getPhone());
				newscVO.setCost(cost[i]);
				newscVO.setIspayment('N');
				newscVO.setCancel('N');
				newscVO.setIscancel('N');
				
				orderList.add(i, newscVO);
				thingList.add(i, thService.read(tno[i]));

				if (soService.register(newscVO) == 1) {

				}
			}
		}

		model.addAttribute("userinfo", mvo);
		model.addAttribute("orderList", scVO);
		model.addAttribute("order", orderList);
		model.addAttribute("thing", thingList);
		model.addAttribute("shop", shService.read(sno));

		System.out.println("bankanme : " + scVO.getBankname());
		System.out.println("bank : " + scVO.getBank());
		System.out.println("payment card : " + scVO.getMethod());
		System.out.println("in ordercomplete controller token : " + request.getSession().getAttribute("token"));

	}
	/*
	 * @RequestMapping(value="/shopordercomplete",method=RequestMethod.POST)
	 * public void orderComple(ShopOderVO vo,HttpServletRequest request, Model
	 * model, HttpSession session)throws Exception{
	 * logger.info("get in ordercomplte"); ShopVO shopvo=new ShopVO(); MemberVO
	 * user=new MemberVO(); List<ShopOrderCompleteVO> orderList=new
	 * ArrayList<ShopOrderCompleteVO>(); List<ThingVO> thingList=new
	 * ArrayList<ThingVO>();
	 * 
	 * String sno=request.getParameter("sno"); String
	 * mno=request.getParameter("mno"); String
	 * bankname=request.getParameter("bankname"); String
	 * bank=request.getParameter("bank"); String
	 * method=request.getParameter("method"); String
	 * zipcode=request.getParameter("zipcode"); String
	 * address1=request.getParameter("address1"); String
	 * address2=request.getParameter("address2"); String
	 * phone=request.getParameter("phone");
	 * 
	 * if(request.getParameterValues("tno")!=null){ String[]
	 * tno=request.getParameterValues("tno"); String[]
	 * cost=request.getParameterValues("cost"); String[]
	 * orderstock=request.getParameterValues("orderstock");
	 * 
	 * for(int i=0;i<request.getParameterValues("tno").length;i++){
	 * ShopOrderCompleteVO scvo=new ShopOrderCompleteVO();
	 * if(method.charAt(0)=='S'){ scvo.setProcessing('C'); }
	 * scvo.setSno(Integer.parseInt(sno));
	 * scvo.setOrderer(Integer.parseInt(mno)); scvo.setBank(bank);
	 * scvo.setBankname(bankname); scvo.setMethod(method.charAt(0));
	 * scvo.setTno(Integer.parseInt(tno[i].toString())); scvo.setUsepoint(0);
	 * scvo.setCost(Integer.parseInt(cost[i].toString()));
	 * scvo.setOrderstock(Integer.parseInt(orderstock[i]));
	 * scvo.setTotalcost(Integer.parseInt(cost[i].toString())*Integer.parseInt(
	 * orderstock[i].toString()));
	 * scvo.setOrdernum(Tool.getToday()+String.valueOf(tno[0])+String.valueOf(
	 * sno)); scvo.setZipcode(zipcode); scvo.setAddress1(address1);
	 * scvo.setAddress2(address2); scvo.setPhone(phone);
	 * scvo.setOrderdate(Tool.getTodayMinus());
	 * 
	 * System.out.println("sno: "+scvo.getSno()+", mno:"+scvo.getOrderer()
	 * +", bank : "+scvo.getBank()+", bankname :"+scvo.getBankname()
	 * +", method : "+scvo.getMethod()+", tno : "+scvo.getTno()+", usepoint : "
	 * +scvo.getUsepoint()+", cost : "+scvo.getCost()+ ", orderStock : "+
	 * scvo.getOrderstock() + ", totalcost : "+ scvo.getTotalcost()
	 * +", ordernum : "+scvo.getOrdernum()+
	 * ", zipcode : "+scvo.getZipcode()+", address1 : "+ scvo.getAddress1() +
	 * ", address2 : "+scvo.getAddress2()+ ", phone : "+scvo.getPhone());
	 * orderList.add(i,scvo);
	 * thingList.add(i,thService.read(Integer.parseInt(tno[i])));
	 * if(soService.register(scvo)==1){
	 * 
	 * } } shopvo=shService.read(Integer.parseInt(sno));
	 * user=mService.selectuser(Integer.parseInt(mno));
	 * model.addAttribute("order",orderList); model.addAttribute("user",user);
	 * model.addAttribute("shop",shopvo); model.addAttribute("thing",thingList);
	 * } }
	 */
}
