package kr.or.ddit.vo;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Component;

public class BoardVO {
	private String bo_id;
	private String bo_seq;
	private String bo_depth;
	private String bo_group;
	private String bo_title;
	private String bo_content;
	private String bo_hit;
	private String mem_id;
	private String bo_delete;
	private String rnum;
	private String bo_time;
	private File[] items;
	
	{
		this.bo_time = new SimpleDateFormat("YYYY/MM/DD HH:mm:SS").format(new Date());
	}
	public File[] getItems() {
		return items;
	}
	
	public void setItems(File[] items) {
		this.items = items;
	}
	
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getBo_id() {
		return bo_id;
	}
	public String getBo_time() {
		return bo_time;
	}
	public void setBo_time(String bo_time) {
		this.bo_time = bo_time;
	}
	public void setBo_id(String bo_id) {
		this.bo_id = bo_id;
	}
	public String getBo_seq() {
		return bo_seq;
	}
	public void setBo_seq(String bo_seq) {
		this.bo_seq = bo_seq;
	}
	public String getBo_depth() {
		return bo_depth;
	}
	public void setBo_depth(String bo_depth) {
		this.bo_depth = bo_depth;
	}
	public String getBo_group() {
		return bo_group;
	}
	public void setBo_group(String bo_group) {
		this.bo_group = bo_group;
	}
	public String getBo_title() {
		return bo_title;
	}
	public void setBo_title(String bo_title) {
		this.bo_title = bo_title;
	}
	public String getBo_content() {
		return bo_content;
	}
	public void setBo_content(String bo_content) {
		this.bo_content = bo_content;
	}
	public String getBo_hit() {
		return bo_hit;
	}
	public void setBo_hit(String bo_hit) {
		this.bo_hit = bo_hit;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getBo_delete() {
		return bo_delete;
	}
	public void setBo_delete(String bo_delete) {
		this.bo_delete = bo_delete;
	}
	
	
}
