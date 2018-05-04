/*
DROP TABLE WD_PAYMENT CASCADE CONSTRAINTS;
CREATE TABLE WD_PAYMENT(
	PAYSEQ NUMBER(8) PRIMARY KEY,
	MID VARCHAR2(50) NOT NULL,
	GRNUM NUMBER(8) NOT NULL,		-- 그룹넘버
	PDSEQ NUMBER(8) NOT NULL,
	OPTION1 VARCHAR2(100),
	OPTION2 VARCHAR2(100),
	OPTION3 VARCHAR2(100),
	OPTION4 VARCHAR2(100),
	OPTION5 VARCHAR2(100),
	RVSEQ NUMBER(8),				-- 예약이 존재하는 경우에만 사용
	TOTAL_PRICE NUMBER(8) NOT NULL,
	BUYDATE DATE NOT NULL,
	CPOSEQ NUMBER(8)				-- 청첩장 상세 옵션
);
ALTER TABLE WD_PAYMENT ADD CONSTRAINT FK_PAYMENT_MID FOREIGN KEY(MID) REFERENCES WD_MEMBER(MID);
ALTER TABLE WD_PAYMENT ADD CONSTRAINT FK_PAYMENT_RVSEQ FOREIGN KEY(RVSEQ) REFERENCES WD_RESERVATION(RVSEQ);
ALTER TABLE WD_PAYMENT ADD CONSTRAINT FK_PAYMENT_CPOSEQ FOREIGN KEY(CPOSEQ) REFERENCES WD_CPO(CPOSEQ);
DROP SEQUENCE SEQ_PAYSEQ;
CREATE SEQUENCE SEQ_PAYSEQ START WITH 1 INCREMENT BY 1;
DROP SEQUENCE SEQ_PAY_GRNUM;
CREATE SEQUENCE SEQ_PAY_GRNUM START WITH 1 INCREMENT BY 1;
 */
package kh.com.a.model2;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import kh.com.a.model.CpoDto;
import kh.com.a.model.MemberDto;
import kh.com.a.model.ReservationDto;

public class PaymentViewParam implements Serializable {
	
	private int payseq;
	private String mid;
	private int grnum;
	private int pdseq;
	private String option1;
	private String option2;
	private String option3;
	private String option4;
	private String option5;
	private int rvseq;
	private int total_price;
	private String buydate;
	private int cposeq;

	Object pdDto;
	ReservationDto reservDto;
//	TODO 0427
	CpoDto cpoDto;
	MemberDto memDto;
	
//	편의상 추가
	private List<String> optionList = new ArrayList<String>();
	
	public PaymentViewParam() {}

	public int getPayseq() {
		return payseq;
	}

	public void setPayseq(int payseq) {
		this.payseq = payseq;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getGrnum() {
		return grnum;
	}

	public void setGrnum(int grnum) {
		this.grnum = grnum;
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

	public String getBuydate() {
		return buydate;
	}

	public void setBuydate(String buydate) {
		this.buydate = buydate;
	}

	public int getCposeq() {
		return cposeq;
	}

	public void setCposeq(int cposeq) {
		this.cposeq = cposeq;
	}

	public Object getPdDto() {
		return pdDto;
	}

	public void setPdDto(Object pdDto) {
		this.pdDto = pdDto;
	}

	public ReservationDto getReservDto() {
		return reservDto;
	}

	public void setReservDto(ReservationDto reservDto) {
		this.reservDto = reservDto;
	}

	public List<String> getOptionList() {
		return optionList;
	}

	public void setOptionList(List<String> optionList) {
		this.optionList = optionList;
	}

	public CpoDto getCpoDto() {
		return cpoDto;
	}

	public void setCpoDto(CpoDto cpoDto) {
		this.cpoDto = cpoDto;
	}

	public MemberDto getMemDto() {
		return memDto;
	}

	public void setMemDto(MemberDto memDto) {
		this.memDto = memDto;
	}

	@Override
	public String toString() {
		return "PaymentViewParam [payseq=" + payseq + ", mid=" + mid + ", grnum=" + grnum + ", pdseq=" + pdseq
				+ ", option1=" + option1 + ", option2=" + option2 + ", option3=" + option3 + ", option4=" + option4
				+ ", option5=" + option5 + ", rvseq=" + rvseq + ", total_price=" + total_price + ", buydate=" + buydate
				+ ", cposeq=" + cposeq + ", pdDto=" + pdDto + ", reservDto=" + reservDto + ", cpoDto=" + cpoDto
				+ ", memDto=" + memDto + ", optionList=" + optionList + "]";
	}

}
