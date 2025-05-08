package com.omfys.crm.model;

import java.io.InputStream;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;

@Entity
@Table(name="LEADDOCUMENTS")
@Data
public class LeadDocuments {
	
	    @Id
	    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "leaddocumentsseq")
	    @SequenceGenerator(name = "leaddocumentsseq", sequenceName = "LEAD_DOCUMENTS_SEQ", allocationSize = 1)

	    @Column(name="LEADDOCUMENTID")
        private int leaddocumentid;
	 
	    @Column(name="DOCUMENTNAME")
	    private String documentname;
		
	    @Lob
		private byte[] documentupload;
		
		@Column(name = "FILENAME")
		private String filename;
		
		@Column(name = "FILESIZE")
		private Long filesize;
		
		@Column(name = "FILETYPE")
		private String filetype;
		
		@ManyToOne
		@JoinColumn(name = "CRMRECORDS")
		private CRMRecords crmrecordid;
		
		@ManyToOne
		@JoinColumn(name = "CRMEVENTS")
		private CRMEvents crmevents;
		
		@Column(name = "CREATEDBY")
		private int createdby;
		
		@Column(name = "CREATIONDATE",columnDefinition = "DATE DEFAULT CURRENT_DATE")
		private Date creationdate;
		
		@Column(name = "LASTUPDATEDBY")
		private int lastupdatedby;
		
		@Column(name = "LASTUPDATEDDATE",columnDefinition = "DATE DEFAULT CURRENT_DATE")
		private Date lastupdateddate;
		
		@Transient
		private int docsize;
		
}
