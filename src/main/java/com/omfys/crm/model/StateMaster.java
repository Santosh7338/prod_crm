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

import lombok.Data;

@Entity
@Table(name="STATE_MASTER")
@Data
public class StateMaster {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "statemasterseq")
	@SequenceGenerator(name = "statemasterseq", sequenceName = "STATEMASTER_SEQ", allocationSize = 1)
	@Column(name = "STATE_ID")
	private int stateid;
	
	@Column(name = "STATE_NAME")
	private String statename;
	
	@ManyToOne
	@JoinColumn(name = "COUNTRY_ID")
	private Countries countryid;
	
	@Column(name = "IS_DELETED")
	private String isdeleted;
	
	@Column(name = "CREATED_BY")
	private int createdby;
	
	@Column(name = "CREATION_DATE",columnDefinition = "DATE DEFAULT CURRENT_DATE")
	private Date creationdate;
	
	@Column(name = "LAST_UPDATED_BY")
	private int lastupdatedby;
	
	@Column(name = "LAST_UPDATED_DATE",columnDefinition = "DATE DEFAULT CURRENT_DATE")
	private Date lastupdateddate;

}
