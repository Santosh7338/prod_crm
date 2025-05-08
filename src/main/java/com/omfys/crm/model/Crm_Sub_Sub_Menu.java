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
@Table(name="CRM_SUB_SUB_MENU")
@Data
public class Crm_Sub_Sub_Menu {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "Crm_Sub_Sub_Menu")
	@SequenceGenerator(name = "Crm_Sub_Sub_Menu", sequenceName = "CRM_SUB_SUB_MENU_SEQ", allocationSize = 1)
	
	@Column(name="SUB_SUB_MENU_ID")
	private int sub_sub_manu_id;
	
	@ManyToOne
	@JoinColumn(name="SUB_MENU_ID")
	private Crm_Sub_Menu sub_manu_id;
	
	@ManyToOne
	@JoinColumn(name="MAIN_MENU_ID")
	private MainMenu main_menu_id;
	
	@Column(name="SUB_SUB_MENU_NAME")
	private String sub_sub_menu_name;
	
	@Column(name="SUB_SUB_MENU_CTRLR_NAME")
	private String sub_sub_menu_cntr_name;
	
	@Column(name="SUB_SUB_MENU_ACTION_NAME")
	private String sub_sub_menu_action_name;
	
	@Column(name="SUB_SUB_MENU_ICON")
	private String sub_sub_menu_icon;
	
	@Column(name="CREATED_BY")
	private int created_by;
	
	@DateTimeFormat(pattern = "dd/mm/yyyy hh:mm:ss")
	@Column(name = "CREATION_DATE", updatable = false)
	private Date creation_date = new java.sql.Date(new java.util.Date().getTime());
	
	@Column(name ="LAST_UPDATED_BY")
	private int last_updated_by;
	
	@DateTimeFormat(pattern = "dd/mm/yyyy hh:mm:ss")
	@Column(name = "LAST_UPDATE_DATE", updatable = true)
	private Date last_update_date = new java.sql.Date(new java.util.Date().getTime());
	
}
