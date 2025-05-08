package com.omfys.crm.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.omfys.crm.model.CRMRecords;

public interface CRMRecordsRespositoty extends JpaRepository<CRMRecords, Integer> {
	
	@Query(value = "SELECT * FROM CRMRECORDS WHERE ISACTIVATED = 'Y' AND CRMTYPE = 'Enquiry' AND ASSIGNETO =?1 order by CRMRECORDID DESC",nativeQuery = true)
	public List<CRMRecords> findAllActivatedEnquiries(int empid);
	
	@Query(value = "SELECT * FROM CRMRECORDS WHERE ISACTIVATED = 'Y' AND CRMTYPE = 'Lead' AND ASSIGNETO =?1 order by CRMRECORDID DESC",nativeQuery = true)
	public List<CRMRecords> findAllActivatedLeads(int empid);
	
	@Query(value = "SELECT * FROM CRMRECORDS WHERE ISACTIVATED = 'Y' AND CRMTYPE = 'PO' AND ASSIGNETO =?1 order by CRMRECORDID DESC",nativeQuery = true)
	public List<CRMRecords> findAllActivatedCustomers(int empid);
	
	public CRMRecords findByCrmrecordid(int crmid);
	
	@Query(value = "SELECT * FROM CRMRECORDS WHERE ISACTIVATED = 'Y' AND CRMTYPE = 'Enquiry' order by CRMRECORDID DESC",nativeQuery = true)
	public List<CRMRecords> findAllActivatedEnquiriesForHr();
	
	@Query(value = "SELECT * FROM CRMRECORDS WHERE ISACTIVATED = 'Y' AND CRMTYPE = 'Lead'  order by CRMRECORDID DESC",nativeQuery = true)
	public List<CRMRecords> findAllActivatedLeadsForHr();
	
	@Query(value = "SELECT * FROM CRMRECORDS WHERE ISACTIVATED = 'Y' AND CRMTYPE = 'PO'  order by CRMRECORDID DESC",nativeQuery = true)
	public List<CRMRecords> findAllActivatedCustomersForHr();
	
	@Query(value = "select * from CRMRECORDS where to_char(sysdate,'yyyy') = to_char(SOURCINGDATE,'yyyy') AND to_char(sysdate,'mm') = to_char(SOURCINGDATE,'mm') AND STATUS =?1 AND ASSIGNETO =?2",nativeQuery = true)
	public List<CRMRecords> findAllLGRForSalesPerson(String crmstatus,int empid);
	
	@Query(value = "select * from CRMRECORDS where to_char(sysdate,'yyyy') = to_char(SOURCINGDATE,'yyyy') AND to_char(sysdate,'mm') = to_char(SOURCINGDATE,'mm') AND STATUS =?1",nativeQuery = true)
	public List<CRMRecords> findAllLGRForAuthority(String crmstatus);
	
	@Query(value = "select * from CRMRECORDS where to_char(sysdate,'yyyy') = to_char(SOURCINGDATE,'yyyy') AND  to_char(SOURCINGDATE,'mm') =?1  AND CRMEVENT =?2 AND ASSIGNETO =?3",nativeQuery = true)
	public List<CRMRecords> findAllEventBasedLGRForSalesPersonMonthly(int month,String crmevent,int empid);
	
	@Query(value = "select * from CRMRECORDS where (to_char(SYSDATE,'YYYY')+1) = (to_char(SOURCINGDATE,'yyyy')+1) AND  to_char(SOURCINGDATE,'mm') =?1  AND CRMEVENT =?2 AND ASSIGNETO =?3",nativeQuery = true)
	public List<CRMRecords> findAllEventBasedLGRForSalesPersonMonthlyJM(int month,String crmevent,int empid);
	
	
	@Query(value = "select * from CRMRECORDS where to_char(sysdate,'yyyy') = to_char(SOURCINGDATE,'yyyy') AND to_char(sysdate,'mm') =?1 AND CRMEVENT =?2",nativeQuery = true)
	public List<CRMRecords> findAllEventBasedLGRForAuthorityMonthly(int month,String crmstatus);
	
