package com.omfys.crm.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.omfys.crm.model.PersonalDetails;

public interface PersonalDetailsRepository extends JpaRepository<PersonalDetails, Integer>{
	
	@Query(value="SELECT * FROM PERSONAL_DETAILS WHERE EMP_ID = ?1",nativeQuery = true)
	public PersonalDetails findByEmpid(int empid);

}
