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
@Table(name="DISTRICT_MASTER")
@Data
public class DistrictMaster {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "districtmasteseq")
	@SequenceGenerator(name = "districtmasterseq", sequenceName = "DISTRICTMASTER_SEQ", allocationSize = 1)
	@Column(name = "DISTRICT_ID")
	private int districtid;
	
	@Column(name = "DISTRICT_NAME")
	private String districtname;
	
	@ManyToOne
	@JoinColumn(name = "STATE_ID")
	private StateMaster crmstateid;
	
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
