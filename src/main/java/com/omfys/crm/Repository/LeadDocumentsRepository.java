package com.omfys.crm.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.omfys.crm.model.LeadDocuments;

public interface LeadDocumentsRepository extends JpaRepository<LeadDocuments, Integer> {
         
	 @Query(value="SELECT * FROM LEADDOCUMENTS WHERE CRMRECORDS = ?1 ORDER BY LEADDOCUMENTID ASC",nativeQuery = true)
	 public List<LeadDocuments> findByCrmrecordid(int crmid);
	 
	 @Query(value="SELECT * FROM LEADDOCUMENTS WHERE CRMEVENTS = ?1",nativeQuery = true)
	 public List<LeadDocuments> findByCrmEventid(int crmeventid);
	 
	
	 
}
