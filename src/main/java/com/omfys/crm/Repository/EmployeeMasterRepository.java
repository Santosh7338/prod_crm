package com.omfys.crm.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.omfys.crm.model.EmployeeMaster;
import com.omfys.crm.model.MainMenu;

public interface EmployeeMasterRepository  extends JpaRepository<EmployeeMaster, Integer> {
	
	public List<EmployeeMaster> findByEmpcode(String empcode);
	
	public EmployeeMaster findByEmpid(int empid);
	
	public List<EmployeeMaster> findByOrderByEmpfirstnameAsc();
	
	@Query(value="SELECT * FROM JOINING_DETAILS WHERE EMP_CODE = ?1 and PASSWORD = ?2",nativeQuery = true)
	public EmployeeMaster getLoginDetails(String empcode,String password);
	
	
	@Query(value="SELECT *FROM EMPLOYEE_MASTER WHERE IS_ACTIVATED='Y'",nativeQuery = true)
	public List<EmployeeMaster> getEmployeeDetails();
	
	@Query(value="SELECT *FROM EMPLOYEE_MASTER WHERE IS_ACTIVATED='Y' AND EMP_ID=?1",nativeQuery = true)
	public List<EmployeeMaster> getemployeebasedonid(int empid);

}
