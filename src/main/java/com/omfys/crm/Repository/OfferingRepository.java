package com.omfys.crm.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.omfys.crm.model.CrmDataSource;
import com.omfys.crm.model.Offering;

public interface OfferingRepository extends JpaRepository<Offering,Integer> {
	
	@Query(value="SELECT * FROM OFFERING WHERE IS_ACTIVATED = 'Y' order by OFFERINGID DESC",nativeQuery = true)
	public List<Offering> findActivatedOfferingByOrderByOfferingdescAsc();
	
	@Query(value="SELECT * FROM OFFERING WHERE OFFERINGID = ?",nativeQuery = true)
	public List<Offering> getOfferingById(int offeringId);
	
	@Query(value="SELECT MAX(OFFERINGID) FROM OFFERING",nativeQuery = true)
	public int getMaxValue();
	

}
