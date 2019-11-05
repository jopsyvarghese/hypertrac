package com.hypertrac.beans;

public class Applications {
	private int id;
	private String nameOrNo;
	private int dept;
	private String subject;
	private String submitted_on;
	private String validity;
	private int status;
	private int app_by;
	private int itemCount;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}	
	public int getItemCount() {
		return itemCount;
	}
	public void setItemCount(int pageCount) {
		this.itemCount = pageCount;
	}
	public String getNameOrNo() {
		return nameOrNo;
	}
	public void setNameOrNo(String nameOrNo) {
		this.nameOrNo = nameOrNo;
	}
	public int getDept() {
		return dept;
	}
	public void setDept(int dept) {
		this.dept = dept;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getSubmitted_on() {
		return submitted_on;
	}
	public void setSubmitted_on(String submitted_on) {
		this.submitted_on = submitted_on;
	}
	public String getValidity() {
		return validity;
	}
	public void setValidity(String validity) {
		this.validity = validity;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getApp_by() {
		return app_by;
	}
	public void setApp_by(int app_by) {
		this.app_by = app_by;
	}
}
