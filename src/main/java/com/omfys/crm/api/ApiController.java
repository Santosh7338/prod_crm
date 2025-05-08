package com.omfys.crm.api;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections4.map.HashedMap;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.omfys.crm.Repository.CRMEventsRepository;
import com.omfys.crm.Repository.CRMRecordsContactsRepository;
import com.omfys.crm.Repository.CRMRecordsRespositoty;
import com.omfys.crm.Repository.CountriesRepository;
import com.omfys.crm.Repository.DistrictMasterRepository;
import com.omfys.crm.Repository.EmployeeMasterRepository;
import com.omfys.crm.Repository.JoiningDetailsReposiory;
import com.omfys.crm.Repository.LeadDocumentsRepository;
import com.omfys.crm.Repository.MainterritoryRepository;
import com.omfys.crm.Repository.RegionRepositroy;
import com.omfys.crm.Repository.StateMasterRepository;
import com.omfys.crm.Repository.StatusOfEventRepository;
import com.omfys.crm.Repository.SubterritoryRepository;
import com.omfys.crm.Repository.TerritoryRepository;
import com.omfys.crm.apis.responsedto.GlobalResponse;
import com.omfys.crm.dao.crmDao;
import com.omfys.crm.daoimpl.crmDaoImpl;
import com.omfys.crm.model.CRMEvents;
import com.omfys.crm.model.CRMRecords;
import com.omfys.crm.model.CRMRecordsContacts;
import com.omfys.crm.model.Countries;
import com.omfys.crm.model.DistrictMaster;
import com.omfys.crm.model.EmployeeMaster;
import com.omfys.crm.model.JoiningDetails;
import com.omfys.crm.model.JoiningInformation;
import com.omfys.crm.model.LeadDocuments;
import com.omfys.crm.model.Lead_to_Customer;
import com.omfys.crm.model.Main_Territory;
import com.omfys.crm.model.ProjectRoleMapping;
import com.omfys.crm.model.Region;
import com.omfys.crm.model.StateMaster;
import com.omfys.crm.model.StatusOfEvent;
import com.omfys.crm.model.SubTerritory;
import com.omfys.crm.model.TerritorySetup;




@RestController
public class ApiController {
	
	@Autowired
	CRMRecordsRespositoty crmrecordsRespositoty;

	@Autowired
	JoiningDetailsReposiory joiningDetailsReposiory;
	
	@Autowired
	CRMRecordsContactsRepository crmRecordsContactsRepository;
	
	@Autowired
	StatusOfEventRepository statusOfEventRepository;
	
	@Autowired
	LeadDocumentsRepository leaddocumentsRepository;
	
	@Autowired
	CRMEventsRepository crmeventsRepository;
	
	@Autowired
	StateMasterRepository stateMasterRepository;
	
	@Autowired
	DistrictMasterRepository districtmasterRepository;
	
	@Autowired
	EmployeeMasterRepository employeeMasterRepository;
	
	@Autowired
	TerritoryRepository territoryRepository;
	
	@Autowired
	MainterritoryRepository mainterritoryRepository;
	
	@Autowired
	SubterritoryRepository subterritoryRepository;
	
	@Autowired
	RegionRepositroy regionRepositroy;
	
	@Autowired
	crmDao    crmdao;
	
	
	
	@Autowired
	com.omfys.crm.Repository.ProjectRoleMappingRepository projectRoleMappingRepository; 
	
	@Autowired
	crmDao crmDao;
	
	@Autowired
	CountriesRepository countriesRepository;
	
	private final static Logger LOGGER =  Logger.getLogger(Logger.GLOBAL_LOGGER_NAME);
	
