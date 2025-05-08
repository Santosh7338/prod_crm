package com.omfys.crm.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.omfys.crm.model.Calling_Status_History;

public interface Crm_calling_history_repositry extends JpaRepository<Calling_Status_History, Integer> {

@Query(value="SELECT * FROM CRM_CALLING_HISTORY where CRM_ID = ?1 and CALLING_DATE = (select max(CALLING_DATE) from CRM_CALLING_HISTORY where CRM_ID = ?1)",nativeQuery = true)	
public List<Calling_Status_History> checkLatestCallingStatus(int crmId);

@Query(value="SELECT * FROM CRM_CALLING_HISTORY where CRM_ID = ?1",nativeQuery = true)	
public List<Calling_Status_History> getAllCrmHistoryOnCrmId(int crmId);

@Query(value="SELECT MAX(CRMRECORDID) FROM CRMRECORDS",nativeQuery = true)	
public int getmaximumCrmId();

}
