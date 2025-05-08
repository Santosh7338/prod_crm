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
@Table(name = "CRM_MAIN_MENU")
@Data
public class MainMenu {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "crmmainmenuseq")
	@SequenceGenerator(name = "crmmainmenuseq", sequenceName = "CRM_MAIN_MENU_SEQ", allocationSize = 1)

	@Column(name = "MAIN_MENU_ID")
	private int mainmenuid;

	@Column(name = "PROFILE_ID")
	private int profileid;

	@Column(name = "MAIN_MENU_NAME")
	private String mainmenuname;

	@Column(name = "MAIN_MENU_CTRLR_NAME")
	private String mainmenuctrlrname;

	@Column(name = "MAIN_MENU_ACTION_NAME")
	private String mainmenuactionname;

	@Column(name = "MAIN_MENU_ICON")
	private String mainmenuicon;

	@Column(name = "ENABLE_FLAG")
	private String enableflag;

	@Column(name = "CREATED_BY", updatable = false)
	private int createdby;
	
	@Column(name = "CRM_USER_TYPE")
	private String crm_user_type;

	@DateTimeFormat(pattern = "dd/mm/yyyy hh:mm:ss")
	@Column(name = "CREATION_DATE", updatable = false)
	private Date creationdate = new java.sql.Date(new java.util.Date().getTime());

	@Column(name = "LAST_UPDATED_BY", updatable = true)
	private int lastupdatedby;

	@DateTimeFormat(pattern = "dd/mm/yyyy hh:mm:ss")
	@Column(name = "LAST_UPDATE_DATE", updatable = true)
	private Date lastupdatedate = new java.sql.Date(new java.util.Date().getTime());
}
