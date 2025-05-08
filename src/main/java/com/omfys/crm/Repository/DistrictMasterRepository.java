package com.omfys.crm.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.omfys.crm.model.DistrictMaster;

public interface DistrictMasterRepository extends JpaRepository<DistrictMaster, Integer> {
	
	@Query(value="SELECT * FROM DISTRICT_MASTER WHERE STATE_ID =?1",nativeQuery = true)
	public List<DistrictMaster> findByStateid(int stateid);
	
	public DistrictMaster findByDistrictid(int districtid);

}
