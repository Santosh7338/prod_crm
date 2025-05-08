package com.omfys.crm.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Entity
@Table(name="COUNTRIES")
@Data
public class Countries {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "countriesseq")
	@SequenceGenerator(name = "countriesseq", sequenceName = "COUNTRIES_SEQ", allocationSize = 1)
	@Column(name = "COUNTRYID")
	private int countryid;
	
	@Column(name = "NAME")
	private String name;
	
	@Column(name = "PHONECODE")
	private Integer phonecode;
	
	@Column(name = "CAPITAL")
	private String capital;
	
	@Column(name = "REGION")
	private String region;
	
	@Column(name = "SUBREGION")
	private String subregion;

	public int compareTo(Countries countryid2) {
		// TODO Auto-generated method stub
		return 0;
	}

}
