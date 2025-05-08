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
@Table(name = "OFFERING")
@Data
public class Offering {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "offeringseq")
	@SequenceGenerator(name = "offeringseq", sequenceName = "OFFERING_SEQ", allocationSize = 1)
	@Column(name = "OFFERINGID" , unique = false)
	private int offeringid;
	
	@Column(name = "OFFERINGDESC")
	private String offeringdesc;
	
	@Column(name = "CREATEDBY")
	private int createdby;
	
	@Column(name = "CREATIONDATE")
	private Date creationdate;
	
	@Column(name = "LASTUPDATEDBY")
	private int lastupdatedby;
	
	@Column(name = "LASTUPDATEDDATE")
	private Date lastupdateddate;
	
	@Column(name = "IS_ACTIVATED",columnDefinition = "varchar(255) default 'Y'")
	private String is_activated;

}
