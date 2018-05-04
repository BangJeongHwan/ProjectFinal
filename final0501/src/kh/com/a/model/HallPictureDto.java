package kh.com.a.model;

import java.io.Serializable;
/*
DROP TABLE WD_HALL_PICTURE CASCADE CONSTRAINTS;
CREATE TABLE WD_HALL_PICTURE(
    WHSEQ NUMBER(8) NOT NULL,               -- 업체 갯수
    HALLNAME VARCHAR2(50) NOT NULL,          -- 홀 이름
    PICTURE VARCHAR2(50) NOT NULL,          -- 사진
    CONSTRAINT PK_HALLPICTURE_01 PRIMARY KEY(WHSEQ, HALLNAME)
);

ALTER TABLE WD_HALL_PICTURE
ADD CONSTRAINT FK_HALLPICTURE_WHSEQ FOREIGN KEY(WHSEQ)
REFERENCES WD_WEDDING(WHSEQ);
*/
public class HallPictureDto implements Serializable {
	private int whseq;
	private String hallname;
	private String picture;
	
	public HallPictureDto() {}

	public HallPictureDto(int whseq, String hallname, String picture) {
		super();
		this.whseq = whseq;
		this.hallname = hallname;
		this.picture = picture;
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

	@Override
	public String toString() {
		return "HallPictureDto [whseq=" + whseq + ", hallname=" + hallname + ", picture=" + picture + "]";
	}
}
