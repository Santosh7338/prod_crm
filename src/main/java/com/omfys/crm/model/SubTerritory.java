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
@Table(name="SUB_TERRITORY")
@Data
public class SubTerritory {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SubTerritoryseq")
	@SequenceGenerator(name = "SubTerritoryseq", sequenceName = "SUB_TERRITORY_SEQ", allocationSize = 1)

	@Column(name="SUB_TR_ID")
	private int sub_tr_id;
	
	@ManyToOne
	@JoinColumn(name="MAIN_TR_ID")
	private Main_Territory main_tr_id;
	
	@ManyToOne
	@JoinColumn(name="TR_ID")
	private TerritorySetup tr_id;
	
	@ManyToOne
	@JoinColumn(name="ASSIGN_TO")
	private EmployeeMaster assigned_id;
	
	@ManyToOne
	@JoinColumn(name="COUNTRYID")
	private Countries country_id;
	
	@ManyToOne
	@JoinColumn(name="UPDATED_BY")
	private EmployeeMaster updated_by;
	
	
	@Column(name = "UPDATED_DATE",columnDefinition = "DATE DEFAULT CURRENT_DATE")
	private Date updated_date;
	
	
}
