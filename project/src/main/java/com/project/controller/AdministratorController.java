package com.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.service.CategoryService;
import com.project.service.CookMoreService;
import com.project.service.CookService;
import com.project.service.CtgroupService;
import com.project.service.EventService;
import com.project.service.MemberService;
import com.project.service.NoticeService;
import com.project.service.ShopMoreService;
import com.project.service.ShopService;
import com.project.service.ThingService;
import com.project.tool.Criteria;
import com.project.tool.PageMaker;
import com.project.tool.SearchCriteria;
import com.project.tool.Tool;
import com.project.tool.Upload;
import com.project.vo.CategoryVO;
import com.project.vo.CookMoreThingVO;
import com.project.vo.CookVO;
import com.project.vo.CtgroupVO;
import com.project.vo.EventVO;
import com.project.vo.MemberVO;
import com.project.vo.NoticeVO;
import com.project.vo.ShopMoreThingVO;
import com.project.vo.ShopVO;
import com.project.vo.ThingVO;

import jdk.nashorn.internal.runtime.JSONListAdapter;

/**
 * Handles requests for the application home page.
 */

@Controller
@RequestMapping("/administrator/*")
public class AdministratorController {

	private static final Logger logger = LoggerFactory.getLogger(AdministratorController.class);
	@Inject
	private CookMoreService cmService;
	@Inject
	private ShopMoreService smService;
	@Inject
	private NoticeService noticeService;
	@Inject
	private EventService eventService;
	@Inject
	private CookService cookService;
	@Inject
	private ThingService thingService;
	@Inject
	private MemberService memberService;
	@Inject
	private ShopService shopService;
	@Inject
	private CtgroupService ctService;
	@Inject
	private CategoryService categoryService;

	// 쿠킹클래스 박스 페이지
	@RequestMapping(value = "/CookBox", method = RequestMethod.GET)
	public void getCookBox(Model model, Criteria cri) throws Exception {
		logger.info("Administrator Cook inside");
		List<ShopVO> shopList = new ArrayList<>();

		shopList = shopService.listAll();
		// model.addAttribute("cook", cookList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cookService.listCountPaging(cri));

		model.addAttribute("shop", shopList);
		model.addAttribute("cook", cookService.list(cri));
		model.addAttribute("pageMaker", pageMaker);
	}

	// 쿠킹클래스 테이블 페이지
	@RequestMapping(value = "/CookTable", method = RequestMethod.GET)
	public void getCookTable(Model model, Criteria cri) throws Exception {
		logger.info("Administrator Cook inside");
		List<ShopVO> shopList = new ArrayList<>();

		shopList = shopService.listAll();

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cookService.listCountPaging(cri));

