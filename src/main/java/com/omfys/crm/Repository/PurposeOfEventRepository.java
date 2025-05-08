package com.omfys.crm.Repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.omfys.crm.model.PurposeOfEvent;

public interface PurposeOfEventRepository extends JpaRepository<PurposeOfEvent, Integer> {
	
	public List<PurposeOfEvent> findByOrderByPurposeofeventAsc();
	
	public List<PurposeOfEvent> findByOrderByPurposeofeventidAsc();
	
	@Query(value="SELECT * FROM PURPOSEOFEVENT WHERE PURPOSEFOR = 'Enquiry' AND IS_ACTIVATED = 'Y' ORDER BY PURPOSEOFEVENTID",nativeQuery = true)
	public List<PurposeOfEvent> getPurposeofeventforenquiry();
	
	@Query(value="SELECT * FROM PURPOSEOFEVENT WHERE PURPOSEFOR = 'Lead' AND IS_ACTIVATED = 'Y' ORDER BY PURPOSEOFEVENTID",nativeQuery = true)
	public List<PurposeOfEvent> getPurposeofeventforLead();
}