	@RequestMapping(value = "/getDetailsToaddEvent", method = RequestMethod.GET)
	public ResponseEntity<Object> findDetailsToaddEvent(@RequestParam Integer crmid)
	{
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
		
		CRMRecords crmrecords = crmrecordsRespositoty.findByCrmrecordid(crmid);
		
		if(crmrecords.getForecastclose() != null)
		{
			String strDate = formatter.format(crmrecords.getForecastclose());  
			
//			System.out.println("Date Format with MM/dd/yyyy : "+strDate); 
			
			crmrecords.setForecastdatestr(strDate);
			
			strDate= null;
		}
		
		if(crmrecords.getPodate() != null)
		{
			String strDate = formatter.format(crmrecords.getPodate());  
			
			crmrecords.setPodatestr(strDate);
			
			strDate = null;
		}
		
		if(crmrecords.getPrimarysalesperson() != null)
		{
			EmployeeMaster emp = employeeMasterRepository.findByEmpid(crmrecords.getPrimarysalesperson().getEmpid());
			crmrecords.setPrimarysalespersonname(emp.getEmpfirstname()+" "+emp.getEmplastname());
			crmrecords.setPrimarysalespersonid(emp.getEmpid());
			emp= null;
			
		}
		else
		{
			crmrecords.setPrimarysalespersonname("Not Applicable");
			crmrecords.setPrimarysalespersonid(0);
		}
		
		if(crmrecords.getSecondarysalesperson() != null)
		{
			EmployeeMaster emp = employeeMasterRepository.findByEmpid(crmrecords.getSecondarysalesperson().getEmpid());
			crmrecords.setSecondarysalespersonname(emp.getEmpfirstname()+" "+emp.getEmplastname());
			crmrecords.setSecondarysalespersonid(emp.getEmpid());
			emp = null;
		}
		else
		{
			crmrecords.setSecondarysalespersonname("Not Applicable");
			crmrecords.setSecondarysalespersonid(0);
		}
		
		if(crmrecords.getPresalesperson() != null)
		{
			EmployeeMaster emp = employeeMasterRepository.findByEmpid(crmrecords.getPresalesperson().getEmpid());
			crmrecords.setPresalespersonname(emp.getEmpfirstname()+" "+emp.getEmplastname());
			crmrecords.setPresalespersonid(emp.getEmpid());
			emp = null;
		}
		else
		{
			crmrecords.setPresalespersonname("Not Applicable");
			crmrecords.setPresalespersonid(0);
		}
		
		if(crmrecords.getBdhead() != null)
		{
			EmployeeMaster emp = employeeMasterRepository.findByEmpid(crmrecords.getBdhead().getEmpid());
			crmrecords.setBdheadname(emp.getEmpfirstname()+" "+emp.getEmplastname());
			crmrecords.setBdheadid(emp.getEmpid());
			emp = null;
		}
		else
		{
			crmrecords.setBdheadname("Not Applicable");
			crmrecords.setBdheadid(0);
		}
		System.out.println("COMPANY NAME ::::::::::::::::::: "+crmrecords.getCompanyname());
		return new ResponseEntity<Object>(crmrecords, HttpStatus.OK);
		
	}
	
