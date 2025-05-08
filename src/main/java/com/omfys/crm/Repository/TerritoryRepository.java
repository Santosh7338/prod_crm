package com.omfys.crm.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.omfys.crm.model.CRMRecords;
import com.omfys.crm.model.Countries;
import com.omfys.crm.model.LeadDocuments;
import com.omfys.crm.model.TerritorySetup;


public interface TerritoryRepository extends JpaRepository<TerritorySetup,Integer>{

	@Query(value = "select *from TERRITORY_SETUP",nativeQuery = true)
	public List<TerritorySetup> readTerritorysetup();

	 @Query(value="SELECT * FROM TERRITORY_SETUP WHERE TR_ID = ?1",nativeQuery = true)
	 public List<TerritorySetup> findByCrmterritoryid(int tr_id);
	 
	 @Query(value = "select *from TERRITORY_SETUP WHERE IS_ACTIVATED='Y'",nativeQuery = true)
	 public List<TerritorySetup> readTerritorysetupactivated();
	 
	 @Query(value="SELECT * FROM TERRITORY_SETUP WHERE COUNTRY_ID = ?1",nativeQuery = true)
	 public List<TerritorySetup> findByCrmCoutryid(int countryid);
	 
}
