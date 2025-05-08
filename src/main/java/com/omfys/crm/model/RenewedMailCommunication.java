package com.omfys.crm.model;

import java.util.ArrayList;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Entity
@Table(name = "RENEWEDMAILCOMMUNICATION")
@Data
public class RenewedMailCommunication {
	

	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "remail_seq")
	@SequenceGenerator(name = "remail_seq", sequenceName = "RENEW_MAIL_COMMUNICATION_SEQ", allocationSize = 1)

	@Column(name = "MAIL_NO")
	private int mail_no;

	@Column(name = "COMM_TYPE")
	private String comm_type;

	@Column(name = "SUB_TYPE")
	private String sub_type;

	@Column(name = "FROM_MAIL")
	private String from_mail;

	@Column(name = "TO_MAIL")
	private String to_mail;

	@Column(name = "SUBJECT")
	private String subject;

	@Column(name = "BODY")
	private String body;

	@Column(name = "RESP1")
	private String resp1;

	@Column(name = "RESP2")
	private String resp2;

	@Column(name = "STATUS")
	private String status;

	@Column(name = "CC_MAIL")
	private ArrayList<String> cc_mail;

	@Column(name = "CREATED_BY", updatable = false)
	private int created_by;

	@DateTimeFormat(pattern = "dd/mm/yyyy hh:mm:ss")
	@Column(name = "CREATION_DATE", updatable = false)
	private Date creation_date = new java.sql.Date(new java.util.Date().getTime());

	@Column(name = "LAST_UPDATED_BY", updatable = true)
	private int last_updated_by;

	@DateTimeFormat(pattern = "dd/mm/yyyy hh:mm:ss")
	@Column(name = "LAST_UPDATE_DATE", updatable = true)
	private Date last_update_date = new java.sql.Date(new java.util.Date().getTime());

}
