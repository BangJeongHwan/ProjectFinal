package kh.com.a.model2;
/*
DROP TABLE WD_USECOUPON
CASCADE CONSTRAINTS;

CREATE TABLE WD_USECOUPON(
  CP_SEQ NUMBER(6),
  MID VARCHAR2(50),
  REMIT DATE NOT NULL,
  DEL CHAR(1) NOT NULL, -- 사용시 삭제
  CONSTRAINT pk_wd_cp PRIMARY KEY(CP_SEQ, MID)
);

ALTER TABLE WD_USECOUPON ADD CONSTRAINT FK_COU_ID FOREIGN KEY(MID) REFERENCES WD_MEMBER(MID);
ALTER TABLE WD_USECOUPON ADD CONSTRAINT FK_COU_SEQ FOREIGN KEY(CP_SEQ) REFERENCES WD_COUPON(SEQ);
 * */
public class couponVO {
	
	private int cp_seq;
	private String mid;
	private String remit;
	private int del;
	
	public couponVO() {}
	
	public couponVO(int cp_seq, String mid, String remit, int del) {
		super();
		this.cp_seq = cp_seq;
		this.mid = mid;
		this.remit = remit;
		this.del = del;
	}
	public int getCp_seq() {
		return cp_seq;
	}
	public void setCp_seq(int cp_seq) {
		this.cp_seq = cp_seq;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getRemit() {
		return remit;
	}
	public void setRemit(String remit) {
		this.remit = remit;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	@Override
	public String toString() {
		return "couponVO [cp_seq=" + cp_seq + ", mid=" + mid + ", remit=" + remit + ", del=" + del + "]";
	}
	
	
}
