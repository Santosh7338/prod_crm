package com.omfys.crm.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Month;
import java.time.Period;
import java.time.Year;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.omfys.crm.Repository.CRMEventMasterRepository;
import com.omfys.crm.Repository.CRMEventsRepository;
import com.omfys.crm.Repository.CRMRecordsContactsRepository;
import com.omfys.crm.Repository.CRMRecordsRespositoty;
import com.omfys.crm.Repository.CountriesRepository;
import com.omfys.crm.Repository.CrmDataSourceRepository;
import com.omfys.crm.Repository.DistrictMasterRepository;
import com.omfys.crm.Repository.EmployeeMasterRepository;
import com.omfys.crm.Repository.FinacialyearsetupRepository;
import com.omfys.crm.Repository.IncentiveConfigurationRepository;
import com.omfys.crm.Repository.JoiningDetailsReposiory;
import com.omfys.crm.Repository.LeadDocumentsRepository;
import com.omfys.crm.Repository.MainMenuRepository;
import com.omfys.crm.Repository.MainterritoryRepository;
import com.omfys.crm.Repository.OfferingRepository;
import com.omfys.crm.Repository.PersonalDetailsRepository;
import com.omfys.crm.Repository.ProjectRoleMappingRepository;
import com.omfys.crm.Repository.PurposeOfEventRepository;
import com.omfys.crm.Repository.RegionRepositroy;
import com.omfys.crm.Repository.StateMasterRepository;
import com.omfys.crm.Repository.StatusOfEventRepository;
import com.omfys.crm.Repository.SubterritoryRepository;
import com.omfys.crm.Repository.TargetConfigurationRepository;
import com.omfys.crm.Repository.TerritoryRepository;
import com.omfys.crm.dao.crmDao;
import com.omfys.crm.model.CRMRecords;
import com.omfys.crm.model.CRMRecordsContacts;
import com.omfys.crm.model.Countries;
import com.omfys.crm.model.CrmDataSource;
import com.omfys.crm.model.EmployeeData;
import com.omfys.crm.model.EmployeeMaster;
import com.omfys.crm.model.Financial_Year_Setup;
import com.omfys.crm.model.Lead_to_Customer;
import com.omfys.crm.model.Main_Territory;
import com.omfys.crm.model.ProjectRoleMapping;
import com.omfys.crm.model.Region;
import com.omfys.crm.model.SubTerritory;
import com.omfys.crm.model.TerritorySetup;
import com.omfys.crm.utility.MailService;
import com.poiji.bind.Poiji;


@Controller
public class CrmTerrtoryController {

	@Autowired
	MainMenuRepository mainmenuRepository;
	
	@Autowired
	CRMEventsRepository crmeventsRepository;
	
	@Autowired(required=true)
	MailService mailService;
	
	@Autowired
	EmployeeMasterRepository employeeMasterRepository;
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	OfferingRepository offeringRepository;
	
	@Autowired
	CrmDataSourceRepository crmDataSourceRepository;
	
	@Autowired
	StatusOfEventRepository statusOfEventRepository;
	
	@Autowired
	PurposeOfEventRepository purposeOfEventRepository;
	
	@Autowired
	CRMEventMasterRepository crmEventRepository;
	
	@Autowired
	CRMRecordsRespositoty crmrecordsRespositoty;
	
	@Autowired
	CRMRecordsContactsRepository enquiriesContactsRepository;
	
	@Autowired
	CRMEventsRepository crmEventsRepository;
	
	@Autowired
	LeadDocumentsRepository leaddocumentsRepository;
	
	@Autowired
	ProjectRoleMappingRepository projectRoleMappingRepository;
	
	@Autowired
	TargetConfigurationRepository targetConfigurationRepository;
	
	@Autowired
	IncentiveConfigurationRepository incentiveConfigurationRepository;
	
	@Autowired
	CountriesRepository countriesRepository;
	
	@Autowired
	StateMasterRepository stateMasterRepository;
	
	@Autowired
	DistrictMasterRepository districtMasterRepository;
	
	@Autowired
	PersonalDetailsRepository personalDetailsRepository;
	
	@Autowired
	JoiningDetailsReposiory joiningDetailsReposiory;
	
	@Autowired
	FinacialyearsetupRepository finacialyearsetupRepository;

	@Autowired
	private Environment environment;
	
	@Autowired
	private crmDao crmdao;
	
	@Autowired
	TerritoryRepository territoryRepository;
	
	@Autowired
	MainterritoryRepository mainterritoryRepository;
	
	@Autowired
	SubterritoryRepository subterritoryRepository;
	
	@Autowired
	RegionRepositroy regionRepositroy;
	
	
	
	 @RequestMapping("/createterritory")
	 public ModelAndView upatedealdetails(Model model,HttpServletRequest request,@RequestParam(value = "savemsg", required = false) String savemsg) throws ParseException, IOException
	 {
		
		 List<TerritorySetup> territorysetup = territoryRepository.readTerritorysetup();
		 
         List<Region> region = regionRepositroy.readRegion();
         
         Collections.sort(region,(p1,p2)->{  
             return p1.getCountryid().getName().compareTo(p2.getCountryid().getName());  
             });  
         
         List<EmployeeMaster> employee = employeeMasterRepository.getEmployeeDetails();
         
         SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-YYYY");
			
			for(int i=0;i<territorysetup.size();i++)
			{
				if(territorysetup.get(i).getUpdated_date() != null)
				{
					String updateddate = formatter.format(territorysetup.get(i).getUpdated_date());
					territorysetup.get(i).setUpdateddate1(updateddate);
				}
				
			}
         
		List<ProjectRoleMapping> salesmanagers = projectRoleMappingRepository.getSalesManager();
		 
		 model.addAttribute("savemsg",savemsg);
         model.addAttribute("employee",employee);
         model.addAttribute("salesmanagers",salesmanagers);
		 model.addAttribute("region",region);
		 model.addAttribute("territorysetup", territorysetup);
		 return new ModelAndView("createterritory"); 
	 }
	 
	 @RequestMapping("/save_territory")
	 public ModelAndView upateterritory(Model model,HttpServletRequest request)
	 {
		    HttpSession session = request.getSession();

			EmployeeMaster employee = (EmployeeMaster) session.getAttribute("emp");
			
			if(employee == null)
			{
				String errormsg = "Sorry!Your session has expired.Please login again to continue";
				
				model.addAttribute("errormsg", errormsg);
				
				return new ModelAndView("crmerror");
			}

			String territoryname=request.getParameter("TerritoryName");
			
			int countryid=Integer.valueOf(request.getParameter("countryid"));
			
			int territoryManagerid=Integer.valueOf(request.getParameter("territoryMangaerid"));
			
			EmployeeMaster territoryManager=employeeMasterRepository.findByEmpid(territoryManagerid);
			
			Countries countryinfo = countriesRepository.findByCountryid(countryid);
			
			List<Region> region=regionRepositroy.getCountryid(countryid);
			
			List<TerritorySetup> tr = territoryRepository.findByCrmCoutryid(countryid);
			
			Region rg=region.get(0);
			
			int employeeid = employee.getEmpid();
			
			TerritorySetup ts=new TerritorySetup();
			
			if(tr.size()!=0) {
			ts.setTr_id(tr.get(0).getTr_id());
			ts.setTerritory_name(territoryname);
			ts.setTerritoryMangaerid(territoryManager);
			ts.setCountryid(countryinfo);
			ts.setRegionid(rg);
			ts.setUpdated_by(employeeid);
			ts.setUpdated_date(new Date());
			ts.setIs_activated("Y");
			}else {
				ts.setTerritory_name(territoryname);
				ts.setTerritoryMangaerid(territoryManager);
				ts.setCountryid(countryinfo);
				ts.setRegionid(rg);
				ts.setUpdated_by(employeeid);
				ts.setUpdated_date(new Date());
				ts.setIs_activated("Y");
			}
			
			String savemsg = "";
			
			try
			{
				savemsg = "doneTerritory";
			}
			catch(Exception e)
			{
				savemsg = "errorTerriotry";
			}
			
			TerritorySetup territorysetup = territoryRepository.save(ts);
			
		 return new ModelAndView("redirect:createterritory?savemsg='" + URLEncoder.encode(savemsg) +"'"); 
	 }
	 
	 @RequestMapping("/assignmainterritory")
	 public ModelAndView assignmainterritory(Model model,HttpServletRequest request,@RequestParam(value = "savemsg", required = false) String savemsg) throws ParseException, IOException
	 {
		 List<Lead_to_Customer> issalesPerson=crmdao.isSalesPerson();
		 
         List<TerritorySetup> territorysetup = territoryRepository.readTerritorysetupactivated();

         List<Main_Territory> getmainterritory = mainterritoryRepository.getMainterritory();
         
         SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-YYYY");
			
			for(int i=0;i<getmainterritory.size();i++)
			{
				if(getmainterritory.get(i).getLast_updated_date() != null)
				{
					String updateddate = formatter.format(getmainterritory.get(i).getLast_updated_date());
					getmainterritory.get(i).setUpdateddate(updateddate);
				}
				
			}
         
			
		 model.addAttribute("savemsg",savemsg);	
         model.addAttribute("getmainterritory",getmainterritory);
         model.addAttribute("tmain",getmainterritory);
         model.addAttribute("issalesPerson", issalesPerson);
		 model.addAttribute("territorysetup", territorysetup);
		 return new ModelAndView("assigntertory"); 
	 }

	 
	 @RequestMapping("/assingmainTerritory")
	 public ModelAndView assingmainTerritory(Model model,HttpServletRequest request) throws ParseException, IOException
	 {
		    HttpSession session = request.getSession();

			EmployeeMaster employee = (EmployeeMaster) session.getAttribute("emp");
			
			if(employee == null)
			{
				String errormsg = "Sorry!Your session has expired.Please login again to continue";
				
				model.addAttribute("errormsg", errormsg);
				
				return new ModelAndView("crmerror");
			}

			int updated_by = employee.getEmpid();
			
			//Sales person id
			 int salespersonid=Integer.valueOf(request.getParameter("salesid"));
			 
			 System.out.println("sales person id=====>"+salespersonid);
			
			 EmployeeMaster salespersonid1 = employeeMasterRepository.findByEmpid(salespersonid);
			
			 //Territory id
			 int territoryid=Integer.valueOf(request.getParameter("territoryid"));
			 
			//tr manager id
			int trmanagerid=Integer.valueOf(request.getParameter("territorymgid"));
			
			EmployeeMaster territorymanagerid = employeeMasterRepository.findByEmpid(trmanagerid);
			
			 //region id
			 int countryid=Integer.valueOf(request.getParameter("regionid"));
			
			 Countries countryinfo = countriesRepository.findByCountryid(countryid);
			
			//Currency
			String Currency=request.getParameter("Currency");
			
			//Territery setup
			List<TerritorySetup> tr = territoryRepository.findByCrmCoutryid(countryid);
			
			TerritorySetup tr1=tr.get(0);
			
			
			List<Main_Territory> mainterritory =  mainterritoryRepository.findByAssignedEmpid(salespersonid);
			
			Main_Territory mt= new Main_Territory();
			if(mainterritory.size()!=0) {
				mt.setMain_tr_id(mainterritory.get(0).getMain_tr_id());
				mt.setSalespersonid(salespersonid1);
				mt.setTerritory_id(tr1);
				mt.setTerritorymanagerid(territorymanagerid);
				mt.setRegionid(countryinfo);
				mt.setCurrency(Currency);
				mt.setUpdated_by(updated_by);
				mt.setCreationdate(new Date());
				mt.setLast_updated_date(new Date());
			}else {
				mt.setSalespersonid(salespersonid1);
				mt.setTerritory_id(tr1);
				mt.setTerritorymanagerid(territorymanagerid);
				mt.setRegionid(countryinfo);
				mt.setCurrency(Currency);
				mt.setUpdated_by(updated_by);
				mt.setCreationdate(new Date());
				mt.setLast_updated_date(new Date());
			
			}
			
			Main_Territory territorysetup = mainterritoryRepository.save(mt);
			
              String savemsg = "";
			
			try
			{
				savemsg = "doneAssingMainTerriotry";
			}
			catch(Exception e)
			{
				savemsg = "errorAssingMainTerriotry";
			}
			
		 return new ModelAndView("redirect:assignmainterritory?savemsg='" + URLEncoder.encode(savemsg)+"'"); 
	 }
	 
