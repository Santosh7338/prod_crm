package com.omfys.crm.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.omfys.crm.model.StatusOfEvent;

public interface StatusOfEventRepository extends JpaRepository<StatusOfEvent, Integer> {
	
	@Query(value="SELECT * FROM STATUSOFEVENT WHERE EVENTSTATUSFOR = 'Enquiry' and IS_ACTIVATED = 'Y' order by EVENTSTATUSID",nativeQuery = true)
	public List<StatusOfEvent> getstatusforenquiry();
	
	@Query(value="SELECT * FROM STATUSOFEVENT WHERE EVENTSTATUSFOR = 'Lead' and IS_ACTIVATED = 'Y' order by EVENTSTATUSID",nativeQuery = true)
	public List<StatusOfEvent> getstatusforlead();

}