		model.addAttribute("shop", shopList);
		model.addAttribute("cook", cookService.list(cri));
		model.addAttribute("pageMaker", pageMaker);
	}

	// 샵 박스 페이지
	@RequestMapping(value = "/ShopBox", method = RequestMethod.GET)
	public void getShopBox(Model model, SearchCriteria cri) throws Exception {
		logger.info("Administrator Shop in");
		List<ThingVO> thingList = new ArrayList<>();
		thingList = thingService.listAll();

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(shopService.listCountPaging(cri));

		model.addAttribute("shop", shopService.list(cri));
		model.addAttribute("thing", thingList);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("ctgroup", ctService.AllList());
		model.addAttribute("category", categoryService.AllList());
	}

	// 샵 박스 페이지
	@RequestMapping(value = "/ShopTable", method = RequestMethod.GET)
	public void getShopTable(Model model, SearchCriteria cri) throws Exception {
		logger.info("Administrator Shop in");
		List<ThingVO> thingList = new ArrayList<>();
		thingList = thingService.listAll();

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(shopService.listCountPaging(cri));

		model.addAttribute("shop", shopService.list(cri));
		model.addAttribute("thing", thingList);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("ctgroup", ctService.AllList());
		model.addAttribute("category", categoryService.AllList());
	}

	// 물건 박스 페이지
	@RequestMapping(value = "/ThingBox", method = RequestMethod.GET)
	public void getThingBox(Model model, SearchCriteria cri) throws Exception {
		logger.info("Administrator Cook inside");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(thingService.listCountPaging(cri));

		model.addAttribute("thing", thingService.list(cri));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("ctgroup", ctService.AllList());
		model.addAttribute("category", categoryService.AllList());
	}

	// 물건 테이블 페이지
	@RequestMapping(value = "/ThingTable", method = RequestMethod.GET)
	public void getThingTable(Model model, SearchCriteria cri) throws Exception {
		logger.info("Administrator Cook inside");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(thingService.listCountPaging(cri));

		model.addAttribute("thing", thingService.list(cri));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("ctgroup", ctService.AllList());
		model.addAttribute("category", categoryService.AllList());
	}

	// 공지사항 테이블 페이지
	@RequestMapping(value = "/NoticeTable", method = RequestMethod.GET)
	public void getNoticeTable(Model model, Criteria cri) throws Exception {
		logger.info("Administrator Notice Table inside");

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(noticeService.listCountPaging(cri));

		model.addAttribute("notice", noticeService.list(cri));
		model.addAttribute("pageMaker", pageMaker);
	}

	// 샵 박스 페이지
	@RequestMapping(value = "/EventBox", method = RequestMethod.GET)
	public void getEventBox(Model model, SearchCriteria cri) throws Exception {
		logger.info("Administrator Event in");
		List<ShopVO> shopSaleList = new ArrayList<>();
		List<CookVO> cookSaleList = new ArrayList<>();
		List<EventVO> list=new ArrayList<>();

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(eventService.countPaging());

		list=eventService.listPage(cri);
		shopSaleList = shopService.selectSale();
		cookSaleList = cookService.selectSale();
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("event", list);
		model.addAttribute("shopSaleList", shopSaleList);
		model.addAttribute("cookSaleList", cookSaleList);
	}
	// 샵 테이블 페이지
	@RequestMapping(value = "/EventTable", method = RequestMethod.GET)
	public void getEventTable(Model model, SearchCriteria cri) throws Exception {
		logger.info("Administrator Event in");
		List<ShopVO> shopSaleList = new ArrayList<>();
		List<CookVO> cookSaleList = new ArrayList<>();
		List<EventVO> list=new ArrayList<>();

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(eventService.countPaging());

		list=eventService.listPage(cri);
		shopSaleList = shopService.selectSale();
		cookSaleList = cookService.selectSale();
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("event", list);
		model.addAttribute("shopSaleList", shopSaleList);
		model.addAttribute("cookSaleList", cookSaleList);
	}
	
	// 맴버 박스 페이지
	@RequestMapping(value = "/MemberTable", method = RequestMethod.GET)
	public void getMemberBox(Model model, SearchCriteria cri) throws Exception {
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(memberService.countPaging());

		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("member",memberService.listPage(cri));
	}
	// 쿠킹 클래스 등록
	@RequestMapping(value = "/Cook/Create", method = RequestMethod.POST)
	public String postCook(CookVO vo, RedirectAttributes rttr, @RequestParam("shopmore") String[] shopmore,
			HttpServletRequest request, @RequestParam("url")String url, @ModelAttribute("cri")SearchCriteria cri) throws Exception {
		logger.info("Administrator Cook Register");
		CookMoreThingVO cmtVO = new CookMoreThingVO();
		String[] tno = new String[shopmore.length];

		vo.setCno(cookService.maxNum());

		String thumb = "";
		String file1 = "";
		long size1 = 0;
		String upDir = Tool.getRealPath(request, "/photo_upload/cook");
		MultipartFile file1MF = vo.getFile1MF();
		size1 = file1MF.getSize();

		if (size1 > 0) {
			String Folder = "/photo_upload/cook";
			Tool tool = new Tool();
			tool.CheckFolder(request, Folder);
			file1 = Upload.saveFileSpring(file1MF, upDir);
			vo.setFile1(file1);
			vo.setSize1(size1);
			if (Tool.isImage(file1)) {
				thumb = Tool.preview(upDir, file1, 400, 400);
			} else {
				thumb = "";
			}
		} else if (size1 == 0) {
			thumb = "no_image.jpg";
		}
		vo.setThumb(thumb);

		if (cookService.regisertCook(vo) == 1) {
			if (!shopmore[0].toString().equals("0")) {
				for (int i = 0; i < shopmore.length; i++) {
					cmtVO.setSno(Integer.parseInt(tno[i] = shopmore[i].toString()));
					cmtVO.setCno(vo.getCno());
					cmService.register(cmtVO);
				}
			}
			rttr.addFlashAttribute("msg", "SUCCESS");
		}
		
		url += "?page="+cri.getPage()+"?perPageNum="+cri.getPerPageNum();
		
		return "redirect:/administrator/"+url;
	}

	// 쿠킹 클래스 삭제
	@RequestMapping(value = "/Cook/Delete", method = RequestMethod.GET)
	public String getCookDelete(@RequestParam("cno") int cno, RedirectAttributes rttr, HttpServletRequest request,
			@ModelAttribute("cri")SearchCriteria cri, @RequestParam("url")String url)
			throws Exception {
		CookVO vo = new CookVO();
		vo = cookService.read(cno);
		String file = vo.getFile1();
		String thumb = vo.getThumb();
		String Folder = "/photo_upload/cook";
		String upDir = Tool.getRealPath(request, Folder);

		cmService.delete(cno);
		if (cookService.delete(cno) == 1) {
			if (!thumb.equals("no_image.jpg")) {
				Tool.deleteFile(upDir, file);
				Tool.deleteFile(upDir, thumb);
			}
			rttr.addFlashAttribute("msg", "SUCCESS");
		}
		url+="?page="+cri.getPage()+"&perPageNum="+cri.getPerPageNum();
		return "redirect:/administrator/"+url;
	}

	// 쿠킹 클래스 수정
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/Cook/Modify", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String getCookModify(Model model, @RequestParam("cno") int cno) throws Exception {
		logger.info("Request Ajax ");
		JSONObject obj = new JSONObject();
		JSONArray array = new JSONArray();

		CookVO vo = new CookVO();
		List<CookMoreThingVO> cmtList = new ArrayList<>();
		vo = cookService.read(cno);

		obj.put("cno", vo.getCno());
		obj.put("title", vo.getTitle());
		obj.put("content", vo.getContent());

		obj.put("askstart", vo.getAskstart());
		obj.put("askend", vo.getAskend());
		obj.put("startday", vo.getStartday());
		obj.put("endday", vo.getEndday());
		obj.put("starttime", vo.getStarttime());
		obj.put("endtime", vo.getEndtime());
		obj.put("cost", vo.getCost());
		obj.put("salecost", vo.getSalecost());
		obj.put("someready", vo.getSomeready());
		obj.put("minmember", vo.getMinmember());
		obj.put("maxmember", vo.getMaxmember());

		obj.put("st_begin", vo.getSt_begin());
		obj.put("st_end", vo.getSt_end());
		obj.put("st_day", vo.getSt_day());

		obj.put("clo_begin", vo.getClo_begin());
		obj.put("clo_end", vo.getClo_end());
		obj.put("clo_day", vo.getClo_day());

		obj.put("del_begin", vo.getDel_begin());
		obj.put("del_end", vo.getDel_end());
		obj.put("den_day", vo.getDel_day());

		obj.put("sale_begin", vo.getSale_begin());
		obj.put("sale_end", vo.getSale_end());
		obj.put("sale_day", vo.getSale_day());

		char display = vo.getDisplay();
		char deleted = vo.getDeleted();
		char strong = vo.getStrong();
		char closed = vo.getClosed();
		char sale = vo.getSale();
		if (display == 'Y') {
			obj.put("display", true);
		} else {
			obj.put("display", false);
		}
		if (deleted == 'Y') {
			obj.put("deleted", true);
		} else {
			obj.put("deleted", false);
		}
		if (strong == 'Y') {
			obj.put("strong", true);
		} else {
			obj.put("strong", false);
		}
		if (closed == 'Y') {
			obj.put("closed", true);
		} else {
			obj.put("closed", false);
		}
		if (sale == 'Y') {
			obj.put("sale", true);
		} else {
			obj.put("sale", false);
		}
		cmtList = cmService.list(cno);
		Iterator<CookMoreThingVO> it = cmtList.iterator();
		if (it != null) {
			while (it.hasNext()) {
				CookMoreThingVO cmtvo = it.next();
				JSONObject shopmore = new JSONObject();

				shopmore.put("sno", cmtvo.getSno());

				array.add(shopmore);
			}
		}

		obj.put("shopmore", array);

		return obj.toJSONString();
	}

	// 쿠킹 클래스 수정 업데이트
	@RequestMapping(value = "/Cook/Modify", method = RequestMethod.POST)
	public String postCookModify(CookVO vo, Model model, @RequestParam("cno") int cno, RedirectAttributes rttr,
			HttpServletRequest request, @RequestParam("shopmore") String[] shopmore,@RequestParam("url")String url,
			@ModelAttribute("cri")SearchCriteria cri) throws Exception {
		CookMoreThingVO cmtVO = new CookMoreThingVO();
		String[] sno = new String[shopmore.length];

		vo.setCno(cno);

		char display = request.getParameter("display") == null ? 'N' : 'Y';
		char closed = request.getParameter("closed") == null ? 'N' : 'Y';
		char strong = request.getParameter("strong") == null ? 'N' : 'Y';
		char sale = request.getParameter("sale") == null ? 'N' : 'Y';
		char deleted = request.getParameter("deleted") == null ? 'N' : 'Y';

		vo.setDisplay(display);
		vo.setClosed(closed);
		vo.setDeleted(deleted);
		vo.setSale(sale);

		MultipartFile file1MF = vo.getFile1MF();
		String thumb = "";
		String file1 = "";
		long size1 = 0;

		CookVO oldVo = new CookVO();
		oldVo = cookService.read(cno);

		size1 = file1MF.getSize();

		if (size1 <= 0) {
			vo.setFile1(oldVo.getFile1());
			vo.setSize1(oldVo.getSize1());
			vo.setThumb(oldVo.getThumb());
		} else if (size1 > 0) {
			String Folder = "/photo_upload/cook";
			String upDir = Tool.getRealPath(request, Folder);
			Tool.deleteFile(upDir, oldVo.getFile1());
			Tool.deleteFile(upDir, oldVo.getThumb());

			Tool tool = new Tool();
			tool.CheckFolder(request, Folder);

			file1 = Upload.saveFileSpring(file1MF, upDir);
			vo.setFile1(file1);
			vo.setSize1(size1);
			if (Tool.isImage(file1)) {
				thumb = Tool.preview(upDir, file1, 400, 400);
			} else {
				thumb = "";
			}
			vo.setThumb(thumb);
		}
		if (cookService.modify(vo) == 1) {
			rttr.addFlashAttribute("msg", "SUCCESS");
			if (shopmore[0].toString().equals("0")) {
				cmService.delete(cno);
			} else {
				cmService.delete(cno);
				for (int i = 0; i < shopmore.length; i++) {
					cmtVO.setSno(Integer.parseInt(sno[i] = shopmore[i].toString()));
					cmtVO.setCno(vo.getCno());
					cmService.register(cmtVO);
				}
			}
		}
		url+="?page="+cri.getPage()+"?perPageNum="+cri.getPerPageNum();
		return "redirect:/administrator/"+url;
	}

	// 쿠킹 클래스 강조 출력 여부
	@RequestMapping(value = "/Cook/Strong/Update/{cno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> StrongUpdate(@RequestBody CookVO vo, @PathVariable("cno") int cno) throws Exception {
		ResponseEntity<String> entity = null;

		vo.setCno(cno);
		cookService.checkStrong(vo);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		return entity;
	}

	// 쿠킹 클래스 비공개 여부
	@RequestMapping(value = "/Cook/Closed/Update/{cno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> ClosedUpdate(@RequestBody CookVO vo, @PathVariable("cno") int cno) throws Exception {
		ResponseEntity<String> entity = null;
		vo.setCno(cno);
		cookService.checkClosed(vo);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return entity;
	}

	// 쿠킹 클래스 삭제 여부
	@RequestMapping(value = "/Cook/Deleted/Update/{cno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> DeletedUpdate(@RequestBody CookVO vo, @PathVariable("cno") int cno) throws Exception {
		ResponseEntity<String> entity = null;
		vo.setCno(cno);
		cookService.checkDeleted(vo);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return entity;
	}

	// 쿠킹 클래스 세일 여부
	@RequestMapping(value = "/Cook/Sale/Update/{cno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> SaleUpdate(@RequestBody CookVO vo, @PathVariable("cno") int cno) throws Exception {
		ResponseEntity<String> entity = null;
		vo.setCno(cno);
		cookService.checkSale(vo);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return entity;
	}

	// 쿠킹 클래스 화면표시 여부
	@RequestMapping(value = "/Cook/Display/Update/{cno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> DisplayUpdate(@RequestBody CookVO vo, @PathVariable("cno") int cno) throws Exception {
		ResponseEntity<String> entity = null;
		vo.setCno(cno);
		cookService.checkDisplay(vo);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return entity;
	}

	// 카테고리 그룹 추가 메소드
	@RequestMapping(value = "/Thing/Ctgroup/Create", method = RequestMethod.POST)
	public ResponseEntity<String> insertCtgroup(@RequestBody CtgroupVO vo) {
		ResponseEntity<String> entity = null;
		try {
			if (thingService.CtgroupInsert(vo) == 1) {
				entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 카테고리 그룹 리스트 출력 메소드
	@RequestMapping(value = "/Thing/GroupList/", method = RequestMethod.GET)
	public ResponseEntity<List<CtgroupVO>> getCtgroupList() {
		ResponseEntity<List<CtgroupVO>> entity = null;
		try {
			entity = new ResponseEntity<>(thingService.groupList(), HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 카테고리 리스트 출력 메소드
	@RequestMapping(value = "/Thing/CategoryList/{ctgroup}", method = RequestMethod.GET)
	public ResponseEntity<List<CategoryVO>> getCategoyList(@PathVariable("ctgroup") int ctgroup) {
		ResponseEntity<List<CategoryVO>> entity = null;
		List<CategoryVO> vo = new ArrayList<CategoryVO>();
		try {
			vo = thingService.categoryList(ctgroup);
			entity = new ResponseEntity<List<CategoryVO>>(vo, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 카테고리 추가 메소드
	@RequestMapping(value = "/Thing/Category/Create", method = RequestMethod.POST)
	public ResponseEntity<String> insertCategory(@RequestBody CategoryVO vo) {
		ResponseEntity<String> entity = null;
		try {
			if (thingService.CategoryInsert(vo) == 1) {
				entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 물건 등록
	@RequestMapping(value = "/Thing/Create", method = RequestMethod.POST)
	public String postThing(ThingVO vo, RedirectAttributes rttr, HttpServletRequest request,
			@ModelAttribute("cri") SearchCriteria cri, @RequestParam("url") String url) throws Exception {
		logger.info("Administrator Thing Register");

		String thumb = "";
		String file1 = "";
		long size1 = 0;
		String upDir = Tool.getRealPath(request, "/photo_upload/thing");
		MultipartFile file1MF = vo.getFile1MF();
		size1 = file1MF.getSize();

		if (size1 > 0) {
			String Folder = "/photo_upload/thing";
			Tool tool = new Tool();
			tool.CheckFolder(request, Folder);
			file1 = Upload.saveFileSpring(file1MF, upDir);
			vo.setFile1(file1);
			vo.setSize1(size1);
			if (Tool.isImage(file1)) {
				thumb = Tool.preview(upDir, file1, 400, 400);
			} else {
				thumb = "";
			}
		} else if (size1 == 0) {
			thumb = "no_image.jpg";
		}
		vo.setThumb(thumb);

		if (thingService.regisertThing(vo) == 1) {
			rttr.addFlashAttribute("msg", "SUCCESS");
		}
		url += "?page=" + cri.getPage() + "&perPageNum=" + cri.getPerPageNum();
		if (cri.getCtgroup() != 0) {
			url += "&ctgroup=" + cri.getCtgroup();
		}
		if (cri.getCategory() != 0) {
			url += "&category=" + cri.getCategory();
		}
		return "redirect:/administrator/" + url;
	}

	// 물건 클래스 수정
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/Thing/Modify", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String getThingModify(Model model, @RequestParam("tno") int tno) throws Exception {
		logger.info("Request Ajax ");
		JSONObject obj = new JSONObject();

		ThingVO vo = new ThingVO();

		vo = thingService.read(tno);
		obj.put("tno", vo.getTno());
		obj.put("ctgroup", vo.getCtgroup());
		obj.put("category", vo.getCategory());
		obj.put("name", vo.getName());
		obj.put("stock", vo.getStock());
		obj.put("company", vo.getCompany());
		obj.put("country", vo.getCountry());
		obj.put("buycost", vo.getBuycost());
		obj.put("sellcost", vo.getSellcost());
		obj.put("thumb", vo.getThumb());

		return obj.toJSONString();
	}

	// 물건 수정 업데이트
	@RequestMapping(value = "/Thing/Modify", method = RequestMethod.POST)
	public String postThingModify(ThingVO vo, Model model, @RequestParam("tno") int tno, RedirectAttributes rttr,
			HttpServletRequest request, @ModelAttribute("cri") SearchCriteria cri) throws Exception {
		vo.setTno(tno);

		MultipartFile file1MF = vo.getFile1MF();
		String thumb = "";
		String file1 = "";
		long size1 = 0;

		ThingVO oldVo = new ThingVO();
		oldVo = thingService.read(tno);

		size1 = file1MF.getSize();

		if (size1 <= 0) {
			vo.setFile1(oldVo.getFile1());
			vo.setSize1(oldVo.getSize1());
			vo.setThumb(oldVo.getThumb());
		} else if (size1 > 0) {
			String Folder = "/photo_upload/thing";
			String upDir = Tool.getRealPath(request, Folder);
			Tool.deleteFile(upDir, oldVo.getFile1());
			Tool.deleteFile(upDir, oldVo.getThumb());

			Tool tool = new Tool();
			tool.CheckFolder(request, Folder);

			file1 = Upload.saveFileSpring(file1MF, upDir);
			vo.setFile1(file1);
			vo.setSize1(size1);
			if (Tool.isImage(file1)) {
				thumb = Tool.preview(upDir, file1, 400, 400);
			} else {
				thumb = "";
			}
			vo.setThumb(thumb);
		}
		if (thingService.modify(vo) == 1) {
			rttr.addFlashAttribute("msg", "SUCCESS");
		}
		return "redirect:/administrator/ThingBox";
	}

	// 물건 삭제
	@RequestMapping(value = "/Thing/Delete", method = RequestMethod.GET)
	public String getThingDelete(@RequestParam("tno") int tno, @ModelAttribute("cri") SearchCriteria cri,
			RedirectAttributes rttr, HttpServletRequest request, @RequestParam("url") String url) throws Exception {
		logger.info("Thing Delete");
		ThingVO vo = new ThingVO();
		vo = thingService.read(tno);
		String file = vo.getFile1();
		String thumb = vo.getThumb();
		String Folder = "/photo_upload/thing";
		String upDir = Tool.getRealPath(request, Folder);
		if (thingService.delete(tno) == 1) {
			if (!thumb.equals("no_image.jpg")) {
				Tool.deleteFile(upDir, file);
				Tool.deleteFile(upDir, thumb);
			}
			rttr.addFlashAttribute("msg", "SUCCESS");
		}
		url+="?page="+cri.getPage()+"&perPageNum="+cri.getPerPageNum();
		return "redirect:/administrator/"+url;
	}

	// 물건 카테고리 목록별 가져오기
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/Thing/Categorylist", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String getThingCategoryList(Model model, @RequestParam("ctgroup") int ctgroup,
			@RequestParam("ctno") int ctno) throws Exception {
		logger.info("Request Ajax ");
		JSONObject obj = new JSONObject();
		JSONArray array = new JSONArray();

		CategoryVO vo = new CategoryVO();
		List<ThingVO> thingList = new ArrayList<>();
		vo.setCtgroup(ctgroup);
		vo.setCtno(ctno);

		thingList = thingService.thingInfo(vo);
		Iterator<ThingVO> it = thingList.iterator();
		if (it != null) {
			while (it.hasNext()) {
				ThingVO thingVO = it.next();
				JSONObject thingCategoryList = new JSONObject();

				thingCategoryList.put("tno", thingVO.getTno());
				thingCategoryList.put("name", thingVO.getName());
				array.add(thingCategoryList);
			}
		}

		obj.put("thingCategoryList", array);

		return obj.toJSONString();
	}

	// 카테고리 별 품목 상세 정보
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/Thing/ThingInfo", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String getThingInfo(Model model, @RequestParam("tno") int tno) throws Exception {
		logger.info("Request Ajax ");
		JSONObject obj = new JSONObject();

		ThingVO vo = new ThingVO();
		vo = thingService.read(tno);

		obj.put("thumb", vo.getThumb());
		obj.put("cost", vo.getSellcost());
		obj.put("name", vo.getName());
		return obj.toJSONString();
	}

	// 쿠킹 클래스 등록
	@RequestMapping(value = "/Shop/Create", method = RequestMethod.POST)
	public String postShop(ShopVO vo, RedirectAttributes rttr, @RequestParam("shopmore") String[] shopmore,
			HttpServletRequest request, @RequestParam("url") String url) throws Exception {
		logger.info("Administrator Shop Register");
		ShopMoreThingVO smtVO = new ShopMoreThingVO();
		String[] tno = new String[shopmore.length];
		vo.setSno(shopService.maxNum());

		if (shopService.regisertShop(vo) == 1) {
			if (!shopmore[0].toString().equals("0")) {
				for (int i = 0; i < shopmore.length; i++) {
					smtVO.setTno(Integer.parseInt(tno[i] = shopmore[i].toString()));
					smtVO.setSno(vo.getSno());
					smService.register(smtVO);
				}
			}
			rttr.addFlashAttribute("msg", "SUCCESS");
		}

		return "redirect:/administrator/" + url;
	}

	// 샵 삭제
	@RequestMapping(value = "/Shop/Delete", method = RequestMethod.GET)
	public String getShopDelete(@RequestParam("sno") int sno, @ModelAttribute("cri")SearchCriteria cri, 
			@RequestParam("url")String url, RedirectAttributes rttr) throws Exception {
		logger.info("Shop Delete");
		smService.delete(sno);
		if (shopService.delete(sno) == 1) {
			rttr.addFlashAttribute("msg","SUCCESS");
		}
		
		url+="?page="+cri.getPage()+"&perPageNum="+cri.getPerPageNum();
		
		return "redirect:/administrator"+url;
	}

	// 샵 수정
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/Shop/Modify", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String getShopModify(Model model, @RequestParam("sno") int sno) throws Exception {
		logger.info("Request Ajax ");
		JSONObject obj = new JSONObject();
		JSONArray array = new JSONArray();

		ShopVO vo = new ShopVO();
		ThingVO thingVO = new ThingVO();
		List<ShopMoreThingVO> smtList = new ArrayList<>();

		vo = shopService.read(sno);
		thingVO = thingService.read(vo.getTno());

		obj.put("sno", vo.getSno());
		obj.put("tno", vo.getTno());

		obj.put("ctgroup", thingVO.getCtgroup());
		obj.put("category", thingVO.getCategory());

		obj.put("title", vo.getTitle());
		obj.put("content", vo.getContent());

		obj.put("cost", vo.getCost());
		obj.put("salecost", vo.getSalecost());
		obj.put("file1", vo.getFile1());

		obj.put("st_begin", vo.getSt_begin());
		obj.put("st_end", vo.getSt_end());
		obj.put("st_day", vo.getSt_day());

		obj.put("clo_begin", vo.getClo_begin());
		obj.put("clo_end", vo.getClo_end());
		obj.put("clo_day", vo.getClo_day());

		obj.put("del_begin", vo.getDel_begin());
		obj.put("del_end", vo.getDel_end());
		obj.put("den_day", vo.getDel_day());

		obj.put("sale_begin", vo.getSale_begin());
		obj.put("sale_end", vo.getSale_end());
		obj.put("sale_day", vo.getSale_day());

		char display = vo.getDisplay();
		char deleted = vo.getDeleted();
		char strong = vo.getStrong();
		char closed = vo.getClosed();
		char sale = vo.getSale();
		if (display == 'Y') {
			obj.put("display", true);
		} else {
			obj.put("display", false);
		}
		if (deleted == 'Y') {
			obj.put("deleted", true);
		} else {
			obj.put("deleted", false);
		}
		if (strong == 'Y') {
			obj.put("strong", true);
		} else {
			obj.put("strong", false);
		}
		if (closed == 'Y') {
			obj.put("closed", true);
		} else {
			obj.put("closed", false);
		}
		if (sale == 'Y') {
			obj.put("sale", true);
		} else {
			obj.put("sale", false);
		}

		smtList = smService.selectList(sno);
		Iterator<ShopMoreThingVO> it = smtList.iterator();
		if (it != null) {
			while (it.hasNext()) {
				ShopMoreThingVO cmtvo = it.next();
				ThingVO tvo = new ThingVO();
				JSONObject shopmore = new JSONObject();

				tvo = thingService.read(cmtvo.getTno());

				shopmore.put("shopmoretno", tvo.getTno());
				shopmore.put("shopmorectgroup", tvo.getCtgroup());
				shopmore.put("shopmorecategory", tvo.getCategory());

				array.add(shopmore);
			}
		}

		obj.put("shopmore", array);

		return obj.toJSONString();
	}

	// 샵 수정 업데이트
	@RequestMapping(value = "/Shop/Modify", method = RequestMethod.POST)
	public String postShopModify(ShopVO vo, Model model, @RequestParam("sno") int sno, RedirectAttributes rttr,
			HttpServletRequest request, @ModelAttribute("cri") SearchCriteria cri, @RequestParam("url") String url,
			@RequestParam("shopmore") String[] shopmore) throws Exception {
		vo.setSno(sno);
		if (shopService.modify(vo) == 1) {
			if (shopmore[0].toString().equals("0")) {
				smService.delete(sno);
			} else {
				smService.delete(sno);
				for (int i = 0; i < shopmore.length; i++) {
					ShopMoreThingVO smvo = new ShopMoreThingVO();
					smvo.setSno(vo.getSno());
					smvo.setTno(Integer.parseInt(shopmore[i].toString()));

					smService.register(smvo);
				}
			}
		}
		return "redirect:/administrator/" + url;
	}

	// 쿠킹 클래스 강조 출력 여부
	@RequestMapping(value = "/Shop/Strong/Update/{cno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> shopStrongUpdate(@RequestBody ShopVO vo, @PathVariable("sno") int sno)
			throws Exception {
		ResponseEntity<String> entity = null;
		vo.setSno(sno);
		shopService.checkStrong(vo);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return entity;
	}

	// 쿠킹 클래스 비공개 여부
	@RequestMapping(value = "/Shop/Closed/Update/{sno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> shopClosedUpdate(@RequestBody ShopVO vo, @PathVariable("sno") int sno)
			throws Exception {
		ResponseEntity<String> entity = null;
		vo.setSno(sno);
		shopService.checkClosed(vo);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return entity;
	}

	// 쿠킹 클래스 삭제 여부
	@RequestMapping(value = "/Shop/Deleted/Update/{sno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> shopDeletedUpdate(@RequestBody ShopVO vo, @PathVariable("sno") int sno)
			throws Exception {
		ResponseEntity<String> entity = null;
		vo.setSno(sno);
		shopService.checkDeleted(vo);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return entity;
	}

	// 쿠킹 클래스 세일 여부
	@RequestMapping(value = "/Shop/Sale/Update/{sno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> shopSaleUpdate(@RequestBody ShopVO vo, @PathVariable("sno") int sno)
			throws Exception {
		ResponseEntity<String> entity = null;
		vo.setSno(sno);
		shopService.checkSale(vo);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return entity;
	}

	// 쿠킹 클래스 화면표시 여부
	@RequestMapping(value = "/Shop/Display/Update/{sno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> DisplayUpdate(@RequestBody ShopVO vo, @PathVariable("sno") int sno) throws Exception {
		ResponseEntity<String> entity = null;
		vo.setSno(sno);
		shopService.checkDisplay(vo);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return entity;
	}

	// 공지사항 등록
	@RequestMapping(value = "/Notice/Create", method = RequestMethod.POST)
	public String postNotice(NoticeVO vo, RedirectAttributes rttr, HttpServletRequest request,
			@RequestParam("url") String url, @ModelAttribute("cri") SearchCriteria cri) throws Exception {
		logger.info("Administrator Notice Register");

		vo.setNno(noticeService.maxNum());

		String thumb = "";
		String file1 = "";
		long size1 = 0;
		String upDir = Tool.getRealPath(request, "/photo_upload/notice");
		MultipartFile file1MF = vo.getFile1MF();
		size1 = file1MF.getSize();

		if (size1 > 0) {
			String Folder = "/photo_upload/notice";
			Tool tool = new Tool();
			tool.CheckFolder(request, Folder);
			file1 = Upload.saveFileSpring(file1MF, upDir);
			vo.setFile1(file1);
			vo.setSize1(size1);
			if (Tool.isImage(file1)) {
				thumb = Tool.preview(upDir, file1, 400, 400);
			} else {
				thumb = "";
			}
		} else if (size1 == 0) {
			thumb = "no_image.jpg";
		}
		vo.setThumb(thumb);

		if (noticeService.regisertNotice(vo) == 1) {
			rttr.addFlashAttribute("msg", "SUCCESS");
		}
		url += "?page=" + cri.getPage() + "&perPageNum=" + cri.getPerPageNum();
		return "redirect:/administrator/" + url;
	}

	// 공지사항 수정
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/Notice/Modify", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String getNoticeModify(Model model, @RequestParam("nno") int nno) throws Exception {
		logger.info("Request Ajax ");
		JSONObject obj = new JSONObject();

		NoticeVO vo = new NoticeVO();

		vo = noticeService.read(nno);

		obj.put("nno", vo.getNno());

		obj.put("title", vo.getTitle());
		obj.put("content", vo.getContent());

		obj.put("file1", vo.getFile1());

		char display = vo.getDisplay();
		char deleted = vo.getDeleted();
		char strong = vo.getStrong();
		char closed = vo.getClosed();

		if (display == 'Y') {
			obj.put("display", true);
		} else {
			obj.put("display", false);
		}
		if (deleted == 'Y') {
			obj.put("deleted", true);
		} else {
			obj.put("deleted", false);
		}
		if (strong == 'Y') {
			obj.put("strong", true);
		} else {
			obj.put("strong", false);
		}
		if (closed == 'Y') {
			obj.put("closed", true);
		} else {
			obj.put("closed", false);
		}

		return obj.toJSONString();
	}

	// 공지사항 수정 업데이트
	@RequestMapping(value = "/Notice/Modify", method = RequestMethod.POST)
	public String postNoticeModify(NoticeVO vo, Model model, @RequestParam("nno") int nno,
			@ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr, HttpServletRequest request,
			@RequestParam("url") String url) throws Exception {

		vo.setNno(nno);

		char display = request.getParameter("display") == null ? 'N' : 'Y';
		char closed = request.getParameter("closed") == null ? 'N' : 'Y';
		char strong = request.getParameter("strong") == null ? 'N' : 'Y';
		char deleted = request.getParameter("deleted") == null ? 'N' : 'Y';

		vo.setDisplay(display);
		vo.setClosed(closed);
		vo.setDeleted(deleted);

		MultipartFile file1MF = vo.getFile1MF();
		String thumb = "";
		String file1 = "";
		long size1 = 0;

		NoticeVO oldVo = new NoticeVO();
		oldVo = noticeService.read(nno);

		size1 = file1MF.getSize();

		if (size1 <= 0) {
			vo.setFile1(oldVo.getFile1());
			vo.setSize1(oldVo.getSize1());
			vo.setThumb(oldVo.getThumb());
		} else if (size1 > 0) {
			String Folder = "/photo_upload/notice";
			String upDir = Tool.getRealPath(request, Folder);
			Tool.deleteFile(upDir, oldVo.getFile1());
			Tool.deleteFile(upDir, oldVo.getThumb());

			Tool tool = new Tool();
			tool.CheckFolder(request, Folder);

			file1 = Upload.saveFileSpring(file1MF, upDir);
			vo.setFile1(file1);
			vo.setSize1(size1);
			if (Tool.isImage(file1)) {
				thumb = Tool.preview(upDir, file1, 400, 400);
			} else {
				thumb = "";
			}
			vo.setThumb(thumb);
		}
		if (noticeService.modify(vo) == 1) {
			rttr.addFlashAttribute("msg", "SUCCESS");
		}
		url += "?page=" + cri.getPage() + "&perPageNum=" + cri.getPerPageNum();
		return "redirect:/administrator/" + url;
	}

	// 공지사항 강조 출력 여부
	@RequestMapping(value = "/Notice/Strong/Update/{nno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> noticeStrongUpdate(@RequestBody NoticeVO vo, @PathVariable("nno") int nno)
			throws Exception {
		ResponseEntity<String> entity = null;
		vo.setNno(nno);
		noticeService.checkStrong(vo);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		return entity;
	}

	// 공지사항 비공개 여부
	@RequestMapping(value = "/Notice/Closed/Update/{nno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> noticeClosedUpdate(@RequestBody NoticeVO vo, @PathVariable("nno") int nno)
			throws Exception {
		ResponseEntity<String> entity = null;
		vo.setNno(nno);
		noticeService.checkClosed(vo);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		return entity;
	}

	// 공지사항 삭제 여부
	@RequestMapping(value = "/Notice/Deleted/Update/{nno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> noticeDeletedUpdate(@RequestBody NoticeVO vo, @PathVariable("nno") int nno)
			throws Exception {
		ResponseEntity<String> entity = null;
		vo.setNno(nno);
		noticeService.checkDeleted(vo);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		return entity;
	}

	// 공지사항 화면 표시 여부
	@RequestMapping(value = "/Notice/Display/Update/{nno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> noticeDisplayUpdate(@RequestBody NoticeVO vo, @PathVariable("nno") int nno)
			throws Exception {
		ResponseEntity<String> entity = null;
		vo.setNno(nno);
		noticeService.checkDisplay(vo);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		return entity;
	}

	// 공지사항 삭제
	@RequestMapping(value = "/Notice/Delete", method = RequestMethod.GET)
	public String getNoticeDelete(@RequestParam("nno") int nno, @ModelAttribute("cri")SearchCriteria cri, 
			@RequestParam("url")String url, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
		logger.info("Notice Delete");
		NoticeVO vo = new NoticeVO();
		vo = noticeService.read(nno);
		String file = vo.getFile1();
		String thumb = vo.getThumb();
		String Folder = "/photo_upload/notice";
		String upDir = Tool.getRealPath(request, Folder);

		if (noticeService.delete(nno) == 1) {
			if (!thumb.equals("no_image.jpg")) {
				Tool.deleteFile(upDir, file);
				Tool.deleteFile(upDir, thumb);
			}
			rttr.addFlashAttribute("msg", "SUCCESS");
		}
		
		url+="?page="+cri.getPage()+"&perPageNum="+cri.getPerPageNum();
		return "redirect:/administrator/"+url;
	}

	//이벤트 등록
	@RequestMapping(value = "/Event/Create", method = RequestMethod.POST)
	public String createPOST(EventVO vo, RedirectAttributes rttr, HttpServletRequest request,
			@ModelAttribute("cri") SearchCriteria cri, @RequestParam("url") String url) throws Exception {
		logger.info("event create post");
		vo.setEno(eventService.maxNum());
		List<MultipartFile> fileMF = vo.getFile1MF();
		List<String> fileName = new ArrayList<String>();
		String upDir = Tool.getRealPath(request, "/photo_upload/event");
		String file1 = "";
		String file2 = "";
		String thumb1 = "";
		String thumb2 = "";
		long size1 = 0;
		long size2 = 0;

		if (null != fileMF && fileMF.size() > 0) {
			for (int i = 0; i < fileMF.size(); i++) {
				fileName.add(i, Upload.saveFileSpring(fileMF.get(i), upDir));
			}
			file1 = fileName.get(0).toString();
			file2 = fileName.get(1).toString();
			size1 = fileMF.get(0).getSize();
			size2 = fileMF.get(1).getSize();
			if (Tool.isImage(file1)) {
				thumb1 = Tool.preview(upDir, file1, 400, 400);
			} else {
				thumb1 = "no_image.jpg";
			}
			if (Tool.isImage(file2)) {
				thumb2 = Tool.preview(upDir, file2, 375, 200);
			} else {
				thumb2 = "no_banner.jpg";
			}
		}
		vo.setFile1(file1);
		vo.setFile2(file2);
		vo.setSize1(size1);
		vo.setSize2(size2);
		vo.setThumb1(thumb1);
		vo.setThumb2(thumb2);

		if(eventService.createEvent(vo)==1){
			rttr.addFlashAttribute("msg", "SUCCESS");
		}
			
		url += "?page=" + cri.getPage() + "&perPageNum=" + cri.getPerPageNum();
		
		return "redirect:/administrator/" + url;
	}

	// 이벤트 삭제
	@RequestMapping(value = "/Event/Delete", method = RequestMethod.GET)
	public String getEventDelete(@RequestParam("eno") int eno, RedirectAttributes rttr, HttpServletRequest request
			,@ModelAttribute("cri")SearchCriteria cri, @RequestParam("url")String url)throws Exception {
		EventVO vo = new EventVO();
		vo = eventService.read(eno);
		String file1 = vo.getFile1();
		String file2 = vo.getFile2();
		String thumb1 = vo.getThumb1();
		String thumb2 = vo.getThumb2();
		String Folder = "/photo_upload/event";
		String upDir = Tool.getRealPath(request, Folder);

		if (eventService.eventDelete(eno) == 1) {
			if (!thumb1.equals("no_image.jpg")) {
				Tool.deleteFile(upDir, file1);
				Tool.deleteFile(upDir, file2);
				Tool.deleteFile(upDir, thumb1);
				Tool.deleteFile(upDir, thumb2);
			}
			rttr.addFlashAttribute("msg", "SUCCESS");
		}
		url+="?page="+cri.getPage()+"&perPageNum="+cri.getPerPageNum();
		return "redirect:/administrator/"+url;
	}

	//이벤트 수정
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/Event/Modify", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String getEventModify(Model model, @RequestParam("eno") int eno) throws Exception {
		logger.info("Request Ajax ");
		JSONObject obj = new JSONObject();

		EventVO vo = new EventVO();
		vo = eventService.read(eno);

		obj.put("eno", vo.getEno());
		obj.put("title", vo.getTitle());
		obj.put("content", vo.getContent());

		obj.put("salecost", vo.getSalecost());
		obj.put("st_begin", vo.getSt_begin());
		obj.put("st_end", vo.getSt_end());
		obj.put("st_day", vo.getSt_day());

		obj.put("clo_begin", vo.getClo_begin());
		obj.put("clo_end", vo.getClo_end());
		obj.put("clo_day", vo.getClo_day());

		obj.put("del_begin", vo.getDel_begin());
		obj.put("del_end", vo.getDel_end());
		obj.put("den_day", vo.getDel_day());

		obj.put("banner_begin", vo.getBanner_begin());
		obj.put("banner_end", vo.getBanner_end());
		obj.put("banner_day", vo.getBanner_day());
		
		obj.put("quit_begin", vo.getQuit_begin());
		obj.put("quit_end", vo.getQuit_end());
		obj.put("quit_day", vo.getQuit_day());
		
		char display = vo.getDisplay();
		char deleted = vo.getDeleted();
		char strong = vo.getStrong();
		char closed = vo.getClosed();
		char banner= vo.getBanner();
		char quit=vo.getQuit();
		
		if (display == 'Y') {
			obj.put("display", true);
		} else {
			obj.put("display", false);
		}
		if (deleted == 'Y') {
			obj.put("deleted", true);
		} else {
			obj.put("deleted", false);
		}
		if (strong == 'Y') {
			obj.put("strong", true);
		} else {
			obj.put("strong", false);
		}
		if (closed == 'Y') {
			obj.put("closed", true);
		} else {
			obj.put("closed", false);
		}
		if(banner=='Y'){
			obj.put("banner", true);
		}else{
			obj.put("banner", false);
		}
		if(quit=='Y'){
			obj.put("quit", true);
		}else{
			obj.put("quit", false);
		}
		
		obj.put("shopSale", vo.getSaleshop());
		obj.put("cookSale", vo.getSalecook());
		obj.put("salecost", vo.getSalecost());
		
		return obj.toJSONString();
	}

	// 쿠킹 클래스 수정 업데이트
	@RequestMapping(value = "/Event/Modify", method = RequestMethod.POST)
	public String postEventModify(EventVO vo, Model model, @RequestParam("eno") int eno, RedirectAttributes rttr,
			HttpServletRequest request, @RequestParam("url")String url, @ModelAttribute("cri")SearchCriteria cri) throws Exception {
		
		vo.setEno(eno);
		EventVO oldVO=new EventVO();
		oldVO=eventService.read(eno);
		
		char display = request.getParameter("display") == null ? 'N' : 'Y';
		char closed = request.getParameter("closed") == null ? 'N' : 'Y';
		char strong = request.getParameter("strong") == null ? 'N' : 'Y';
		char sale = request.getParameter("sale") == null ? 'N' : 'Y';
		char deleted = request.getParameter("deleted") == null ? 'N' : 'Y';
		char banner= request.getParameter("banner")==null? 'N':'Y';
		char quit=request.getParameter("quit")==null ? 'N':'Y';

		vo.setDisplay(display);
		vo.setStrong(strong);
		vo.setClosed(closed);
		vo.setDeleted(deleted);
		vo.setBanner(banner);
		vo.setQuit(quit);
		
		List<MultipartFile> fileMF = vo.getFile1MF();
		List<String> fileName = new ArrayList<String>();
		
		String file1 = "";
		String file2 = "";
		String thumb1 = "";
		String thumb2 = "";
		long size1 = 0;
		long size2 = 0;
		
		size1=fileMF.get(0).getSize();
		size2=fileMF.get(1).getSize();
		
		EventVO oldVo=new EventVO();
		oldVo = eventService.read(eno);

		if (size1 <= 0) {
			vo.setFile1(oldVo.getFile1());
			vo.setSize1(oldVo.getSize1());
			vo.setThumb1(oldVo.getThumb1());
		} else if (size1 > 0) {
			Tool tool = new Tool();
			String Folder = "/photo_upload/event";
			tool.CheckFolder(request, Folder);
			String upDir = Tool.getRealPath(request, Folder);
			Tool.deleteFile(upDir, oldVo.getFile1());
			Tool.deleteFile(upDir, oldVo.getThumb1());			

			file1 = Upload.saveFileSpring(fileMF.get(0), upDir);
			vo.setFile1(file1);
			vo.setSize1(size1);
			if (Tool.isImage(file1)) {
				thumb1 = Tool.preview(upDir, file1, 400, 400);
			} else {
				thumb1 = "";
			}
			vo.setThumb1(thumb1);
		}
		if (size2 <= 0) {
			vo.setFile2(oldVo.getFile2());
			vo.setSize2(oldVo.getSize2());
			vo.setThumb2(oldVo.getThumb2());
		} else if (size2 > 0) {
			Tool tool = new Tool();
			String Folder = "/photo_upload/event";
			tool.CheckFolder(request, Folder);
			String upDir = Tool.getRealPath(request, Folder);
			Tool.deleteFile(upDir, oldVo.getFile2());
			Tool.deleteFile(upDir, oldVo.getThumb2());			

			file2 = Upload.saveFileSpring(fileMF.get(1), upDir);
			vo.setFile1(file2);
			vo.setSize1(size2);
			if (Tool.isImage(file2)) {
				thumb2 = Tool.preview(upDir, file2, 400, 400);
			} else {
				thumb2 = "";
			}
			vo.setThumb2(thumb2);
		}
		if(eventService.modify(vo)==1) {
			rttr.addFlashAttribute("msg", "SUCCESS");
		}
		
		url+="?page="+cri.getPage()+"&perPageNum="+cri.getPerPageNum();
		return "redirect:/administrator/"+url;
	}
	
	// 이벤트 강조 출력 여부
	@RequestMapping(value = "/Event/Strong/Update/{eno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> eventStrongUpdate(@RequestBody EventVO vo, @PathVariable("eno") int eno) throws Exception {
		ResponseEntity<String> entity = null;
		vo.setEno(eno);
		eventService.checkString(vo);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		return entity;
	}

	// 이벤트 비공개 여부
	@RequestMapping(value = "/Event/Closed/Update/{eno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> eventClosedUpdate(@RequestBody EventVO vo, @PathVariable("eno") int eno) throws Exception {
		ResponseEntity<String> entity = null;
		vo.setEno(eno);
		eventService.checkClosed(vo);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return entity;
	}

	// 이벤트 배너 출력 여부
	@RequestMapping(value = "/Event/Banner/Update/{eno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> eventBannerUpdate(@RequestBody EventVO vo, @PathVariable("eno") int eno) throws Exception {
		ResponseEntity<String> entity = null;
		vo.setEno(eno);
		eventService.checkBanner(vo);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return entity;
	}
	
	// 이벤트 종료 여부
	@RequestMapping(value = "/Event/Quit/Update/{eno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
		public ResponseEntity<String> eventQuitUpdate(@RequestBody EventVO vo, @PathVariable("eno") int eno) throws Exception {
		ResponseEntity<String> entity = null;
		vo.setEno(eno);
		eventService.checkQuit(vo);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return entity;
	}
	
	// 이벤트 삭제 여부
	@RequestMapping(value = "/Event/Deleted/Update/{eno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> eventDeletedUpdate(@RequestBody EventVO vo, @PathVariable("eno") int eno) throws Exception {
		ResponseEntity<String> entity = null;
		vo.setEno(eno);
		eventService.checkDeleted(vo);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return entity;
	}

	// 이벤트 화면표시 여부
	@RequestMapping(value = "/Event/Display/Update/{eno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> eventDisplayUpdate(@RequestBody EventVO vo, @PathVariable("eno") int eno) throws Exception {
		ResponseEntity<String> entity = null;
		vo.setEno(eno);
		eventService.checkDisplay(vo);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return entity;
	}
	// 쿠킹 클래스 삭제
	@RequestMapping(value = "/Member/Delete", method = RequestMethod.GET)
	public String getMemberDelete(@RequestParam("mno") int mno, RedirectAttributes rttr, 
			HttpServletRequest request, @ModelAttribute("cri")SearchCriteria cri, @RequestParam("url")String url)throws Exception {
		MemberVO vo= new MemberVO();
		vo = memberService.selectuser(mno);
		String file = vo.getFile1();
		String thumb = vo.getThumb();
		String Folder = "/photo_upload/member";
		String upDir = Tool.getRealPath(request, Folder);

		if (memberService.delete(mno) == 1) {
			if (!thumb.equals("no_image.jpg")) {
				Tool.deleteFile(upDir, file);
				Tool.deleteFile(upDir, thumb);
			}
			rttr.addFlashAttribute("msg", "SUCCESS");
		}
		
		url+="?page="+cri.getPage()+"&perPageNum="+cri.getPerPageNum();
		
		return "redirect:/administrator/"+url;
	}
	
	// 맴버 인증  여부 변경
	@RequestMapping(value = "/Member/Confirm/Update/{mno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> memberConfirmUpdate(@RequestBody MemberVO vo, @PathVariable("mno") int mno) throws Exception {
		ResponseEntity<String> entity = null;
		vo.setMno(mno);
		memberService.checkConfirm(vo);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		return entity;
	}

	// 맴버 등급 변경
	@RequestMapping(value = "/Member/Level/Update/{mno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> memberLevelUpdate(@RequestBody MemberVO vo, @PathVariable("mno") int mno) throws Exception {
		ResponseEntity<String> entity = null;
		vo.setMno(mno);
		memberService.checkMlevel(vo);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		return entity;
	}
	
	// 맴버 탈퇴 여부 변경
	@RequestMapping(value = "/Member/Drop/Update/{mno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> memberDropUpdate(@RequestBody MemberVO vo, @PathVariable("mno") int mno) throws Exception {
		ResponseEntity<String> entity = null;
		vo.setMno(mno);
		memberService.checkMdrop(vo);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		return entity;
	}
	/*
	 * @RequestMapping(value = "/AllList", method = RequestMethod.GET) public
	 * void home(Model model) throws Exception { logger.info(""); List<NoticeVO>
	 * noticeList =new ArrayList<NoticeVO>(); List<EventVO> eventList =new
	 * ArrayList<EventVO>(); List<CookVO> cookList =new ArrayList<CookVO>();
	 * List<ThingVO> thingList =new ArrayList<ThingVO>(); List<MemberVO>
	 * memberList =new ArrayList<MemberVO>(); List<CtgroupVO> ctgroupList = new
	 * ArrayList<CtgroupVO>(); List<CategoryVO> categoryAllList=new
	 * ArrayList<CategoryVO>(); List<ShopVO> shopAllList=new
	 * ArrayList<ShopVO>();
	 * 
	 * noticeList=noticeService.listAll(); eventList=eventService.listAll();
	 * cookList=cookService.listAll(); thingList=thingService.listAll();
	 * memberList=memberService.listAll(); ctgroupList=thingService.groupList();
	 * categoryAllList=thingService.categoryAllList(); shopAllList
	 * =shopService.listAll();
	 * 
	 * model.addAttribute("notice", noticeList);
	 * model.addAttribute("event",eventList);
	 * model.addAttribute("cook",cookList); model.addAttribute("thing",
	 * thingList); model.addAttribute("member", memberList);
	 * model.addAttribute("ctgroup",ctgroupList);
	 * model.addAttribute("categoryAllList",categoryAllList);
	 * model.addAttribute("shop",shopAllList); }
	 */
}