	 @RequestMapping("/updategmainterritory")
	 public ModelAndView assingmainTerritory1(Model model,HttpServletRequest request) throws ParseException, IOException
	 {
		    HttpSession session = request.getSession();

			EmployeeMaster employee = (EmployeeMaster) session.getAttribute("emp");
			
			if(employee == null)
			{
				String errormsg = "Sorry!Your session has expired.Please login again to continue";
				
				model.addAttribute("errormsg", errormsg);
				
				return new ModelAndView("crmerror");
			}

			int updated_by = employee.getEmpid();
			
			//Sales person id
			 int salespersonid=Integer.valueOf(request.getParameter("editsalespersonid"));
			 
			 System.out.println("sales person id=====>"+salespersonid);
			
			 EmployeeMaster salespersonid1 = employeeMasterRepository.findByEmpid(salespersonid);
			
			 //Territory id
			 int territoryid=Integer.valueOf(request.getParameter("editterritoryid"));
			 
			//tr manager id
			int trmanagerid=Integer.valueOf(request.getParameter("editterritorymgid"));
			
			EmployeeMaster territorymanagerid = employeeMasterRepository.findByEmpid(trmanagerid);
			
			 //region id
			 int countryid=Integer.valueOf(request.getParameter("editregionid"));
			
			 Countries countryinfo = countriesRepository.findByCountryid(countryid);
			
			//Currency
			String Currency=request.getParameter("editCurrency");
			
			//Territery setup
			List<TerritorySetup> tr = territoryRepository.findByCrmCoutryid(countryid);
			
			TerritorySetup tr1=tr.get(0);
			
			
			List<Main_Territory> mainterritory =  mainterritoryRepository.findByAssignedEmpid(salespersonid);
			
			Main_Territory mt= new Main_Territory();
			if(mainterritory.size()!=0) {
				mt.setMain_tr_id(mainterritory.get(0).getMain_tr_id());
				mt.setSalespersonid(salespersonid1);
				mt.setTerritory_id(tr1);
				mt.setTerritorymanagerid(territorymanagerid);
				mt.setRegionid(countryinfo);
				mt.setCurrency(Currency);
				mt.setUpdated_by(updated_by);
				mt.setCreationdate(new Date());
				mt.setLast_updated_date(new Date());
			}else {
				mt.setSalespersonid(salespersonid1);
				mt.setTerritory_id(tr1);
				mt.setTerritorymanagerid(territorymanagerid);
				mt.setRegionid(countryinfo);
				mt.setCurrency(Currency);
				mt.setUpdated_by(updated_by);
				mt.setCreationdate(new Date());
				mt.setLast_updated_date(new Date());
			
			}
			
			Main_Territory territorysetup = mainterritoryRepository.save(mt);
			
              String savemsg = "";
			
			try
			{
				savemsg = "doneAssingMainTerriotry";
			}
			catch(Exception e)
			{
				savemsg = "errorAssingMainTerriotry";
			}
			
		 return new ModelAndView("redirect:assignmainterritory?savemsg='" + URLEncoder.encode(savemsg)+"'"); 
	 }
	 
	 
	 
	 @RequestMapping("/deactiveTerritory")
	 public ModelAndView deactiveTerritory(Model model,HttpServletRequest request,@RequestParam Integer territory_id) throws ParseException, IOException
	 {
		 List<TerritorySetup> tr = territoryRepository.findByCrmterritoryid(territory_id);
		 
		    TerritorySetup ts=new TerritorySetup();
		    ts.setTr_id(tr.get(0).getTr_id());
		    ts.setTerritoryMangaerid(tr.get(0).getTerritoryMangaerid());
		    ts.setCountryid(tr.get(0).getCountryid());
		    ts.setRegionid(tr.get(0).getRegionid());
			ts.setTerritory_name(tr.get(0).getTerritory_name());
			ts.setUpdated_by(tr.get(0).getUpdated_by());
			ts.setUpdated_date(new Date());
			ts.setIs_activated("N");
			
			TerritorySetup territorysetup = territoryRepository.save(ts);
		
		 return new ModelAndView("redirect:createterritory"); 
	 }
	 
	 @RequestMapping("/activeTerritory")
	 public ModelAndView activeTerritory(Model model,HttpServletRequest request,@RequestParam Integer territory_id) throws ParseException, IOException
	 {
		 List<TerritorySetup> tr = territoryRepository.findByCrmterritoryid(territory_id);
		 
		    TerritorySetup ts=new TerritorySetup();
		    ts.setTr_id(tr.get(0).getTr_id());
		    ts.setTerritoryMangaerid(tr.get(0).getTerritoryMangaerid());
		    ts.setCountryid(tr.get(0).getCountryid());
		    ts.setRegionid(tr.get(0).getRegionid());
			ts.setTerritory_name(tr.get(0).getTerritory_name());
			ts.setUpdated_by(tr.get(0).getUpdated_by());
			ts.setUpdated_date(new Date());
			ts.setIs_activated("Y");
			
			TerritorySetup territorysetup = territoryRepository.save(ts);
		
		 return new ModelAndView("redirect:createterritory"); 
	 }
	 
	 
	 @RequestMapping("/editterritory")
	 public ModelAndView editterritory1(Model model,HttpServletRequest request,@RequestParam Integer tr_id) throws ParseException, IOException
	 {
		    String terriotry_name=request.getParameter("territoryname1");
			
		    List<TerritorySetup> tr = territoryRepository.findByCrmterritoryid(tr_id);
		 
		    TerritorySetup ts=new TerritorySetup();
		    ts.setTr_id(tr.get(0).getTr_id());
		    ts.setTerritoryMangaerid(tr.get(0).getTerritoryMangaerid());
		    ts.setCountryid(tr.get(0).getCountryid());
		    ts.setRegionid(tr.get(0).getRegionid());
			ts.setTerritory_name(terriotry_name);
			ts.setUpdated_by(tr.get(0).getUpdated_by());
			ts.setUpdated_date(new Date());
			ts.setIs_activated("Y");
			
			TerritorySetup territorysetup = territoryRepository.save(ts);
		
		 return new ModelAndView("redirect:createterritory"); 
	 }
	 
	 @RequestMapping("/createregion")
	 public ModelAndView createregion(Model model,HttpServletRequest request,@RequestParam(value = "savemsg", required = false) String savemsg) throws ParseException, IOException
	 {
		 
		 HttpSession session = request.getSession();
		 
		 SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");

			EmployeeMaster employee = (EmployeeMaster) session.getAttribute("emp");
			
			if(employee == null)
			{
				String errormsg = "Sorry!Your session has expired.Please login again to continue";
				
				model.addAttribute("errormsg", errormsg);
				
				return new ModelAndView("crmerror");
			}
			
			List<Region> region = regionRepositroy.readRegion();
			
			SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-YYYY");
			
			for(int i=0;i<region.size();i++)
			{
				if(region.get(i).getLast_update_date() != null)
				{
					String updateddate = formatter.format(region.get(i).getLast_update_date());
					region.get(i).setUpdateddate(updateddate);
				}
				
			}
			 
		  model.addAttribute("savemsg",savemsg);	
		  model.addAttribute("region",region);
		 return new ModelAndView("createregion"); 
	 }
	 
	 @RequestMapping("/updateregion")
	 public ModelAndView updatedRegion(Model model,HttpServletRequest request) throws ParseException, IOException
	 {
		 
		 HttpSession session = request.getSession();

			EmployeeMaster employee = (EmployeeMaster) session.getAttribute("emp");
			
			if(employee == null)
			{
				String errormsg = "Sorry!Your session has expired.Please login again to continue";
				
				model.addAttribute("errormsg", errormsg);
				
				return new ModelAndView("crmerror");
			}
		 
		 
		 int countryid=0;
		 
		 String currency="";
		 
		 if(request.getParameter("regionid")!=null) {
			 countryid=Integer.valueOf(request.getParameter("regionid"));
		 }
		 
		 if(request.getParameter("Currency")!=null) {
			 currency=request.getParameter("Currency");
		 }
		 
		 if(request.getParameter("editcountry")!=null) {
			 countryid=Integer.valueOf(request.getParameter("editcountry"));
		 }
		 
		 if(request.getParameter("editcurrency")!=null) {
			 currency=request.getParameter("editcurrency");
		 }
		 
		 Countries countryinfo = countriesRepository.findByCountryid(countryid);
		 

		 List<Region> r = regionRepositroy.getCountryid(countryid);
		 
		 Region rg=new Region();
		 
		 if(r.size()!=0) {
	           rg.setRg_id(r.get(0).getRg_id());
		       rg.setCountryid(countryinfo);
		       rg.setCurrency(currency);
		       rg.setUpdated_by(employee.getEmpid());
		       rg.setCreatedDate(new Date());
		       rg.setLast_update_date(new Date());
		 }else {
			 rg.setCountryid(countryinfo);
			 rg.setCurrency(currency);
			 rg.setUpdated_by(employee.getEmpid());
			 rg.setCreatedDate(new Date());
			 rg.setLast_update_date(new Date());
		 }
		 
		   String savemsg = "";
			
			try
			{
				savemsg = "createdregion";
			}
			catch(Exception e)
			{
				savemsg = "errorRegion";
			}
		 
		 
		 Region region = regionRepositroy.save(rg);
		 
		 return new ModelAndView("redirect:createregion?savemsg='" + URLEncoder.encode(savemsg) +"'"); 
	 }
	 
	 @RequestMapping("/calindersetup")
	 public ModelAndView calindersetup(Model model,HttpServletRequest request,@RequestParam(value = "savemsg", required = false) String savemsg) throws ParseException, IOException
	 {
		    HttpSession session = request.getSession();

			EmployeeMaster employee = (EmployeeMaster) session.getAttribute("emp");
			
			if(employee == null)
			{
				String errormsg = "Sorry!Your session has expired.Please login again to continue";
				
				model.addAttribute("errormsg", errormsg);
				
				return new ModelAndView("crmerror");
				
			}
			
			
		List<Financial_Year_Setup> fs=finacialyearsetupRepository.financialyearsetup();
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-YYYY");
		
		SimpleDateFormat formatter1 = new SimpleDateFormat("MMM-YYYY");
		
		
		String string_format="4/1/2021";  
		
		for(int i=0;i<fs.size();i++)
		{
			if(fs.get(i).getStart_date() != null)
			{
				
				Date date_format=new SimpleDateFormat("yyyy-MM").parse(fs.get(i).getStart_date());  
				String start_date1 = formatter1.format(date_format);
				fs.get(i).setStartdate(start_date1);
			}
			
			if(fs.get(i).getStart_date() != null)
			{
				Date date_format=new SimpleDateFormat("yyyy-MM").parse(fs.get(i).getEnd_date());
				String end_date1 = formatter1.format(date_format);
				fs.get(i).setEnddate(end_date1);
			}
			
			if(fs.get(i).getLast_updated_date() != null)
			{
				String lastupdateddate1 = formatter.format(fs.get(i).getLast_updated_date());
				fs.get(i).setLastupdateddate(lastupdateddate1);
			}

		}
		
		 model.addAttribute("savemsg",savemsg);
		 model.addAttribute("finacialyearsetup",fs);
		 return new ModelAndView("calindersetup");
	 }
	 
