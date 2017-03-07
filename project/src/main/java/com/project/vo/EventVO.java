package com.project.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class EventVO {
  private int r;
  private int eno;
  private String bname="EVENT";
  private String title;
  private String content;
  private String writer;
  private String regdate;
  private String startday;
  private String endday;
  private char banner='N';
  private char quit='N';
  private String file1="";
  private long size1=0;
  private String thumb1="no_image.jpg";
  private String file2="";
  private long size2=0;
  private String thumb2="no_banner.jpg";
  private List<MultipartFile> file1MF;
  private char strong='N';
  private char closed='N';
  private char deleted='N';
  private char display='N';
  
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
