package kh.com.a.model2;
/*
DROP TABLE WD_USECOUPON
CASCADE CONSTRAINTS;

CREATE TABLE WD_USECOUPON(
  SEQ NUMBER(6) PRIMARY KEY,
  CP_SEQ NUMBER(6) NOT NULL,
  MID VARCHAR2(50) NOT NULL,
  REMIT DATE NOT NULL,
  DEL CHAR(1) NOT NULL, -- 사용시 삭제
  BKSEQ NUMBER(6)
);

DROP SEQUENCE SEQ_WD_UC;

CREATE SEQUENCE SEQ_WD_UC
START WITH 1 INCREMENT BY 1;


ALTER TABLE WD_USECOUPON ADD CONSTRAINT FK_COU_ID FOREIGN KEY(MID) REFERENCES WD_MEMBER(MID);
ALTER TABLE WD_USECOUPON ADD CONSTRAINT FK_COU_SEQ FOREIGN KEY(CP_SEQ) REFERENCES WD_COUPON(SEQ);
ALTER TABLE WD_USECOUPON ADD CONSTRAINT FK_COU_BKSEQ FOREIGN KEY(BKSEQ) REFERENCES WD_BASKET(BKSEQ);
 * */
public class couponVO {
	
	private int seq;
	private int cp_seq;
	private String mid;
	private String remit;
	private int del;
	private String title;
	private int discount;
	private int bkseq;
	
	public couponVO() {}

	public couponVO(int seq, int cp_seq, String mid, String remit, int del, String title, int discount, int bkseq) {
		super();
		this.seq = seq;
		this.cp_seq = cp_seq;
		this.mid = mid;
		this.remit = remit;
		this.del = del;
		this.title = title;
		this.discount = discount;
		this.bkseq = bkseq;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public int getBkseq() {
		return bkseq;
	}

	public void setBkseq(int bkseq) {
		this.bkseq = bkseq;
	}

	@Override
	public String toString() {
		return "couponVO [seq=" + seq + ", cp_seq=" + cp_seq + ", mid=" + mid + ", remit=" + remit + ", del=" + del
				+ ", title=" + title + ", discount=" + discount + ", bkseq=" + bkseq + "]";
	}

	
	
}