	 @RequestMapping("/updatecalindersetup")
	 public ModelAndView updatecalindersetup(Model model,HttpServletRequest request) throws ParseException, IOException
	 {

		    HttpSession session = request.getSession();

			EmployeeMaster employee = (EmployeeMaster) session.getAttribute("emp");
			
			if(employee == null)
			{
				String errormsg = "Sorry!Your session has expired.Please login again to continue";
				
				model.addAttribute("errormsg", errormsg);
				
				return new ModelAndView("crmerror");
			}
		 
		 
		 String startdate=request.getParameter("startdate");

		 String enddate=request.getParameter("enddate");
		 
		 SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		 
		 int lastupdateby=employee.getEmpid();
		 
		 List<Financial_Year_Setup> fs1=finacialyearsetupRepository.financialyearsetup();
		 
		 Financial_Year_Setup fs= new Financial_Year_Setup();
		 
		 if(fs1.size()!=0) {
			 fs.setFy_id(fs1.get(0).getFy_id());
			 fs.setStart_date(startdate);
			 fs.setEnd_date(enddate);
			 fs.setLastupdatedby(lastupdateby);
			 fs.setLast_updated_date(new Date());
			 
		 }else {
			 fs.setStart_date(startdate);
			 fs.setEnd_date(enddate);
			 fs.setLastupdatedby(lastupdateby);
			 fs.setLast_updated_date(new Date());
		 }
		 
		 String savemsg = "";
			
			try
			{
				savemsg = "donecalendersetup";
			}
			catch(Exception e)
			{
				savemsg = "errorTerriotry";
			}
		 
		 Financial_Year_Setup fs2=finacialyearsetupRepository.save(fs);
		 
		 return new ModelAndView("redirect:calindersetup?savemsg='"+URLEncoder.encode(savemsg)+"'");
	 }
	 

	 //for sales person
		 
		 static List<String> getDateList(String strStartDate, String strEndDate) {
		        // Formatter for the input
		        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("MM/d/u");
		        
		        // Formatter for the output
		        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("dd-MM-uuuu");

		        // Parse strings to LocalDate instances
		        LocalDate startDate = LocalDate.parse(strStartDate, inputFormatter);
		        LocalDate endDate = LocalDate.parse(strEndDate, inputFormatter);

		        return Stream.iterate(startDate.withDayOfMonth(1), date -> date.plusMonths(1))
		                .limit(ChronoUnit.MONTHS.between(startDate, endDate.plusMonths(1)))
		                .map(date -> date.format(outputFormatter))
		                .collect(Collectors.toList());
		    }
		 
