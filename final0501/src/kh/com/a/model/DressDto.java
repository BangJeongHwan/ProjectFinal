package kh.com.a.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/*
 CREATE TABLE DRESS(
DSSEQ NUMBER(8) PRIMARY KEY,
CID VARCHAR2(50) NOT NULL,
DNAME VARCHAR2(50) NOT NULL,
PICTURE0 VARCHAR2(50),
PICTURE1 VARCHAR2(50),
PICTURE2 VARCHAR2(50),
PICTURE3 VARCHAR2(50),
PICTURE4 VARCHAR2(50),
PICTURE5 VARCHAR2(50),
PICTURE6 VARCHAR2(50),
PICTURE7 VARCHAR2(50),
PICTURE8 VARCHAR2(50),
PICTURE9 VARCHAR2(50),
CONTENT VARCHAR2(200) NOT NULL,
OPENTIME VARCHAR2(100) NOT NULL,
ADDRE VARCHAR2(50) NOT NULL,
REDATE DATE,
RETIME VARCHAR2(50)
);

CREATE SEQUENCE DSSEQ_DRESS
START WITH 4000 MAXVALUE 4999 INCREMENT BY 1;

ALTER TABLE DRESS
ADD CONSTRAINT FK_DRESS_CID FOREIGN KEY(CID)
REFERENCES WD_COMPANY(CID);

 */

public class DressDto implements Serializable {

	private int dsseq;
	private String cid;
	private String dname;
	private List<String> pic = new ArrayList<>();
	private String picture0;
	private String picture1;
	private String picture2;
	private String picture3;
	private String picture4;
	private String picture5;
	private String picture6;
	private String picture7;
	private String picture8;
	private String picture9;
	private String content;
	private String opentime;
	private String addre;
	private String redate;
	private String retime;
	
	public DressDto() {
		for(int i = 0; i < 10; i++) {
			pic.add("");
		}
	}

	public DressDto(String cid, String dname, String content, String opentime, String addre) {
		super();
		this.cid = cid;
		this.dname = dname;
		this.content = content;
		this.opentime = opentime;
		this.addre = addre;
	}



	public DressDto(int dsseq, String dname, String cid, String picture0, String content) {
		super();
		this.dsseq = dsseq;
		this.cid = cid;
		this.dname = dname;
		this.picture0 = picture0;
		this.content = content;
	}

	public DressDto(int dsseq, String cid, String dname, String picture0, String picture1, String picture2, String picture3,
			String picture4, String picture5, String picture6, String picture7, String picture8, String picture9,
			String content, String opentime, String addre) {
		super();
		this.dsseq = dsseq;
		this.cid = cid;
		this.dname = dname;
		this.picture0 = picture0;
		this.picture1 = picture1;
		this.picture2 = picture2;
		this.picture3 = picture3;
		this.picture4 = picture4;
		this.picture5 = picture5;
		this.picture6 = picture6;
		this.picture7 = picture7;
		this.picture8 = picture8;
		this.picture9 = picture9;
		this.content = content;
		this.opentime = opentime;
		this.addre = addre;
	}

	
	
	public List<String> getPic() {
		return pic;
	}


	public void setPic(List<String> pic) {
		this.pic = pic;
	}


	public DressDto(int dsseq, String cid, String dname, String picture0, String picture1, String picture2, String picture3,
			String picture4, String picture5, String picture6, String picture7, String picture8, String picture9,
			String content, String opentime, String addre, String redate, String retime) {
		super();
		this.dsseq = dsseq;
		this.cid = cid;
		this.dname = dname;
		this.picture0 = picture0;
		this.picture1 = picture1;
		this.picture2 = picture2;
		this.picture3 = picture3;
		this.picture4 = picture4;
		this.picture5 = picture5;
		this.picture6 = picture6;
		this.picture7 = picture7;
		this.picture8 = picture8;
		this.picture9 = picture9;
		this.content = content;
		this.opentime = opentime;
		this.addre = addre;
		this.redate = redate;
		this.retime = retime;
	}

	public int getDsseq() {
		return dsseq;
	}

	public void setDsseq(int dsseq) {
		this.dsseq = dsseq;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}
	

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getPicture0() {
		return picture0;
	}

	public void setPicture0(String picture0) {
		this.picture0 = picture0;
	}

	public String getPicture1() {
		return picture1;
	}

	public void setPicture1(String picture1) {
		this.picture1 = picture1;
	}

	public String getPicture2() {
		return picture2;
	}

	public void setPicture2(String picture2) {
		this.picture2 = picture2;
	}

	public String getPicture3() {
		return picture3;
	}

	public void setPicture3(String picture3) {
		this.picture3 = picture3;
	}

	public String getPicture4() {
		return picture4;
	}

	public void setPicture4(String picture4) {
		this.picture4 = picture4;
	}

	public String getPicture5() {
		return picture5;
	}

	public void setPicture5(String picture5) {
		this.picture5 = picture5;
	}

	public String getPicture6() {
		return picture6;
	}

	public void setPicture6(String picture6) {
		this.picture6 = picture6;
	}

	public String getPicture7() {
		return picture7;
	}

	public void setPicture7(String picture7) {
		this.picture7 = picture7;
	}

	public String getPicture8() {
		return picture8;
	}

	public void setPicture8(String picture8) {
		this.picture8 = picture8;
	}

	public String getPicture9() {
		return picture9;
	}

	public void setPicture9(String picture9) {
		this.picture9 = picture9;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getOpentime() {
		return opentime;
	}

	public void setOpentime(String opentime) {
		this.opentime = opentime;
	}

	public String getAddre() {
		return addre;
	}

	public void setAddre(String addre) {
		this.addre = addre;
	}

	public String getRedate() {
		return redate;
	}

	public void setRedate(String redate) {
		this.redate = redate;
	}

	public String getRetime() {
		return retime;
	}

	public void setRetime(String retime) {
		this.retime = retime;
	}

	@Override
	public String toString() {
		return "DressDto [dsseq=" + dsseq + ", cid=" + cid + ", dname=" + dname + ", pic=" + pic + ", picture0="
				+ picture0 + ", picture1=" + picture1 + ", picture2=" + picture2 + ", picture3=" + picture3
				+ ", picture4=" + picture4 + ", picture5=" + picture5 + ", picture6=" + picture6 + ", picture7="
				+ picture7 + ", picture8=" + picture8 + ", picture9=" + picture9 + ", content=" + content
				+ ", opentime=" + opentime + ", addre=" + addre + ", redate=" + redate + ", retime=" + retime + "]";
	}

	
	
}