	@Query(value = "select * from CRMRECORDS where (to_char(SYSDATE,'YYYY')+1) = (to_char(SOURCINGDATE,'yyyy')+1) AND  to_char(SOURCINGDATE,'mm') =?1  AND CRMEVENT =?2",nativeQuery = true)
	public List<CRMRecords> findAllEventBasedLGRForAuthorityMonthlyJM(int month,String crmstatus);
	
	// get records based on CRM Type as enquiry leads and customer
	
	@Query(value = "select * from CRMRECORDS where  to_char(SOURCINGDATE,'YYYY-mm') =?1  AND CRMTYPE =?2 AND ASSIGNETO =?3",nativeQuery = true)
	public List<CRMRecords> findAllCRMTypeLGRForSalesPersonMonthly(String yearmonth,String crmstatus,int empid);
	
	@Query(value = "select * from CRMRECORDS where  to_char(SOURCINGDATE,'YYYY-mm') =?1  AND CRMTYPE =?2 AND ASSIGNETO =?3",nativeQuery = true)
	public List<CRMRecords> findAllCRMTypeLGRForSalesPersonMonthlyJM(String yearmonth,String crmstatus,int empid);
	
	@Query(value = "select * from CRMRECORDS where  to_char(SOURCINGDATE,'YYYY-mm') =?1  AND CRMTYPE =?2",nativeQuery = true)
	public List<CRMRecords> findAllCRMTypeLGRForAuthorityJM(String yearmonth,String crmstatus);
	
	@Query(value = "select * from CRMRECORDS where  to_char(SOURCINGDATE,'YYYY-mm') =?1  AND CRMTYPE =?2",nativeQuery = true)
	public List<CRMRecords> findAllCRMTypeLGRForAuthority(String yearmonth,String crmstatus);
	
	// get records based on event stages Enquiry, Interested, Not Interested, Lead Qualified, PoC, Proposal Submitted, Waiting for PO, PO, Lost
	
	@Query(value = "select * from CRMRECORDS where  to_char(SOURCINGDATE,'YYYY-mm') =?1  AND PURPOSEOFEVENT =?2 AND ASSIGNETO =?3",nativeQuery = true)
	public List<CRMRecords> findAllPurposeOfEventLGRForSalesPersonMonthly(String yearmonth,String crmstatus,int empid);
	
	@Query(value = "select * from CRMRECORDS where  to_char(SOURCINGDATE,'YYYY-mm') =?1  AND PURPOSEOFEVENT =?2 AND ASSIGNETO =?3",nativeQuery = true)
	public List<CRMRecords> findAllPurposeOfEventLGRForSalesPersonMonthlyJM(String yearmonth,String crmstatus,int empid);
	
	@Query(value = "select * from CRMRECORDS where  to_char(SOURCINGDATE,'YYYY-mm') =?1  AND PURPOSEOFEVENT =?2",nativeQuery = true)
	public List<CRMRecords> findAllPurposeOfEventGRForAuthorityJM(String yearmonth,String crmstatus);
	
	@Query(value = "select * from CRMRECORDS where to_char(SOURCINGDATE,'YYYY-mm') =?1  AND PURPOSEOFEVENT =?2",nativeQuery = true)
	public List<CRMRecords> findAllPurposeOfEventForAuthority(String yearmonth,String crmstatus);
	
	// get records based on STATUS AS “Enquiry” , “Lead” , “Opportunity”, “Pipeline”, “Order”, “Cancelled”        
	
	@Query(value = "select * from CRMRECORDS where  to_char(sysdate,'YYYY-mm') = ?1 AND STATUS =?2",nativeQuery = true)
	public List<CRMRecords> findAllLGRForAuthorityMonthly(String yearmonth,String crmstatus);
	
	@Query(value = "select * from CRMRECORDS where  to_char(sysdate,'YYYY-mm') =?1 AND STATUS =?2",nativeQuery = true)
	public List<CRMRecords> findAllLGRForAuthorityMonthlyJM(String yearmonth,String crmstatus);
	
