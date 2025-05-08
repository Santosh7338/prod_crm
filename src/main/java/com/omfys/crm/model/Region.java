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
@Table(name="REGION")
@Data
public class Region {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "regionseq")
	@SequenceGenerator(name = "regionseq", sequenceName = "REGION_SEQ", allocationSize = 1)
	@Column(name = "RG_ID")
	private int rg_id;
	
	@ManyToOne
	@JoinColumn(name = "COUNTRYID")
	private Countries countryid;
	
	@Column(name="CURRENCY")
	private String currency;
	
	@Column(name = "UPDATED_BY")
	private int updated_by;
	
	@Column(name = "CREATED_DATE",columnDefinition = "DATE DEFAULT CURRENT_DATE")
	private Date createdDate;
	
	@Column(name = "UPDATED_DATE",columnDefinition = "DATE DEFAULT CURRENT_DATE")
	private Date last_update_date;
	
	@Transient
	private String updateddate;
	
	

}
