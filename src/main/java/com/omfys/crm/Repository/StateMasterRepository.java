package com.omfys.crm.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.omfys.crm.model.StateMaster;

public interface StateMasterRepository extends JpaRepository<StateMaster, Integer> {
	
	@Query(value="SELECT * FROM STATE_MASTER WHERE COUNTRY_ID =?1",nativeQuery = true)
	public List<StateMaster> findByCountryid(int countryid);
	
	public StateMaster findByStateid(int stateid);

}
