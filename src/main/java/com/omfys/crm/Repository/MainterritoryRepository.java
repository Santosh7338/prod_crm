package com.omfys.crm.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.omfys.crm.model.Countries;
import com.omfys.crm.model.Main_Territory;
import com.omfys.crm.model.TerritorySetup;

public interface MainterritoryRepository extends JpaRepository<Main_Territory, Integer>{

	
	 @Query(value = "select *from MAIN_TERRITORY",nativeQuery = true)
	 public List<Main_Territory> getMainterritory();
	
	 @Query(value="SELECT * FROM MAIN_TERRITORY WHERE SALES_PERSON_ID = ?1",nativeQuery = true)
	 public List<Main_Territory> findByAssignedEmpid(int assigned_id);

	 @Query(value="SELECT * FROM MAIN_TERRITORY WHERE MAIN_TR_ID = ?1",nativeQuery = true) 
	public List<Main_Territory> findByMainterritory(Integer main_tr_id);

	@Query(value="SELECT * FROM MAIN_TERRITORY WHERE TERRITORY_ID = ?1",nativeQuery = true) 
	public List<Main_Territory> findByterrirotryid(Integer tr_id);
	 
	 
//	 @Query(value="SELECT * FROM MAIN_TERRITORY WHERE SALES_PERSON_ID = ?1",nativeQuery = true)
//	 public List<Main_Territory> findByAssignedEmpid(int assigned_id);
//	 
	
	 
}
