package com.spring.mybatis02.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Entity
public class MybatisMember {
	
	@Id
	@Size(min=3, max=20, message = "아이디는 3~20자리로 입력해야 합니다.")
    private String id;
	
	@Size(min=4, max=20, message = "비밀번호는 4~20자리로 입력해야 합니다.")
    private String pwd;
	
	@Size(min=2, max=50, message = "이름은 최소 2자리부터 입력해야 합니다.")
    private String name;

	@Size(min=12, max=13, message = "전화번호는 12 ~ 13 입력해야 합니다.")
    private String tel;
	
	@Pattern(regexp = "^[a-zA-Z0-9+-\\_.]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$" , message = "올바른 이메일 형식이 아닙니다.")
    private String email;
    
    //getter, setter
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
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
    
    
}