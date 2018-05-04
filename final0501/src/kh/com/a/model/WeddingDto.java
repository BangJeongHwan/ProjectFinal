package kh.com.a.model;

import java.io.Serializable;
/*
DROP TABLE WD_WEDDING CASCADE CONSTRAINTS;

CREATE TABLE WD_WEDDING(
    WHSEQ NUMBER(8) PRIMARY KEY,        -- 예식장 그룹 갯수, 글 번호
    CID VARCHAR2(50) UNIQUE,            -- 회사 id
    CNAME VARCHAR2(50) NOT NULL,		-- 회사명
    HTYPE VARCHAR2(10) NOT NULL,        -- 홀 타입
    MINCOOK NUMBER(10) NOT NULL,          -- 최소가격(식대)
    MAXCOOK NUMBER(10) NOT NULL,          -- 최대가격(식대)
    MENUTYPE VARCHAR2(100) NOT NULL,     -- 메뉴 종류
    MINPEOPLE NUMBER(10) NOT NULL,      -- 최소보증인원
    MAXPEOPLE NUMBER(10) NOT NULL,      -- 최대수용인원
    CONTENT VARCHAR2(4000) NOT NULL,     -- 내용
    ADDRESS VARCHAR2(100) NOT NULL,     -- 주소()
    LATITUDE VARCHAR2(100) NOT NULL,    -- 위도
    LONGITUDE VARCHAR2(100) NOT NULL,   -- 경도
    PICTURE VARCHAR2(100) NOT NULL,    -- 사진
    TRANSPO VARCHAR2(4000),    -- 교통정보
    PARKING VARCHAR2(4000),     -- 주차 정보
    READCOUNT NUMBER(10) NOT NULL,  -- 읽은 수
    COMMENTCOUNT NUMBER(10) NOT NULL    -- 답글 수
);

DROP SEQUENCE SEQ_WEDDING;
CREATE SEQUENCE SEQ_WEDDING
START WITH 1 INCREMENT BY 1;


ALTER TABLE WD_WEDDING
ADD CONSTRAINT FK_WEDDING_CID FOREIGN KEY(CID)
REFERENCES WD_COMPANY(CID);
*/
public class WeddingDto implements Serializable {
	private int whseq;
	private String cid;
	private String cname;
	private String htype;
	private int mincook;
	private int maxcook;
	private String menutype;
	private int minpeople;
	private int maxpeople;
	private String content;
	private String address;
	private String latitude;
	private String longitude;
	private String picture;
	private String transpo;
	private String parking;
	private int readcount;
	private int commentcount;
	
	public WeddingDto() {}
	
	public WeddingDto(int whseq, String cid, String cname, String htype, int mincook, int maxcook, String menutype,
			int minpeople, int maxpeople, String content, String address, String latitude, String longitude,
			String picture, String transpo, String parking, int readcount, int commentcount) {
		super();
		this.whseq = whseq;
		this.cid = cid;
		this.cname = cname;
		this.htype = htype;
		this.mincook = mincook;
		this.maxcook = maxcook;
		this.menutype = menutype;
		this.minpeople = minpeople;
		this.maxpeople = maxpeople;
		this.content = content;
		this.address = address;
		this.latitude = latitude;
		this.longitude = longitude;
		this.picture = picture;
		this.transpo = transpo;
		this.parking = parking;
		this.readcount = readcount;
		this.commentcount=commentcount;
	}

	

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getCommentcount() {
		return commentcount;
	}

	public void setCommentcount(int commentcount) {
		this.commentcount = commentcount;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public int getWhseq() {
		return whseq;
	}

	public void setWhseq(int whseq) {
		this.whseq = whseq;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getHtype() {
		return htype;
	}

	public void setHtype(String htype) {
		this.htype = htype;
	}

	public int getMincook() {
		return mincook;
	}

	public void setMincook(int mincook) {
		this.mincook = mincook;
	}

	public int getMaxcook() {
		return maxcook;
	}

	public void setMaxcook(int maxcook) {
		this.maxcook = maxcook;
	}

	public String getMenutype() {
		return menutype;
	}

	public void setMenutype(String menutype) {
		this.menutype = menutype;
	}

	public int getMinpeople() {
		return minpeople;
	}

	public void setMinpeople(int minpeople) {
		this.minpeople = minpeople;
	}

	public int getMaxpeople() {
		return maxpeople;
	}

	public void setMaxpeople(int maxpeople) {
		this.maxpeople = maxpeople;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getTranspo() {
		return transpo;
	}

	public void setTranspo(String transpo) {
		this.transpo = transpo;
	}

	public String getParking() {
		return parking;
	}

	public void setParking(String parking) {
		this.parking = parking;
	}

	@Override
	public String toString() {
		return "WeddingDto [whseq=" + whseq + ", cid=" + cid + ", cname=" + cname + ", htype=" + htype + ", mincook="
				+ mincook + ", maxcook=" + maxcook + ", menutype=" + menutype + ", minpeople=" + minpeople
				+ ", maxpeople=" + maxpeople + ", content=" + content + ", address=" + address + ", latitude="
				+ latitude + ", longitude=" + longitude + ", picture=" + picture + ", transpo=" + transpo + ", parking="
				+ parking + ", readcount=" + readcount + ", commentcount=" + commentcount + "]";
	}
	
	
}
