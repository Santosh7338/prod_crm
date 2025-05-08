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
@Table(name="TARGETCONFIGURATION")
@Data
public class TargetConfiguration {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "targetconfigseq")
	@SequenceGenerator(name = "targetconfigseq", sequenceName = "TARGETCONFIG_SEQ", allocationSize = 1)
	@Column(name = "TARGETCONFIGID")
	private int targetconfigid;
	
	@ManyToOne
	@JoinColumn(name = "SALESPERSON")
	private EmployeeMaster salesperson;
	
	@Column(name = "TARGETTYPE")
	private String targettype;
	
	@Column(name = "TARGETFREQUENCY")
	private String targetfrequency;
	
	@Column(name = "TARGET")
	private int target;
	
	@Column(name = "REMARK")
	private String remark;

}
