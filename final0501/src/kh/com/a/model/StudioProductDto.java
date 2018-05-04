package kh.com.a.model;

import java.io.Serializable;

public class StudioProductDto implements Serializable{
	/*
	-- 스튜디오 상품 --

CREATE TABLE WD_SD_PRODUCT(
SDPDSEQ NUMBER(8) PRIMARY KEY,
SDSEQ NUMBER(8) NOT NULL,
TITLE VARCHAR2(50) NOT NULL,
CONTENT VARCHAR2(500) NOT NULL,
PRICE VARCHAR2(200) NOT NULL,
REDATE DATE ,
RETIME VARCHAR2(100)
);

CREATE SEQUENCE SEQ_SDPDSEQ
START WITH 3000 INCREMENT BY 1;

-- PDSEQ 스튜디오는 3000번대부터 시작!
CREATE SEQUENCE SEQ_SDSEQ
START WITH 1 INCREMENT BY 1;

ALTER TABLE WD_SD_PRODUCT
ADD CONSTRAINT FK_WD_SD_PRODUCT_SDSEQ FOREIGN KEY(SDSEQ)
REFERENCES WD_STUDIO(STSEQ);

*/
	private int sdpdseq; // 전체 상품 번호
	private int sdseq; // 해당 상품 번호
	private String title; // 해당 상품 제목
	private String content; // 해당 상품 내용
	private int price; // 해당 상품 가격
	private String date; // 에약날짜
	private String retime; // 에약시간
	
	public StudioProductDto() {
		
	}
	
	public StudioProductDto(int sdpdseq, int sdseq, String title, String content, int price, String date, String retime) {
		super();
		this.sdpdseq = sdpdseq;
		this.sdseq = sdseq;
		this.title = title;
		this.content = content;
		this.price = price;
		this.date = date;
		this.retime = retime;
	}
	
	public StudioProductDto(String title, String content, int price, String date, String retime) {
		super();
		this.title = title;
		this.content = content;
		this.price = price;
		this.date = date;
		this.retime = retime;
	}
	
	public StudioProductDto(int sdpdseq, int sdseq, String title, String content, int price) {
		super();
		this.sdpdseq = sdpdseq;
		this.sdseq = sdseq;
		this.title = title;
		this.content = content;
		this.price = price;
	}

	public int getSdpdseq() {
		return sdpdseq;
	}
	public void setSdpdseq(int sdpdseq) {
		this.sdpdseq = sdpdseq;
	}
	public int getSdseq() {
		return sdseq;
	}
	public void setSdseq(int sdseq) {
		this.sdseq = sdseq;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getRetime() {
		return retime;
	}
	public void setRetime(String retime) {
		this.retime = retime;
	}
	
	@Override
	public String toString() {
		return "StudioProductDto [pdseq=" + sdpdseq + ", stseq=" + sdseq + ", title=" + title + ", content=" + content
				+ ", price=" + price + ", date=" + date + ", retime=" + retime + "]";
	}
}
