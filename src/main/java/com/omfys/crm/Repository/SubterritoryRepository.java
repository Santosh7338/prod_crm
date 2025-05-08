package com.omfys.crm.Repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.omfys.crm.model.Countries;
import com.omfys.crm.model.Main_Territory;
import com.omfys.crm.model.SubTerritory;


public interface SubterritoryRepository extends JpaRepository<SubTerritory, Integer>{

	 @Query(value = "SELECT *FROM SUB_TERRITORY WHERE ASSIGN_TO=?1",nativeQuery = true)
	 public List<SubTerritory> getCounntrybasedonid(int assingedid);
	 
	
}
