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
@Table(name = "CRMRECORDS")
@Data
public class CRMRecords {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "crmrecordseq")
	@SequenceGenerator(name = "crmrecordseq", sequenceName = "CRMRECORDS_SEQ", allocationSize = 1)

	@Column(name = "CRMRECORDID")
	private int crmrecordid;
	
	@ManyToOne
	@JoinColumn(name = "CRMDATASOURCE")
	private CrmDataSource crmDataSource;
	
	@Column(name = "SOURCINGDATE", columnDefinition = "DATE DEFAULT CURRENT_DATE")
	private Date sourcingdate ;
	
	@Column(name = "OFFERING")
	private String offering;
	
	@Column(name = "COMPANYNAME")
	private String companyname;
	
	@Column(name = "COUNTRY")
	private String country ;
	
	@Column(name = "STATE")
	private String state;
	
	@Column(name = "DISTRICT")
	private String district;
	
	@Column(name = "COUNTRY_TYPE")
	private String countrytype;
	
	@Column(name = "CURRENCY_TYPE")
	private String currencytype;
	
	@Column(name = "FOREIGNCURRENCY")
	private String foreigncurrency;
	
	@Column(name = "ADDRESS1")
	private String address1;
	
	@Column(name = "ADDRESS2")
	private String address2;
	
	@Column(name = "CITY")
	private String city;
	
	@Column(name = "NICKNAME")
	private String nickname;
	
	@Column(name = "EMPLOYEESIZE")
	private String employeesize;
	
	@Column(name = "ANNUALTURNOVER")
	private String annualturnover;
	
	@ManyToOne
	@JoinColumn(name = "ASSIGNETO")
	private EmployeeMaster assigneto;
	
	@ManyToOne
	@JoinColumn(name = "PRIMARYSALESPERSON")
	private EmployeeMaster primarysalesperson;
	
	@ManyToOne
	@JoinColumn(name = "SECONDARYSALESPERSON")
	private EmployeeMaster secondarysalesperson;
	
	@ManyToOne
	@JoinColumn(name = "PRESALESPERSON")
	private EmployeeMaster presalesperson;
	
	@ManyToOne
	@JoinColumn(name = "BDHEAD")
	private EmployeeMaster bdhead;
	
	@Column(name = "CRMEVENT")
	private String crmevent;
	
	@Column(name = "PURPOSEOFEVENT")
	private String purposeofevent;
	
	@Column(name = "STATUS")
	private String status;
	
	@Column(name = "CRMTYPE")
	private String crmtype;
	
	@Column(name = "PROJECTDESCRIPTION")
	private String projectdescription;
	
	@Column(name = "POTENTIALOPP")
	private Long potentialopp;
	
	@Column(name = "CHANCEOFSALE")
	private String chanceofsale;
	
	@Column(name = "MARGIN")
	private String margin;
	
	@Column(name = "FORECASTCLOSE")
	private Date forecastclose;
	
	@Column(name = "PONUMBER")
	private String ponumber;
	
	@Column(name = "CALLING_STATUS")
	private String calling_status;
	
	@Column(name = "CALLING_STATUS_REMARK")
	private String calling_status_remark;
	
	@Column(name = "INDUSTRY_OF_COMPANY")
	private String industry_of_company;
	
	@Column(name = "ALTERNATIVE_EMAIL_ID")
	private String alternative_email_id;
	
	@Column(name = "DESIGNATION_OF_PROSPECT")
	private String designation_of_prospect;
	
	@Column(name = "PODATE")
	private Date podate;
	
	@Column(name = "POAMOUNT")
	private Long poamount;
	
	@Column(name = "ISACTIVATED",columnDefinition = "varchar(255) default 'Y'")
	private String isactivated;
	
	@Column(name = "ISACTIVATEDCUSTOMER",columnDefinition = "varchar(255) default 'Y'")
	private String isactivatedcustomer;
	
	@Column(name = "NEEDBYDATE")
	@Temporal(TemporalType.TIMESTAMP)
	private Date needbyDate;
	
	@ManyToOne
	@JoinColumn(name = "CREATEDBY")
	private EmployeeMaster createdby;
	
	@Column(name = "CREATIONDATE",columnDefinition = "DATE DEFAULT CURRENT_DATE")
	private Date creationdate;
	
	@Column(name = "LASTUPDATEDBY")
	private int lastupdatedby;
	
	@Column(name = "LASTUPDATEDDATE",columnDefinition = "DATE DEFAULT CURRENT_DATE")
	private Date lastupdateddate;
	
	
	@Column(name = "FLOW_OF_DATE")
	@Temporal(TemporalType.TIMESTAMP)
	private Date flow_of_date;
	
	
	@Transient
	private String forecastdatestr;
	

	@Transient
	private String podatestr;
	
	@Transient
	private String primarysalespersonname;
	
	@Transient
	private String secondarysalespersonname;
	
	@Transient
	private String presalespersonname;
	
	@Transient
	private String bdheadname;
	
	@Transient
	private int primarysalespersonid;
	
	@Transient
	private int secondarysalespersonid;
	
	@Transient
	private int presalespersonid;
	
	@Transient
	private int bdheadid;
	
	@Transient
	private String creation;
	
	@Transient
	private String updation;
}
