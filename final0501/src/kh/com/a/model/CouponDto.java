package kh.com.a.model;

import java.io.Serializable;
/*
DROP TABLE WD_COUPON
CASCADE CONSTRAINTS;

CREATE TABLE WD_COUPON(
    SEQ NUMBER(6) PRIMARY KEY,
    TITLE VARCHAR2(20) NOT NULL,	
    OPENDATE DATE NOT NULL,				-- 기간제 쿠폰에 대한 시행 날
    CLOSEDATE DATE NOT NULL,			-- 기간제 쿠폰에 대한 마감 날
    SHOUR NUMBER(6),					-- 시간제 쿠폰에 대한 시작 시간(시)
    SMIN NUMBER(6),						-- 시간제 쿠폰에 대한 시작 시간(분)
    TIMEREMIT NUMBER(6),				-- 시간제 쿠폰에 대한 시작후 몇분후에 마감할 것인지
    USERREMIT NUMBER(6) NOT NULL,		-- 쿠폰 유효기간 사용자가 받은 날짜부터 적용
    DISCOUNT NUMBER(6) NOT NULL,		-- 할인률
    SORT CHAR(1) NOT NULL,				-- 1 - 공유쿠폰용    2 - 쿠폰도전  3 - 타임쿠폰   4 - 랜덤쿠폰
    DEL CHAR(1) NOT NULL				-- 0 - 등록 X  1 - 삭제
);

DROP SEQUENCE SEQ_WD_COUPON ;

CREATE SEQUENCE SEQ_WD_COUPON START WITH 1 INCREMENT BY 1;


 * 
 * */
public class CouponDto implements Serializable {
	
	private int seq;
	private String title;
	private String opendate;
	private String closedate;
	private int shour;
	private int smin;
	private int timeremit;
	private int userremit;
	private int discount;
	private int sort;
	private int del;
	
	public CouponDto() {}
	
	public CouponDto(int seq, String title, String opendate, String closedate, int shour, int smin, int timeremit,
			int userremit, int discount, int sort, int del) {
		super();
		this.seq = seq;
		this.title = title;
		this.opendate = opendate;
		this.closedate = closedate;
		this.shour = shour;
		this.smin = smin;
		this.timeremit = timeremit;
		this.userremit = userremit;
		this.discount = discount;
		this.sort = sort;
		this.del = del;
	}
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getOpendate() {
		return opendate.substring(0, 10);
	}
	public void setOpendate(String opendate) {
		this.opendate = opendate;
	}
	public String getClosedate() {
		return closedate.substring(0, 10);
	}
	public void setClosedate(String closedate) {
		this.closedate = closedate;
	}
	
	public int getShour() {
		return shour;
	}

	public void setShour(int shour) {
		this.shour = shour;
	}

	public int getSmin() {
		return smin;
	}

	public void setSmin(int smin) {
		this.smin = smin;
	}

	public int getTimeremit() {
		return timeremit;
	}
	public void setTimeremit(int timeremit) {
		this.timeremit = timeremit;
	}
	public int getUserremit() {
		return userremit;
	}
	public void setUserremit(int userremit) {
		this.userremit = userremit;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}

	@Override
	public String toString() {
		return "CouponDto [seq=" + seq + ", title=" + title + ", opendate=" + opendate + ", closedate=" + closedate
				+ ", shour=" + shour + ", smin=" + smin + ", timeremit=" + timeremit + ", userremit=" + userremit
				+ ", discount=" + discount + ", sort=" + sort + ", del=" + del + "]";
	}
	
	
	
}
