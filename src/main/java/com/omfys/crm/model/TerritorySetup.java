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
@Table(name = "TERRITORY_SETUP")
@Data
public class TerritorySetup {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "territorySetupseq")
	@SequenceGenerator(name = "territorySetupseq", sequenceName = "TERRITORY_SETUP_SEQ", allocationSize = 1)

	@Column(name = "TR_ID")
	private int tr_id;
	
	@Column(name = "TERRITORY_NAME")
	private String territory_name;
	
	@ManyToOne
	@JoinColumn(name="COUNTRY_ID")
	private Countries countryid;
	
	@ManyToOne
	@JoinColumn(name="TR_MG_ID")
	private EmployeeMaster territoryMangaerid;
	
	@ManyToOne
	@JoinColumn(name="RG_ID")
	private Region regionid;
	
	@Column(name = "UPDATED_BY")
	private int updated_by;
	
	@Column(name = "UPDATED_DATE",columnDefinition = "DATE DEFAULT CURRENT_DATE")
	private Date updated_date;
	
	@Column(name = "IS_ACTIVATED")
	private String is_activated;
	
	@Transient
	private String updateddate1;

}
