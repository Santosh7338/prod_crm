package com.omfys.crm.Repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.omfys.crm.model.CRMEventMaster;
import com.omfys.crm.model.CRMEvents;


public interface CRMEventMasterRepository extends JpaRepository<CRMEventMaster, Integer> {
	
	public List<CRMEventMaster> findByOrderByCrmeventAsc();
	
	

}
