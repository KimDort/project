package com.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.service.CookMoreService;
import com.project.service.CookService;
import com.project.service.EventService;
import com.project.service.MemberService;
import com.project.service.NoticeService;
import com.project.service.ShopMoreService;
import com.project.service.ShopService;
import com.project.service.ThingService;
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

@RestController
public class AjaxController {
	@Inject
	private CookService cookService;

	@Inject
	private MemberService memberService;

	@Inject
	private ThingService thingService;

	@Inject
	private EventService eventService;

	@Inject
	private NoticeService noticeService;

	@Inject
	private ShopService shopService;

	@Inject
	private CookMoreService cookmoreService;

	@Inject
	private ShopMoreService shopmoreService;

	// 쿠킹 클래스 메인 페이지 노출 여부
	@RequestMapping(value = "/administrator/cook/display/update/{cno}", method = { RequestMethod.PUT,
			RequestMethod.PATCH })
	public ResponseEntity<String> DisplayUpdate(@RequestBody CookVO vo, @PathVariable("cno") int cno) throws Exception {
		ResponseEntity<String> entity = null;

		vo.setCno(cno);
		cookService.checkDisplay(vo);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		return entity;
	}

	// 쿠킹 클래스 강조 출력 여부
	@RequestMapping(value = "/administrator/cook/strong/update/{cno}", method = { RequestMethod.PUT,
			RequestMethod.PATCH })
	public ResponseEntity<String> StrongUpdate(@RequestBody CookVO vo, @PathVariable("cno") int cno) throws Exception {
		ResponseEntity<String> entity = null;

		vo.setCno(cno);
		cookService.checkStrong(vo);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		return entity;
	}

	// 쿠킹 클래스
	@RequestMapping(value = "/administrator/cook/display/getlistone/{cno}", method = RequestMethod.GET)
	public ResponseEntity<CookVO> getDisplayOne(@PathVariable("cno") int cno) throws Exception {
		ResponseEntity<CookVO> entity = null;
		CookVO vo = new CookVO();
		vo = cookService.read(cno);
		entity = new ResponseEntity<CookVO>(vo, HttpStatus.OK);
		return entity;
	}

	// 회원가입 아이디 중복 체크
	@RequestMapping(value = "/member/checkId/", method = RequestMethod.POST)
	public ResponseEntity<String> checkId(@RequestBody MemberVO vo) throws Exception {
		ResponseEntity<String> entity = null;
		if (memberService.checkId(vo.getId()) == 0) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}

