package com.omfys.crm.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.omfys.crm.model.JoiningDetails;

public interface JoiningDetailsReposiory extends JpaRepository<JoiningDetails, Integer> {
	
	@Query(value="SELECT * FROM Joining_Details WHERE EMP_ID = ?1",nativeQuery = true)
	public JoiningDetails findByEmpid(int empid);

}