	@Query(value = "select * from CRMRECORDS where to_char(SOURCINGDATE,'YYYY-mm') =?1  AND STATUS =?2 AND ASSIGNETO =?3",nativeQuery = true)
	public List<CRMRecords> findAllLGRForSalesPersonMonthly(String yearmonth,String crmstatus,int empid);
	
	@Query(value = "select * from CRMRECORDS where to_char(SOURCINGDATE,'YYYY-mm') =?1  AND STATUS =?2 AND ASSIGNETO =?3",nativeQuery = true)
	public List<CRMRecords> findAllLGRForSalesPersonMonthlyJM(String yearmonth,String crmstatus,int empid);
	
	
//	//selected date range
//	@Query(value = "SELECT *FROM CRMRECORDS WHERE TO_CHAR(SOURCINGDATE,'YYYY-MM') >=?1 AND TO_CHAR(SOURCINGDATE,'YYYY-MM') <=?2 AND CRMTYPE =?3 AND ASSIGNETO =?4",nativeQuery = true)
//	public List<CRMRecords> findAllCRMTypeLGRForSalesPersonMonthlyJMBasedonRange(String monthyear,String monthyear1, String string,int empid);
//
//	@Query(value = "SELECT *FROM CRMRECORDS WHERE TO_CHAR(SOURCINGDATE,'YYYY-MM') >=?1 AND TO_CHAR(SOURCINGDATE,'YYYY-MM') <=?2 AND PURPOSEOFEVENT =?3 AND ASSIGNETO =?4",nativeQuery = true)
//	public List<CRMRecords> findAllPurposeOfEventLGRForSalesPersonMonthlyJMBasedonRange(String monthyear,String monthyear1, String string, int empid);
//	
//	@Query(value = "SELECT *FROM CRMRECORDS WHERE TO_CHAR(SOURCINGDATE,'YYYY-MM') >=?1 AND TO_CHAR(SOURCINGDATE,'YYYY-MM') <=?2 AND CRMTYPE =?3 AND ASSIGNETO =?4",nativeQuery = true)
//	public List<CRMRecords> findAllLGRForSalesPersonMonthlyJMbasedonRange(String monthyear,String monthyear1,String crmstatus,int empid);
//
//	//HR
//	@Query(value = "SELECT *FROM CRMRECORDS WHERE TO_CHAR(SOURCINGDATE,'YYYY-MM') >=?1 AND TO_CHAR(SOURCINGDATE,'YYYY-MM') <=?2 AND CRMTYPE =?3",nativeQuery = true)
//	public List<CRMRecords> findAllCRMTypeLGRForSalesPersonMonthlyJMBasedonRangeHr(String monthyear1,String monthyear12, String string);
//
//	@Query(value = "SELECT *FROM CRMRECORDS WHERE TO_CHAR(SOURCINGDATE,'YYYY-MM') >=?1 AND TO_CHAR(SOURCINGDATE,'YYYY-MM') <=?2 AND PURPOSEOFEVENT =?3",nativeQuery = true)
//	public List<CRMRecords> findAllPurposeOfEventLGRForSalesPersonMonthlyJMBasedonRangeHr(String monthyear1,String monthyear12, String string);
//
//	
//	@Query(value = "SELECT *FROM CRMRECORDS WHERE TO_CHAR(SOURCINGDATE,'YYYY-MM') >=?1 AND TO_CHAR(SOURCINGDATE,'YYYY-MM') <=?2 AND CRMTYPE =?3",nativeQuery = true)
//	public List<CRMRecords> findAllCRMTypeLGRForSalesPersonMonthlyJMBasedonRange(String monthyear1, String monthyear12,String string);
//
//	@Query(value = "SELECT *FROM CRMRECORDS WHERE TO_CHAR(SOURCINGDATE,'YYYY-MM') >=?1 AND TO_CHAR(SOURCINGDATE,'YYYY-MM') <=?2 AND CRMTYPE =?3",nativeQuery = true)
//	public List<CRMRecords> findAllLGRForSalesPersonMonthlyJMbasedonRange(String monthyear1, String monthyear12,String string);

	
	//new for employee proper working dashbord
	@Query(value = "select * from CRMRECORDS where to_char(SOURCINGDATE,'YYYY-mm') =?1 AND CRMTYPE =?2 AND ASSIGNETO =?3",nativeQuery = true)
	public List<CRMRecords> findAllCRMTypeLGRForSalesPersonMonthlyJM2(String startDate1, String string, int empid);

