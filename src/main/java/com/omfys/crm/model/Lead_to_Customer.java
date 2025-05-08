package com.omfys.crm.model;

public class Lead_to_Customer {
	
	private int employee_resource;
	private String project_role_master;
	private String firstname;
	private String lastname;
	private String email;
	private String isinternational;
	
	
	
	public String getIsinternational() {
		return isinternational;
	}
	public void setIsinternational(String isinternational) {
		this.isinternational = isinternational;
	}
	public int getEmployee_resource() {
		return employee_resource;
	}
	public void setEmployee_resource(int employee_resource) {
		this.employee_resource = employee_resource;
	}
	public String getProject_role_master() {
		return project_role_master;
	}
	public void setProject_role_master(String project_role_master) {
		this.project_role_master = project_role_master;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "Lead_to_Customer [employee_resource=" + employee_resource + ", project_role_master="
				+ project_role_master + ", firstname=" + firstname + ", lastname=" + lastname + ", email=" + email
				+ ", isinternational=" + isinternational + "]";
	}
	
	

}
