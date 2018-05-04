package kh.com.a.model;

import java.io.Serializable;
/*
-- 예식장 웨딩홀 --
DROP TABLE WD_WHALL CASCADE CONSTRAINTS;
CREATE TABLE WD_WHALL(
    PDSEQ NUMBER(8) PRIMARY KEY,        -- 예식장별 상품 갯수
    WHSEQ NUMBER(8) NOT NULL,           -- 예식장 업체
    HALLNAME VARCHAR2(100) NOT NULL,      -- 홀 이름
    FLOOR VARCHAR2(10) NOT NULL,         -- 층
    MINCOOK NUMBER(10) NOT NULL,          -- 최소가격(식대)
    MAXCOOK NUMBER(10) NOT NULL,          -- 최대가격(식대)
    FORMAT VARCHAR2(10) NOT NULL,        -- 분리, 동시(식사와 같이 가능 여부)
    FACILITY VARCHAR2(500) NOT NULL,     -- 시설 구분
    MINPEOPLE NUMBER(10) NOT NULL,        -- 최대 인원수
    MAXPEOPLE NUMBER(10) NOT NULL,        -- 최소 인원수
    SETPEOPLE NUMBER(10) NOT NULL,        -- 착석 인원수
    WSTEP VARCHAR2(10) NOT NULL,          -- 웨딩시간 간격
    PAY VARCHAR2(500) NOT NULL,              -- 사용료
    MENUTYPE VARCHAR2(100) NOT NULL,         -- 식사
    DRINK VARCHAR2(10) NOT NULL,             -- 포함, 미포함
    OPENTIME VARCHAR2(500) NOT NULL,		    -- 오픈시간
	CLOSETIME VARCHAR2(500) NOT NULL       -- 마감시간
);

DROP SEQUENCE SEQ_WH_PDSEQ;
CREATE SEQUENCE SEQ_WH_PDSEQ
START WITH 1000 MAXVALUE 1999 INCREMENT BY 1;

ALTER TABLE WD_WHALL
ADD CONSTRAINT FK_WHALL_WHSEQ FOREIGN KEY(WHSEQ)
REFERENCES WD_WEDDING(WHSEQ);
*/

public class WeddingHallDto implements Serializable {
	private int pdseq;
	private int whseq;
	private String hallname;
	private String floor;
	private int mincook;
	private int maxcook;
	private String format;
	private String facility;
	private int minpeople;
	private int maxpeople;
	private int setpeople;
	private String wstep;
	private String pay;
	private String menutype;
	private String drink;
	private String opentime;
	private String closetime;
	
	public WeddingHallDto() {}

	public WeddingHallDto(int pdseq, int whseq, String hallname, String floor, int mincook, int maxcook, String format,
			String facility, int minpeople, int maxpeople, int setpeople, String wstep, String pay, String menutype,
			String drink, String opentime, String closetime) {
		super();
		this.pdseq = pdseq;
		this.whseq = whseq;
		this.hallname = hallname;
		this.floor = floor;
		this.mincook = mincook;
		this.maxcook = maxcook;
		this.format = format;
		this.facility = facility;
		this.minpeople = minpeople;
		this.maxpeople = maxpeople;
		this.setpeople = setpeople;
		this.wstep = wstep;
		this.pay = pay;
		this.menutype = menutype;
		this.drink = drink;
		this.opentime = opentime;
		this.closetime = closetime;
	}

	public int getPdseq() {
		return pdseq;
	}

	public void setPdseq(int pdseq) {
		this.pdseq = pdseq;
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

	public String getFloor() {
		return floor;
	}

	public void setFloor(String floor) {
		this.floor = floor;
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

	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}

	public String getFacility() {
		return facility;
	}

	public void setFacility(String facility) {
		this.facility = facility;
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

	public int getSetpeople() {
		return setpeople;
	}

	public void setSetpeople(int setpeople) {
		this.setpeople = setpeople;
	}

	public String getWstep() {
		return wstep;
	}

	public void setWstep(String wstep) {
		this.wstep = wstep;
	}

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}

	public String getMenutype() {
		return menutype;
	}

	public void setMenutype(String menutype) {
		this.menutype = menutype;
	}

	public String getDrink() {
		return drink;
	}

	public void setDrink(String drink) {
		this.drink = drink;
	}

	public String getOpentime() {
		return opentime;
	}

	public void setOpentime(String opentime) {
		this.opentime = opentime;
	}

	public String getClosetime() {
		return closetime;
	}

	public void setClosetime(String closetime) {
		this.closetime = closetime;
	}

	@Override
	public String toString() {
		return "WeddingHallDto [pdseq=" + pdseq + ", whseq=" + whseq + ", hallname=" + hallname + ", floor=" + floor
				+ ", mincook=" + mincook + ", maxcook=" + maxcook + ", format=" + format + ", facility=" + facility
				+ ", minpeople=" + minpeople + ", maxpeople=" + maxpeople + ", setpeople=" + setpeople + ", wstep="
				+ wstep + ", pay=" + pay + ", menutype=" + menutype + ", drink=" + drink + ", opentime=" + opentime
				+ ", closetime=" + closetime + "]";
	}

	

	
}
