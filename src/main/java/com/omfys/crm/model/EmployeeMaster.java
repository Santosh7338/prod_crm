package com.omfys.crm.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Entity
@Table(name = "EMPLOYEE_MASTER")
@Data
public class EmployeeMaster {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "course_seq")
	@SequenceGenerator(name = "course_seq", sequenceName = "EMPLOYEE_MASTER_SEQ", allocationSize = 1)

	@Column(name = "EMP_ID")
	private int empid;

	@Column(name = "EMP_CODE")
	private String empcode;

	@Column(name = "EMP_FIRST_NAME")
	private String empfirstname;

	@Column(name = "EMP_LAST_NAME")
	private String emplastname;

	@Column(name = "USER_ID")
	private int userid;

	@Column(name = "PASSWORD")
	private String password;
	
	@Column(name = "OTP")
	private String otp;

	@Column(name = "CREATED_BY", updatable = false)
	private int createdby;

	@DateTimeFormat(pattern = "dd/mm/yyyy hh:mm:ss")
	@Column(name = "CREATION_DATE", updatable = false)
	private Date creationdate = new java.sql.Date(new java.util.Date().getTime());

	@Column(name = "LAST_UPDATED_BY", updatable = true)
	private int lastupdatedby;

	@DateTimeFormat(pattern = "dd/mm/yyyy hh:mm:ss")
	@Column(name = "LAST_UPDATE_DATE", updatable = true)
	private Date lastupdatedate = new java.sql.Date(new java.util.Date().getTime());

	@Column(name = "IS_DELETED")
	private String isdeleted;

	@Column(name = "IS_ACTIVATED")
	private String isactivated;

	@Column(name = "PROFILE_ID")
	private int profileid;
	
	@Column(name = "PROJECT_ROLE_ID")
	private Integer projectroleid;
	
	@Column(name = "UPLOAD_PHOTO")
	private byte[] uploadphoto;
	
	@Column(name = "EMAIL")
	private String email;
	
	@Column(name = "PHOTO_NAME")
	private String photoname;
	
	@Column(name="EMP_DEACT_DATE")
	private Date empdeactdate;
	
	@Column(name="SALTKEY")
	private String saltkey;
	
	@Column(name="MYTESTCLOUMN")
	private String mytestcloumn;
	
	@Column(name="ISINTERNATIONAL")
	private String isinternational;
	
	@Transient
	public Date timesheetdate;

}
