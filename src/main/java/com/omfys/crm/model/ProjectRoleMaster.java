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
@Table(name="PROJECT_ROLE_MASTER")
@Data
public class ProjectRoleMaster {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "prg_role_seq")
	@SequenceGenerator(name = "prg_role_seq", sequenceName = "PROJECT_ROLE_MASTER_SEQ", allocationSize = 1)
	private int prroleno;
	
	@Column(name="PROJECT_ROLE_NAME")
	private String projectrolename;
	
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
