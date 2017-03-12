package com.project.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class EventVO {
	private int r;
	private int eno;
	private String bname = "EVENT";
	private String title;
	private String content;
	private String writer;
	private String regdate;
	private String startday;
	private String endday;
	private String file1 = "";
	private long size1 = 0;
	private String thumb1 = "no_image.jpg";
	private String file2 = "";
	private long size2 = 0;
	private String thumb2 = "no_banner.jpg";
	private List<MultipartFile> file1MF;
	private char strong = 'N';
	private String st_begin;
	private String st_end;
	private String st_day;
	private char closed = 'N';
	private String clo_begin;
	private String clo_end;
	private String clo_day;
	private char banner = 'N';
	private String banner_begin;
	private String banner_end;
	private String banner_day;
	private char quit = 'N';
	private String quit_begin;
	private String quit_end;
	private String quit_day;
	private char deleted = 'N';
	private String del_begin;
	private String del_end;
	private String del_day;
	private char display = 'N';
	private int saleshop;
	private int salecook;
	private int salecost;

	public int getSaleshop() {
		return saleshop;
	}

	public void setSaleshop(int saleshop) {
		this.saleshop = saleshop;
	}

	public int getSalecook() {
		return salecook;
	}

	public void setSalecook(int salecook) {
		this.salecook = salecook;
	}

	public int getSalecost() {
		return salecost;
	}

	public void setSalecost(int salecost) {
		this.salecost = salecost;
	}

	public String getSt_begin() {
		return st_begin;
	}

	public void setSt_begin(String st_begin) {
		this.st_begin = st_begin;
	}

	public String getSt_end() {
		return st_end;
	}

	public void setSt_end(String st_end) {
		this.st_end = st_end;
	}

	public String getSt_day() {
		return st_day;
	}

	public void setSt_day(String st_day) {
		this.st_day = st_day;
	}

	public String getClo_begin() {
		return clo_begin;
	}

	public void setClo_begin(String clo_begin) {
		this.clo_begin = clo_begin;
	}

	public String getClo_end() {
		return clo_end;
	}

	public void setClo_end(String clo_end) {
		this.clo_end = clo_end;
	}

	public String getClo_day() {
		return clo_day;
	}

	public void setClo_day(String clo_day) {
		this.clo_day = clo_day;
	}

	public String getBanner_begin() {
		return banner_begin;
	}

	public void setBanner_begin(String banner_begin) {
		this.banner_begin = banner_begin;
	}

	public String getBanner_end() {
		return banner_end;
	}

	public void setBanner_end(String banner_end) {
		this.banner_end = banner_end;
	}

	public String getBanner_day() {
		return banner_day;
	}

	public void setBanner_day(String banner_day) {
		this.banner_day = banner_day;
	}

	public String getQuit_begin() {
		return quit_begin;
	}

	public void setQuit_begin(String quit_begin) {
		this.quit_begin = quit_begin;
	}

	public String getQuit_end() {
		return quit_end;
	}

	public void setQuit_end(String quit_end) {
		this.quit_end = quit_end;
	}

	public String getQuit_day() {
		return quit_day;
	}

	public void setQuit_day(String quit_day) {
		this.quit_day = quit_day;
	}

	public String getDel_begin() {
		return del_begin;
	}

	public void setDel_begin(String del_begin) {
		this.del_begin = del_begin;
	}

	public String getDel_end() {
		return del_end;
	}

	public void setDel_end(String del_end) {
		this.del_end = del_end;
	}

	public String getDel_day() {
		return del_day;
	}

	public void setDel_day(String del_day) {
		this.del_day = del_day;
	}

	public char getDisplay() {
		return display;
	}

	public void setDisplay(char display) {
		this.display = display;
	}

	public int getR() {
		return r;
	}

	public void setR(int r) {
		this.r = r;
	}

	public int getEno() {
		return eno;
	}

	public void setEno(int eno) {
		this.eno = eno;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getStartday() {
		return startday;
	}

	public void setStartday(String startday) {
		this.startday = startday;
	}

	public String getEndday() {
		return endday;
	}

	public void setEndday(String endday) {
		this.endday = endday;
	}

	public char getBanner() {
		return banner;
	}

	public void setBanner(char banner) {
		this.banner = banner;
	}

	public char getQuit() {
		return quit;
	}

	public void setQuit(char quit) {
		this.quit = quit;
	}

	public String getFile1() {
		return file1;
	}

	public void setFile1(String file1) {
		this.file1 = file1;
	}

	public long getSize1() {
		return size1;
	}

	public void setSize1(long size1) {
		this.size1 = size1;
	}

	public String getThumb1() {
		return thumb1;
	}

	public void setThumb1(String thumb1) {
		this.thumb1 = thumb1;
	}

	public String getFile2() {
		return file2;
	}

	public void setFile2(String file2) {
		this.file2 = file2;
	}

	public long getSize2() {
		return size2;
	}

	public void setSize2(long size2) {
		this.size2 = size2;
	}

	public String getThumb2() {
		return thumb2;
	}

	public void setThumb2(String thumb2) {
		this.thumb2 = thumb2;
	}

	public List<MultipartFile> getFile1MF() {
		return file1MF;
	}

	public void setFile1MF(List<MultipartFile> file1mf) {
		file1MF = file1mf;
	}

	public char getStrong() {
		return strong;
	}

	public void setStrong(char strong) {
		this.strong = strong;
	}

	public char getClosed() {
		return closed;
	}

	public void setClosed(char closed) {
		this.closed = closed;
	}

	public char getDeleted() {
		return deleted;
	}

	public void setDeleted(char deleted) {
		this.deleted = deleted;
	}
}
