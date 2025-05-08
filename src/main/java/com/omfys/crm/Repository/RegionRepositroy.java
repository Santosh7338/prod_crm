package com.omfys.crm.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.omfys.crm.model.Countries;
import com.omfys.crm.model.Main_Territory;
import com.omfys.crm.model.Region;
import com.omfys.crm.model.TerritorySetup;

public interface RegionRepositroy extends  JpaRepository<Region, Integer>{
	
	@Query(value = "SELECT *FROM REGION",nativeQuery = true)
	public List<Region> readRegion();
	
	
	@Query(value = "SELECT *FROM REGION WHERE COUNTRYID=?1",nativeQuery = true)
	public List<Region> getCountryid(int countryid);
	
	@Query(value = "SELECT *FROM REGION WHERE RG_ID=?1",nativeQuery = true)
	public List<Region> getRegionDetails(int rg_id);


	
	

}
