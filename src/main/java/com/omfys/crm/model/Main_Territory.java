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
@Table(name = "MAIN_TERRITORY")
@Data
public class Main_Territory {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "Main_Territoryseq")
	@SequenceGenerator(name = "Main_Territoryseq", sequenceName = "MAIN_TERRITORY_SEQ", allocationSize = 1)

	@Column(name = "MAIN_TR_ID")
	private int main_tr_id;
	
	@ManyToOne
	@JoinColumn(name = "SALES_PERSON_ID")
	private EmployeeMaster salespersonid;
	
	@ManyToOne
	@JoinColumn(name = "TERRITORY_ID")
	private TerritorySetup territory_id;
	
	@ManyToOne
	@JoinColumn(name="TR_MGR_ID")
	private EmployeeMaster territorymanagerid;
	
	@ManyToOne
	@JoinColumn(name="REGION_ID")
	private Countries regionid;
	
	@Column(name = "CURRENCY")
	private String currency;
	
	@Column(name = "LAST_UPDATED_BY")
	private int updated_by;

	@Column(name = "CREATION_DATE",columnDefinition = "DATE DEFAULT CURRENT_DATE")
	private Date creationdate;
	
	@Column(name = "UPDATED_DATE",columnDefinition = "DATE DEFAULT CURRENT_DATE")
	private Date updated_date;
	
	@Column(name = "LAST_UPDATED_DATE",columnDefinition = "DATE DEFAULT CURRENT_DATE")
	private Date last_updated_date;
	
	@Transient
	private String updateddate;

}
