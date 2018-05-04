/*
DROP TABLE WD_MEMBER CASCADE CONSTRAINTS;
CREATE TABLE WD_MEMBER(
    MID VARCHAR2(50) PRIMARY KEY,
    PWD VARCHAR2(50) NOT NULL,
    MNAME VARCHAR2(50) NOT NULL,
    SEX CHAR(1) NOT NULL,
    EMAIL VARCHAR2(100) UNIQUE,
    PHONE VARCHAR2(50) NOT NULL,
    ADDRESS VARCHAR2(200) NOT NULL,
    AUTH VARCHAR2(50) NOT NULL      -- 일반회원(member), 관리자(admin)
);
-- admin sample data
INSERT INTO WD_MEMBER(MID, PWD, MNAME, SEX, EMAIL, PHONE, ADDRESS, AUTH)
		VALUES ('admin', 'admin', '관리자', 'f', 'admin@naver.com', '010-9875-7895', '서울 강남구 역삼동 838 kh 2층', 'admin');
 */

package kh.com.a.model;

import java.io.Serializable;

public class MemberDto implements Serializable {
	
	private String mid;
	private String pwd;
	private String mname;
	private char sex;
	private String email;
	private String phone;
	private String address;
	private String auth;
	
	public MemberDto() {}
	
//	mem = new MemberDto("guest",0);

	public MemberDto(String mid, String auth) {
		this.mid = mid;
		this.auth = auth;
	}
	
	public MemberDto(String mid, String pwd, String mname, char sex, String email, String phone, String address,
			String auth) {
		super();
		this.mid = mid;
		this.pwd = pwd;
		this.mname = mname;
		this.sex = sex;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.auth = auth;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public char getSex() {
		return sex;
	}

	public void setSex(char sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "MemberDto [mid=" + mid + ", pwd=" + pwd + ", mname=" + mname + ", sex=" + sex + ", email=" + email
				+ ", phone=" + phone + ", address=" + address + ", auth=" + auth + "]";
	}

}
