package com.omfys.crm.model;

public class JoiningInformation {
	
	private int empid;
	private String emp_code;
	private String email;
	private String emp_first_name;
	private String emp_last_name;
	private int profileid;
	private int createdby;
	private double ctc;
	private String contectnumber;
	public int getEmpid() {
		return empid;
	}
	public void setEmpid(int empid) {
		this.empid = empid;
	}
	public String getEmp_code() {
		return emp_code;
	}
	public void setEmp_code(String emp_code) {
		this.emp_code = emp_code;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmp_first_name() {
		return emp_first_name;
	}
	public void setEmp_first_name(String emp_first_name) {
		this.emp_first_name = emp_first_name;
	}
	public String getEmp_last_name() {
		return emp_last_name;
	}
	public void setEmp_last_name(String emp_last_name) {
		this.emp_last_name = emp_last_name;
	}
	public int getProfileid() {
		return profileid;
	}
	public void setProfileid(int profileid) {
		this.profileid = profileid;
	}
	public int getCreatedby() {
		return createdby;
	}
	public void setCreatedby(int createdby) {
		this.createdby = createdby;
	}
	public double getCtc() {
		return ctc;
	}
	public void setCtc(double ctc) {
		this.ctc = ctc;
	}
	public String getContectnumber() {
		return contectnumber;
	}
	public void setContectnumber(String contectnumber) {
		this.contectnumber = contectnumber;
	}
	@Override
	public String toString() {
		return "JoiningInformation [empid=" + empid + ", emp_code=" + emp_code + ", email=" + email
				+ ", emp_first_name=" + emp_first_name + ", emp_last_name=" + emp_last_name + ", profileid=" + profileid
				+ ", createdby=" + createdby + ", ctc=" + ctc + ", contectnumber=" + contectnumber + "]";
	}
	
	

}
