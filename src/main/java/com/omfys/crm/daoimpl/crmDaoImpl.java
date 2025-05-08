package com.omfys.crm.daoimpl;

import java.sql.ResultSet;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.omfys.crm.dao.crmDao;
import com.omfys.crm.model.Countries;
import com.omfys.crm.model.EmployeeMaster;
import com.omfys.crm.model.JoiningInformation;
import com.omfys.crm.model.Lead_to_Customer;

@Repository("crmDaoImpl")
public class crmDaoImpl implements crmDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public boolean isCRMAdmin(EmployeeMaster emp, String userRole) {

		
		boolean flag = false;
		
		String sql = " SELECT CASE "
				+ " WHEN EXISTS (SELECT 1"
				+ " FROM USER_ROLE"
				+ " WHERE EMPLOYEE = "+emp.getEmpid()+" AND USERROLE LIKE '"+userRole+"' AND ISACTIVATED  LIKE 'Y' AND  ROWNUM = 1)"
				+ " THEN 'Y'"
				+ " ELSE 'N'"
				+ " END AS REC_EXISTS"
				+ " FROM DUAL";
		
		
		System.out.println("SQL in isCRMAdmin ==> "+sql);
		
		ArrayList<String> dml2 = (ArrayList<String>) jdbcTemplate.query(sql, new RowMapper<String>(){

			@Override
			public String mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				String flag2 = rs.getString("REC_EXISTS");
				return flag2;
			}
		});	
		
		if(dml2.size() > 0)
		{
			if(dml2.get(0).equals("Y"))
			{
				flag = true;
			}
			else
			{
				flag = false;
			}
		}
		
		return flag;
	
	}

	@Override
	public List<Countries> notInIndia() {
		// TODO Auto-generated method stub
		String sql = "SELECT *FROM COUNTRIES WHERE NAME NOT IN 'India'";
		
		List<Countries> exceptIndia = jdbcTemplate.query(sql, new RowMapper<Countries>() {
			@Override
			public Countries mapRow(ResultSet rs, int rowNum) throws SQLException {
				Countries exceptIndia = new Countries();
				exceptIndia.setCountryid(rs.getInt("countryid"));
				exceptIndia.setName(rs.getString("name"));
				exceptIndia.setCapital(rs.getString("capital"));
				exceptIndia.setPhonecode(rs.getInt("phonecode"));
				exceptIndia.setRegion(rs.getString("region"));
				exceptIndia.setSubregion(rs.getString("subregion"));
				
				return exceptIndia;
			}
		});
		return exceptIndia;
	}

	@Override
	public List<Countries> inIndia() {
		// TODO Auto-generated method stub
String sql = "SELECT *FROM COUNTRIES WHERE NAME IN 'India'";
		
		List<Countries> exceptIndia = jdbcTemplate.query(sql, new RowMapper<Countries>() {
			@Override
			public Countries mapRow(ResultSet rs, int rowNum) throws SQLException {
				Countries exceptIndia = new Countries();
				exceptIndia.setCountryid(rs.getInt("countryid"));
				exceptIndia.setName(rs.getString("name"));
				
				return exceptIndia;
			}
		});
		return exceptIndia;
	}

	@Override
	public List<Lead_to_Customer> leadToCustomer() {

		String sql="select DISTINCT(PR.EMPLOYEERESOURCE),PRM.PROJECT_ROLE_NAME,EMP.EMP_FIRST_NAME,EMP.EMP_LAST_NAME,EMP.EMAIL \r\n" + 
				"from PROJECT_ROLE_MAPPING PR,PROJECT_ROLE_MASTER PRM,EMPLOYEE_MASTER EMP \r\n" + 
				"WHERE PR.PROJECT_ROLE =PRM.PRROLENO AND PR.EMPLOYEERESOURCE=EMP.EMP_ID AND  PR.PROJECT_ROLE IN (1,17,18,20)";
		
		List<Lead_to_Customer> exceptIndia = jdbcTemplate.query(sql, new RowMapper<Lead_to_Customer>() {
			@Override
			public Lead_to_Customer mapRow(ResultSet rs, int rowNum) throws SQLException {
				Lead_to_Customer custmerMail=new Lead_to_Customer();
				custmerMail.setEmployee_resource(rs.getInt("EMPLOYEERESOURCE"));
				custmerMail.setProject_role_master(rs.getString("PROJECT_ROLE_NAME"));
				custmerMail.setFirstname(rs.getString("EMP_FIRST_NAME"));
				custmerMail.setLastname(rs.getString("EMP_LAST_NAME"));
				custmerMail.setEmail(rs.getString("EMAIL"));
				
				return custmerMail;
			}
		});
		return exceptIndia;
	}

	@Override
	public List<Lead_to_Customer> isSalesPerson() {
		// TODO Auto-generated method stub
		
		/*
		String sql="select DISTINCT(EMP.EMP_ID),EMP.ISINTERNATIONAL,PRM.PROJECT_ROLE_NAME,EMP.EMP_FIRST_NAME,EMP.EMP_LAST_NAME,EMP.EMAIL \r\n" + 
				"from PROJECT_ROLE_MAPPING PR,PROJECT_ROLE_MASTER PRM,EMPLOYEE_MASTER EMP \r\n" + 
				"WHERE PR.PROJECT_ROLE =PRM.PRROLENO AND PR.EMPLOYEERESOURCE=EMP.EMP_ID AND  PR.PROJECT_ROLE IN (13,15,16,17) and EMP.IS_ACTIVATED='Y' ORDER BY EMP_FIRST_NAME ASC";
		*/
		
		
		String sql="select DISTINCT(EMP.EMP_ID),EMP.ISINTERNATIONAL,EMP.EMP_FIRST_NAME,EMP.EMP_LAST_NAME,EMP.EMAIL \r\n" + 
				"from PROJECT_ROLE_MAPPING PR,PROJECT_ROLE_MASTER PRM,EMPLOYEE_MASTER EMP \r\n" + 
				"WHERE PR.PROJECT_ROLE =PRM.PRROLENO AND PR.EMPLOYEERESOURCE=EMP.EMP_ID AND  PR.PROJECT_ROLE IN (13,15,16,17) and EMP.IS_ACTIVATED='Y' ORDER BY EMP_FIRST_NAME ASC";
		
		
		
		
		List<Lead_to_Customer> salesPerson = jdbcTemplate.query(sql, new RowMapper<Lead_to_Customer>() {
			@Override
			public Lead_to_Customer mapRow(ResultSet rs, int rowNum) throws SQLException {
				Lead_to_Customer custmerMail=new Lead_to_Customer();
				custmerMail.setEmployee_resource(rs.getInt("EMP_ID"));
				//custmerMail.setProject_role_master(rs.getString("PROJECT_ROLE_NAME"));
				custmerMail.setFirstname(rs.getString("EMP_FIRST_NAME"));
				custmerMail.setLastname(rs.getString("EMP_LAST_NAME"));
				custmerMail.setEmail(rs.getString("EMAIL"));
				custmerMail.setIsinternational(rs.getString("ISINTERNATIONAL"));
				
				return custmerMail;
			}
		});
		return salesPerson;
	}

	@Override
	public List<JoiningInformation> getEmpinformation(int empid) {
		// TODO Auto-generated method stub
		String sql="SELECT DISTINCT(EM.EMP_ID),EM.EMP_CODE,EM.EMAIL,EM.EMP_FIRST_NAME,EM.EMP_LAST_NAME,EM.PROFILE_ID,EM.CREATED_BY,JD.CTC,PD.CONTACT_NUMBER \r\n" + 
				"FROM JOINING_DETAILS JD , EMPLOYEE_MASTER EM, PERSONAL_DETAILS PD \r\n" + 
				"WHERE JD.EMP_ID = EM.EMP_ID AND EM.EMP_ID=PD.EMP_ID AND EM.EMP_ID='"+empid+"' AND EM.IS_ACTIVATED='Y'";
		
		List<JoiningInformation> jd1 = jdbcTemplate.query(sql, new RowMapper<JoiningInformation>() {
			@Override
			public JoiningInformation mapRow(ResultSet rs, int rowNum) throws SQLException {
				JoiningInformation jd=new JoiningInformation();
				jd.setEmpid(rs.getInt("EMP_ID"));
				jd.setEmp_code(rs.getString("EMP_CODE"));
				jd.setEmail(rs.getString("EMAIL"));
				jd.setEmp_first_name(rs.getString("EMP_FIRST_NAME"));
				jd.setEmp_last_name(rs.getString("EMP_LAST_NAME"));
				jd.setProfileid(rs.getInt("PROFILE_ID"));
				jd.setCreatedby(rs.getInt("CREATED_BY"));
				jd.setCtc(rs.getDouble("CTC"));
				jd.setContectnumber(rs.getString("CONTACT_NUMBER"));
				return jd;
			}
		});
		return jd1;
	}

	@Override
	public List<JoiningInformation> getEmpinformation() {
		// TODO Auto-generated method stub
		String sql="SELECT DISTINCT(EM.EMP_ID),EM.EMP_CODE,EM.EMAIL,EM.EMP_FIRST_NAME,EM.EMP_LAST_NAME,EM.PROFILE_ID,EM.CREATED_BY,JD.CTC,PD.CONTACT_NUMBER \r\n" + 
				"FROM JOINING_DETAILS JD , EMPLOYEE_MASTER EM, PERSONAL_DETAILS PD \r\n" + 
				"WHERE JD.EMP_ID = EM.EMP_ID AND EM.EMP_ID=PD.EMP_ID AND EM.IS_ACTIVATED='Y'";
		
		List<JoiningInformation> jd1 = jdbcTemplate.query(sql, new RowMapper<JoiningInformation>() {
			@Override
			public JoiningInformation mapRow(ResultSet rs, int rowNum) throws SQLException {
				JoiningInformation jd=new JoiningInformation();
				jd.setEmpid(rs.getInt("EMP_ID"));
				jd.setEmp_code(rs.getString("EMP_CODE"));
				jd.setEmail(rs.getString("EMAIL"));
				jd.setEmp_first_name(rs.getString("EMP_FIRST_NAME"));
				jd.setEmp_last_name(rs.getString("EMP_LAST_NAME"));
				jd.setProfileid(rs.getInt("PROFILE_ID"));
				jd.setCreatedby(rs.getInt("CREATED_BY"));
				jd.setCtc(rs.getDouble("CTC"));
				jd.setContectnumber(rs.getString("CONTACT_NUMBER"));
				return jd;
			}
		});
		return jd1;
	}

	@Override
	public String getLatestCrmHistoryCallingStatusonId(int crm_id) {
		// TODO Auto-generated method stub
		return null;
	}

	
	

}
