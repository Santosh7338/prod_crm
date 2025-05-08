package com.omfys.crm.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.omfys.crm.model.CRMRecordsContacts;

public interface CRMRecordsContactsRepository extends JpaRepository<CRMRecordsContacts, Integer> {
	
	 @Query(value="SELECT * FROM CRMRECORDSCONTACTS WHERE CRMRECORDS = ?1",nativeQuery = true)
	 public List<CRMRecordsContacts> findByCrmrecordsid(int crmid);

}
