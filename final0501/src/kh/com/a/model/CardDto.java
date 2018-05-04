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

public class CardDto implements Serializable {
	
	private int wiseq;
	private String cid;
	private String cname;
	private String picture;
	private String content;
	
	public CardDto() {
		// TODO Auto-generated constructor stub
	}
	
	
	public CardDto(int wiseq, String cid, String cname, String picture, String content) {
		super();
		this.wiseq = wiseq;
		this.cid = cid;
		this.cname = cname;
		this.picture = picture;
		this.content = content;
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


	@Override
	public String toString() {
		return "CardDto [wiseq=" + wiseq + ", cid=" + cid + ", cname=" + cname + ", picture=" + picture + ", content="
				+ content + "]";
	}

	
	

	
}
