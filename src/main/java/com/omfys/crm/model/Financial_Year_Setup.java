package com.omfys.crm.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;

@Entity
@Table(name="FINANCIAL_YEAR_SETUP")
@Data
public class Financial_Year_Setup {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "countriesseq")
	@SequenceGenerator(name = "countriesseq", sequenceName = "FINANCIAL_YEAR_SETUP_SEQ", allocationSize = 1)
	@Column(name = "FY_ID")
	private int fy_id;
	
	@Column(name = "START_DATE")
	private String start_date;
	
	@Column(name = "END_DATE")
	private String end_date;
	
	@Column(name = "UPDATEDBY")
	private int lastupdatedby;
	
	@Column(name = "LAST_UPDATED_DATE",columnDefinition = "DATE DEFAULT CURRENT_DATE")
	private Date last_updated_date;
	
	@Transient
	private String startdate;
	
	@Transient
	private String enddate;
	
	@Transient
	private String lastupdateddate;
	
	
}
