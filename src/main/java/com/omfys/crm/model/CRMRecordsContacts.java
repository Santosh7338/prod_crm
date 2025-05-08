package com.omfys.crm.model;



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
@Table(name = "CRMRECORDSCONTACTS")
@Data
public class CRMRecordsContacts {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "crmrecordscontactsseq")
	@SequenceGenerator(name = "crmrecordscontactsseq", sequenceName = "CRMRECORDSCONTACTS_SEQ", allocationSize = 1)

	@Column(name = "ENQCONTID")
	private int enqcontid;
	
	@ManyToOne
	@JoinColumn(name = "CRMRECORDS")
	private CRMRecords crmrecordsid;
	
	@Column(name = "CONTACTNAME")
	private String contactname;
	
	@Column(name = "DESIGNATION")
	private String designation;
	
	@Column(name = "MOBILENO")
	private String mobileno;
	
	@Column(name = "OFFICENO")
	private String officeno;
	
	@Column(name = "EMAILID")
	private String emailid;
	
	@Column(name = "ALTEMAIL")
	private String altemail;
	
	@Column(name = "AUTHORITY")
	private String authority;
	
	@Transient
	private int contactsize;

}