		return entity;
	}

	// 카테고리 그룹 리스트 출력 메소드
	@RequestMapping(value = "/thing/ctgrouplist/", method = RequestMethod.GET)
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

	// 카테고리 그룹 추가 메소드
	@RequestMapping(value = "/thing/insertCtgroup", method = RequestMethod.POST)
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

	// 카테고리 리스트 출력 메소드
	@RequestMapping(value = "/thing/categorylist/{ctgroup}", method = RequestMethod.GET)
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
	@RequestMapping(value = "/thing/insertCategory", method = RequestMethod.POST)
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

	// 카테고리 삭제
	@RequestMapping(value = "/thing/deleteCategory/{ctno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteCategory(@PathVariable("ctno") int ctno) {
		ResponseEntity<String> entity = null;
		try {
			thingService.CategoryDelete(ctno);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 카테고리 그룹 삭제 메소드
	@RequestMapping(value = "/thing/deleteCtgroup/{ctgroup}", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteCtgroup(@PathVariable("ctgroup") int ctgroup) {
		ResponseEntity<String> entity = null;
		try {
			thingService.CtgroupDelete(ctgroup);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 물건 아이템 추가
	@RequestMapping(value = "/thing/create", method = RequestMethod.POST)
	public ResponseEntity<String> ThingCreatePOST(HttpServletRequest request,
			@RequestParam("file1MF") MultipartFile file1MF) {
		ResponseEntity<String> entity = null;
		ThingVO vo = new ThingVO();
		try {
			String ctgroup = request.getParameter("ctgroup");
			String category = request.getParameter("category");
			String name = request.getParameter("name");
			String stock = request.getParameter("stock");
			String buycost = request.getParameter("buycost");
			String sellcost = request.getParameter("sellcost");
			char strong = request.getParameter("strong") == null ? 'N' : request.getParameter("strong").charAt(0);
			char closed = request.getParameter("closed") == null ? 'N' : request.getParameter("closed").charAt(0);
			char deleted = request.getParameter("deleteld") == null ? 'N' : request.getParameter("deleteld").charAt(0);
			char sale = request.getParameter("sale") == null ? 'N' : request.getParameter("sale").charAt(0);
			String upDir = Tool.getRealPath(request, "/photo_upload/thing");
			String file1 = "";
			String thumb = "";
			long size1 = 0;
			size1 = file1MF.getSize();

			// 업로드 파일 생성
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
			vo.setCtgroup(Integer.parseInt(ctgroup));
			vo.setCategory(Integer.parseInt(category));
			vo.setName(name);
			vo.setThumb(thumb);
			vo.setStock(Integer.parseInt(stock));
			vo.setBuycost(Integer.parseInt(buycost));
			vo.setSellcost(Integer.parseInt(sellcost));
			vo.setStrong(strong);
			vo.setDeleted(deleted);
			vo.setClosed(closed);
			vo.setSale(sale);
			thingService.regisertThing(vo);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 쿠킹 클래스 등록
	@RequestMapping(value = "/cook/create", method = RequestMethod.POST)
	public ResponseEntity<String> CookCreatePOST(HttpServletRequest request,
			@RequestParam("file1MF") MultipartFile file1MF) {
		ResponseEntity<String> entity = null;
		CookVO vo = new CookVO();
		try {
			String[] sellthingnum = request.getParameterValues("sellthingnum");
			String writer = request.getParameter("writer");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String askstart = request.getParameter("askstart");
			String askend = request.getParameter("askend");
			String startday = request.getParameter("startday");
			String endday = request.getParameter("endday");
			String stime1 = request.getParameter("stime1");
			String stime2 = request.getParameter("stime2");
			String etime1 = request.getParameter("etime1");
			String etime2 = request.getParameter("etime2");
			String cost = request.getParameter("cost");
			String selecost = request.getParameter("salecost");
			String someready = request.getParameter("someready");
			String minmember = request.getParameter("minmember");
			String maxmember = request.getParameter("maxmember");
			char strong = request.getParameter("strong") == null ? 'N' : request.getParameter("strong").charAt(0);
			char closed = request.getParameter("clsoed") == null ? 'N' : request.getParameter("closed").charAt(0);
			char deleted = request.getParameter("deleteld") == null ? 'N' : request.getParameter("deleted").charAt(0);
			char sale = request.getParameter("sale") == null ? 'N' : request.getParameter("sale").charAt(0);
			char display = request.getParameter("display") == null ? 'N' : request.getParameter("display").charAt(0);
			if (stime1.length() == 1) {
				stime1 = "0" + stime1;
			}
			if (stime2.length() == 1) {
				stime2 = "0" + stime2;
			}
			if (etime1.length() == 1) {
				etime1 = "0" + etime1;
			}
			if (etime2.length() == 1) {
				etime2 = "0" + etime2;
			}
			String starttime = stime1 + ":" + stime2;
			String endtime = etime1 + ":" + etime2;
			String upDir = Tool.getRealPath(request, "/photo_upload/cook");
			String thumb = "";
			String file1 = "";
			long size1 = 0;
			size1 = file1MF.getSize();
			if (size1 > 0) {
				String Folder = "/photo_upload/cook";
				Tool tool = new Tool();
				tool.CheckFolder(request, Folder);
				file1 = Upload.saveFileSpring(file1MF, upDir);

				if (Tool.isImage(file1)) {
					thumb = Tool.preview(upDir, file1, 400, 400);
				} else {
					thumb = "no_image.jpg";
				}
				vo.setFile1(file1);
				vo.setSize1(size1);
				vo.setThumb(thumb);
			} 
			vo.setTitle(title);
			vo.setContent(Tool.convertChar(content));
			vo.setWriter(writer);
			vo.setAskend(askend);
			vo.setAskstart(askstart);
			vo.setStartday(startday);
			vo.setEndday(endday);
			vo.setStarttime(starttime);
			vo.setEndtime(endtime);
			vo.setCost(Integer.parseInt(cost));
			vo.setSalecost(Integer.parseInt(selecost));
			vo.setMinmember(Integer.parseInt(minmember));
			vo.setMaxmember(Integer.parseInt(maxmember));
			vo.setSomeready(someready);
			vo.setStrong(strong);
			vo.setClosed(closed);
			vo.setDeleted(deleted);
			vo.setDisplay(display);
			vo.setSale(sale);			
			if (cookService.regisertCook(vo)==1) {
				if (Integer.parseInt(sellthingnum[0])==6){
					
				}else if(Integer.parseInt(sellthingnum[0])!=6){
					regCookMoreThing(cookmoreService.max(), sellthingnum);
				}
				entity = new ResponseEntity<>("cook", HttpStatus.OK);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 쿠킹 클래스 리스트 출력
	@RequestMapping(value = "/cook/AllList", method = RequestMethod.GET)
	public ResponseEntity<List<CookVO>> CookAllList() {
		ResponseEntity<List<CookVO>> entity = null;
		try {
			entity = new ResponseEntity<>(cookService.listAll(), HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 샵 클래스 리스트 출력
	@RequestMapping(value = "/shop/AllList", method = RequestMethod.GET)
	public ResponseEntity<List<ShopVO>> ShopAllList() {
		ResponseEntity<List<ShopVO>> entity = null;
		try {
			entity = new ResponseEntity<>(shopService.listAll(), HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 이벤트 등록
	@RequestMapping(value = "/event/create", method = RequestMethod.POST)
	public ResponseEntity<String> EventCreatePOST(HttpServletRequest request,
			@RequestParam("file1MF") List<MultipartFile> file1MF) {
		ResponseEntity<String> entity = null;
		EventVO vo = new EventVO();
		try {
			String writer = request.getParameter("writer");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String startday = request.getParameter("startday");
			String endday = request.getParameter("endday");
			char strong = request.getParameter("strong") == null ? 'N' : request.getParameter("strong").charAt(0);
			char closed = request.getParameter("closed") == null ? 'N' : request.getParameter("closed").charAt(0);
			char banner = request.getParameter("banner") == null ? 'N' : request.getParameter("banner").charAt(0);
			char quit = request.getParameter("quit") == null ? 'N' : request.getParameter("quit").charAt(0);
			char deleted = request.getParameter("deleted") == null ? 'N' : request.getParameter("deleted").charAt(0);
			char display = request.getParameter("display") == null ? 'N' : request.getParameter("display").charAt(0);
			List<String> fileName = new ArrayList<String>();

			String upDir = Tool.getRealPath(request, "/photo_upload/event");
			String file1 = "";
			String file2 = "";
			String thumb1 = "";
			String thumb2 = "";
			long size1 = 0;
			long size2 = 0;

			if (file1MF != null && file1MF.size() > 0) {
				for (int i = 0; i < file1MF.size(); i++) {
					fileName.add(i, Upload.saveFileSpring(file1MF.get(i), upDir));
				}
				String Folder = "/photo_upload/event";
				Tool.CheckFolder(request, Folder);
				file1 = fileName.get(0).toString();
				file2 = fileName.get(1).toString();
				size1 = file1MF.get(0).getSize();
				size2 = file1MF.get(1).getSize();
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
				vo.setFile1(file1);
				vo.setFile2(file2);
				vo.setSize1(size1);
				vo.setSize2(size2);
				vo.setThumb1(thumb1);
				vo.setThumb2(thumb2);
			}
			vo.setWriter(writer);
			vo.setTitle(title);
			vo.setContent(Tool.convertChar(content));
			vo.setStartday(startday);
			vo.setEndday(endday);
			vo.setStrong(strong);
			vo.setClosed(closed);
			vo.setDeleted(deleted);
			vo.setQuit(quit);
			vo.setDeleted(deleted);
			vo.setBanner(banner);
			vo.setDisplay(display);
			eventService.createEvent(vo);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 공지사항등록 등록
	@RequestMapping(value = "/notice/create", method = RequestMethod.POST)
	public ResponseEntity<String> NoticeCreatePOST(HttpServletRequest request,
			@RequestParam("file1MF") MultipartFile file1MF) {
		ResponseEntity<String> entity = null;
		NoticeVO vo = new NoticeVO();
		try {
			String writer = request.getParameter("writer");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String startday = request.getParameter("startday");
			String endday = request.getParameter("endday");
			char strong = request.getParameter("strong") == null ? 'N' : request.getParameter("strong").charAt(0);
			char colsed = request.getParameter("closed") == null ? 'N' : request.getParameter("closed").charAt(0);
			char deleted = request.getParameter("deleted") == null ? 'N' : request.getParameter("deleted").charAt(0);
			char display = request.getParameter("display") == null ? 'N' : request.getParameter("display").charAt(0);

			String upDir = Tool.getRealPath(request, "/photo_upload/cook");
			String file1 = "";
			String thumb1 = "";
			long size1 = 0;

			if (file1MF.getSize() > 0) {
				String Folder = "/photo_upload/notice";
				Tool.CheckFolder(request, Folder);
				file1 = Upload.saveFileSpring(file1MF, upDir);
				size1 = file1MF.getSize();
				if (Tool.isImage(file1)) {
					thumb1 = Tool.preview(upDir, file1, 400, 400);
				} else {
					thumb1 = "no_image.jpg";
				}
			}

			// noticeService.regisertNotice(vo);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/shop/create", method = RequestMethod.POST)
	public ResponseEntity<String> ShopCreatePOST(HttpServletRequest request) {
		ResponseEntity<String> entity = null;
		ShopVO vo = new ShopVO();
		try {
			String tno = request.getParameter("tno");
			String[] sellthingnum = request.getParameterValues("category2");
			String writer = request.getParameter("writer");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String salecost = request.getParameter("salecost");
			String startday = request.getParameter("startday");
			String endday = request.getParameter("endday");
			String cost=request.getParameter("cost");
			char strong = request.getParameter("strong") == null ? 'N' : request.getParameter("strong").charAt(0);
			char closed = request.getParameter("closed") == null ? 'N' : request.getParameter("closed").charAt(0);
			char deleted = request.getParameter("deleted") == null ? 'N' : request.getParameter("deleted").charAt(0);
			char display = request.getParameter("display") == null ? 'N' : request.getParameter("display").charAt(0);
			char sale = request.getParameter("sale") == null ? 'N' : request.getParameter("sale").charAt(0);
			String file1=request.getParameter("file1");
			
			vo.setWriter(writer);
			vo.setTitle(title);
			vo.setTno(Integer.parseInt(tno));
			vo.setContent(content);
			vo.setStartDay(startday);
			vo.setEndDay(endday);
			vo.setStrong(strong);
			vo.setSale(sale);
			vo.setDeleted(deleted);
			vo.setFile1(file1);
			vo.setClosed(closed);
			vo.setSalecost(Integer.parseInt(salecost));
			vo.setCost(Integer.parseInt(cost));
			vo.setDisplay(display);
			
			if (shopService.regisertShop(vo) == 1) {
				if(Integer.parseInt(sellthingnum[0])!=6){
					regShopMoreThing(shopmoreService.max(), sellthingnum);
				}
				entity = new ResponseEntity<>("shop", HttpStatus.OK);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	public void regShopMoreThing(int sno, String[] param) {
		ShopMoreThingVO vo = new ShopMoreThingVO();
		try {
			for (int i = 0; i < param.length; i++) {
				vo.setTno(Integer.parseInt(param[i]));
				vo.setSno(sno);
				shopmoreService.register(vo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public void regCookMoreThing(int cno, String[] param){
		CookMoreThingVO vo=new CookMoreThingVO();
		try {
			for(int i=0;i<param.length;i++){
				//vo.setTno(Integer.parseInt(param[i]));
				vo.setCno(cno);
				cookmoreService.register(vo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	//샵 등록 물건 정보 가져오기
	@RequestMapping(value = "/thing/thingInfo/{ctgroup}/{ctno}", method = RequestMethod.GET)
	public ResponseEntity<List<ThingVO>> getThingInfo(@PathVariable("ctgroup")int ctgroup, 
			@PathVariable("ctno")int ctno){
		ResponseEntity<List<ThingVO>> entity=null;
		CategoryVO vo=new CategoryVO();
		try {
			vo.setCtgroup(ctgroup);
			vo.setCtno(ctno);
			entity=new ResponseEntity<List<ThingVO>>(thingService.thingInfo(vo),HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//물건 정보 가져오기
	@RequestMapping(value="/thing/getthing/{tno}",method=RequestMethod.GET)
	public ResponseEntity<ThingVO> getthing(@PathVariable("tno")int tno){
		ResponseEntity<ThingVO> entity=null;
		try {			
			entity=new ResponseEntity<ThingVO>(thingService.read(tno),HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
