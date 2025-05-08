package com.omfys.crm.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "PURPOSEOFEVENT")
@Data
public class PurposeOfEvent {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "purposeofeventseq")
	@SequenceGenerator(name = "purposeofeventseq", sequenceName = "PURPOSEOFEVENT_SEQ", allocationSize = 1)

	@Column(name = "PURPOSEOFEVENTID")
	private int purposeofeventid;
	
	@Column(name = "PURPOSEOFEVENT")
	private String purposeofevent;
	
	@Column(name = "PURPOSEFOR")
	private String purposefor;
	
	@Column(name = "CREATEDBY")
	private int createdby;
	
	@Column(name = "CREATIONDATE")
	private Date creationdate;
	
	@Column(name = "LASTUPDATEDBY")
	private int lastupdatedby;
	
	@Column(name = "LASTUPDATEDDATE")
	private Date lastupdateddate;
	
	@Column(name = "IS_ACTIVATED")
	private String isactivated;
	
}