		//sales person data 2		 
		 @RequestMapping(value = "/forsalesepersoneventtrands2", method = RequestMethod.GET)
			public void employeeTotalCount1(HttpServletRequest request, HttpServletResponse response,Model model,
					@RequestParam(value = "startdate") String startdate) throws ParseException {
			    
			 HttpSession session = request.getSession();

				EmployeeMaster employee = (EmployeeMaster) session.getAttribute("emp");
				
				
				int employeeid = employee.getEmpid();
				
				int profileid = employee.getProfileid();
				
				List<CRMRecords> enquiries = new ArrayList<CRMRecords>();
				
				List<CRMRecords> leads = new ArrayList<CRMRecords>();
				
				List<CRMRecords> customers = new ArrayList<CRMRecords>();
				
				int enquiriescount=0, leadscount=0 ,customerscount=0 ;
				
				List<Integer> newenquirygen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> leadgen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> ordergen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> opportunitygen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> pipelinegen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> cancelledgen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> enquirygen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> interestedgen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> notinterestedgen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> leadqualifiedgen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> pocgen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> proposalsubmittedgen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> waitingforpogen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> pogen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> lostgen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<CRMRecords> newenquirygens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> leadgens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> ordergens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> opportunitygens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> pipelinegens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> cancelledgens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> enquirygens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> interestedgens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> notinterestedgens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> leadqualifiedgens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> pocgens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> proposalsubmittedgens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> waitingforpogens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> pogens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> lostgens = new ArrayList<CRMRecords>();
				
				String isbdh = projectRoleMappingRepository.isBusinessDevelopmentHead(employee.getEmpid(), 19, employee.getEmpid(), 19);
				
				 LocalDate start = LocalDate.parse("2016-02-01"),
		          end   = LocalDate.parse("2016-03-01");

		    String startDate1=startdate.substring(0,4)+"-"+startdate.substring(5,7);
		
		    System.out.println("startDate================>"+startDate1);
		 
		   int year1=Integer.valueOf(startdate.substring(0,4));
		   int month1=Integer.valueOf(startdate.substring(5,7));
		 
		   LocalDate localDate1 = LocalDate.of(year1, month1, 1);
		  Month dayOfWeek = localDate1.getMonth();
		
		  String monthname=dayOfWeek.toString();
		
		  System.out.println("monthname===================>"+monthname);
		

		  newenquirygens = crmrecordsRespositoty.findAllCRMTypeLGRForSalesPersonMonthlyJM2(startDate1,"Enquiry", employee.getEmpid());
							
							leadgens = crmrecordsRespositoty.findAllCRMTypeLGRForSalesPersonMonthlyJM2(startDate1,"Lead", employee.getEmpid());
							
							ordergens = crmrecordsRespositoty.findAllCRMTypeLGRForSalesPersonMonthlyJM2(startDate1,"PO", employee.getEmpid());
							
							opportunitygens = crmrecordsRespositoty.findAllLGRForSalesPersonMonthlyJM2(startDate1,"Opportunity", employee.getEmpid());
							
							pipelinegens = crmrecordsRespositoty.findAllLGRForSalesPersonMonthlyJM2(startDate1,"Pipeline", employee.getEmpid());
							
							cancelledgens = crmrecordsRespositoty.findAllLGRForSalesPersonMonthlyJM2(startDate1,"Cancelled", employee.getEmpid());
							
							enquirygens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM2(startDate1,"Enquiry", employee.getEmpid());
							
							interestedgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM2(startDate1,"Interested", employee.getEmpid());
							
							notinterestedgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM2(startDate1,"Not Interested", employee.getEmpid());
						
							leadqualifiedgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM2(startDate1,"Lead Qualified", employee.getEmpid());
							
							pocgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM2(startDate1,"PoC", employee.getEmpid());
							
							proposalsubmittedgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM2(startDate1,"Proposal Submitted", employee.getEmpid());
							
							waitingforpogens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM2(startDate1,"Waiting for PO", employee.getEmpid());

							pogens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM2(startDate1,"PO", employee.getEmpid());
							
							lostgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM2(startDate1,"Lost", employee.getEmpid());
						
		                if(newenquirygens.size() > 0)
						{
		                	newenquirygen.add(0,newenquirygens.size());
						}
		                
		                if(leadgens.size() > 0)
						{
		                	leadgen.add(0,leadgens.size());
						}
		                
		                if(ordergens.size() > 0)
						{
		                	ordergen.add(0,ordergens.size());
						}
		                
		                if(opportunitygens.size() > 0)
						{
		                	opportunitygen.add(0,opportunitygens.size());
						}
		                
		                if(pipelinegens.size() > 0)
						{
		                	pipelinegen.add(0,pipelinegens.size());
						}
		                
		                if(cancelledgens.size() > 0)
						{
		                	cancelledgen.add(0,cancelledgens.size());
						}
		                
		                if(enquirygens.size() > 0)
						{
		                	enquirygen.add(0,enquirygens.size());
						}
		                
		                if(interestedgens.size() > 0)
						{
		                	interestedgen.add(0,interestedgens.size());
						}
		                
		                if(notinterestedgens.size() > 0)
						{
		                	notinterestedgen.add(0,notinterestedgens.size());
						}
		                
		                if(leadqualifiedgens.size() > 0)
						{
		                	leadqualifiedgen.add(0,leadqualifiedgens.size());
						}

		                if(pocgens.size() > 0)
						{
		                	pocgen.add(0,pocgens.size());
						}
		                
		                if(proposalsubmittedgens.size() > 0)
						{
		                	proposalsubmittedgen.add(0,proposalsubmittedgens.size());
						}
		                
		                if(waitingforpogens.size() > 0)
						{
		                	waitingforpogen.add(0,waitingforpogens.size());
						}
		                
		                if(pogens.size() > 0)
						{
		                	pogen.add(0,pogens.size());
						}
		                
		                if(lostgens.size() > 0)
						{
		                	lostgen.add(0,lostgens.size());
						}
				
		  
   		    org.json.JSONObject parent=new org.json.JSONObject();
   		    parent.put("newenquirygen", newenquirygen);
			parent.put("leadgen", leadgen);
			parent.put("ordergen", ordergen);
			parent.put("opportunitygen", opportunitygen);
			parent.put("pipelinegen", pipelinegen);
			parent.put("cancelledgen", cancelledgen);
			parent.put("enquirygen", enquirygen);
			parent.put("interestedgen", interestedgen);
			parent.put("notinterestedgen", notinterestedgen);
			parent.put("leadqualifiedgen", leadqualifiedgen);
			parent.put("pocgen", pocgen);
			parent.put("proposalsubmittedgen", proposalsubmittedgen);
			parent.put("waitingforpogen", waitingforpogen);
			parent.put("pogen", pogen);
			parent.put("lostgen", lostgen);
			parent.put("monthname", monthname);
		    
		      String json = null;
			 
			 json = new Gson().toJson(parent);
				response.setContentType("application/json");
				try {
					response.getWriter().write(json);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
		 }	
		 

		    @RequestMapping(value = "/salesstatustrandsforHR", method = RequestMethod.GET)
			public void employeeSalesStatusTrands12(HttpServletRequest request, HttpServletResponse response,Model model,
					@RequestParam(value = "startDate1") String startdate,@RequestParam(value = "salespersonid1") String salespersonid1) throws ParseException {
			 
				
				int employeeid = Integer.valueOf(salespersonid1);
				
				List<CRMRecords> enquiries = new ArrayList<CRMRecords>();
				
				List<CRMRecords> leads = new ArrayList<CRMRecords>();
				
				List<CRMRecords> customers = new ArrayList<CRMRecords>();
				
				int enquiriescount=0, leadscount=0 ,customerscount=0 ;
				
				List<Integer> newenquirygen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> leadgen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> ordergen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> opportunitygen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> pipelinegen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> cancelledgen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> enquirygen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> interestedgen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> notinterestedgen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> leadqualifiedgen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> pocgen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> proposalsubmittedgen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> waitingforpogen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> pogen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> lostgen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<CRMRecords> newenquirygens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> leadgens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> ordergens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> opportunitygens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> pipelinegens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> cancelledgens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> enquirygens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> interestedgens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> notinterestedgens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> leadqualifiedgens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> pocgens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> proposalsubmittedgens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> waitingforpogens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> pogens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> lostgens = new ArrayList<CRMRecords>();
				
				 LocalDate start = LocalDate.parse("2016-02-01"),
		          end   = LocalDate.parse("2016-03-01");

		    String startDate1=startdate.substring(0,4)+"-"+startdate.substring(5,7);
		
		   int year1=Integer.valueOf(startdate.substring(0,4));
		   int month1=Integer.valueOf(startdate.substring(5,7));
		 
		   LocalDate localDate1 = LocalDate.of(year1, month1, 1);
		  Month dayOfWeek = localDate1.getMonth();
		
		  String monthname=dayOfWeek.toString();
		
		  if(employeeid!=0) {

		                   newenquirygens = crmrecordsRespositoty.findAllCRMTypeLGRForSalesPersonMonthlyJM2(startDate1,"Enquiry", employeeid);
							
							leadgens = crmrecordsRespositoty.findAllCRMTypeLGRForSalesPersonMonthlyJM2(startDate1,"Lead", employeeid);
							
							ordergens = crmrecordsRespositoty.findAllCRMTypeLGRForSalesPersonMonthlyJM2(startDate1,"PO", employeeid);
							
							opportunitygens = crmrecordsRespositoty.findAllLGRForSalesPersonMonthlyJM2(startDate1,"Opportunity", employeeid);
							
							pipelinegens = crmrecordsRespositoty.findAllLGRForSalesPersonMonthlyJM2(startDate1,"Pipeline", employeeid);
							
							cancelledgens = crmrecordsRespositoty.findAllLGRForSalesPersonMonthlyJM2(startDate1,"Cancelled", employeeid);
							
							enquirygens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM2(startDate1,"Enquiry", employeeid);
							
							interestedgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM2(startDate1,"Interested", employeeid);
							
							notinterestedgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM2(startDate1,"Not Interested", employeeid);
						
							leadqualifiedgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM2(startDate1,"Lead Qualified", employeeid);
							
							pocgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM2(startDate1,"PoC", employeeid);
							
							proposalsubmittedgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM2(startDate1,"Proposal Submitted", employeeid);
							
							waitingforpogens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM2(startDate1,"Waiting for PO", employeeid);

							pogens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM2(startDate1,"PO", employeeid);
							
							lostgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM2(startDate1,"Lost", employeeid);
				
		  }else {
			  
			    newenquirygens = crmrecordsRespositoty.findAllCRMTypeLGRForSalesPersonMonthlyJM3(startDate1,"Enquiry");
				
				leadgens = crmrecordsRespositoty.findAllCRMTypeLGRForSalesPersonMonthlyJM3(startDate1,"Lead");
				
				ordergens = crmrecordsRespositoty.findAllCRMTypeLGRForSalesPersonMonthlyJM3(startDate1,"PO");
				
				opportunitygens = crmrecordsRespositoty.findAllLGRForSalesPersonMonthlyJM3(startDate1,"Opportunity");
				
				pipelinegens = crmrecordsRespositoty.findAllLGRForSalesPersonMonthlyJM3(startDate1,"Pipeline");
				
				cancelledgens = crmrecordsRespositoty.findAllLGRForSalesPersonMonthlyJM3(startDate1,"Cancelled");
				
				enquirygens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM3(startDate1,"Enquiry");
				
				interestedgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM3(startDate1,"Interested");
				
				notinterestedgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM3(startDate1,"Not Interested");
			
				leadqualifiedgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM3(startDate1,"Lead Qualified");
				
				pocgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM3(startDate1,"PoC");
				
				proposalsubmittedgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM3(startDate1,"Proposal Submitted");
				
				waitingforpogens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM3(startDate1,"Waiting for PO");

				pogens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM3(startDate1,"PO");
				
				lostgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM3(startDate1,"Lost");
	
		  }
							
		                if(newenquirygens.size() > 0)
						{
		                	newenquirygen.add(0,newenquirygens.size());
						}
		                
		                if(leadgens.size() > 0)
						{
		                	leadgen.add(0,leadgens.size());
						}
		                
		                if(ordergens.size() > 0)
						{
		                	ordergen.add(0,ordergens.size());
						}
		                
		                if(opportunitygens.size() > 0)
						{
		                	opportunitygen.add(0,opportunitygens.size());
						}
		                
		                if(pipelinegens.size() > 0)
						{
		                	pipelinegen.add(0,pipelinegens.size());
						}
		                
		                if(cancelledgens.size() > 0)
						{
		                	cancelledgen.add(0,cancelledgens.size());
						}
		                
		                if(enquirygens.size() > 0)
						{
		                	enquirygen.add(0,enquirygens.size());
						}
		                
		                if(interestedgens.size() > 0)
						{
		                	interestedgen.add(0,interestedgens.size());
						}
		                
		                if(notinterestedgens.size() > 0)
						{
		                	notinterestedgen.add(0,notinterestedgens.size());
						}
		                
		                if(leadqualifiedgens.size() > 0)
						{
		                	leadqualifiedgen.add(0,leadqualifiedgens.size());
						}

		                if(pocgens.size() > 0)
						{
		                	pocgen.add(0,pocgens.size());
						}
		                
		                if(proposalsubmittedgens.size() > 0)
						{
		                	proposalsubmittedgen.add(0,proposalsubmittedgens.size());
						}
		                
		                if(waitingforpogens.size() > 0)
						{
		                	waitingforpogen.add(0,waitingforpogens.size());
						}
		                
		                if(pogens.size() > 0)
						{
		                	pogen.add(0,pogens.size());
						}
		                
		                if(lostgens.size() > 0)
						{
		                	lostgen.add(0,lostgens.size());
						}
				
		  
		    org.json.JSONObject parent=new org.json.JSONObject();
		    parent.put("newenquirygen", newenquirygen);
			parent.put("leadgen", leadgen);
			parent.put("ordergen", ordergen);
			parent.put("opportunitygen", opportunitygen);
			parent.put("pipelinegen", pipelinegen);
			parent.put("cancelledgen", cancelledgen);
			parent.put("enquirygen", enquirygen);
			parent.put("interestedgen", interestedgen);
			parent.put("notinterestedgen", notinterestedgen);
			parent.put("leadqualifiedgen", leadqualifiedgen);
			parent.put("pocgen", pocgen);
			parent.put("proposalsubmittedgen", proposalsubmittedgen);
			parent.put("waitingforpogen", waitingforpogen);
			parent.put("pogen", pogen);
			parent.put("lostgen", lostgen);
			parent.put("monthname", monthname);
		    
		      String json = null;
			 
			 json = new Gson().toJson(parent);
				response.setContentType("application/json");
				try {
					response.getWriter().write(json);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 } 
		    
		    
		    
		    @RequestMapping(value = "/salesstatustrandsforHR1", method = RequestMethod.GET)
			public void employeeSalesStatusTrands121(HttpServletRequest request, HttpServletResponse response,Model model,
					@RequestParam(value = "startDate1") String startdate,@RequestParam(value = "salespersonid1") String salespersonid1) throws ParseException {
			 
				
				int employeeid = Integer.valueOf(salespersonid1);
				
				List<CRMRecords> enquiries = new ArrayList<CRMRecords>();
				
				List<CRMRecords> leads = new ArrayList<CRMRecords>();
				
				List<CRMRecords> customers = new ArrayList<CRMRecords>();
				
				int enquiriescount=0, leadscount=0 ,customerscount=0 ;
				
				List<Integer> newenquirygen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> leadgen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> ordergen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> opportunitygen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> pipelinegen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> cancelledgen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> enquirygen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> interestedgen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> notinterestedgen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> leadqualifiedgen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> pocgen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> proposalsubmittedgen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> waitingforpogen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> pogen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<Integer> lostgen = new ArrayList<Integer>(Collections.nCopies(0, 0));
				
				List<CRMRecords> newenquirygens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> leadgens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> ordergens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> opportunitygens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> pipelinegens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> cancelledgens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> enquirygens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> interestedgens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> notinterestedgens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> leadqualifiedgens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> pocgens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> proposalsubmittedgens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> waitingforpogens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> pogens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> lostgens = new ArrayList<CRMRecords>();
				
				 LocalDate start = LocalDate.parse("2016-02-01"),
		          end   = LocalDate.parse("2016-03-01");

		    String startDate1=startdate.substring(0,4)+"-"+startdate.substring(5,7);
		
		   int year1=Integer.valueOf(startdate.substring(0,4));
		   int month1=Integer.valueOf(startdate.substring(5,7));
		 
		   LocalDate localDate1 = LocalDate.of(year1, month1, 1);
		  Month dayOfWeek = localDate1.getMonth();
		
		  String monthname=dayOfWeek.toString();
		
		  if(employeeid!=0) {

		                   newenquirygens = crmrecordsRespositoty.findAllCRMTypeLGRForSalesPersonMonthlyJM2(startDate1,"Enquiry", employeeid);
							
							leadgens = crmrecordsRespositoty.findAllCRMTypeLGRForSalesPersonMonthlyJM2(startDate1,"Lead", employeeid);
							
							ordergens = crmrecordsRespositoty.findAllCRMTypeLGRForSalesPersonMonthlyJM2(startDate1,"PO", employeeid);
							
							opportunitygens = crmrecordsRespositoty.findAllLGRForSalesPersonMonthlyJM2(startDate1,"Opportunity", employeeid);
							
							pipelinegens = crmrecordsRespositoty.findAllLGRForSalesPersonMonthlyJM2(startDate1,"Pipeline", employeeid);
							
							cancelledgens = crmrecordsRespositoty.findAllLGRForSalesPersonMonthlyJM2(startDate1,"Cancelled", employeeid);
							
							enquirygens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM2(startDate1,"Enquiry", employeeid);
							
							interestedgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM2(startDate1,"Interested", employeeid);
							
							notinterestedgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM2(startDate1,"Not Interested", employeeid);
						
							leadqualifiedgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM2(startDate1,"Lead Qualified", employeeid);
							
							pocgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM2(startDate1,"PoC", employeeid);
							
							proposalsubmittedgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM2(startDate1,"Proposal Submitted", employeeid);
							
							waitingforpogens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM2(startDate1,"Waiting for PO", employeeid);

							pogens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM2(startDate1,"PO", employeeid);
							
							lostgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM2(startDate1,"Lost", employeeid);
				
		  }else {
			  
			    newenquirygens = crmrecordsRespositoty.findAllCRMTypeLGRForSalesPersonMonthlyJM3(startDate1,"Enquiry");
				
				leadgens = crmrecordsRespositoty.findAllCRMTypeLGRForSalesPersonMonthlyJM3(startDate1,"Lead");
				
				ordergens = crmrecordsRespositoty.findAllCRMTypeLGRForSalesPersonMonthlyJM3(startDate1,"PO");
				
				opportunitygens = crmrecordsRespositoty.findAllLGRForSalesPersonMonthlyJM3(startDate1,"Opportunity");
				
				pipelinegens = crmrecordsRespositoty.findAllLGRForSalesPersonMonthlyJM3(startDate1,"Pipeline");
				
				cancelledgens = crmrecordsRespositoty.findAllLGRForSalesPersonMonthlyJM3(startDate1,"Cancelled");
				
				enquirygens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM3(startDate1,"Enquiry");
				
				interestedgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM3(startDate1,"Interested");
				
				notinterestedgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM3(startDate1,"Not Interested");
			
				leadqualifiedgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM3(startDate1,"Lead Qualified");
				
				pocgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM3(startDate1,"PoC");
				
				proposalsubmittedgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM3(startDate1,"Proposal Submitted");
				
				waitingforpogens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM3(startDate1,"Waiting for PO");

				pogens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM3(startDate1,"PO");
				
				lostgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM3(startDate1,"Lost");
	
		  }
							
		                if(newenquirygens.size() > 0)
						{
		                	newenquirygen.add(0,newenquirygens.size());
						}
		                
		                if(leadgens.size() > 0)
						{
		                	leadgen.add(0,leadgens.size());
						}
		                
		                if(ordergens.size() > 0)
						{
		                	ordergen.add(0,ordergens.size());
						}
		                
		                if(opportunitygens.size() > 0)
						{
		                	opportunitygen.add(0,opportunitygens.size());
						}
		                
		                if(pipelinegens.size() > 0)
						{
		                	pipelinegen.add(0,pipelinegens.size());
						}
		                
		                if(cancelledgens.size() > 0)
						{
		                	cancelledgen.add(0,cancelledgens.size());
						}
		                
		                if(enquirygens.size() > 0)
						{
		                	enquirygen.add(0,enquirygens.size());
						}
		                
		                if(interestedgens.size() > 0)
						{
		                	interestedgen.add(0,interestedgens.size());
						}
		                
		                if(notinterestedgens.size() > 0)
						{
		                	notinterestedgen.add(0,notinterestedgens.size());
						}
		                
		                if(leadqualifiedgens.size() > 0)
						{
		                	leadqualifiedgen.add(0,leadqualifiedgens.size());
						}

		                if(pocgens.size() > 0)
						{
		                	pocgen.add(0,pocgens.size());
						}
		                
		                if(proposalsubmittedgens.size() > 0)
						{
		                	proposalsubmittedgen.add(0,proposalsubmittedgens.size());
						}
		                
		                if(waitingforpogens.size() > 0)
						{
		                	waitingforpogen.add(0,waitingforpogens.size());
						}
		                
		                if(pogens.size() > 0)
						{
		                	pogen.add(0,pogens.size());
						}
		                
		                if(lostgens.size() > 0)
						{
		                	lostgen.add(0,lostgens.size());
						}
				
		  
		    org.json.JSONObject parent=new org.json.JSONObject();
		    parent.put("newenquirygen", newenquirygen);
			parent.put("leadgen", leadgen);
			parent.put("ordergen", ordergen);
			parent.put("opportunitygen", opportunitygen);
			parent.put("pipelinegen", pipelinegen);
			parent.put("cancelledgen", cancelledgen);
			parent.put("enquirygen", enquirygen);
			parent.put("interestedgen", interestedgen);
			parent.put("notinterestedgen", notinterestedgen);
			parent.put("leadqualifiedgen", leadqualifiedgen);
			parent.put("pocgen", pocgen);
			parent.put("proposalsubmittedgen", proposalsubmittedgen);
			parent.put("waitingforpogen", waitingforpogen);
			parent.put("pogen", pogen);
			parent.put("lostgen", lostgen);
			parent.put("monthname", monthname);
		    
		      String json = null;
			 
			 json = new Gson().toJson(parent);
				response.setContentType("application/json");
				try {
					response.getWriter().write(json);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 } 
		  
		    
		    @RequestMapping(value = "/te", method = RequestMethod.GET)
			public void emp(HttpServletRequest request, HttpServletResponse response,Model model) throws ParseException {
		    
		    	System.out.println("===============================================================");
		    
		    	String inputStartDate="2022-01-01";
		    	String inputEndDate="2023-12-01";
		    	
		    	LocalDate startDate=LocalDate.parse(inputStartDate);
		    	LocalDate endDate=LocalDate.parse(inputEndDate);
		    	
		    	Long monthsBetween = ChronoUnit.MONTHS.between(
		    	        LocalDate.parse(inputStartDate).withDayOfMonth(1),
		    	        LocalDate.parse(inputEndDate).withDayOfMonth(1));
		    	System.out.println(monthsBetween); //3
		    	
		    	System.out.println("Period===============>"+monthsBetween);
		    	
		    	int sn=0;
		    	int en=monthsBetween.intValue();
		    	
		    	List<String> monthname = new ArrayList<String>();
		    	
               List<Integer> newenquirygen = new ArrayList<Integer>(Collections.nCopies(en,sn));
				
				List<CRMRecords> newenquirygens = new ArrayList<CRMRecords>();
//				
				int employeeid=21;
				
				int i=0;
                while(!startDate.isAfter(endDate)) {
                	
		    		String month=startDate.getMonth().getDisplayName(TextStyle.SHORT, Locale.US);
		    		
		    		LocalDate startMonthDate=startDate.withDayOfMonth(1);
		    		
		    		LocalDate endMonthDate=startDate.withDayOfMonth(startDate.lengthOfMonth());
		    		
		    		startDate=endMonthDate.plusDays(1);
		    		String ym="";
		    		if(startDate.getMonthValue()<10) {
		    			  ym=startDate.getYear()+"-0"+startDate.getMonthValue();
		    		}else {
		    		      ym=startDate.getYear()+"-"+startDate.getMonthValue();
		    		}
		    		System.out.println("year month==========>"+ym);
		    		
		    		newenquirygens = crmrecordsRespositoty.findAllCRMTypeLGRForSalesPersonMonthlyJM2(ym,"Enquiry", employeeid);
		    		
		    		System.out.println("end value================>"+en);
		    		
	                if(newenquirygens.size() > 0)
					{
	                	System.out.println("size=========>"+newenquirygens.size());
	                	
	                	newenquirygen.add(i,newenquirygens.size());
					}
	                
	                monthname.add(month);
	                
	                i++;
	                
		    	}
                
                org.json.JSONObject parent=new org.json.JSONObject();
    		    parent.put("newenquirygen", newenquirygen);
    		    parent.put("monthname", monthname);
    		    
    		    
    		     String json = null;
    			 
    			 json = new Gson().toJson(parent);
    				response.setContentType("application/json");
    				try {
    					response.getWriter().write(json);
    				} catch (IOException e) {
    					// TODO Auto-generated catch block
    					e.printStackTrace();
    				}
                
		    }
		    
		    
		    
		    @RequestMapping(value = "/resetsalesevent", method = RequestMethod.GET)
			public void employeeTotalCount1(HttpServletRequest request, HttpServletResponse response,Model model) throws ParseException {
		    	
		    	
		    	HttpSession session = request.getSession();

				EmployeeMaster employee = (EmployeeMaster) session.getAttribute("emp");
				
				List<Financial_Year_Setup> fs1=finacialyearsetupRepository.financialyearsetup();
				
				int employeeid = employee.getEmpid();
				
				int profileid = employee.getProfileid();
				
				List<CRMRecords> enquiries = new ArrayList<CRMRecords>();
				
				List<CRMRecords> leads = new ArrayList<CRMRecords>();
				
				List<CRMRecords> customers = new ArrayList<CRMRecords>();
				
				int enquiriescount=0, leadscount=0 ,customerscount=0 ;
				
				String year = fs1.get(0).getStart_date().substring(0,4)+" - "+fs1.get(0).getEnd_date().substring(2,4);
				
				//Added by santosh
				String inputStartDate=fs1.get(0).getStart_date()+"-01";
		    	String inputEndDate=fs1.get(0).getEnd_date()+"-01";
		    	
		    	LocalDate startDate=LocalDate.parse(inputStartDate);
		    	LocalDate endDate=LocalDate.parse(inputEndDate);
		    	
		    	Long monthsBetween = ChronoUnit.MONTHS.between(
		    	        LocalDate.parse(inputStartDate).withDayOfMonth(1),
		    	        LocalDate.parse(inputEndDate).withDayOfMonth(1));
		    	System.out.println(monthsBetween); //3
		    	
		    	int sn=0;
		    	int en=monthsBetween.intValue();
		    	
		    	List<String> monthname = new ArrayList<String>();
		    	
		    	int i=0;
				//
				List<Integer> newenquirygen = new ArrayList<Integer>(Collections.nCopies(en, 0));
				
				List<Integer> leadgen = new ArrayList<Integer>(Collections.nCopies(en, 0));
				
				List<Integer> ordergen = new ArrayList<Integer>(Collections.nCopies(en, 0));
				
				List<Integer> opportunitygen = new ArrayList<Integer>(Collections.nCopies(en, 0));
				
				List<Integer> pipelinegen = new ArrayList<Integer>(Collections.nCopies(en, 0));
				
				List<Integer> cancelledgen = new ArrayList<Integer>(Collections.nCopies(en, 0));
				
				List<Integer> enquirygen = new ArrayList<Integer>(Collections.nCopies(en, 0));
				
				List<Integer> interestedgen = new ArrayList<Integer>(Collections.nCopies(en, 0));
				
				List<Integer> notinterestedgen = new ArrayList<Integer>(Collections.nCopies(en, 0));
				
				List<Integer> leadqualifiedgen = new ArrayList<Integer>(Collections.nCopies(en, 0));
				
				List<Integer> pocgen = new ArrayList<Integer>(Collections.nCopies(en, 0));
				
				List<Integer> proposalsubmittedgen = new ArrayList<Integer>(Collections.nCopies(en, 0));
				
				List<Integer> waitingforpogen = new ArrayList<Integer>(Collections.nCopies(en, 0));
				
				List<Integer> pogen = new ArrayList<Integer>(Collections.nCopies(en, 0));
				
				List<Integer> lostgen = new ArrayList<Integer>(Collections.nCopies(en, 0));
				
				List<CRMRecords> newenquirygens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> leadgens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> ordergens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> opportunitygens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> pipelinegens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> cancelledgens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> enquirygens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> interestedgens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> notinterestedgens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> leadqualifiedgens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> pocgens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> proposalsubmittedgens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> waitingforpogens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> pogens = new ArrayList<CRMRecords>();
				
				List<CRMRecords> lostgens = new ArrayList<CRMRecords>();
				
				String isbdh = projectRoleMappingRepository.isBusinessDevelopmentHead(employee.getEmpid(), 19, employee.getEmpid(), 19);
				
				Date date = new Date();
				LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
				
				int currentmonth = localDate.getMonthValue();
				
				if(isbdh.equalsIgnoreCase("TRUE"))
				{
		            enquiries = crmrecordsRespositoty.findAllActivatedEnquiriesForHr();
					
					leads = crmrecordsRespositoty.findAllActivatedLeadsForHr();
					
					customers = crmrecordsRespositoty.findAllActivatedCustomersForHr();
					
					while(!startDate.isAfter(endDate)) {
						
						String month=startDate.getMonth().getDisplayName(TextStyle.SHORT, Locale.US);
			    		
			    		LocalDate startMonthDate=startDate.withDayOfMonth(1);
			    		
			    		LocalDate endMonthDate=startDate.withDayOfMonth(startDate.lengthOfMonth());
			    		
			    		String ym="";
			    		if(startDate.getMonthValue()<10) {
			    			  ym=startDate.getYear()+"-0"+startDate.getMonthValue();
			    		}else {
			    		      ym=startDate.getYear()+"-"+startDate.getMonthValue();
			    		}
			    		
			    		startDate=endMonthDate.plusDays(1);
						
						if(startDate.getMonthValue() < 4)
						{
							newenquirygens = crmrecordsRespositoty.findAllCRMTypeLGRForAuthorityJM(ym,"Enquiry");
							
							leadgens = crmrecordsRespositoty.findAllCRMTypeLGRForAuthorityJM(ym,"Lead");
							
							ordergens = crmrecordsRespositoty.findAllCRMTypeLGRForAuthorityJM(ym,"PO");
							
							opportunitygens = crmrecordsRespositoty.findAllLGRForAuthorityMonthlyJM(ym,"Opportunity");
							
							pipelinegens = crmrecordsRespositoty.findAllLGRForAuthorityMonthlyJM(ym,"Pipeline");
							
							cancelledgens = crmrecordsRespositoty.findAllLGRForAuthorityMonthlyJM(ym,"Cancelled");
							
							enquirygens = crmrecordsRespositoty.findAllPurposeOfEventGRForAuthorityJM(ym,"Enquiry");
							
							interestedgens = crmrecordsRespositoty.findAllPurposeOfEventGRForAuthorityJM(ym,"Interested");
							
							notinterestedgens = crmrecordsRespositoty.findAllPurposeOfEventGRForAuthorityJM(ym,"Not Interested");

							leadqualifiedgens = crmrecordsRespositoty.findAllPurposeOfEventGRForAuthorityJM(ym,"Lead Qualified");

							pocgens = crmrecordsRespositoty.findAllPurposeOfEventGRForAuthorityJM(ym,"PoC");

							proposalsubmittedgens = crmrecordsRespositoty.findAllPurposeOfEventGRForAuthorityJM(ym,"Proposal Submitted");

							waitingforpogens = crmrecordsRespositoty.findAllPurposeOfEventGRForAuthorityJM(ym,"Waiting for PO");

							pogens = crmrecordsRespositoty.findAllPurposeOfEventGRForAuthorityJM(ym,"PO");

							lostgens = crmrecordsRespositoty.findAllPurposeOfEventGRForAuthorityJM(ym,"Lost");
		                }
						else
						{
		                    newenquirygens = crmrecordsRespositoty.findAllCRMTypeLGRForAuthority(ym,"Enquiry");
							
							leadgens = crmrecordsRespositoty.findAllCRMTypeLGRForAuthority(ym,"Lead");
							
							ordergens = crmrecordsRespositoty.findAllCRMTypeLGRForAuthority(ym,"PO");
							
							opportunitygens = crmrecordsRespositoty.findAllLGRForAuthorityMonthly(ym,"Opportunity");
							
							pipelinegens = crmrecordsRespositoty.findAllLGRForAuthorityMonthly(ym,"Pipeline");
							
							cancelledgens = crmrecordsRespositoty.findAllLGRForAuthorityMonthly(ym,"Cancelled");
							
							enquirygens = crmrecordsRespositoty.findAllPurposeOfEventForAuthority(ym,"Enquiry");
							
							interestedgens = crmrecordsRespositoty.findAllPurposeOfEventForAuthority(ym,"Interested");
							
							notinterestedgens = crmrecordsRespositoty.findAllPurposeOfEventForAuthority(ym,"Not Interested");

							leadqualifiedgens = crmrecordsRespositoty.findAllPurposeOfEventForAuthority(ym,"Lead Qualified");

							pocgens = crmrecordsRespositoty.findAllPurposeOfEventForAuthority(ym,"PoC");

							proposalsubmittedgens = crmrecordsRespositoty.findAllPurposeOfEventForAuthority(ym,"Proposal Submitted");

							waitingforpogens = crmrecordsRespositoty.findAllPurposeOfEventForAuthority(ym,"Waiting for PO");

							pogens = crmrecordsRespositoty.findAllPurposeOfEventForAuthority(ym,"PO");

							lostgens = crmrecordsRespositoty.findAllPurposeOfEventForAuthority(ym,"Lost");
						}
						
						if(newenquirygens.size() > 0)
						{
		                	newenquirygen.add(i,newenquirygens.size());
						}
		                
		                if(leadgens.size() > 0)
						{
		                	leadgen.add(i,leadgens.size());
						}
		                
		                if(ordergens.size() > 0)
						{
		                	ordergen.add(i,ordergens.size());
						}
		                
		                if(opportunitygens.size() > 0)
						{
		                	opportunitygen.add(i,opportunitygens.size());
						}
		                
		                if(pipelinegens.size() > 0)
						{
		                	pipelinegen.add(i,pipelinegens.size());
						}
		                
		                if(cancelledgens.size() > 0)
						{
		                	cancelledgen.add(i,cancelledgens.size());
						}
		                
		                if(enquirygens.size() > 0)
						{
		                	enquirygen.add(i,enquirygens.size());
						}
		                
		                if(interestedgens.size() > 0)
						{
		                	interestedgen.add(i,interestedgens.size());
						}
		                
		                if(notinterestedgens.size() > 0)
						{
		                	notinterestedgen.add(i,notinterestedgens.size());
						}
		                
		                if(leadqualifiedgens.size() > 0)
						{
		                	leadqualifiedgen.add(i,leadqualifiedgens.size());
						}
		                
		                if(pocgens.size() > 0)
						{
		                	pocgen.add(i,pocgens.size());
						}
		                
		                if(proposalsubmittedgens.size() > 0)
						{
		                	proposalsubmittedgen.add(i,proposalsubmittedgens.size());
						}
		                
		                if(waitingforpogens.size() > 0)
						{
		                	waitingforpogen.add(i,waitingforpogens.size());
						}
		                
		                if(pogens.size() > 0)
						{
		                	pogen.add(i,pogens.size());
						}
		                
		                if(lostgens.size() > 0)
						{
		                	lostgen.add(i,lostgens.size());
						}
		                
		                monthname.add(month.toUpperCase());
		                
		                i++;
					}
				}
				
				else if(employee.getProfileid()== 6)
				{
		            enquiries = crmrecordsRespositoty.findAllActivatedEnquiriesForHr();
					
					leads = crmrecordsRespositoty.findAllActivatedLeadsForHr();
					
					customers = crmrecordsRespositoty.findAllActivatedCustomersForHr();
					
					while(!startDate.isAfter(endDate)) {
						
						String month=startDate.getMonth().getDisplayName(TextStyle.SHORT, Locale.US);
			    		
			    		LocalDate startMonthDate=startDate.withDayOfMonth(1);
			    		
			    		LocalDate endMonthDate=startDate.withDayOfMonth(startDate.lengthOfMonth());
			    		
			    		String ym="";
			    		if(startDate.getMonthValue()<10) {
			    			  ym=startDate.getYear()+"-0"+startDate.getMonthValue();
			    		}else {
			    		      ym=startDate.getYear()+"-"+startDate.getMonthValue();
			    		}
				    	
			    		System.out.println("start date====================>"+ym);
			    		startDate=endMonthDate.plusDays(1);
						
							if(startDate.getMonthValue() <4)
							{	
							newenquirygens = crmrecordsRespositoty.findAllCRMTypeLGRForAuthorityJM(ym,"Enquiry");
							
							leadgens = crmrecordsRespositoty.findAllCRMTypeLGRForAuthorityJM(ym,"Lead");
							
							ordergens = crmrecordsRespositoty.findAllCRMTypeLGRForAuthorityJM(ym,"PO");
							
							opportunitygens = crmrecordsRespositoty.findAllLGRForAuthorityMonthlyJM(ym,"Opportunity");
							
							pipelinegens = crmrecordsRespositoty.findAllLGRForAuthorityMonthlyJM(ym,"Pipeline");
							
							cancelledgens = crmrecordsRespositoty.findAllLGRForAuthorityMonthlyJM(ym,"Cancelled");
							
							enquirygens = crmrecordsRespositoty.findAllPurposeOfEventGRForAuthorityJM(ym,"Enquiry");
							
							interestedgens = crmrecordsRespositoty.findAllPurposeOfEventGRForAuthorityJM(ym,"Interested");
							
							notinterestedgens = crmrecordsRespositoty.findAllPurposeOfEventGRForAuthorityJM(ym,"Not Interested");

							leadqualifiedgens = crmrecordsRespositoty.findAllPurposeOfEventGRForAuthorityJM(ym,"Lead Qualified");

							pocgens = crmrecordsRespositoty.findAllPurposeOfEventGRForAuthorityJM(ym,"PoC");

							proposalsubmittedgens = crmrecordsRespositoty.findAllPurposeOfEventGRForAuthorityJM(ym,"Proposal Submitted");

							waitingforpogens = crmrecordsRespositoty.findAllPurposeOfEventGRForAuthorityJM(ym,"Waiting for PO");

							pogens = crmrecordsRespositoty.findAllPurposeOfEventGRForAuthorityJM(ym,"PO");

							lostgens = crmrecordsRespositoty.findAllPurposeOfEventGRForAuthorityJM(ym,"Lost");
		                }
						else
						{
		                    newenquirygens = crmrecordsRespositoty.findAllCRMTypeLGRForAuthority(ym,"Enquiry");
							
							leadgens = crmrecordsRespositoty.findAllCRMTypeLGRForAuthority(ym,"Lead");
							
							ordergens = crmrecordsRespositoty.findAllCRMTypeLGRForAuthority(ym,"PO");
							
							opportunitygens = crmrecordsRespositoty.findAllLGRForAuthorityMonthly(ym,"Opportunity");
							
							pipelinegens = crmrecordsRespositoty.findAllLGRForAuthorityMonthly(ym,"Pipeline");
							
							cancelledgens = crmrecordsRespositoty.findAllLGRForAuthorityMonthly(ym,"Cancelled");
							
							enquirygens = crmrecordsRespositoty.findAllPurposeOfEventForAuthority(ym,"Enquiry");
							
							interestedgens = crmrecordsRespositoty.findAllPurposeOfEventForAuthority(ym,"Interested");
							
							notinterestedgens = crmrecordsRespositoty.findAllPurposeOfEventForAuthority(ym,"Not Interested");

							leadqualifiedgens = crmrecordsRespositoty.findAllPurposeOfEventForAuthority(ym,"Lead Qualified");

							pocgens = crmrecordsRespositoty.findAllPurposeOfEventForAuthority(ym,"PoC");

							proposalsubmittedgens = crmrecordsRespositoty.findAllPurposeOfEventForAuthority(ym,"Proposal Submitted");

							waitingforpogens = crmrecordsRespositoty.findAllPurposeOfEventForAuthority(ym,"Waiting for PO");

							pogens = crmrecordsRespositoty.findAllPurposeOfEventForAuthority(ym,"PO");

							lostgens = crmrecordsRespositoty.findAllPurposeOfEventForAuthority(ym,"Lost");
						}
						
						if(newenquirygens.size() > 0)
						{
		                	newenquirygen.add(i,newenquirygens.size());
						}
		                
		                if(leadgens.size() > 0)
						{
		                	leadgen.add(i,leadgens.size());
						}
		                
		                if(ordergens.size() > 0)
						{
		                	ordergen.add(i,ordergens.size());
						}
		                
		                if(opportunitygens.size() > 0)
						{
		                	opportunitygen.add(i,opportunitygens.size());
						}
		                
		                if(pipelinegens.size() > 0)
						{
		                	pipelinegen.add(i,pipelinegens.size());
						}
		                
		                if(cancelledgens.size() > 0)
						{
		                	cancelledgen.add(i,cancelledgens.size());
						}
		                
		                if(enquirygens.size() > 0)
						{
		                	enquirygen.add(i,enquirygens.size());
						}
		                
		                if(interestedgens.size() > 0)
						{
		                	interestedgen.add(i,interestedgens.size());
						}
		                
		                if(notinterestedgens.size() > 0)
						{
		                	notinterestedgen.add(i,notinterestedgens.size());
						}
		                
		                if(leadqualifiedgens.size() > 0)
						{
		                	leadqualifiedgen.add(i,leadqualifiedgens.size());
						}
		                
		                if(pocgens.size() > 0)
						{
		                	pocgen.add(i,pocgens.size());
						}
		                
		                if(proposalsubmittedgens.size() > 0)
						{
		                	proposalsubmittedgen.add(i,proposalsubmittedgens.size());
						}
		                
		                if(waitingforpogens.size() > 0)
						{
		                	waitingforpogen.add(i,waitingforpogens.size());
						}
		                
		                if(pogens.size() > 0)
						{
		                	pogen.add(i,pogens.size());
						}
		                
		                if(lostgens.size() > 0)
						{
		                	lostgen.add(i,lostgens.size());
						}
		                   
		                monthname.add(month.toUpperCase());
		                
		                i++;
		                
					}
				}
				else
				{
					enquiries = crmrecordsRespositoty.findAllActivatedEnquiries(employeeid);
					
					leads = crmrecordsRespositoty.findAllActivatedLeads(employeeid);
					
					customers = crmrecordsRespositoty.findAllActivatedCustomers(employeeid);
					
					while(!startDate.isAfter(endDate)) {
						
						String month=startDate.getMonth().getDisplayName(TextStyle.SHORT, Locale.US);
			    		
			    		LocalDate startMonthDate=startDate.withDayOfMonth(1);
			    		
			    		LocalDate endMonthDate=startDate.withDayOfMonth(startDate.lengthOfMonth());
			    		
			    		String ym="";
			    		if(startDate.getMonthValue()<10) {
			    			  ym=startDate.getYear()+"-0"+startDate.getMonthValue();
			    		}else {
			    		      ym=startDate.getYear()+"-"+startDate.getMonthValue();
			    		}

			    		startDate=endMonthDate.plusDays(1);
			    		
							if(startDate.getMonthValue() < 4)
							{	
							
							newenquirygens = crmrecordsRespositoty.findAllCRMTypeLGRForSalesPersonMonthlyJM(ym,"Enquiry", employee.getEmpid());
							
							leadgens = crmrecordsRespositoty.findAllCRMTypeLGRForSalesPersonMonthlyJM(ym,"Lead", employee.getEmpid());
							
							ordergens = crmrecordsRespositoty.findAllCRMTypeLGRForSalesPersonMonthlyJM(ym,"PO", employee.getEmpid());
							
							opportunitygens = crmrecordsRespositoty.findAllLGRForSalesPersonMonthlyJM(ym,"Opportunity", employee.getEmpid());
							
							pipelinegens = crmrecordsRespositoty.findAllLGRForSalesPersonMonthlyJM(ym,"Pipeline", employee.getEmpid());
							
							cancelledgens = crmrecordsRespositoty.findAllLGRForSalesPersonMonthlyJM(ym,"Cancelled", employee.getEmpid());
							
							enquirygens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM(ym,"Enquiry", employee.getEmpid());
							
							interestedgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM(ym,"Interested", employee.getEmpid());
							
							notinterestedgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM(ym,"Not Interested", employee.getEmpid());
						
							leadqualifiedgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM(ym,"Lead Qualified", employee.getEmpid());
							
							pocgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM(ym,"PoC", employee.getEmpid());
							
							proposalsubmittedgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM(ym,"Proposal Submitted", employee.getEmpid());
							
							waitingforpogens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM(ym,"Waiting for PO", employee.getEmpid());

							pogens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM(ym,"PO", employee.getEmpid());
							
							lostgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthlyJM(ym,"Lost", employee.getEmpid());
						
						}
						else
						{
							newenquirygens = crmrecordsRespositoty.findAllCRMTypeLGRForSalesPersonMonthly(ym,"Enquiry", employee.getEmpid());
							
							leadgens = crmrecordsRespositoty.findAllCRMTypeLGRForSalesPersonMonthly(ym,"Lead", employee.getEmpid());
							
							ordergens = crmrecordsRespositoty.findAllCRMTypeLGRForSalesPersonMonthly(ym,"PO", employee.getEmpid());
							
							opportunitygens = crmrecordsRespositoty.findAllLGRForSalesPersonMonthly(ym,"Opportunity", employee.getEmpid());
							
							pipelinegens = crmrecordsRespositoty.findAllLGRForSalesPersonMonthly(ym,"Pipeline", employee.getEmpid());
							
							cancelledgens = crmrecordsRespositoty.findAllLGRForSalesPersonMonthly(ym,"Cancelled", employee.getEmpid());
							
		                    enquirygens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthly(ym,"Enquiry", employee.getEmpid());
							
							interestedgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthly(ym,"Interested", employee.getEmpid());
							
							notinterestedgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthly(ym,"Not Interested", employee.getEmpid());
						
							leadqualifiedgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthly(ym,"Lead Qualified", employee.getEmpid());
							
							pocgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthly(ym,"PoC", employee.getEmpid());
							
							proposalsubmittedgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthly(ym,"Proposal Submitted", employee.getEmpid());
							
							waitingforpogens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthly(ym,"Waiting for PO", employee.getEmpid());

							pogens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthly(ym,"PO", employee.getEmpid());
							
							lostgens = crmrecordsRespositoty.findAllPurposeOfEventLGRForSalesPersonMonthly(ym,"Lost", employee.getEmpid());
						
						}
						
		                if(newenquirygens.size() > 0)
						{
		                	newenquirygen.add(i,newenquirygens.size());
						}
		                
		                if(leadgens.size() > 0)
						{
		                	leadgen.add(i,leadgens.size());
						}
		                
		                if(ordergens.size() > 0)
						{
		                	ordergen.add(i,ordergens.size());
						}
		                
		                if(opportunitygens.size() > 0)
						{
		                	opportunitygen.add(i,opportunitygens.size());
						}
		                
		                if(pipelinegens.size() > 0)
						{
		                	pipelinegen.add(i,pipelinegens.size());
						}
		                
		                if(cancelledgens.size() > 0)
						{
		                	cancelledgen.add(i,cancelledgens.size());
						}
		                
		                if(enquirygens.size() > 0)
						{
		                	enquirygen.add(i,enquirygens.size());
						}
		                
		                if(interestedgens.size() > 0)
						{
		                	interestedgen.add(i,interestedgens.size());
						}
		                
		                if(notinterestedgens.size() > 0)
						{
		                	notinterestedgen.add(i,notinterestedgens.size());
						}
		                
		                if(leadqualifiedgens.size() > 0)
						{
		                	leadqualifiedgen.add(i,leadqualifiedgens.size());
						}
		                
		                if(pocgens.size() > 0)
						{
		                	pocgen.add(i,pocgens.size());
						}
		                
		                if(proposalsubmittedgens.size() > 0)
						{
		                	proposalsubmittedgen.add(i,proposalsubmittedgens.size());
						}
		                
		                if(waitingforpogens.size() > 0)
						{
		                	waitingforpogen.add(i,waitingforpogens.size());
						}
		                
		                if(pogens.size() > 0)
						{
		                	pogen.add(i,pogens.size());
						}
		                
		                if(lostgens.size() > 0)
						{
		                	lostgen.add(i,lostgens.size());
						}
		                
		                monthname.add(month.toUpperCase());
		                
		                i++;
		             }
				}
				
				
				if(enquiries.size() > 0)
				{
					enquiriescount = enquiries.size();
					System.out.println(enquiriescount);
				}
				
				if(leads.size() > 0)
				{
					leadscount = leads.size();
				}
				
				if(customers .size() > 0)
				{
					customerscount = customers.size();
				}
				
				String[] arr = new String[monthname.size()];
				
				for (int i1 = 0; i1 < monthname.size(); i1++) {
		            arr[i1] = monthname.get(i1);
		 
				}
				
				String output = "";

			    for (int i2 = 0; i2 < arr.length; i2++) {
			        output += "\"" + arr[i2] + "\"";
			        if (i2 != arr.length - 1) {
			            output += ",";
			        }
			    }
		    
			    List<String> monthname1= new ArrayList<String>();
				
			    monthname1.add(output);
			    
			    System.out.println("==================>"+monthname1);
				
//				System.out.println("*** enquiriescount ==> "+enquiriescount+" leadscount ==> "+leadscount+" customerscount ==> "+customerscount+" *** profileid ==> "+profileid);
				
				 org.json.JSONObject parent=new org.json.JSONObject();
				    parent.put("newenquirygen", newenquirygen);
					parent.put("leadgen", leadgen);
					parent.put("ordergen", ordergen);
					parent.put("opportunitygen", opportunitygen);
					parent.put("pipelinegen", pipelinegen);
					parent.put("cancelledgen", cancelledgen);
					parent.put("enquirygen", enquirygen);
					parent.put("interestedgen", interestedgen);
					parent.put("notinterestedgen", notinterestedgen);
					parent.put("leadqualifiedgen", leadqualifiedgen);
					parent.put("pocgen", pocgen);
					parent.put("proposalsubmittedgen", proposalsubmittedgen);
					parent.put("waitingforpogen", waitingforpogen);
					parent.put("pogen", pogen);
					parent.put("lostgen", lostgen);
					parent.put("monthname", monthname);
				    
				      String json = null;
					 
					 json = new Gson().toJson(parent);
						response.setContentType("application/json");
						try {
							response.getWriter().write(json);
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
		    }
		    
		    
		    
		    @RequestMapping(value = "/uploadcrmfile")
		    public ModelAndView uploadFile(Model model,HttpServletRequest request,@RequestParam("upload_file") MultipartFile files) throws IOException {
		    	
		    					
				HttpSession session = request.getSession();

				EmployeeMaster employee1 = (EmployeeMaster) session.getAttribute("emp");
				
				if(employee1 == null)
				{
					String errormsg = "Sorry!Your session has expired.Please login again to continue";
					
					model.addAttribute("errormsg", errormsg);
					
					return new ModelAndView("crmerror");
				}

				int employeeid = employee1.getEmpid();
				
				int datasources = 3;
				
				CrmDataSource crmDataSource = crmDataSourceRepository.findByCrmdsid(datasources);
		    	
		       File f=convert(files);
		       
			    // Read the Excel file using Poiji
		       List<EmployeeData> employeeDataList = Poiji.fromExcel(f, EmployeeData.class);
		       
		    // Iterate through each employee in the list
		       for (int row = 0; row < employeeDataList.size(); row++) {
		           EmployeeData employee = employeeDataList.get(row);
		           
		           // Check for null values and throw an exception with specific row and column details
		           if (employee.getCompanyName() == null || employee.getCompanyName().isEmpty()) {
		               //throw new RuntimeException("Null value found at row " + (row + 1) + ", column 'Company Name'");
		        	   String errormsg= "Empty value found at row : " + (row + 1) +",  column : Company Name";
		        	   model.addAttribute("errormsg", errormsg);
		        	
		        	   return new ModelAndView("excelerror");
		           }
		           if (employee.getIndustry() == null || employee.getIndustry().isEmpty()) {
//		               throw new RuntimeException("Null value found at row " + (row + 1) + ", column 'Industry'");
		        	   
		        	   String errormsg= "Empty value found at row : " + (row + 1) +",  column : Industry";
		        	   model.addAttribute("errormsg", errormsg);
		        	   
		        	   return new ModelAndView("excelerror");
  		           }
		           
		           if (employee.getContactPerson() == null || employee.getContactPerson().isEmpty()) {
		             //  throw new RuntimeException("Null value found at row " + (row + 1) + ", column 'Contact Person'");
		        	  
		        	   String errormsg= "Empty value found at row : " + (row + 1) +",  column : Contact Person";
		        	   model.addAttribute("errormsg", errormsg);
		        	   return new ModelAndView("excelerror");
		           }
		           if (employee.getDesignation() == null || employee.getDesignation().isEmpty()) {
//		               throw new RuntimeException("Null value found at row " + (row + 1) + ", column 'Designation'");
		        	   String errormsg= "Empty value found at row : " + (row + 1) +",  column : Designation";
		        	   model.addAttribute("errormsg", errormsg);
		        	   return new ModelAndView("excelerror");
		           }
		           if (employee.getMobileNo() == null || employee.getMobileNo().isEmpty()) {
		           //    throw new RuntimeException("Null value found at row " + (row + 1) + ", column 'Mobile No'");
		        	   String errormsg= "Empty value found at row : " + (row + 1) +",  column : Mobile No";
		        	   model.addAttribute("errormsg", errormsg);
		        	   return new ModelAndView("excelerror");
		           }
		           if (employee.getAlternateNo() == null || employee.getAlternateNo().isEmpty()) {
		               //throw new RuntimeException("Null value found at row " + (row + 1) + ", column 'Alternate No'");
		        	   String errormsg= "Empty value found at row : " + (row + 1) +",  column : Alternate No";
		        	   model.addAttribute("errormsg", errormsg); 
		        	   return new ModelAndView("excelerror");
		           }
		           if (employee.getEmailId() == null || employee.getEmailId().isEmpty()) {
		              // throw new RuntimeException("Null value found at row " + (row + 1) + ", column 'Email'");
		        	   String errormsg= "Empty value found at row : " + (row + 1) +",  column : Email";
		        	   model.addAttribute("errormsg", errormsg);
		        	   return new ModelAndView("excelerror");
		           }
		           if (employee.getAlternateEmailId() == null || employee.getAlternateEmailId().isEmpty()) {
//		               throw new RuntimeException("Null value found at row " + (row + 1) + ", column 'Alternate Email'");
		        	   String errormsg= "Empty value found at row : " + (row + 1) +",  column : Alternate Email";
		        	   model.addAttribute("errormsg", errormsg);
		        	   return new ModelAndView("excelerror");
		           }
		           if (employee.getCity() == null || employee.getCity().isEmpty()) {
//		               throw new RuntimeException("Null value found at row " + (row + 1) + ", column 'City'");
		        	   String errormsg= "Empty value found at row : " + (row + 1) +",  column : City";
		        	   model.addAttribute("errormsg", errormsg);
		        	   return new ModelAndView("excelerror");  
		           }
		           if (employee.getCountry() == null || employee.getCountry().isEmpty()) {
//		               throw new RuntimeException("Null value found at row " + (row + 1) + ", column 'Country'");
		        	   String errormsg= "Empty value found at row : " + (row + 1) +",  column : Country";
		        	   model.addAttribute("errormsg", errormsg);
		        	   return new ModelAndView("excelerror");
		           }
		           if (employee.getEmployeeSize() == null || employee.getEmployeeSize().isEmpty()) {
//		               throw new RuntimeException("Null value found at row " + (row + 1) + ", column 'Employee Size'");
		        	   String errormsg= "Empty value found at row : " + (row + 1) +",  column : Employee Size";
		        	   model.addAttribute("errormsg", errormsg);
		        	   return new ModelAndView("excelerror");
		           }
		           if (employee.getCallStatus() == null || employee.getCallStatus().isEmpty()) {
//		               throw new RuntimeException("Null value found at row " + (row + 1) + ", column 'Call Status'");
		        	   String errormsg= "Empty value found at row : " + (row + 1) +",  column : Call Status";
		        	   model.addAttribute("errormsg", errormsg);
		        	   return new ModelAndView("excelerror");
		           }
		           if (employee.getRemark() == null || employee.getRemark().isEmpty()) {
//		               throw new RuntimeException("Null value found at row " + (row + 1) + ", column 'Remark'");
		        	   String errormsg= "Empty value found at row : " + (row + 1) +",  column : Remark";
		        	   model.addAttribute("errormsg", errormsg);
		        	   return new ModelAndView("excelerror");
		           }
		           
		           // Print values if everything is fine
		           System.out.println("companyName: " + employee.getCompanyName());
		           System.out.println("industry: " + employee.getIndustry());
		           System.out.println("contactPerson: " + employee.getContactPerson());
		           System.out.println("Designation: " + employee.getDesignation());
		           System.out.println("Mobile No: " + employee.getMobileNo());
		           System.out.println("Alternate No: " + employee.getAlternateNo());
		           System.out.println("Email: " + employee.getEmailId());
		           System.out.println("Alternate Email: " + employee.getAlternateEmailId());
		           System.out.println("City: " + employee.getCity());
		           System.out.println("Country: " + employee.getCountry());
		           System.out.println("Employee Size: " + employee.getEmployeeSize());
		           System.out.println("Call Status: " + employee.getCallStatus());
		           System.out.println("Remark: " + employee.getRemark());
		       }

		       
		    // Read the Excel file using Poiji
//		       List<EmployeeData> employeeDataList = Poiji.fromExcel(f, EmployeeData.class);
	            
	         // Iterate through the list using the enhanced for-each loop
		       for (int row = 0; row < employeeDataList.size(); row++) {
		           EmployeeData employee = employeeDataList.get(row);
	            	
	            	CRMRecords enquiry = new CRMRecords();
	            	
	    			enquiry.setCrmDataSource(crmDataSource);
	    			
	    			enquiry.setOffering("Java");
	    			
	    			enquiry.setCompanyname(employee.getCompanyName());
	    			
	    			enquiry.setNickname("");
	    			
	    			enquiry.setCalling_status(employee.getCallStatus());
	    			
	    			enquiry.setIndustry_of_company(employee.getIndustry());

	    			enquiry.setAlternative_email_id(employee.getAlternateEmailId());

	    			enquiry.setCalling_status_remark(employee.getRemark());
	    			
	    			enquiry.setEmployeesize("1 to 50");
	    			
	    			enquiry.setAnnualturnover("1 to 5");
	    			
	    			if(employee.getCountry().equalsIgnoreCase("India")) {
	    
	    				//santosh commited code				
	   // 				  int countryid = 101;
	    					
	    				//  String country = countriesRepository.findByCountryid(countryid).getName();	
	    			
	    				List<Main_Territory> mainterritory = mainterritoryRepository.findByAssignedEmpid(employeeid);	
	    				
		    			int countryid = mainterritory.get(0).getTerritory_id().getCountryid().getCountryid();
	    					
		    		    String country = countriesRepository.findByCountryid(countryid).getName();	
		    
	    				
	    			enquiry.setDistrict("Pune");
//	    			
	    			enquiry.setState("Maharashtra");
	    			
	    			enquiry.setCountry(country);
	    			
	    			enquiry.setCountrytype(String.valueOf(282));
	    			
	    			}else {
	    			     
	    			List<Main_Territory> mainterritory = mainterritoryRepository.findByAssignedEmpid(employeeid);	
	    				
	    			int countryid = mainterritory.get(0).getTerritory_id().getCountryid().getCountryid();
    					
	    		    String country = countriesRepository.findByCountryid(countryid).getName();	
	    			
//	    			enquiry.setDistrict("Pune");
////	    			
//	    			enquiry.setState("Maharashtra");
	    			
	    			enquiry.setCountry(country);
	    			
	    			enquiry.setCountrytype(String.valueOf(mainterritory.get(0).getTerritory_id().getTerritory_name()));
	    				   
	    			}
	    			
	    			enquiry.setIsactivated("Y");
	    			
	    			enquiry.setCrmtype("Enquiry");
	    			
	    			enquiry.setCreatedby(employee1);
	    			
	    			enquiry.setSourcingdate(new Date());
	    			
	    			enquiry.setCreationdate(new Date()); 
	    			
	    			enquiry.setLastupdatedby(employeeid);
	    			
	    			enquiry.setLastupdateddate(new Date());
	    			
//	    			enquiry.setAddress1(address1);
	    			
//	    			enquiry.setAddress2(address2);
	    			
	    			enquiry.setCity(employee.getCity());
	    			
//	    			if(isassigneto.equals("Yes"))
//	    			{
//	    				int assigneto = Integer.parseInt(request.getParameter("assigneto"));
//	    				EmployeeMaster emp = employeeMasterRepository.findByEmpid(assigneto);
//	    				
//	    				enquiry.setAssigneto(emp);
//	    			}
//	    			else
//	    			{
	    				enquiry.setAssigneto(employee1);
//	    			}
	    			
	    			enquiry.setCrmevent("Telephonic Call");
	    			
//	    			if(purposeofevent.equals("Other"))
//	    			{
//	    				othpurposeofevent = request.getParameter("othpofevent");
//	    				enquiry.setPurposeofevent(othpurposeofevent);
//	    			}
//	    			else
//	    			{
	    				enquiry.setPurposeofevent("Enquiry");
//	    			}
	    			
	    				
	    				
	    			enquiry.setStatus("Enquiry");
	    			
	    			CRMRecords saveenquiry = crmrecordsRespositoty.save(enquiry);
	    			
	    			
	    			CRMRecordsContacts enquiriescontacts = new CRMRecordsContacts();
	    			
	    			enquiriescontacts.setCrmrecordsid(saveenquiry);
					
					enquiriescontacts.setContactname(employee.getContactPerson());
					
					enquiriescontacts.setDesignation(employee.getDesignation());
					
					enquiriescontacts.setMobileno(employee.getMobileNo());
					
					enquiriescontacts.setOfficeno(employee.getAlternateNo());
					
					enquiriescontacts.setEmailid(employee.getEmailId());
					
					enquiriescontacts.setAltemail(employee.getAlternateEmailId());
					
					enquiriescontacts.setAuthority("Manager");
					
					enquiriesContactsRepository.save(enquiriescontacts);
					
					enquiriescontacts = null;
	    			
	            	
	            	
	            	System.out.println("companyName: "+employee.getCompanyName());
	            	System.out.println("industry: "+employee.getIndustry());
	            	System.out.println("contactPerson: "+employee.getContactPerson());
	                System.out.println("Designation: " + employee.getDesignation());
	                System.out.println("Mobile No: " + employee.getMobileNo());
	                System.out.println("Alternate No: " + employee.getAlternateNo());
	                System.out.println("Email: " + employee.getEmailId());
	                System.out.println("Alternate Email: " + employee.getAlternateEmailId());
	                System.out.println("City: " + employee.getCity());
	                System.out.println("Country: " + employee.getCountry());
	                System.out.println("Employee Size: " + employee.getEmployeeSize());
	                System.out.println("Call Status: " + employee.getCallStatus());
	                System.out.println("Remark: " + employee.getRemark());
	                System.out.println("---------------------------");
	            }
	            
		       String savemsg = "success";

	            return new ModelAndView("redirect:enquiries?savemsg='" + URLEncoder.encode(savemsg) + "'");
		    }
		    
		    
		    
		    public File convert(MultipartFile file) throws IOException 
		    {
		     File convFile = new File(file.getOriginalFilename());
		     file.transferTo(convFile);
		     return convFile;
		   }
}



