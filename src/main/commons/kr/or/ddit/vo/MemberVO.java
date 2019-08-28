package kr.or.ddit.vo;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Component;

// Bean
//	* private 전역변수
//	* 전역변수의 setter/getter
// 	VO(Value Object) : 변경 가능
// DTO(Data Transfer Object) : 변경 불가
// <bean name="memberVO" class="kr.or.ddit.vo.MemberVO"/>
public class MemberVO {
	public MemberVO() {
		System.out.println("MemberVO 생성자");
	}
	
//	 SELECT 'private String ' || LOWER(COLUMN_NAME) || ';'
//	 FROM USER_TAB_COLUMNS
//	 WHERE TABLE_NAME='FREEBOARD';
	private String mem_id;
	private String mem_pass;
	private String mem_name;
	private String mem_birth;
	private String mem_addr;
	private String mem_hp;
	private String mem_mail;
	private String mem_delete;
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pass() {
		return mem_pass;
	}
	public void setMem_pass(String mem_pass) {
		this.mem_pass = mem_pass;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_birth() {
		return mem_birth;
	}
	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}
	public String getMem_addr() {
		return mem_addr;
	}
	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}
	public String getMem_hp() {
		return mem_hp;
	}
	public void setMem_hp(String mem_hp) {
		this.mem_hp = mem_hp;
	}
	public String getMem_mail() {
		return mem_mail;
	}
	public void setMem_mail(String mem_mail) {
		this.mem_mail = mem_mail;
	}
	public String getMem_delete() {
		return mem_delete;
	}
	public void setMem_delete(String mem_delete) {
		this.mem_delete = mem_delete;
	}

	
}
