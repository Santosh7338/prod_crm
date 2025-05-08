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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import lombok.Data;

@Entity
@Table(name = "CRMEVENTS")
@Data
public class CRMEvents {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "crmeventseq")
	@SequenceGenerator(name = "crmeventseq", sequenceName = "CRMEVENT_SEQ", allocationSize = 1)

	@Column(name = "CRMEVENTID")
	private int crmeventid;
	
	@ManyToOne
	@JoinColumn(name = "CRMRECORDID")
	private CRMRecords crmrecordid;
	
	@Column(name = "CRMEVENT")
	private String crmevent;
	
	@Column(name = "PURPOSEOFEVENT")
	private String purposeofevent;
	
	@Column(name = "STATUS")
	private String status;
	
	@Column(name = "REMARK")
	private String remark;
	
	@Column(name = "CRMEVENTDATE")
	@Temporal(TemporalType.TIMESTAMP)
	private Date crmeventdate;
	
	@Column(name = "PROJECTDESCRIPTION")
	private String projectdescription;
	
	@Column(name = "POTENTIALOPP")
	private Long potentialopp;
	
	@Column(name = "CHANCEOFSALE")
	private String chanceofsale;
	
	@Column(name = "FORECASTCLOSE")
	private Date forecastclose;
	
	@Column(name = "PONUMBER")
	private String ponumber;
	
	@Column(name = "PODATE")
	private Date podate;
	
	@Column(name = "POAMOUNT")
	private Long poamount;
	
	@Column(name = "OFFERING")
	private String offering;
	
	@Column(name = "NEEDBYDATE")
	@Temporal(TemporalType.TIMESTAMP)
	private Date needbyDate;
	
	@Column(name = "CREATEDBY")
	private int createdby;
	
	@Column(name = "CREATIONDATE",columnDefinition = "DATE DEFAULT CURRENT_DATE")
	private Date creationdate;
	
	@Column(name = "LASTUPDATEDBY")
	private int lastupdatedby;
	
	@Column(name = "LASTUPDATEDDATE",columnDefinition = "DATE DEFAULT CURRENT_DATE")
	private Date lastupdateddate;
	
	//ADDED BY 14-02-2023
	@Column(name = "RENEW")
	private String renew;
	
	@Transient
	private String crmeventstrdate;

	@Transient
	private String crmpodatestr;
	
	@Transient
	private String needbydatestr;
	
	@Transient
	private int crmeventids;
}
