package kh.com.a.model;

import java.io.Serializable;

public class CookieDto implements Serializable {
	
	static private int b = 1;
	static private int check = 1;
	static private String Crp1;
	static private String Crp2;
	static private String Crp3;
	static private String Crp4;
	static private String Crp5;
	static private String Crp6;
	
	public CookieDto() {
		
	}

	public CookieDto(int b, int check, String crp1, String crp2, String crp3, String crp4, String crp5, String crp6) {
		super();
		this.b = b;
		this.check = check;
		Crp1 = crp1;
		Crp2 = crp2;
		Crp3 = crp3;
		Crp4 = crp4;
		Crp5 = crp5;
		Crp6 = crp6;
	}



	public String getCrp1() {
		return Crp1;
	}



	public void setCrp1(String crp1) {
		Crp1 = crp1;
	}



	public String getCrp2() {
		return Crp2;
	}



	public void setCrp2(String crp2) {
		Crp2 = crp2;
	}



	public String getCrp3() {
		return Crp3;
	}



	public void setCrp3(String crp3) {
		Crp3 = crp3;
	}



	public String getCrp4() {
		return Crp4;
	}



	public void setCrp4(String crp4) {
		Crp4 = crp4;
	}



	public String getCrp5() {
		return Crp5;
	}



	public void setCrp5(String crp5) {
		Crp5 = crp5;
	}



	public String getCrp6() {
		return Crp6;
	}



	public void setCrp6(String crp6) {
		Crp6 = crp6;
	}



	public int getB() {
		return b;
	}

	public void setB(int b) {
		this.b = b;
	}

	public int getCheck() {
		return check;
	}

	public void setCheck(int check) {
		this.check = check;
	}

	@Override
	public String toString() {
		return "cookieDto [b=" + b + ", check=" + check + "]";
	}
}
