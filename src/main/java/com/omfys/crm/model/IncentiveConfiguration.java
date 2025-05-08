package com.omfys.crm.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name="INCENTIVECONFIGURATION")
@Data
public class IncentiveConfiguration {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "incentivefigseq")
	@SequenceGenerator(name = "incentiveconfigseq", sequenceName = "INCENTIVECONFIG_SEQ", allocationSize = 1)
	@Column(name = "INCENTIVECONFIGID")
	private int incentiveconfigid;
	
	@Column(name = "INCENTIVEROLE")
	private String incentiverole;
	
	@Column(name = "INCENTIVEELIGIBILITY")
	private String incentiveeligibility;
	
	@Column(name = "INCENTIVETYPE")
	private String   incentivetype;
	
	@Column(name = "INCENTIVETYPE1")
	private String incentivetype1;
	
	@Column(name = "INCENTIVETOBECAL")
	private String incentivetobecal;
	
	@Column(name = "REMARK")
	private String remark;
	
	@Column(name = "CURRENTFINYEAR")
	private String currentfinyear;

}
