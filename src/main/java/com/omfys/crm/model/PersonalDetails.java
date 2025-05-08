package com.omfys.crm.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;


@Entity
@Table(name="PERSONAL_DETAILS")
@Data
public class PersonalDetails {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "course seq")
	@SequenceGenerator(name = "course seq", sequenceName = "PERSONAL DETAILS SEQ", allocationSize = 1)
	@Column(name = "ID")
	private int id;
	
	@Column(name = "FIRST_NAME")
	private String firstname;
	
	@Column(name = "MIDDLE_NAME")
	private String middlename;
	
	@Column(name = "LAST_NAME")
	private String lastname;
	
	@Column(name = "GENDER")
	private String gender;

	@Column(name = "EMAIL")
	private String email;

	@Column(name = "MARITAL_STATUS")
	private String maritalstatus;
	
	@Column(name = "RELIGION")
	private String religion;
	
	@Column(name = "SPOUSE_NAME")
	private String spousename;
	
	@Column(name = "CONTACT_NUMBER")
	private Long contactnumber;
	
	@Column(name = "EMERGENCY_NUMBER")
	private Long emergencynumber;
	
	@ManyToOne
	@JoinColumn(name="EMP_ID")
	private EmployeeMaster empid;
	
	@Column(name = "DOB")
	private Date dob;
		
	@Column(name = "CREATED_BY", updatable = false)
	private int createdby;

	@DateTimeFormat(pattern = "dd/mm/yyyy hh:mm:ss")
	@Column(name = "CREATION_DATE" , updatable = false)
	private Date creationdate= new java.sql.Date(new java.util.Date().getTime());

	@Column(name = "LAST_UPDATED_BY" , updatable=true)
	private int lastupdatedby;

	@DateTimeFormat(pattern = "dd/mm/yyyy hh:mm:ss")
	@Column(name = "LAST_UPDATE_DATE" , updatable = true)
	private Date lastupdatedate= new java.sql.Date(new java.util.Date().getTime());
	
	@Column(name = "IS_DELETED")
	private String isdeleted;
	
	@Column(name = "BIRTH_PLACE")
	private String birthplace;
	
	@DateTimeFormat(pattern = "dd/mm/yyyy hh:mm:ss")
	@Column(name = "MARRIAGE_DATE" , updatable = true)
	private Date marrriagedate;
	
	@Column(name = "NATIONALITY_SELF")
	private String nationalityself;
	
	@Column(name = "BLOOD_GROUP")
	private String bloodgroup;
	
	@Column(name = "AGE")
	private String age;
	
	@Column(name = "HEIGHT")
	private String height;
	
	@Column(name = "WEIGHT")
	private String weight;
	
	@Column(name = "VISION")
	private String vision;
	
	@Column(name = "PHYSICAL_DISABILITY")
	private String physicaldisability;
	
	@Column(name = "CORP_EMAIL")
	private String corporateemail;

}
