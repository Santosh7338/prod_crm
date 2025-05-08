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
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;



@Entity
@Table(name="JOINING_DETAILS")
@Data
public class JoiningDetails {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "course_seq")
	@SequenceGenerator(name = "course_seq", sequenceName = "JOINING_DETAILS_SEQ", allocationSize = 1)
	
	
	@Column(name = "ID")
	private int id;
	
	@Column(name = "EMPLOYEE_STATUS")
	private String employeestatus;
	
	@Column(name = "JOINING_DATE")
	private Date joiningdate;
	
	@Transient
	private String joiningdate1;
	
	@ManyToOne
	@JoinColumn(name="DESIGNATION_ID")
	private  DesignationMaster designationid;
//	
//	@ManyToOne
//	@JoinColumn(name="ROLE_ID")
//	private RoleMaster roleid;
	
	@ManyToOne
	@JoinColumn(name="GRADE_ID")
	private  GradeLevelMaster gradeid;
	
	@ManyToOne
	@JoinColumn(name="DEPARTMENT_ID")
	private  DepartmentMaster departmentid;
	
	@ManyToOne
	@JoinColumn(name="EMP_ID")
	private EmployeeMaster empid;
	
	@Column(name = "CTC")
	private Long ctc;
	
	@Column(name = "GROSS_SALARY")
	private Long grosssalary;
	
	@Column(name = "BASIC_SALARY")
	private Long basicsalary;
	
	@Column(name = "PF_NUMBER")
	private String pfnumber;
	
	@Column(name = "UAN_NUMBER")
	private Long uannumber;

	@Column(name = "ESIC_NUMBER")
	private Long esicnumber;
	
	@Column(name = "BANK_AC_NUMBER")
	private Long bankacnumber;
	
	@Column(name = "BANK_NAME")
	private String bankname;
	
	@Column(name = "IFSC")
	private String ifsc;
	
	@Column(name = "PROBATION_DATE")
	private Date probationdate;
	
	@Transient
	private String probationdate1;
	
	@Column(name = "PREV_EMP_STATUS")
	private String prevempstatus;
	
	@Column(name = "NEW_DESIGNATION")
	private String newdesignation;
	
	@Column(name = "PF_APPLICABLE")
	private String pfapplicable;
	
	@Column(name = "ESIC_APPLICABLE")
	private String esicapplicable;
	
	@Column(name = "BRANCH_NAME")
	private String branchname;
	
	@Column(name = "PAN_NO")
	private String panno;
	
	@Column(name = "AADHAR_CARD")
	private String aadhar_card;
	
	@Column(name = "EMPLOYMENT")
	private String employment;
	
	@Column(name = "CREATED_BY", updatable = false)
	private int createdby;

	@DateTimeFormat(pattern = "dd/mm/yyyy hh:mm:ss")
	@Column(name = "CREATION_DATE" , updatable = false)
	private Date creationdate;

	@Column(name = "LAST_UPDATED_BY" , updatable=true)
	private int lastupdatedby;

	@DateTimeFormat(pattern = "dd/mm/yyyy hh:mm:ss")
	@Column(name = "LAST_UPDATE_DATE" , updatable = true)
	private Date lastupdatedate;
	
	@Column(name = "IS_DELETED")
	private String isdeleted;

	@Column(name = "CARRIER_GOAL")
	private String carriergoals;
		
	@Column(name = "EXTRA_ACTIVITY")
	private String extracurricular;
		
	@Column(name = "PREVIOUS_INTERVIEW")
	private String previousinterview;
		
	@Column(name = "MAJOR_PROJECT")
	private String mojorPhandled;
		
	@Column(name = "KEY_ACHIEVEMENTS")
	private String keyresultachieved;

}
