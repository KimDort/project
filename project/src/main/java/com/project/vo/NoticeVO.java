package com.project.vo;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {
	private int r;
	private int nno;
	private String bname;
	private String title;
	private String content;
	private String writer;
	private String nick;
	private String regdate;
	private String startday;
	private String endday;
	private int readcount;
	private char strong = 'N';
	private String st_begin;
	private String st_end;
	private String st_day;
	private char closed = 'N';
	private String clo_begin;
	private String clo_end;
	private String clo_day;
	private char deleted = 'N';
	private String del_begin;
	private String del_end;
	private String del_day;
	private MultipartFile file1MF;
	private String thumb = "";
	private String file1 = "";
	private long size1 = 0;
	private char display;
	
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

	public String getThumb() {
		return thumb;
	}

	public void setThumb(String thumb) {
		this.thumb = thumb;
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

	public MultipartFile getFile1MF() {
		return file1MF;
	}

	public void setFile1MF(MultipartFile file1mf) {
		file1MF = file1mf;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public int getNno() {
		return nno;
	}

	public void setNno(int nno) {
		this.nno = nno;
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

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
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
