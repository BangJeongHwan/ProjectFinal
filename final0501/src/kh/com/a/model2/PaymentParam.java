package kh.com.a.model2;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import kh.com.a.model.CpoDto;
import kh.com.a.model.PaymentDto;

public class PaymentParam implements Serializable {
	
	private List<Integer> selectedIndex = new ArrayList<Integer>();
	private List<PaymentDto> payList = new ArrayList<PaymentDto>();
	private List<CpoDto> cpoList = new ArrayList<CpoDto>();
	private int totalPrice;
	
	public PaymentParam() {}

	public List<Integer> getSelectedIndex() {
		return selectedIndex;
	}

	public void setSelectedIndex(List<Integer> selectedIndex) {
		this.selectedIndex = selectedIndex;
	}

	public List<PaymentDto> getPayList() {
		return payList;
	}

	public void setPayList(List<PaymentDto> payList) {
		this.payList = payList;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public List<CpoDto> getCpoList() {
		return cpoList;
	}

	public void setCpoList(List<CpoDto> cpoList) {
		this.cpoList = cpoList;
	}

	@Override
	public String toString() {
		return "PaymentParam [selectedIndex=" + selectedIndex + ", payList=" + payList + ", cpoList=" + cpoList
				+ ", totalPrice=" + totalPrice + "]";
	}


}








