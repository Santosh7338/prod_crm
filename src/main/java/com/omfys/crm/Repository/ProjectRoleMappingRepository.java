package com.omfys.crm.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.omfys.crm.model.ProjectRoleMapping;

public interface ProjectRoleMappingRepository extends JpaRepository<ProjectRoleMapping, Integer> 
{
	@Query(value="select DISTINCT(pm.EMPLOYEERESOURCE)  from PROJECT_ROLE_MAPPING pm where (PROJECT_ROLE = 13 or PROJECT_ROLE = 14 or PROJECT_ROLE = 15 or PROJECT_ROLE = 16 or PROJECT_ROLE = 17)",nativeQuery = true)
	public List<Integer> findByEmployeeMaster();
	
	@Query(value="SELECT * FROM PROJECT_ROLE_MAPPING WHERE EMPLOYEERESOURCE = ?1",nativeQuery = true)
	public List<ProjectRoleMapping> findByEmployeeId(int empid);
	
	/*
	@Query(value="select DISTINCT(pm.EMPLOYEERESOURCE)  from PROJECT_ROLE_MAPPING pm where (PROJECT_ROLE = 15 or PROJECT_ROLE = 16 or PROJECT_ROLE = 17)",nativeQuery = true)
	public List<Integer> getPrimarySalesPerson();
	*/
	
	@Query(value="select DISTINCT(pm.EMPLOYEERESOURCE), em.EMP_FIRST_NAME  from PROJECT_ROLE_MAPPING pm JOIN EMPLOYEE_MASTER em ON em.EMP_ID = pm.EMPLOYEERESOURCE where  (pm.PROJECT_ROLE = 15 or pm.PROJECT_ROLE = 16 or pm.PROJECT_ROLE = 17) order by em.EMP_FIRST_NAME",nativeQuery = true)
	public List<Integer> getPrimarySalesPerson();
	
	
	/*
	@Query(value="select DISTINCT(pm.EMPLOYEERESOURCE)  from PROJECT_ROLE_MAPPING pm where (PROJECT_ROLE = 13 or PROJECT_ROLE = 14)",nativeQuery = true)
	public List<Integer> getPresalesPerson();
	*/
	
	@Query(value="select DISTINCT(pm.EMPLOYEERESOURCE),em.EMP_FIRST_NAME from PROJECT_ROLE_MAPPING pm join EMPLOYEE_MASTER em ON em.EMP_ID = pm.EMPLOYEERESOURCE  where (pm.PROJECT_ROLE = 13 or pm.PROJECT_ROLE = 14) order by em.EMP_FIRST_NAME",nativeQuery = true)
	public List<Integer> getPresalesPerson();
	
	
	@Query(value="select DISTINCT(pm.EMPLOYEERESOURCE)  from PROJECT_ROLE_MAPPING pm where (PROJECT_ROLE = 19)",nativeQuery = true)
	public List<Integer> getBDHead();
	
	@Query(value="SELECT 'TRUE' FROM DUAL WHERE EXISTS (SELECT 'x' FROM PROJECT_ROLE_MAPPING WHERE EMPLOYEERESOURCE = ?1 and PROJECT_ROLE = ?2) UNION SELECT 'FALSE' FROM DUAL WHERE NOT EXISTS (SELECT 'x' FROM PROJECT_ROLE_MAPPING WHERE EMPLOYEERESOURCE = ?3 and PROJECT_ROLE = ?4)",nativeQuery = true)
	public String isBusinessDevelopmentHead(int empid,int projectrole,int empid1,int projectrole1);
	
	@Query(value="SELECT * FROM PROJECT_ROLE_MAPPING WHERE PROJECT_ROLE=15 AND IS_ACTIVATED='Y'",nativeQuery = true)
	public List<ProjectRoleMapping> getSalesManager();
}
