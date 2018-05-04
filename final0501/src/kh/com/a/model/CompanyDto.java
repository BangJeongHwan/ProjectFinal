/*DROP TABLE WD_COMPANY CASCADE CONSTRAINTS;
CREATE TABLE WD_COMPANY(
    CID VARCHAR2(50) PRIMARY KEY,
    PWD VARCHAR2(50) NOT NULL,
    CNAME VARCHAR2(50) NOT NULL,
    EMAIL VARCHAR2(100) UNIQUE,
    PHONE VARCHAR2(50) NOT NULL,
    ADDRESS VARCHAR2(200) NOT NULL,
    LICENSE VARCHAR2(50) UNIQUE,    -- 사업자등록증(123-45-67890 형식)
    AUTH VARCHAR2(50) NOT NULL,      -- 예식장(WH), 청첩장(WI), 스튜디오(ST), 드레스(DS), 메이크업(MU)
    GRADE NUMBER(1) NOT NULL        -- 기업 등급 : 0(막 가입한 상태), 1(관리자 인증을 받은 상태)
);
*/
package kh.com.a.model;

import java.io.Serializable;

public class CompanyDto implements Serializable {
	private String cid;
	private String pwd;
	private String cname;
	private String email;
	private String phone;
	private String address;
	private String license;
	private String auth;
	private int grade;
	
	// 사업자 등록증 나누기 위해
	private int license1;
	private int license2;
	private int license3;
	
	public CompanyDto() {}


	public CompanyDto(String cid, String pwd, String cname, String email, String phone, String address, String license,
			String auth, int grade) {
		super();
		this.cid = cid;
		this.pwd = pwd;
		this.cname = cname;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.license = license;
		this.auth = auth;
		this.grade = grade;
	}

	// 회원가입용
	public CompanyDto(String cid, String pwd, String cname, String email, String phone, String address, String license,
			String auth) {
		super();
		this.cid = cid;
		this.pwd = pwd;
		this.cname = cname;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.license = license;
		this.auth = auth;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
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

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	

	public int getLicense1() {
		return license1;
	}

	public void setLicense1(int license1) {
		this.license1 = license1;
	}

	public int getLicense2() {
		return license2;
	}

	public void setLicense2(int license2) {
		this.license2 = license2;
	}

	public int getLicense3() {
		return license3;
	}

	public void setLicense3(int license3) {
		this.license3 = license3;
	}

	@Override
	public String toString() {
		return "CompanyDto [cid=" + cid + ", pwd=" + pwd + ", cname=" + cname + ", email=" + email + ", phone=" + phone
				+ ", address=" + address + ", license=" + license + ", auth=" + auth + ", grade=" + grade + "]";
	}
}