	@Query(value = "select * from CRMRECORDS where  to_char(SOURCINGDATE,'YYYY-mm') =?1 AND PURPOSEOFEVENT =?2 AND ASSIGNETO =?3",nativeQuery = true)
	public List<CRMRecords> findAllPurposeOfEventLGRForSalesPersonMonthlyJM2(String startDate1, String string,int empid);

	@Query(value = "select * from CRMRECORDS where to_char(SOURCINGDATE,'YYYY-mm') =?1 AND STATUS =?2 AND ASSIGNETO =?3",nativeQuery = true)
	public List<CRMRecords> findAllLGRForSalesPersonMonthlyJM2(String startDate1, String string, int empid);

	
	//All Employee
	@Query(value = "select * from CRMRECORDS where to_char(SOURCINGDATE,'YYYY-mm') =?1 AND CRMTYPE =?2",nativeQuery = true)
	public List<CRMRecords> findAllCRMTypeLGRForSalesPersonMonthlyJM3(String startDate1, String string);

	@Query(value = "select * from CRMRECORDS where to_char(SOURCINGDATE,'YYYY-mm') =?1 AND STATUS =?2",nativeQuery = true)
	public List<CRMRecords> findAllLGRForSalesPersonMonthlyJM3(String startDate1, String string);

	@Query(value = "select * from CRMRECORDS where  to_char(SOURCINGDATE,'YYYY-mm') =?1 AND PURPOSEOFEVENT =?2",nativeQuery = true)
	public List<CRMRecords> findAllPurposeOfEventLGRForSalesPersonMonthlyJM3(String startDate1, String string);
	
	@Query(value = "select * from CRMRECORDS where STATUS=?1",nativeQuery = true)
	public List<CRMRecords> findAllCancelledCrmRecords(String crmtype);
	
	@Query(value = "select * from CRMRECORDS where STATUS=?1 and ASSIGNETO=?2",nativeQuery = true)
	public List<CRMRecords> findAllCancelledCrmRecordsByEmpId(String crmtype , int empid);
	
	//this based on range dates
	@Query(value = "SELECT * FROM CRMRECORDS WHERE ISACTIVATED = 'Y' AND CRMTYPE = 'Enquiry' AND ASSIGNETO =?1\r\n" + 
			"and TO_CHAR(CREATIONDATE,'YYYY-MM-DD')>=?2 AND TO_CHAR(CREATIONDATE,'YYYY-MM-DD') <=?3\r\n" + 
			"order by CRMRECORDID DESC",nativeQuery = true)
	public List<CRMRecords> findAllActivatedEnquiriesBasedonRanges(int empid,String start_date,String end_date);
	
	
	//This based on data range calling status
	@Query(value = "SELECT * FROM CRMRECORDS WHERE ISACTIVATED = 'Y' AND CRMTYPE = 'Enquiry' AND ASSIGNETO =?1\r\n" + 
			"and TO_CHAR(CREATIONDATE,'YYYY-MM-DD')>=?2 AND TO_CHAR(CREATIONDATE,'YYYY-MM-DD') <=?3\r\n" + 
			"AND CALLING_STATUS=?4\r\n" + 
			"order by CRMRECORDID DESC",nativeQuery = true)
	public List<CRMRecords> findAllActivatedEnquiriesBasedonrangeandstatus(int empid,String start_date,String end_date,String status);
	
	//Based on calling status
	@Query(value = "SELECT * FROM CRMRECORDS WHERE ISACTIVATED = 'Y' AND CRMTYPE = 'Enquiry' AND ASSIGNETO =?1 \r\n" + 
			"AND CALLING_STATUS=?2\r\n" + 
			"order by CRMRECORDID DESC ",nativeQuery = true)
	public List<CRMRecords> findAllbasedoncallingstatus(int empid,String status);
	
	
}
