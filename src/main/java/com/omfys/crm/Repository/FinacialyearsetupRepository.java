package com.omfys.crm.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.omfys.crm.model.Countries;
import com.omfys.crm.model.EmployeeMaster;
import com.omfys.crm.model.Financial_Year_Setup;

public interface FinacialyearsetupRepository extends JpaRepository<Financial_Year_Setup, Integer> {
	
	@Query(value = "SELECT * FROM FINANCIAL_YEAR_SETUP",nativeQuery = true)
	public List<Financial_Year_Setup> financialyearsetup();

	
}
