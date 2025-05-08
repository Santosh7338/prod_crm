package com.omfys.crm.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.omfys.crm.model.CRMEvents;
import com.omfys.crm.model.Countries;

public interface CountriesRepository extends JpaRepository<Countries, Integer>{
	
	public List<Countries> findByOrderByNameAsc();
	
	@Query(value = "SELECT *FROM COUNTRIES WHERE NAME NOT IN 'India'",nativeQuery = true)
	public List<Countries> exceptIndia();
	
	public Countries findByCountryid(int countryid);

}
