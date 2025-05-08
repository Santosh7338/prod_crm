package com.omfys.crm.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.omfys.crm.model.CRMEvents;

public interface CRMEventsRepository extends JpaRepository<CRMEvents, Integer> {
	
	@Query(value = "SELECT * FROM CRMEVENTS WHERE CRMRECORDID =?1 order by CRMEVENTID",nativeQuery = true)
	public List<CRMEvents> findAllByCrmrecordid(int crmid);
	
	@Query(value = "SELECT * FROM CRMEVENTS WHERE CRMRECORDID =?1 and STATUS =?2 order by CRMEVENTID",nativeQuery = true)
	public List<CRMEvents> findAllEventsForCustomer(int crmid,String crmstatus);
	
	@Query(value = "SELECT * FROM CRMEVENTS WHERE CRMEVENTID =?1 ",nativeQuery = true)
	public List<CRMEvents> findCrmEventdetail(int crmeventid);
	
}
