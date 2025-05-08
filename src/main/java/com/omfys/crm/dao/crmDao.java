package com.omfys.crm.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.omfys.crm.model.Countries;
import com.omfys.crm.model.EmployeeMaster;
import com.omfys.crm.model.JoiningInformation;
import com.omfys.crm.model.Lead_to_Customer;

@Repository("crmDao")
public interface crmDao {
	
	public boolean isCRMAdmin(EmployeeMaster emp, String userRole);
	
	public List<Countries> notInIndia();
	
	public List<Countries> inIndia();
	
	public List<Lead_to_Customer> leadToCustomer();
	
	public List<Lead_to_Customer> isSalesPerson();
	
	public List<JoiningInformation> getEmpinformation(int empid);

	public List<JoiningInformation> getEmpinformation();
	
	public String getLatestCrmHistoryCallingStatusonId(int crm_id);	
	
	
}
