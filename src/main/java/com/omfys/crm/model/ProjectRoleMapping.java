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
@Table(name ="PROJECT_ROLE_MAPPING")
@Data
public class ProjectRoleMapping {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "prg_role_map_seq")
	@SequenceGenerator(name = "prg_role_map_seq", sequenceName = "PROJECT_ROLE_MAPPING_SEQ", allocationSize = 1)
	private int projectrolemapid;
	
	@ManyToOne
	@JoinColumn(name ="PROJECT_ROLE")
	private ProjectRoleMaster projectrole;
	
	@ManyToOne
	@JoinColumn(name ="EMPLOYEERESOURCE")
	private EmployeeMaster employeeresource;
	
	@Column(name="CREATED_BY")
	private int createdby;
	
	@Column(name = "CREATION_DATE",updatable = false)
	private Date creationdate = new java.sql.Date(new java.util.Date().getTime());
	
	@Column(name = "LAST_UPDATED_BY", updatable = true)
	private int lastupdatedby;
	
	@DateTimeFormat(pattern = "dd/mm/yyyy hh:mm:ss")
	@Column(name = "LAST_UPDATE_DATE", updatable = true)
	private Date lastupdatedate = new java.sql.Date(new java.util.Date().getTime());
	
	@Column(name = "IS_ACTIVATED")
	private String isactivated;


}
