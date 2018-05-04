package kh.com.a.model2;

import java.io.Serializable;

public class LoginDto implements Serializable {
	
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String phone;
	private String address;
	private String auth;
	
	public LoginDto() {}

	public LoginDto(String id, String auth) {
		super();
		this.id = id;
		this.auth = auth;
	}

	public LoginDto(String id, String name, String email, String phone, String address, String auth) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.auth = auth;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
	
	
	

}
