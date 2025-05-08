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
@Table(name = "STATUSOFEVENT")
@Data
public class StatusOfEvent {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "statusofeventseq")
	@SequenceGenerator(name = "statusofeventseq", sequenceName = "STATUSOFEVENT_SEQ", allocationSize = 1)

	@Column(name = "EVENTSTATUSID")
	private int eventstatusid;
	
	@Column(name = "EVENTSTATUSFOR")
	private String eventstatusfor;
	
	@Column(name = "EVENTSTATUS")
	private String eventstatus;
	
	@Column(name = "EVENTSTATUSNAME")
	private String eventstatusname;
	
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
