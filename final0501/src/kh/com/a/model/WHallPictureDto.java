package kh.com.a.model;

import java.io.Serializable;
/*
DROP TABLE WD_HALL_PICTURE CASCADE CONSTRAINTS;
CREATE TABLE WD_HALL_PICTURE(
    PICSEQ NUMBER(8) PRIMARY KEY,           -- 사진 글 갯수
    WHSEQ NUMBER(8) NOT NULL,               -- 업체 갯수
    HALLNAME VARCHAR2(100) NOT NULL,          -- 홀 이름
    PICTURE VARCHAR2(100) NOT NULL          -- 사진
);
DROP SEQUENCE SEQ_WHPIC;
CREATE SEQUENCE SEQ_WHPIC
START WITH 1 INCREMENT BY 1;
*/
public class WHallPictureDto implements Serializable {
	private int picseq;
	private int whseq;
	private String hallname;
	private String picture;
	private int pictotal;
	
	public WHallPictureDto() {}	

	public WHallPictureDto(int picseq, int whseq, String hallname, String picture, int pictotal) {
		super();
		this.picseq = picseq;
		this.whseq = whseq;
		this.hallname = hallname;
		this.picture = picture;
		this.pictotal = pictotal;
	}

	public WHallPictureDto(int picseq, int whseq, String hallname, String picture) {
		super();
		this.picseq = picseq;
		this.whseq = whseq;
		this.hallname = hallname;
		this.picture = picture;
	}


	public int getPictotal() {
		return pictotal;
	}

	public void setPictotal(int pictotal) {
		this.pictotal = pictotal;
	}

	public int getPicseq() {
		return picseq;
	}

	public void setPicseq(int picseq) {
		this.picseq = picseq;
	}
	
	public int getWhseq() {
		return whseq;
	}

	public void setWhseq(int whseq) {
		this.whseq = whseq;
	}

	public String getHallname() {
		return hallname;
	}

	public void setHallname(String hallname) {
		this.hallname = hallname;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

}
