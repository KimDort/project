package com.project.vo;

import org.springframework.web.multipart.MultipartFile;

public class ThingVO {
	private int r;
	private int tno;
	private int ctgroup;
	private int category;
	private String name;
	private String company;
	private String country;
	private int stock;
	private int buycost;
	private int sellcost;
	private String file1="";
	private long size1=0;
	private String thumb="";
	private char strong;
	private char deleted;
	private char closed;
	private char sale;
	
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	private MultipartFile file1MF;
	
	public char getSale() {
		return sale;
	}
	public void setSale(char sale) {
		this.sale = sale;
	}
	public int getCtgroup() {
		return ctgroup;
	}
	public void setCtgroup(int ctgroup) {
		this.ctgroup = ctgroup;
	}
	public int getR() {
		return r;
	}
	public void setR(int r) {
		this.r = r;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getBuycost() {
		return buycost;
	}
	public void setBuycost(int buycost) {
		this.buycost = buycost;
	}
	public int getSellcost() {
		return sellcost;
	}
	public void setSellcost(int sellcost) {
		this.sellcost = sellcost;
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
	public String getThumb() {
		return thumb;
	}
	public void setThumb(String thumb) {
		this.thumb = thumb;
	}
	public char getStrong() {
		return strong;
	}
	public void setStrong(char strong) {
		this.strong = strong;
	}
	public char getDeleted() {
		return deleted;
	}
	public void setDeleted(char deleted) {
		this.deleted = deleted;
	}
	public char getClosed() {
		return closed;
	}
	public void setClosed(char closed) {
		this.closed = closed;
	}
	public MultipartFile getFile1MF() {
		return file1MF;
	}
	public void setFile1MF(MultipartFile file1mf) {
		file1MF = file1mf;
	}
	
	
}