package kh.com.a.model;

/*
CREATE TABLE CARD(
WISEQ NUMBER(8) PRIMARY KEY,
CID VARCHAR2(50) NOT NULL,
PICTURE VARCHAR2(50) NOT NULL,
CONTENT VARCHAR2(500) NOT NULL
);

CREATE SEQUENCE SEQ_CARD
START WITH 1 INCREMENT BY 1;

ALTER TABLE CARD
ADD CONSTRAINT FK_CARD_CID FOREIGN KEY(CID)
REFERENCES WD_COMPANY(CID);
 
 */
import java.io.Serializable;

public class CardParam implements Serializable {
	
	private int wiseq;
	private String cid;
	private String cname;
	private String picture;
	private String content;
	
	private String s_category;	// 제목, 내용, 작성자
	private String s_keyword;	// 검색어
		
	// ------------- paging
	private int recordCountPerPage = 8;
	private int pageNumber = 0;
	
	private int start = 1;
	private int end = 10;
	
	public CardParam() {
		// TODO Auto-generated constructor stub
	}
	
	

	public int getWiseq() {
		return wiseq;
	}

	public void setWiseq(int wiseq) {
		this.wiseq = wiseq;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	

	public String getS_category() {
		return s_category;
	}



	public void setS_category(String s_category) {
		this.s_category = s_category;
	}



	public String getS_keyword() {
		return s_keyword;
	}



	public void setS_keyword(String s_keyword) {
		this.s_keyword = s_keyword;
	}



	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}



	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}



	public int getPageNumber() {
		return pageNumber;
	}



	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}



	public int getStart() {
		return start;
	}



	public void setStart(int start) {
		this.start = start;
	}



	public int getEnd() {
		return end;
	}



	public void setEnd(int end) {
		this.end = end;
	}



	@Override
	public String toString() {
		return "CardDto [wiseq=" + wiseq + ", cid=" + cid + ", cname=" + cname + ", picture=" + picture + ", content="
				+ content + ", s_category=" + s_category + ", s_keyword=" + s_keyword + ", recordCountPerPage="
				+ recordCountPerPage + ", pageNumber=" + pageNumber + ", start=" + start + ", end=" + end + "]";
	}



	
	

	
	

	
	

	
}
