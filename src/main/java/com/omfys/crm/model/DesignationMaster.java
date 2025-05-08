package com.omfys.crm.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Entity
@Table(name="DESIGNATION_MASTER")
@Data
public class DesignationMaster {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "course_seq")
	@SequenceGenerator(name = "course_seq", sequenceName = "DESIGNATION_MASTER_SEQ", allocationSize = 1)
	
	@Column(name = "DESIGNATION_ID")
	private int designationid;
	
	@Column(name = "DESIGNATION_NAME")
	private String designationname;

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
	
	@Column(name = "DEPARTMENT_ID")
	private int departmentid;

}
