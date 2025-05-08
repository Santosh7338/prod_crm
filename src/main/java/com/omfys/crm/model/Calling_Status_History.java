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
import javax.persistence.Transient;

import lombok.Data;

@Entity
@Table(name = "CRM_CALLING_HISTORY")
@Data
public class Calling_Status_History {

@Id
@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "crmcallseq")
@SequenceGenerator(name = "crmcallseq", sequenceName = "CRM_CALLING_HISTORY_SEQ", allocationSize = 1)
	
@Column(name="calling_status_history_id")	
private int  calling_status_history_id;

@Column(name="calling_date")
private Date calling_date;

@Column(name="calling_status")
private String  calling_status;

@Column(name="calling_remark")
private String  calling_remark;

@ManyToOne
@JoinColumn(name = "crm_id")
private CRMRecords  crm_id;

@Transient
private String callingdatestr;
}
