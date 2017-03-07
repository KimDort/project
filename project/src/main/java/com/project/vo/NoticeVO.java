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
  private char strong='N';
  private char closed='N';
  private char deleted='N';
  private MultipartFile file1MF;
  private String thumb = "";
  private String file1="";
  private long size1=0;
  private char display;
 
  
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
