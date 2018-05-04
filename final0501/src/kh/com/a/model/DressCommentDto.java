package kh.com.a.model;

import java.io.Serializable;

/*
 CREATE TABLE DRESSCOMMENT(
    DCSEQ NUMBER(8) PRIMARY KEY,
    ID VARCHAR2(50) NOT NULL,
    PARENTNUM NUMBER(10) NOT NULL,
    CONTENT VARCHAR2(200) NOT NULL,
    WDATE DATE NOT NULL
);

CREATE SEQUENCE DCSEQ_DRESSCOMMENT
START WITH 1 INCREMENT BY 1;

ALTER TABLE DRESSCOMMENT
ADD CONSTRAINT FK_DRESS_PARENTNUM FOREIGN KEY(PARENTNUM)
REFERENCES DRESS(DSSEQ);
 */

public class DressCommentDto implements Serializable {

	private int dcseq;
	private String id;
	private int parentnum;
	private String content;
	private String date;
	
	public DressCommentDto() {
		// TODO Auto-generated constructor stub
	}

	public DressCommentDto(int dcseq, String id, int parentnum, String content, String date) {
		super();
		this.dcseq = dcseq;
		this.id = id;
		this.parentnum = parentnum;
		this.content = content;
		this.date = date;
	}

	public int getDcseq() {
		return dcseq;
	}

	public void setDcseq(int dcseq) {
		this.dcseq = dcseq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getParentnum() {
		return parentnum;
	}

	public void setParentnum(int parentnum) {
		this.parentnum = parentnum;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "DressCommentDto [dcseq=" + dcseq + ", id=" + id + ", parentnum=" + parentnum + ", content=" + content
				+ ", date=" + date + "]";
	}
	
	
}
