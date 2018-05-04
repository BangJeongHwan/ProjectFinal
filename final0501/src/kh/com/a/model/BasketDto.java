/*
DROP TABLE WD_BASCKET CASCADE CONSTRAINTS;
CREATE TABLE WD_BASCKET(
   BKSEQ NUMBER(8) PRIMARY KEY,
   MID VARCHAR2(50) NOT NULL,
   PDSEQ NUMBER(8) NOT NULL,	-- 청첩장 1000, 
   OPTION1 VARCHAR2(100),
   OPTION2 VARCHAR2(100),
   OPTION3 VARCHAR2(100),
   OPTION4 VARCHAR2(100),
   OPTION5 VARCHAR2(100),
   RVSEQ NUMBER(8),				-- 예약이 존재하는 경우에만 사용
   TOTAL_PRICE NUMBER(8) NOT NULL
);
ALTER TABLE WD_BASCKET ADD CONSTRAINT FK_BASCKET_MID FOREIGN KEY(MID) REFERENCES WD_MEMBER(MID);
ALTER TABLE WD_BASCKET ADD CONSTRAINT FK_BASCKET_RVSEQ FOREIGN KEY(RVSEQ) REFERENCES WD_RESERVATION(RVSEQ);
DROP SEQUENCE SEQ_BKSEQ;
CREATE SEQUENCE SEQ_BKSEQ START WITH 1 INCREMENT BY 1;
 */
package kh.com.a.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class BasketDto implements Serializable {
	
	private int bkseq;
	private String mid;
	private int pdseq;
	private String option1;
	private String option2;
	private String option3;
	private String option4;
	private String option5;
	private int rvseq;
	private int total_price;
	
//	 편의상 추가
	private List<String> optionList = new ArrayList<String>();
	
	public BasketDto() {}

	public BasketDto(int bkseq, String mid, int pdseq, String option1, String option2, String option3, String option4,
			String option5, int rvseq, int total_price, List<String> optionList) {
		super();
		this.bkseq = bkseq;
		this.mid = mid;
		this.pdseq = pdseq;
		this.option1 = option1;
		this.option2 = option2;
		this.option3 = option3;
		this.option4 = option4;
		this.option5 = option5;
		this.rvseq = rvseq;
		this.total_price = total_price;
		this.optionList = optionList;
	}

	public int getBkseq() {
		return bkseq;
	}

	public void setBkseq(int bkseq) {
		this.bkseq = bkseq;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getPdseq() {
		return pdseq;
	}

	public void setPdseq(int pdseq) {
		this.pdseq = pdseq;
	}

	public String getOption1() {
		return option1;
	}

	public void setOption1(String option1) {
		this.option1 = option1;
	}

	public String getOption2() {
		return option2;
	}

	public void setOption2(String option2) {
		this.option2 = option2;
	}

	public String getOption3() {
		return option3;
	}

	public void setOption3(String option3) {
		this.option3 = option3;
	}

	public String getOption4() {
		return option4;
	}

	public void setOption4(String option4) {
		this.option4 = option4;
	}

	public String getOption5() {
		return option5;
	}

	public void setOption5(String option5) {
		this.option5 = option5;
	}

	public int getRvseq() {
		return rvseq;
	}

	public void setRvseq(int rvseq) {
		this.rvseq = rvseq;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public List<String> getOptionList() {
		return optionList;
	}

	public void setOptionList(List<String> optionList) {
		this.optionList = optionList;
	}

	@Override
	public String toString() {
		return "BasketDto [bkseq=" + bkseq + ", mid=" + mid + ", pdseq=" + pdseq + ", option1=" + option1 + ", option2="
				+ option2 + ", option3=" + option3 + ", option4=" + option4 + ", option5=" + option5 + ", rvseq="
				+ rvseq + ", total_price=" + total_price + ", optionList=" + optionList + "]";
	}

}









