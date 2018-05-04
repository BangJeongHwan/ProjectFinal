package kh.com.a.model2;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import kh.com.a.model.ReservationDto;

public class BasketParam implements Serializable {
	
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

	Object pdDto;
	ReservationDto reservDto;
	
//	편의상 추가
	private List<String> optionList = new ArrayList<String>();
	
	public BasketParam() {}

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

	public Object getPdDto() {
		return pdDto;
	}

	public void setPdDto(Object pdDto) {
		this.pdDto = pdDto;
	}

	@Override
	public String toString() {
		return "BasketParam [bkseq=" + bkseq + ", mid=" + mid + ", pdseq=" + pdseq + ", option1=" + option1
				+ ", option2=" + option2 + ", option3=" + option3 + ", option4=" + option4 + ", option5=" + option5
				+ ", rvseq=" + rvseq + ", total_price=" + total_price + ", pdDto=" + pdDto + ", reservDto=" + reservDto
				+ ", optionList=" + optionList + "]";
	}

}