	@RequestMapping(value = "/getContactDetails", method = RequestMethod.GET)
	public ResponseEntity<Object> findContactDetails(@RequestParam Integer crmid)
	{
		List<CRMRecordsContacts> crmrecordsContacts= crmRecordsContactsRepository.findByCrmrecordsid(crmid);
		if(crmrecordsContacts.size() > 0)
		{
			crmrecordsContacts.get(0).setContactsize(crmrecordsContacts.size());
		}
		
		
		return new ResponseEntity<Object>(crmrecordsContacts, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/getstatusofcrmevents", method = RequestMethod.GET)
	public ResponseEntity<Object> findstatusofcrmevents(@RequestParam String recordstitle)
	{
		List<StatusOfEvent> statusofevents = null;
		
		if(recordstitle.equalsIgnoreCase("Enquiry"))
		{
			statusofevents = statusOfEventRepository.getstatusforenquiry();
		}
		else if(recordstitle.equalsIgnoreCase("Lead"))
		{
			statusofevents = statusOfEventRepository.getstatusforlead();
		}
		
		return new ResponseEntity<Object>(statusofevents, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/deletecrmrecord", method = RequestMethod.GET)
	public ResponseEntity<Object> deletecrmRecords(@RequestParam Integer crmid)
	{
        GlobalResponse globlaResponse = new GlobalResponse();
		try
		{
			CRMRecords crmrecords = crmrecordsRespositoty.findByCrmrecordid(crmid);
			
			crmrecords.setIsactivated("N");
			
			crmrecords.setLastupdateddate(new Date());
			
			crmrecordsRespositoty.save(crmrecords);
			
			globlaResponse.setErrorCode("204");
			globlaResponse.setErrorDescription("deletesuccess");
		    
		    return new ResponseEntity<Object>(globlaResponse, HttpStatus.OK);
		}
		catch(Exception e)
		{
			globlaResponse.setErrorCode("204");
			globlaResponse.setErrorDescription("deletefailure");
		    return new ResponseEntity<Object>(globlaResponse, HttpStatus.OK);
		}
	}
	
	@RequestMapping(value = "/deleteContactDetails", method = RequestMethod.GET)
	public ResponseEntity<Object> deleteContactDetails(@RequestParam Integer enqcontid,@RequestParam Integer crmid)
	{
		
		GlobalResponse globlaResponse = new GlobalResponse();
		
		try
		{
			CRMRecordsContacts crmrecordsContact = crmRecordsContactsRepository.getOne(enqcontid);
			
//			System.out.println("crmrecordsContact to delete "+crmrecordsContact.getContactname());
			
		    crmRecordsContactsRepository.delete(crmrecordsContact);
		    
		    List<CRMRecordsContacts> crmrecordsContacts= crmRecordsContactsRepository.findByCrmrecordsid(crmid);
		    
			if(crmrecordsContacts.size() > 0)
			{
				globlaResponse.setContactsize(crmrecordsContacts.size());
			}
			else
			{
				globlaResponse.setContactsize(0);
			}
		    
		    globlaResponse.setErrorCode("204");
			globlaResponse.setErrorDescription("successcon");
		    
		    return new ResponseEntity<Object>(globlaResponse, HttpStatus.OK);
		}
		catch(Exception e)
		{
			
			globlaResponse.setErrorCode("204");
			globlaResponse.setErrorDescription("failcon");
		    
		    return new ResponseEntity<Object>(globlaResponse, HttpStatus.OK);
		}
	}
	
	@RequestMapping(value = "/downloadLeadDocument", method = RequestMethod.GET)
	public ResponseEntity<Object> downloadLeadDocument(@RequestParam String doc_id)
	{
		int docment_id = Integer.parseInt(doc_id);
		
		LeadDocuments leaddocument = leaddocumentsRepository.getOne(docment_id);
		
		return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(leaddocument.getFiletype()))
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + leaddocument.getFilename() + "\"")
                .body(new ByteArrayResource(leaddocument.getDocumentupload()));
	}
	
	@RequestMapping(value = "/getDocumentDetails", method = RequestMethod.GET)
	public ResponseEntity<Object> getDocumentDetails(@RequestParam Integer crmid)
	{
		List<LeadDocuments> leaddocuments = leaddocumentsRepository.findByCrmrecordid(crmid);
		
		if(leaddocuments.size() > 0)
		{
			leaddocuments.get(0).setDocsize(leaddocuments.size());
		}
		
        return new ResponseEntity<Object>(leaddocuments, HttpStatus.OK);
		
	}
	
	@RequestMapping(value = "/deleteLeadDocument", method = RequestMethod.GET)
	public ResponseEntity<Object> deleteLeadDocument(@RequestParam Integer docloadid,@RequestParam Integer crmid)
	{
	    GlobalResponse globlaResponse = new GlobalResponse();
		try
		{
			LeadDocuments Leaddocuments = leaddocumentsRepository.getOne(docloadid);
			leaddocumentsRepository.delete(Leaddocuments);
			
			List<LeadDocuments> leaddocuments = leaddocumentsRepository.findByCrmrecordid(crmid);
			
			if(leaddocuments.size() > 0)
			{
				globlaResponse.setDocsize(leaddocuments.size());
			}
		    
		    globlaResponse.setErrorCode("204");
			globlaResponse.setErrorDescription("successloaddoc");
		    
		    return new ResponseEntity<Object>(globlaResponse, HttpStatus.OK);
		}
		catch(Exception e)
		{
			globlaResponse.setErrorCode("204");
			globlaResponse.setErrorDescription("failloaddoc");
		    return new ResponseEntity<Object>(globlaResponse, HttpStatus.OK);
		}
	}
	
	@RequestMapping(value = "/getEventsDetails", method = RequestMethod.GET)
	public ResponseEntity<Object> getEventsDetails(@RequestParam Integer crmid)
	{
		
//	   SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH.mm.ss");

	   SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy HH.mm.ss");
		List<CRMEvents> crmevents = crmeventsRepository.findAllByCrmrecordid(crmid);
		
		for(int i=0;i<crmevents.size();i++)
		{
//			System.out.println("date "+crmevents.get(i).getCrmeventdate());
			
			if(crmevents.get(i).getCrmeventdate() != null)
			{
//				System.out.println("date1 "+sdf1.format(crmevents.get(i).getCrmeventdate()));
				
				sdf1.format(crmevents.get(i).getCrmeventdate()); 
				
				crmevents.get(i).setCrmeventstrdate(sdf1.format(crmevents.get(i).getCrmeventdate()));
			}
			
			 
		}
		
		return new ResponseEntity<Object>(crmevents, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/getStateList", method = RequestMethod.GET)
	public ResponseEntity<Object> getStateList(@RequestParam String country)
	{
		int conid  = Integer.parseInt(country);
		
		List<StateMaster> statemaster  =  stateMasterRepository.findByCountryid(conid);
		
        return new ResponseEntity<Object>(statemaster, HttpStatus.OK);
		
	}
	
	@RequestMapping(value = "/getCityList", method = RequestMethod.GET)
	public ResponseEntity<Object> getCityList(@RequestParam Integer instate)
	{
		List<DistrictMaster> districtmaster  =  districtmasterRepository.findByStateid(instate);
        return new ResponseEntity<Object>(districtmaster, HttpStatus.OK);
		
	}
	
	@RequestMapping(value = "/getDealDetails", method = RequestMethod.GET)
	public ResponseEntity<Object> getDealDetails(@RequestParam Integer crmid)
	{
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
		
		String neednydate = "", podate = "";
		
		List<CRMEvents> crmrvents = crmeventsRepository.findAllEventsForCustomer(crmid,"PO");
		
		for(int i=0;i<crmrvents.size();i++)
		{
			if(crmrvents.get(i).getPodate() != null)
			{
				podate = formatter.format(crmrvents.get(i).getPodate());
				crmrvents.get(i).setCrmpodatestr(podate);
			}
			
			if(crmrvents.get(i).getNeedbyDate()!= null)
			{
				neednydate = formatter.format(crmrvents.get(i).getNeedbyDate());
				crmrvents.get(i).setNeedbydatestr(neednydate);
			}
		}
		
		return new ResponseEntity<Object>(crmrvents, HttpStatus.OK);
		
	}
	
	
	
	@RequestMapping(value = "/bsapi", method = RequestMethod.GET)
	public void basapi() throws IOException
	{
	URL url = new URL("http://15.206.16.104:6614/Api/SalesOrder/PostCRMDetails");
	HttpURLConnection http = (HttpURLConnection)url.openConnection();
	http.setRequestMethod("POST");
	http.setDoOutput(true);
	http.setRequestProperty("Content-Type", "application/json");

	String data = "{\n   \"CRMRECORDID\":1,\n  "
			+ " \"ANNUALTURNOVER \":\"555\",\n "
			+ "  \"COMPANYNAME \":\"abcd2\",\n "
			+ "  \"CRMEVENT \":\"PO\",\n   "
			+ "\"CRMTYPE \":\"3\",\n   "
			+ "\"EMPLOYEESIZE \":\"33\",\n  "
			+ " \"OFFERING \":\"56\",\n  "
			+ " \"PURPOSEOFEVENT\":\"23\",\n  "
			+ " \"STATUS \":\"Open\",\n   "
			+ "\"CHANCEOFSALE \":\"string\",\n  "
			+ " \"POTENTIALOPP \":0,\n  "
			+ " \"PROJECTDESCRIPTION \":\"string\",\n   "
			+ "\"POAMOUNT \":0,\n   "
			+ "\"PODATE\":\"2023-02-08\",\n   "
			+ "\"PONUMBER \":33,\n   "
			+ "\"BDHEAD \":1,\n   "
			+ "\"PRESALESPERSON\":2,\n   "
			+ "\"PRIMARYSALESPERSON \":3,\n   "
			+ "\"SECONDARYSALESPERSON \":1,\n   "
			+ "\"PRESALESPERSONName \":\"s\",\n   "
			+ "\"PRIMARYSALESPERSOName  \":\"a\",\n   "
			+ "\"SECONDARYSALESPERSOName  \":\"n\",\n   "
			+ "\"site_name  \":\"t\",\n   "
			+ "\"billtoaddrss  \":\"o\",\n   "
			+ "\"GSTRegNo  \":\"s\",\n   "
			+ "\"item   \":\"h\",\n   "
			+ "\"quantity  \":\"M\"\n}";

	byte[] out = data.getBytes(StandardCharsets.UTF_8);

	OutputStream stream = http.getOutputStream();
	stream.write(out);

	System.out.println(http.getResponseCode() + " " + http.getResponseMessage());
	http.disconnect();

}
	
	@RequestMapping(value = "/getExceptIndia", method = RequestMethod.GET)
	public ResponseEntity<Object> getExceptIndia()
	{
		List<Countries> districtmaster  = crmDao.notInIndia();
        return new ResponseEntity<Object>(districtmaster, HttpStatus.OK);
		
	}
	
	@RequestMapping(value = "/getOnlyIndia", method = RequestMethod.GET)
	public ResponseEntity<Object> getOnlyIndia()
	{
		List<Countries> districtmaster  = crmDao.inIndia();
		
        return new ResponseEntity<Object>(districtmaster, HttpStatus.OK);
		
	}
	
	@RequestMapping(value = "/getEmployees", method = RequestMethod.GET)
	public ResponseEntity<Object> getEmployeedetails(@RequestParam String empid)
	{
		
		EmployeeMaster emp = employeeMasterRepository.findByEmpid(Integer.valueOf(empid));
		
        return new ResponseEntity<Object>(emp, HttpStatus.OK);
		
	}
	
	@RequestMapping(value = "/getEventDetails", method = RequestMethod.GET)
	public ResponseEntity<Object> getEventDetails(@RequestParam Integer crmeventid)
	{
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
		
		String neednydate = "", podate = "";
		
		List<CRMEvents> crmrvents = crmeventsRepository.findCrmEventdetail(crmeventid);
		
		for(int i=0;i<crmrvents.size();i++)
		{
			if(crmrvents.get(i).getPodate() != null)
			{
				podate = formatter.format(crmrvents.get(i).getPodate());
				crmrvents.get(i).setCrmpodatestr(podate);
			}
			
			if(crmrvents.get(i).getNeedbyDate()!= null)
			{
				neednydate = formatter.format(crmrvents.get(i).getNeedbyDate());
				crmrvents.get(i).setNeedbydatestr(neednydate);
			}
		}
		
		return new ResponseEntity<Object>(crmrvents, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/getCrmEventDocumentDetails", method = RequestMethod.GET)
	public ResponseEntity<Object> getCrmEventDocumentDetails1(@RequestParam Integer crmeventid)
	{
		List<LeadDocuments> leaddocuments = leaddocumentsRepository.findByCrmEventid(crmeventid);
		
		if(leaddocuments.size() > 0)
		{
			leaddocuments.get(0).setDocsize(leaddocuments.size());
		}
		
        return new ResponseEntity<Object>(leaddocuments, HttpStatus.OK);
		
	}
	
	@RequestMapping(value = "/getcrmeventdetails", method = RequestMethod.GET)
	public ResponseEntity<Object> getcrmeventDetails(@RequestParam Integer crmid)
	{
		
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
		
		String neednydate = "", podate = "";
		
		List<CRMEvents> crmrvents = crmeventsRepository.findAllEventsForCustomer(crmid,"PO");
		
		for(int i=0;i<crmrvents.size();i++)
		{
			if(crmrvents.get(i).getPodate() != null)
			{
				podate = formatter.format(crmrvents.get(i).getPodate());
				crmrvents.get(i).setCrmpodatestr(podate);
			}
			
			if(crmrvents.get(i).getNeedbyDate()!= null)
			{
				neednydate = formatter.format(crmrvents.get(i).getNeedbyDate());
				crmrvents.get(i).setNeedbydatestr(neednydate);
			}
			List<LeadDocuments> leaddocuments = leaddocumentsRepository.findByCrmEventid(crmrvents.get(i).getCrmeventid());
			
			if(leaddocuments.size()!=0) {
				crmrvents.get(i).setCrmeventids(leaddocuments.get(0).getLeaddocumentid());
			}
			
		}
		
		return new ResponseEntity<Object>(crmrvents, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/getterritorysetup", method = RequestMethod.GET)
	public ResponseEntity<Object> getterritorusetupbasedonid(@RequestParam Integer tr_id)
	{
		List<TerritorySetup> trdetails = territoryRepository.findByCrmterritoryid(tr_id);
		
		return new ResponseEntity<Object>(trdetails, HttpStatus.OK);
	}
	
	
	@RequestMapping(value = "/getAssignedterritory", method = RequestMethod.GET)
	public ResponseEntity<Object> getAssignedterritory(@RequestParam Integer assigned_id)
	{
		List<Main_Territory> mainterritory = mainterritoryRepository.findByAssignedEmpid(assigned_id);
		
		return new ResponseEntity<Object>(mainterritory, HttpStatus.OK);
	}
	
//	@RequestMapping(value = "/getAssignedterritoryisactivated", method = RequestMethod.GET)
//	public ResponseEntity<Object> getAssignedterritoryisactivated(@RequestParam Integer assigned_id)
//	{
//		List<Main_Territory> mainterritory = mainterritoryRepository.findByAssignedEmpid(assigned_id);
//		
//		Main_Territory mt=new Main_Territory();
//		
//		for(int i=0;i<mainterritory.size();i++) {
//			
//			if(mainterritory.get(i).getTr_id().getIs_activated().equalsIgnoreCase("N")) {
//				mainterritory.clear();
//			};
//			
//		}
//		
//		return new ResponseEntity<Object>(mainterritory, HttpStatus.OK);
//	}
	
	
	@RequestMapping(value = "/getcountrylist", method = RequestMethod.GET)
	public ResponseEntity<Object> getcountrylist()
	{
		List<Countries> districtmaster  = countriesRepository.findByOrderByNameAsc();
		
        return new ResponseEntity<Object>(districtmaster, HttpStatus.OK);
	}
	
	
	@RequestMapping(value = "/getassignedcountrylist", method = RequestMethod.GET)
	public ResponseEntity<Object> getassignedcountrylist(@RequestParam Integer assigned_id)
	{
		List<SubTerritory> assignedcountry  = subterritoryRepository.getCounntrybasedonid(assigned_id);
		
        return new ResponseEntity<Object>(assignedcountry, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/getCurrecydetails", method = RequestMethod.GET)
	public ResponseEntity<Object> getCurrecydetails(@RequestParam Integer countryid)
	{
		List<Region> currency = regionRepositroy.getCountryid(countryid);
		
		return new ResponseEntity<Object>(currency, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/getregiondetails", method = RequestMethod.GET)
	public ResponseEntity<Object> getregiondetails(@RequestParam Integer rg_id)
	{
		List<Region> currency = regionRepositroy.getRegionDetails(rg_id);
		
		return new ResponseEntity<Object>(currency, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/getorderdetails", method = RequestMethod.GET)
	public ResponseEntity<Object> findAllActivatedCustomersForHr()
	{
		List<CRMRecords> currency = crmrecordsRespositoty.findAllActivatedCustomersForHr();
		
		return new ResponseEntity<Object>(currency, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/getsalesmanager", method = RequestMethod.GET)
	public ResponseEntity<Object> GetSalesManager()
	{
		List<ProjectRoleMapping> salesmanagers = projectRoleMappingRepository.getSalesManager();
		
		return new ResponseEntity<Object>(salesmanagers, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/getmainterritory", method = RequestMethod.GET)
	public ResponseEntity<Object> getMainterritory(@RequestParam Integer main_tr_id)
	{
		List<Main_Territory> mainterritory = mainterritoryRepository.findByMainterritory(main_tr_id);
		
		return new ResponseEntity<Object>(mainterritory, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/getcountrybasedonid", method = RequestMethod.GET)
	public ResponseEntity<Object> getcountrybasedonid(@RequestParam Integer country)
	{
		
        Countries country1  = countriesRepository.findByCountryid(country);
        
        List<Countries> Countries= new ArrayList<Countries>();
        
        Countries.add(country1);
        
        System.out.println("country is present====>"+Countries);
		
        return new ResponseEntity<Object>(Countries, HttpStatus.OK);
		
	}
	
	@RequestMapping(value = "/employeeinformation", method = RequestMethod.GET)
	public ResponseEntity<Object> getemployeeinformation(@RequestParam Integer empid)
	{
		
		List<JoiningInformation> jd  = crmDao.getEmpinformation(empid);
		
		JoiningInformation t =new JoiningInformation();
		for(int i=0;i<jd.size();i++) {
		t.setEmpid(jd.get(i).getEmpid());
		t.setEmp_code(jd.get(i).getEmp_code());
		t.setEmail(jd.get(i).getEmail());
		t.setEmp_first_name(jd.get(i).getEmp_first_name());
		t.setEmp_last_name(jd.get(i).getEmp_last_name());
		t.setProfileid(jd.get(i).getProfileid());
		t.setCreatedby(jd.get(i).getCreatedby());
		t.setCtc(jd.get(i).getCtc());
		}
		
        return new ResponseEntity<Object>(t, HttpStatus.OK);
	}

	@RequestMapping(value = "/empdetails", method = RequestMethod.GET)
	public ResponseEntity<Object> getemployeeinformation1()
	{
		
		List<JoiningInformation> jd  = crmDao.getEmpinformation();
		
		List<JoiningInformation> jd1  = new ArrayList<JoiningInformation>();
		
		for(int i=0;i<jd.size();i++) {
			JoiningInformation t =new JoiningInformation();
			t.setEmpid(jd.get(i).getEmpid());
			t.setEmp_code(jd.get(i).getEmp_code());
			t.setEmail(jd.get(i).getEmail());
			t.setEmp_first_name(jd.get(i).getEmp_first_name());
			t.setEmp_last_name(jd.get(i).getEmp_last_name());
			t.setProfileid(jd.get(i).getProfileid());
			t.setCreatedby(jd.get(i).getCreatedby());
			t.setCtc(jd.get(i).getCtc());
			
			jd1.add(t);

		}
		
        return new ResponseEntity<Object>(jd1, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/issalesPerson", method = RequestMethod.GET)
	public ResponseEntity<Object> issalesPerson()
	{
		
		List<Lead_to_Customer> issalesPerson=crmdao.isSalesPerson();
		
        return new ResponseEntity<Object>(issalesPerson, HttpStatus.OK);
	}
	
	
	@RequestMapping(value = "/employeeinformationbasedonid", method = RequestMethod.GET)
	public ResponseEntity<Object> employeeinformation(@RequestParam Integer empid)
	{
		
		List<EmployeeMaster> emp  = employeeMasterRepository.getemployeebasedonid(empid);
		
		System.out.println("==============>"+emp);
		
        return new ResponseEntity<Object>(emp, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/getcountryid", method = RequestMethod.GET)
	public ResponseEntity<Object> getCountryid(@RequestParam Integer countryid)
	{
		List<TerritorySetup> trsetup = territoryRepository.findByCrmCoutryid(countryid);
		
		return new ResponseEntity<Object>(trsetup, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/getterritoryidbasedonmainterriotry", method = RequestMethod.GET)
	public ResponseEntity<Object> getMainterritory1(@RequestParam Integer tr_id)
	{
		List<Main_Territory> mainterritory = mainterritoryRepository.findByterrirotryid(tr_id);
		
		return new ResponseEntity<Object>(mainterritory, HttpStatus.OK);
	}
	
	
	@RequestMapping(value = "/bsapi11", method = RequestMethod.GET)
	public void basapi1() throws IOException
	{
		
		String line="";
		 String res="";
		
		 URL urlForGetRequest = new URL("https://raw.githubusercontent.com/samayo/country-json/master/src/country-by-currency-code.json");
		    String readLine = null;
		    HttpURLConnection conection = (HttpURLConnection) urlForGetRequest.openConnection();
		    conection.setRequestMethod("GET");
		    int responseCode = conection.getResponseCode();

		    if (responseCode == HttpURLConnection.HTTP_OK) {
		        BufferedReader in = new BufferedReader(
		            new InputStreamReader(conection.getInputStream()));
		        StringBuffer response = new StringBuffer();
		        while ((readLine = in .readLine()) != null) {
		            response.append(readLine);
		            res+=readLine;
		        } 
		        in .close();
		        // print result
		        JSONObject parent=new JSONObject();
		        parent.put("values", res);
		        
		        
		        String json = res;
		        ObjectMapper mapper = new ObjectMapper();
		        Map<String, Object> map = new HashMap<String, Object>();
		        // convert JSON string to Map
		        map = mapper.readValue(json, new TypeReference<Map<String, Object>>() {});		        
		        
		        for (Map.Entry<String,Object> entry : map.entrySet()) {
		            	System.out.println("============+"+entry.getKey()+" "+entry.getValue());
		        }
		       
		        //GetAndPost.POSTRequest(response.toString());
		    } else {
		        System.out.println("GET NOT WORKED");
		    }

	}
	
	
	@RequestMapping(value = "/getCrmorderdsforicm123")
	public void getfreaquentleaves(HttpServletRequest request, Model model, HttpServletResponse response) throws IOException {
	{
		List<CRMRecords> crmrecords = crmrecordsRespositoty.findAllActivatedCustomersForHr();
		
		//List<JSONObject> crmrecods=new ArrayList<JSONObject>();
		
		List<JSONObject> m = new ArrayList<JSONObject>();
		
		for(int i=0;i<crmrecords.size();i++) {
			
			JSONObject p=new JSONObject();
			
			int empid=crmrecords.get(i).getAssigneto().getEmpid();
			
			JoiningDetails jd = joiningDetailsReposiory.findByEmpid(empid);
			
			 p.put("ID",crmrecords.get(i).getCrmrecordid());
			 p.put("EMP_ID",empid);
			 p.put("EMP_NAME",jd.getEmpid().getEmpfirstname()+" "+jd.getEmpid().getEmplastname());
			 if(jd!=null) {
				 if(jd.getEmployeestatus()!=null) {
					 p.put("EMP_TYPE",jd.getEmployment());		 
				 }else {
					 p.put("EMP_TYPE","");		 
				 }
				 
				 if(jd.getCtc()!=null) {
				 p.put("EMP_CTC",jd.getCtc());
				 }else {
					 p.put("EMP_CTC","");
				 }
			 }
			 
			 p.put("PRIMARY",crmrecords.get(i).getPrimarysalesperson().getEmpfirstname()+" "+crmrecords.get(i).getPrimarysalesperson().getEmplastname());
			 p.put("SECONDARY",crmrecords.get(i).getSecondarysalesperson().getEmpfirstname()+" "+crmrecords.get(i).getSecondarysalesperson().getEmplastname());
			 
			 p.put("SO_CUSTOMER_PO",crmrecords.get(i).getPonumber());
			 p.put("SO_ORDER_DATE",crmrecords.get(i).getNeedbyDate());
			 p.put("SO_PO_DATE",crmrecords.get(i).getPodate());
			 
			 
			 m.add(p);
		}
		
		System.out.println("j===========Size================>"+m.size());
		
		if(m.size()!=0) {
			String json = null;
			json = new Gson().toJson(m);
			response.setContentType("application/json");
			response.getWriter().write(json);
		 }
	}
	
	}
	
	
}
