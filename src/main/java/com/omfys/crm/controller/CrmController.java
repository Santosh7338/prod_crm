package com.omfys.crm.controller;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Iterator;

import java.io.IOException;


import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Year;
import java.time.ZoneId;
import java.time.format.TextStyle;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.persistence.Transient;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.google.gson.Gson;
import com.omfys.crm.Repository.CRMEventMasterRepository;
import com.omfys.crm.Repository.CRMEventsRepository;
import com.omfys.crm.Repository.CrmDataSourceRepository;
import com.omfys.crm.Repository.Crm_calling_history_repositry;
import com.omfys.crm.Repository.DistrictMasterRepository;
import com.omfys.crm.Repository.EmployeeMasterRepository;
import com.omfys.crm.Repository.FinacialyearsetupRepository;
import com.omfys.crm.Repository.IncentiveConfigurationRepository;
import com.omfys.crm.Repository.JoiningDetailsReposiory;
import com.omfys.crm.Repository.LeadDocumentsRepository;
import com.omfys.crm.Repository.CRMRecordsContactsRepository;
import com.omfys.crm.Repository.CRMRecordsRespositoty;
import com.omfys.crm.Repository.CountriesRepository;
import com.omfys.crm.Repository.MainMenuRepository;
import com.omfys.crm.Repository.OfferingRepository;
import com.omfys.crm.Repository.PersonalDetailsRepository;
import com.omfys.crm.Repository.ProjectRoleMappingRepository;
import com.omfys.crm.Repository.PurposeOfEventRepository;
import com.omfys.crm.Repository.StateMasterRepository;
import com.omfys.crm.Repository.StatusOfEventRepository;
import com.omfys.crm.Repository.SubSubMenuRepository;
import com.omfys.crm.Repository.SubmenuRepository;
import com.omfys.crm.Repository.TargetConfigurationRepository;
import com.omfys.crm.dao.crmDao;
import com.omfys.crm.model.CRMEventMaster;
import com.omfys.crm.model.CRMEvents;
import com.omfys.crm.model.CrmDataSource;
import com.omfys.crm.model.Crm_Sub_Menu;
import com.omfys.crm.model.Crm_Sub_Sub_Menu;
import com.omfys.crm.model.EmployeeMaster;
import com.omfys.crm.model.Financial_Year_Setup;
import com.omfys.crm.model.IncentiveConfiguration;
import com.omfys.crm.model.JoiningDetails;
import com.omfys.crm.model.JoiningInformation;
import com.omfys.crm.model.LeadDocuments;
import com.omfys.crm.model.Lead_to_Customer;
import com.omfys.crm.model.CRMRecords;
import com.omfys.crm.model.CRMRecordsContacts;
import com.omfys.crm.model.Calling_Status_History;
import com.omfys.crm.model.Countries;
import com.omfys.crm.model.MainMenu;
import com.omfys.crm.model.Offering;
import com.omfys.crm.model.PersonalDetails;
import com.omfys.crm.model.ProjectRoleMapping;
import com.omfys.crm.model.PurposeOfEvent;
import com.omfys.crm.model.RenewedMailCommunication;
import com.omfys.crm.model.StatusOfEvent;
import com.omfys.crm.model.TargetConfiguration;
import com.omfys.crm.utility.MailService;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.time.ZoneId;
import java.time.ZonedDateTime;


@Controller
public class CrmController {
	
	@Autowired
	MainMenuRepository mainmenuRepository;
	
	@Autowired
	Crm_calling_history_repositry crm_calling_history_repositry;
	
	
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
	private Environment environment;
	
	@Autowired
	SubmenuRepository submenurepository;
	
	@Autowired
	SubSubMenuRepository subsubmenurepository;
	
	@Autowired
	FinacialyearsetupRepository finacialyearsetupRepository;
	
	@Autowired
	private crmDao crmdao;
	
//	@Autowired
//	MailService mailService;

	private final static Logger LOGGER =  Logger.getLogger(Logger.GLOBAL_LOGGER_NAME);
	
	@RequestMapping("/")
	public ModelAndView welcome(HttpServletRequest request, Model m) {

		HttpSession session = request.getSession();

        String kwm_user = (String) request.getSession().getAttribute("kwm_user");

		EmployeeMaster employee = (EmployeeMaster) session.getAttribute("emp");

		if (kwm_user != null) {
			kwm_user = (String) request.getSession().getAttribute("kwm_user");
			String Emp_Code = (String) request.getSession().getAttribute("emp_code");
			String Password = (String) request.getSession().getAttribute("password");
			Integer profile_id = (Integer) request.getSession().getAttribute("profile_id");

			if (profile_id == 1) {
				return new ModelAndView("redirect:rsm");

			} else if (profile_id == 6) {
				return new ModelAndView("redirect:Dashboard");
			}

		}
        return new ModelAndView("welcome");

	}
	
	@RequestMapping("/Login_User")
	public ModelAndView getLogin_User(HttpServletRequest request,
			@ModelAttribute("kwm_users") EmployeeMaster kwm_users, BindingResult resultkwm_users,
			final RedirectAttributes re, ModelMap map, Model model, @RequestParam int id) throws AddressException, MessagingException
	{
		Date date = new Date();
		LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		
		int currentmonth = localDate.getMonthValue();
		
		String login_user = (String) request.getSession().getAttribute("kwm_users");
		
		if (login_user == null)
		{
            EmployeeMaster empmaster = employeeMasterRepository.findByEmpid(id);
			
			if (empmaster != null)
			{
//				System.out.println("inside login user not null"+empmaster.getProfileid());
				HttpSession session = request.getSession(true);

				List<MainMenu> mainmenus = new ArrayList<MainMenu>();
				
				boolean issales = false;
				
				int year = Year.now().getValue();
				
				if(crmdao.isCRMAdmin(empmaster, "CRM Admin"))
				{
					
//					mainmenus = mainmenuRepository.findMainMenuForemployee(empmaster.getProfileid());
					
					mainmenus = mainmenuRepository.findMainMenuForAdmin("CRM Admin",empmaster.getEmpid());
					
					//sub manus 
					for (MainMenu mg : mainmenus) {
//						System.out.println("Main Menu Id is " + mg.getMain_menu_id()); 

						List<Crm_Sub_Menu> menu_line = submenurepository.findSubManu(mg.getMainmenuid());

						/*
						 * for (int i = 0; i < menu_line.size(); i++) {
						 * System.out.println("Sub Menu For Testing is " +
						 * menu_line.get(i).getSub_menu_action_name()); }
						 */

						if (menu_line.isEmpty()) {

						} 
						else 
						{
							session.setAttribute("submenu", menu_line);
							session.setAttribute("submenu" + Integer.toString(mg.getMainmenuid()), menu_line);
							for (Crm_Sub_Menu submenu : menu_line) {
								/* System.out.println("Sub Menu is ==> " + submenu.getSub_menu_name()); */

								List<Crm_Sub_Sub_Menu> sub_menu_line = subsubmenurepository.findSubSubMenu(mg.getMainmenuid(), submenu.getSub_menu_id());

								if (sub_menu_line.size() > 0) {
									session.setAttribute("subsubmenu" + Integer.toString(submenu.getSub_menu_id()),
											sub_menu_line);

									/*
									 * for (Project_Sub_Sub_Menu subsubmenu : sub_menu_line) {
									 * System.out.println("Sub Sub Menu Is ===> " +
									 * subsubmenu.getSub_sub_menu_name()); }
									 */
								}
							}
						}
					}

					session.setMaxInactiveInterval(-1);
					
					//
				
				}
				else
				{

					ArrayList<String> salesid = new ArrayList<String>();
					salesid.add("Presales Executive");
					salesid.add("Presales Manager");
					salesid.add("BDM");
					salesid.add("Sales Executive");
					salesid.add("Sales Manager");
					
					List<ProjectRoleMapping> projectrolemap = projectRoleMappingRepository.findByEmployeeId(empmaster.getEmpid());
					
					for(int i=0;i<projectrolemap.size();i++)
					{
						if(salesid.contains(projectrolemap.get(i).getProjectrole().getProjectrolename()))
						{
							if(projectrolemap.get(i).getProjectrole().getProjectrolename().equalsIgnoreCase("Sales Manager") ||
									projectrolemap.get(i).getProjectrole().getProjectrolename().equalsIgnoreCase("BDM")){
								
								
							}
							
							issales = true;
							break;
						}
					}
					
					String isbdh = projectRoleMappingRepository.isBusinessDevelopmentHead(empmaster.getEmpid(), 19, empmaster.getEmpid(), 19);
					
					System.out.println("issales ==> "+issales+" isbdh ==> "+isbdh);
					
					if(isbdh.equalsIgnoreCase("TRUE"))
					{
						
						mainmenus = mainmenuRepository.findMainMenuForemployee("BDA");
						
//						mainmenus = mainmenuRepository.findMainMenuForAdmin("BDA",empmaster.getEmpid());
						
					}
					else if(issales)
					{
						mainmenus = mainmenuRepository.findMainMenuForemployee("Employee");
						
						System.out.println("inside sales person==================================>");
						
//						mainmenus = mainmenuRepository.findMainMenuForAdmin("Employee");
						
					}
					else
					{
						String errormsg = "Sorry!You are not authorized to access the portal";
						
						model.addAttribute("errormsg", errormsg);
						
						return new ModelAndView("crmerror");
					}
				
				}
				

				session.setAttribute("Employee_id", empmaster.getEmpid());
				session.setAttribute("emp", empmaster);
				session.setAttribute("menus", mainmenus);
				session.setAttribute("usertype", mainmenus.get(0).getCrm_user_type());
				
				return new ModelAndView("redirect:dashboard");
			}
			else
			{
                model.addAttribute("msg", "Please check User Name and Password...");
				return new ModelAndView("welcome"); 
			}
		}
		
        model.addAttribute("msg", "Please check User Name and Password...");
	
		return new ModelAndView("welcome"); 
	}
	
	@RequestMapping("/dashboard")
	public ModelAndView dashboard(HttpServletRequest request,Model model)
	{
		HttpSession session = request.getSession();

		EmployeeMaster employee = (EmployeeMaster) session.getAttribute("emp");
		
		if(employee == null)
		{
			String errormsg = "Sorry!Your session has expired.Please login again to continue";
			
			model.addAttribute("errormsg", errormsg);
			
			return new ModelAndView("crmerror");
		}
		
		
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
						System.out.println(" year in < 4 : "+ym);

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
					
					System.out.println(" year : "+ym);
					
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
		
//		System.out.println("*** enquiriescount ==> "+enquiriescount+" leadscount ==> "+leadscount+" customerscount ==> "+customerscount+" *** profileid ==> "+profileid);
		
		String status = "Cancelled";
		ArrayList<CRMRecords>cancelledRecords = (ArrayList<CRMRecords>) crmrecordsRespositoty.findAllCancelledCrmRecords(status);

	    
		model.addAttribute("cancelledRecords",cancelledRecords.size());
		
		model.addAttribute("isbdh",isbdh);
		
		model.addAttribute("profileid",profileid);
		
		model.addAttribute("enquiriescount",enquiriescount);
		
		model.addAttribute("leadscount",leadscount);
		
		model.addAttribute("customerscount",customerscount);
		
		System.out.println("customerscount : "+customerscount);
		
		model.addAttribute("year",year);
		
		session.setAttribute("newenquirygen", newenquirygen);
		session.setAttribute("leadgen", leadgen);
		session.setAttribute("ordergen", ordergen);
		session.setAttribute("opportunitygen", opportunitygen);
		session.setAttribute("pipelinegen", pipelinegen);
		session.setAttribute("cancelledgen", cancelledgen);
		session.setAttribute("enquirygen", enquirygen);
		session.setAttribute("interestedgen", interestedgen);
		session.setAttribute("notinterestedgen", notinterestedgen);
		session.setAttribute("leadqualifiedgen", leadqualifiedgen);
		session.setAttribute("pocgen", pocgen);
		session.setAttribute("proposalsubmittedgen", proposalsubmittedgen);
		session.setAttribute("waitingforpogen", waitingforpogen);
		session.setAttribute("pogen", pogen);
		session.setAttribute("lostgen", lostgen);
		session.setAttribute("monthname", monthname1);
		
		newenquirygens = null;
		
		monthname=null;
		
		leadgens = null;
		
		ordergens = null;
		
		opportunitygens = null;
		
		pipelinegens = null;
		
		cancelledgens = null;
		
		enquirygens = null;
		
		interestedgens = null;
		
		notinterestedgens = null;
		
		leadqualifiedgens = null;
		
		pocgens = null;
		
		proposalsubmittedgens = null;
		
		waitingforpogens = null;
		
		pogens = null;
		
		lostgens = null;
		
        newenquirygen = null;
		
		leadgen = null;
		
		ordergen = null;
		
		opportunitygen = null;
		
		pipelinegen = null;
		
		cancelledgen = null;
		
		enquirygen = null;
		
		interestedgen = null;
		
		notinterestedgen = null;
		
		leadqualifiedgen = null;
		
		pocgen = null;
		
		proposalsubmittedgen = null;
		
		waitingforpogen = null;
		
		pogen = null;
		
		lostgen = null;
		
		return new ModelAndView("dashboard"); 
	}
	
	@RequestMapping("/enquiries")
	public ModelAndView enquiries(HttpServletRequest request,Model model,@RequestParam(value = "savemsg", required = false) String savemsg)
	{
		
		String start_date=request.getParameter("start_date");
		
		String end_date=request.getParameter("end_date");
		
		String calling_status=request.getParameter("calling_status");
			
		System.out.println("start_date==============>"+start_date);
		System.out.println("end_date================>"+end_date);
		
		System.out.println("calling status==========>"+calling_status);
		
		String recordstitle = "enquiry";
		
		HttpSession session = request.getSession();

		EmployeeMaster employee = (EmployeeMaster) session.getAttribute("emp");
		
		List<CRMRecords> enquiries=new ArrayList<CRMRecords>();
		
		if(employee == null)
		{
			String errormsg = "Sorry!Your session has expired.Please login again to continue";
			
			model.addAttribute("errormsg", errormsg);
			
			return new ModelAndView("crmerror");
		}

		int employeeid = employee.getEmpid();
		
		 enquiries = crmrecordsRespositoty.findAllActivatedEnquiriesBasedonRanges(employeeid,start_date,end_date);
		
		 if (request.getParameter("start_date") != null && !request.getParameter("start_date").trim().isEmpty() &&
				    request.getParameter("end_date") != null && !request.getParameter("end_date").trim().isEmpty() &&
				    request.getParameter("calling_status") != null && !request.getParameter("calling_status").trim().isEmpty()) {
//			    enquiries = crmrecordsRespositoty.findAllActivatedEnquiries(employeeid);
			   enquiries = crmrecordsRespositoty.findAllActivatedEnquiriesBasedonrangeandstatus(employeeid,start_date,end_date,calling_status);
			   System.out.println("Based on dataRange and status");
		 } else if (request.getParameter("start_date") != null && !request.getParameter("start_date").trim().isEmpty() &&
		           request.getParameter("end_date") != null && !request.getParameter("end_date").trim().isEmpty()) {
			   System.out.println("Based on data range ");
			    enquiries = crmrecordsRespositoty.findAllActivatedEnquiriesBasedonRanges(employeeid,start_date,end_date);
		   }else if(request.getParameter("calling_status") != null && !request.getParameter("calling_status").trim().isEmpty()) {
			   System.out.println("Based on Calling status "+calling_status);
			    enquiries = crmrecordsRespositoty.findAllbasedoncallingstatus(employeeid,calling_status);
			    
			    System.out.println("calling status size ===========>"+enquiries.size());
		   }else {
			   System.out.println("Based on employee id");
			    enquiries = crmrecordsRespositoty.findAllActivatedEnquiries(employeeid);
		   }
		
		
		String isbdh = projectRoleMappingRepository.isBusinessDevelopmentHead(employee.getEmpid(), 19, employee.getEmpid(), 19);
				
		ArrayList<EmployeeMaster> primarysseconalespersons = new ArrayList<EmployeeMaster>();
		
		ArrayList<EmployeeMaster> presalespersons = new ArrayList<EmployeeMaster>();
		
		ArrayList<EmployeeMaster> bdheads = new ArrayList<EmployeeMaster>();
		
		//Comment by santosh 09-02-2025
		//List<CRMRecords> enquiries = crmrecordsRespositoty.findAllActivatedEnquiries(employeeid);
		
		List<CRMEventMaster> crmevents = crmEventRepository.findByOrderByCrmeventAsc();
		
		List<PurposeOfEvent> purposeOfEvent = purposeOfEventRepository.getPurposeofeventforenquiry();
		
		//List<PurposeOfEvent> purposeOfEvent = purposeOfEventRepository.findByOrderByPurposeofeventidAsc();
		
        List<CrmDataSource> crmdatasources = crmDataSourceRepository.findActivatedDatasourceByOrderByCrmdsidAsc();
		
		List<Offering> offerings = offeringRepository.findActivatedOfferingByOrderByOfferingdescAsc();
		
		List<Integer> primarysseconalesperson  = projectRoleMappingRepository.getPrimarySalesPerson();
		
		List<Integer> presalesperson  = projectRoleMappingRepository.getPresalesPerson();
		
		List<Integer> bdhead  = projectRoleMappingRepository.getBDHead();
		
		for(int i=0;i<primarysseconalesperson.size();i++)
		{
			EmployeeMaster emp = employeeMasterRepository.findByEmpid(primarysseconalesperson.get(i));
			
			primarysseconalespersons.add(emp);
			
			emp = null;
		}
		
		for(int i=0;i<presalesperson.size();i++)
		{
			EmployeeMaster emp = employeeMasterRepository.findByEmpid(presalesperson.get(i));
			
			presalespersons.add(emp);
			
			emp = null;
		}
		
		for(int i=0;i<bdhead.size();i++)
		{
			EmployeeMaster emp = employeeMasterRepository.findByEmpid(bdhead.get(i));
			
			bdheads.add(emp);
			
			emp = null;
		}
		
        primarysseconalesperson  = null;
		
		presalesperson  = null;
		
		bdhead  = null;
		
		  String creation = null ;
		  String updation = null;
		
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yy");
		
		if(enquiries.size() > 0) {
		for (int i = 0 ; i < enquiries.size() ; i++ ) {
			
			System.out.println("en==============>"+enquiries.get(i).getCrmrecordid());
			
		 String date = sdf.format(enquiries.get(i).getCreationdate());
		 String date2 = sdf.format(enquiries.get(i).getLastupdateddate());
		 enquiries.get(i).setCreation(date);
		 enquiries.get(i).setUpdation(date2);

		  }
		}
		
		model.addAttribute("primarysseconalespersons",primarysseconalespersons);
		
		model.addAttribute("presalespersons",presalespersons);
		
		model.addAttribute("bdheads",bdheads);
	
		model.addAttribute("recordstitle",recordstitle);
		
		model.addAttribute("enquiries",enquiries);
		
		model.addAttribute("crmevents",crmevents);
		
		model.addAttribute("purposeOfEvent",purposeOfEvent);
		
		model.addAttribute("savemsg",savemsg);
		
		model.addAttribute("crmdatasources",crmdatasources);
		
		model.addAttribute("offerings",offerings);
		
		if(isbdh.equalsIgnoreCase("true"))
		{
			return new ModelAndView("redirect:enquirieshr"); 
		}
		else
		{
			return new ModelAndView("crmrecords"); 
		}
		
		
	}
	
	@RequestMapping("/enquiry")
	public ModelAndView enquiry(HttpServletRequest request,Model model)
	{
		HttpSession session = request.getSession();

		EmployeeMaster employee = (EmployeeMaster) session.getAttribute("emp");
		
		if(employee == null)
		{
			String errormsg = "Sorry!Your session has expired.Please login again to continue";
			
			model.addAttribute("errormsg", errormsg);
			
			return new ModelAndView("crmerror");
		}

		int employeeid = employee.getEmpid();
		
        List<CrmDataSource> crmdatasources = crmDataSourceRepository.findActivatedDatasourceByOrderByCrmdsidAsc();
		
		List<Offering> offerings = offeringRepository.findActivatedOfferingByOrderByOfferingdescAsc();
		
		List<Integer> projectRoles  = projectRoleMappingRepository.findByEmployeeMaster();
		
		ArrayList<EmployeeMaster> employeemaster  =  new ArrayList<EmployeeMaster>();
		
        ArrayList<EmployeeMaster> primarysseconalespersons = new ArrayList<EmployeeMaster>();
		
		ArrayList<EmployeeMaster> presalespersons = new ArrayList<EmployeeMaster>();
		
		ArrayList<EmployeeMaster> bdheads = new ArrayList<EmployeeMaster>();

		
		for(int i=0;i<projectRoles.size();i++)
		{
			EmployeeMaster emp = employeeMasterRepository.findByEmpid(projectRoles.get(i));
			
			employeemaster.add(emp);
			
			emp =null;
		}
		
        List<Integer> primarysseconalesperson  = projectRoleMappingRepository.getPrimarySalesPerson();
		
		List<Integer> presalesperson  = projectRoleMappingRepository.getPresalesPerson();
		
		List<Integer> bdhead  = projectRoleMappingRepository.getBDHead();
		
		
		for(int i=0;i<primarysseconalesperson.size();i++)
		{
			EmployeeMaster emp = employeeMasterRepository.findByEmpid(primarysseconalesperson.get(i));
			
			primarysseconalespersons.add(emp);
			
			emp = null;
		}
		
		for(int i=0;i<presalesperson.size();i++)
		{
			EmployeeMaster emp = employeeMasterRepository.findByEmpid(presalesperson.get(i));
			
			presalespersons.add(emp);
			
			emp = null;
		}
		
		for(int i=0;i<bdhead.size();i++)
		{
			EmployeeMaster emp = employeeMasterRepository.findByEmpid(bdhead.get(i));
			
			bdheads.add(emp);
			
			emp = null;
		}
		
		
//		List<EmployeeMaster> employeemaster = employeeMasterRepository.findByOrderByEmpfirstnameAsc();
		
		/* LOGGER.log(Level.INFO,"employeemaster size ==> "+employeemaster.size()); */
		
		List<StatusOfEvent> statusofevent = statusOfEventRepository.getstatusforenquiry();
		
		/* LOGGER.log(Level.INFO,"statusofevent size ==> "+statusofevent.size()); */ 
		
//	    List<PurposeOfEvent> purposeOfEvent = purposeOfEventRepository.findAll();
		
//		 List<PurposeOfEvent> purposeOfEvent = purposeOfEventRepository.findByOrderByPurposeofeventidAsc();
		
		List<PurposeOfEvent> purposeOfEvent = purposeOfEventRepository.getPurposeofeventforenquiry();
	    
		/* LOGGER.log(Level.INFO,"purposeOfEvent size ==> "+purposeOfEvent.size()); */
	    
	    List<CRMEventMaster> crmevents = crmEventRepository.findByOrderByCrmeventAsc();
	    
		/* LOGGER.log(Level.INFO,"crmevents size ==> "+crmevents.size()); */
	    
	    List<Countries> Countries = countriesRepository.findByOrderByNameAsc();
	    
	    model.addAttribute("employeeid",employeeid);
		
		model.addAttribute("statusofevent",statusofevent);
		
		model.addAttribute("purposeOfEvent",purposeOfEvent);
		
		model.addAttribute("offerings",offerings);
		
		model.addAttribute("employeemaster",employeemaster);
		
		model.addAttribute("crmevents",crmevents);
		
		model.addAttribute("offerings",offerings);
		
		model.addAttribute("crmdatasources",crmdatasources);
		
		model.addAttribute("countries",Countries);
		
        model.addAttribute("primarysseconalespersons",primarysseconalespersons);
		
		model.addAttribute("presalespersons",presalespersons);
		
		model.addAttribute("bdheads",bdheads);
				
		return new ModelAndView("enquiry"); 
	}
	
	@RequestMapping("/saveenquirydetails")
	public ModelAndView saveenquirydetails(HttpServletRequest request,Model model,@RequestParam(value = "document_upload", required = false) CommonsMultipartFile[] document_upload)
	{
		System.out.println("save Data===============================>");
		String savemsg = "";
		String margin = "";
		String status = request.getParameter("status");
		
		String isbdh = "false";
		
		try {
			
			HttpSession session = request.getSession();

			EmployeeMaster employee = (EmployeeMaster) session.getAttribute("emp");
			
			if(employee == null)
			{
				String errormsg = "Sorry!Your session has expired.Please login again to continue";
				
				model.addAttribute("errormsg", errormsg);
				
				return new ModelAndView("crmerror");
			}

			int employeeid = employee.getEmpid();
			
            String projectdesc = "", chanceofsale = "",forecastclosedatestr ="",currencytype="",foreigncurrency="" ,countrytype="";
			
			Date forecastclosedate = null,podate = null;
			
			Long potentialopp;
			
			SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
			
			isbdh = projectRoleMappingRepository.isBusinessDevelopmentHead(employee.getEmpid(), 19, employee.getEmpid(), 19);
			
			int datasources = Integer.parseInt(request.getParameter("datasource"));
			
			CrmDataSource crmDataSource = crmDataSourceRepository.findByCrmdsid(datasources);
			
			/*
			 * LOGGER.log(Level.INFO,"inside saveenquirydetails size ==> "+crmDataSource.
			 * getCrmdsid());
			 */
			
			String offering[] = request.getParameterValues("offering");
			
			String offeringList ="",country="",state="",district="" , address1="",address2="",city="";
			
			for(int i=0;i<offering.length;i++)
			{
				if(i==0)
				{
					offeringList = offering[0];
				}
				else if(i == (offering.length - 1))
				{
					offeringList = offeringList+","+offering[i];
				}
				else
				{
					offeringList = offeringList+","+offering[i];
				}
			}
			
			/* LOGGER.log(Level.INFO,"offeringList size ==> "+offeringList); */
			
			String companyname = request.getParameter("companyname");	
			
			String nickname = request.getParameter("nickname");
			
			String employeesize = request.getParameter("employeesize");
			
			String annualturnover = request.getParameter("annualturnover");
			
			String isassigneto = request.getParameter("isassigneto");
			
		    String crmevent = request.getParameter("crmevent");
			
			String purposeofevent = request.getParameter("purposeofevent");
			
		    address1=request.getParameter("address1");
			
	        address2=request.getParameter("address2");
			
		    city= request.getParameter("city");
			
			String othpurposeofevent;
			
			if(request.getParameter("country") != "")
			{
			   String country1 = request.getParameter("country");
			   
			   int countryid = Integer.parseInt(country1);
				
			   country = countriesRepository.findByCountryid(countryid).getName();
		
			}
			
			
			if(request.getParameter("instate") !="")
			{
				int state1=0;
				try{
			        state1 = Integer.parseInt(request.getParameter("instate"));
			        state = stateMasterRepository.findByStateid(state1).getStatename();	
				} catch(NumberFormatException ex){ // handle your exception
				    
				}
			}
			
			System.out.println("request.getParameter(\"otherstate\") ==> "+request.getParameter("otherstate"));
			
			if(!request.getParameter("otherstate").equals(""))
			{
				state = request.getParameter("otherstate");
			}
			
			if(request.getParameter("indistricts") != null)
			{
				int district1 = Integer.parseInt(request.getParameter("indistricts"));
				
				district = districtMasterRepository.findByDistrictid(district1).getDistrictname();
			}
			
			System.out.println("request.getParameter(\"otherdistricts\") ==> "+request.getParameter("otherdistricts"));
			
			if(!request.getParameter("otherdistricts").equals(""))
			{
				district = request.getParameter("otherdistricts");
			}
			
			
			if(!request.getParameter("terrioryid").equals(""))
			{
				  countrytype=request.getParameter("terrioryid");
			}
			
			
//			if(employee.getIsInternational().equalsIgnoreCase("N")) {
//				
//			if(!request.getParameter("domestic").equals(""))
//			{
//			     countrytype=request.getParameter("domestic");
//			}
//			
//			}
//			else if(employee.getIsInternational().equalsIgnoreCase("Y")) {
//			
//			if(!request.getParameter("international").equals(""))
//			{
//			     countrytype=request.getParameter("international");
//			}
//			}else {
//				
//				if(!request.getParameter("countrytype").equals(""))
//				{
//				     countrytype=request.getParameter("countrytype");
//				}
//				
//			}
			System.out.println("countrytype===>"+countrytype);
			
//			System.out.println("request.getParameter(\"otherdistricts\") ==> "+request.getParameter("otherdistricts")+"\n"
//					+ "request.getParameter(\"indistricts\") ==> "+request.getParameter("indistricts")+"\n "
//				    + "request.getParameter(\"otherstate\") ==> "+request.getParameter("otherstate")+"\n"
//				    + "request.getParameter(\"instate\") ==> "+request.getParameter("instate")+"\n"
//				    + "request.getParameter(\"country\") ==> "+request.getParameter("country"));
			
//			System.out.println("country ==> "+country+" state ==> "+state+" district ==> "+district);
			
			String contactnames[] = request.getParameterValues("contactname");
			
			String designations[] = request.getParameterValues("Designation");
			
			String mobilenos[] = request.getParameterValues("mobilenos");
			
			String officenos[] = request.getParameterValues("officenos");
			
			String contactemails[] = request.getParameterValues("contactemail");
			
			String altemails[] = request.getParameterValues("altemail");
			
			String auhorities[] = request.getParameterValues("auhority");
			
			String remark = request.getParameter("remark");
			
			String calling_status = request.getParameter("calling_status");

			String calling_status_remark = request.getParameter("calling_status_remark");
			
			String industry_of_company = request.getParameter("industry_of_company");

			String alternative_email_id = request.getParameter("alternative_email_id");
			
//			Date flow_of_Date = request.getParameter("flow_of_Date");	
			
			String flowOfDate = request.getParameter("flow_of_Date");
			SimpleDateFormat formatter11 = new SimpleDateFormat("yyyy-MM-dd"); // Use the correct date format here
			Date flow_of_date = null;

			try {
				flow_of_date = formatter11.parse(flowOfDate);
			} catch (ParseException e) {
			    e.printStackTrace(); // Handle the exception (e.g., invalid date format)
			}

			//String designation_of_prospect = request.getParameter("designation_of_prospect");

			
			CRMRecords enquiry = new CRMRecords();
			
			enquiry.setCrmDataSource(crmDataSource);
			
			enquiry.setOffering(offeringList);
			
			enquiry.setCompanyname(companyname);
			
			enquiry.setNickname(nickname);
			
			enquiry.setCalling_status(calling_status);
			
			enquiry.setIndustry_of_company(industry_of_company);

			enquiry.setAlternative_email_id(alternative_email_id);

			//enquiry.setDesignation_of_prospect(designation_of_prospect);

			enquiry.setCalling_status_remark(calling_status_remark);
			
			enquiry.setEmployeesize(employeesize);
			
			enquiry.setAnnualturnover(annualturnover);
			
			enquiry.setDistrict(district);
			
			enquiry.setState(state);
			
			enquiry.setCountry(country);
			
			enquiry.setIsactivated("Y");
			
			enquiry.setCrmtype("Enquiry");
			
			enquiry.setCreatedby(employee);
			
			enquiry.setSourcingdate(new Date());
			
			enquiry.setCreationdate(new Date()); 
			
			enquiry.setLastupdatedby(employeeid);
			
			enquiry.setLastupdateddate(new Date());
			
			enquiry.setCountrytype(countrytype);
			
			enquiry.setFlow_of_date(flow_of_date);
			
			if(!request.getParameter("address1").equals("")) {
				enquiry.setAddress1(address1);
			}
			
			if(!request.getParameter("address2").equals("")) {
				enquiry.setAddress2(address2);
			}
			
			if(!request.getParameter("city").equals("")) {
				enquiry.setCity(city);
			}
			
			if(isassigneto.equals("Yes"))
			{
				int assigneto = Integer.parseInt(request.getParameter("assigneto"));
				EmployeeMaster emp = employeeMasterRepository.findByEmpid(assigneto);
				
				enquiry.setAssigneto(emp);
			}
			else
			{
				enquiry.setAssigneto(employee);
			}
			
			enquiry.setCrmevent(crmevent);
			
			if(purposeofevent.equals("Other"))
			{
				othpurposeofevent = request.getParameter("othpofevent");
				enquiry.setPurposeofevent(othpurposeofevent);
			}
			else
			{
				enquiry.setPurposeofevent(purposeofevent);
			}
			
			enquiry.setStatus(status);
			
			
			if(status.equals("Converted to Lead"))
			{
                  				 
				 if(request.getParameter("potentialopp") !=null) {
					 try{
				 potentialopp = Long.parseLong(request.getParameter("potentialopp"));
					 } catch(NumberFormatException ex){ // handle your exception
						    
						}
				 }
				 
				 projectdesc = request.getParameter("projectdesc");
				 
				 foreigncurrency=request.getParameter("foreigncurrency");
				 
				 currencytype=request.getParameter("currencytype");
				
				 chanceofsale = request.getParameter("chanceofsale");
				 
				 margin = request.getParameter("margin");
				
				 forecastclosedatestr = request.getParameter("forecastclosedate");
				 
				 forecastclosedate = format.parse(forecastclosedatestr);
				 
                 int primarysalespersonid = Integer.parseInt(request.getParameter("primarysalesperson"));
				 
				 int secondarysalespersonid = Integer.parseInt(request.getParameter("secondarysalesperson"));
				 
				 int presalespersonid = Integer.parseInt(request.getParameter("presalesperson"));
				 
				 int bdheadid = Integer.parseInt(request.getParameter("bdhead"));
				 
				 EmployeeMaster primarysalesperson = employeeMasterRepository.findByEmpid(primarysalespersonid);
				 
				 EmployeeMaster secondarysalesperson = employeeMasterRepository.findByEmpid(secondarysalespersonid);
				 
				 EmployeeMaster presalesperson = employeeMasterRepository.findByEmpid(presalespersonid);
				 
				 EmployeeMaster bdhead = employeeMasterRepository.findByEmpid(bdheadid);
				 
				 enquiry.setCrmtype("Lead");	
					
				 enquiry.setProjectdescription(projectdesc);
				 
				 if(request.getParameter("potentialopp") !=null) {
					 
					 try {
					 potentialopp = Long.parseLong(request.getParameter("potentialopp"));
					 
					 enquiry.setPotentialopp(potentialopp);
					 } catch(NumberFormatException ex){ // handle your exception
						   
					 }
					 }
									
				 enquiry.setCurrencytype(currencytype);
				 
				 enquiry.setForeigncurrency(foreigncurrency);
				 
				 enquiry.setChanceofsale(chanceofsale);
				 
				 if(chanceofsale != null && chanceofsale.equalsIgnoreCase("License reselling")){
					 if(margin != null) {
						 enquiry.setMargin(margin);
					 }
				 }else {
					 enquiry.setMargin("");
				 }
				 
				 
				 
					
				 enquiry.setProjectdescription(projectdesc);
				 
				 enquiry.setForecastclose(forecastclosedate);
				 
				 enquiry.setPrimarysalesperson(primarysalesperson);
				 
				 enquiry.setSecondarysalesperson(secondarysalesperson);
				 
				 enquiry.setPresalesperson(presalesperson);
				 
				 enquiry.setBdhead(bdhead);
				 
				 primarysalesperson = null;
					
				 secondarysalesperson = null;
				 
				 presalesperson = null;
				 
				 bdhead = null;
			}
			
			CRMRecords saveenquiry = crmrecordsRespositoty.save(enquiry);
			String call_status = crmdao.getLatestCrmHistoryCallingStatusonId(enquiry.getCrmrecordid());
			
			if(calling_status != null && !calling_status.equals("")) {
			if(call_status == null) {
				Calling_Status_History csh = new Calling_Status_History();
				
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MMM-yyyy");
				String strDate = LocalDate.now().format(formatter);
				
				Timestamp timestamp = new Timestamp(System.currentTimeMillis());

				csh.setCalling_date(timestamp);				

				
				
				csh.setCalling_status(calling_status);
				csh.setCalling_remark(calling_status_remark);
				csh.setCrm_id(crmrecordsRespositoty.findByCrmrecordid(enquiry.getCrmrecordid()));
				crm_calling_history_repositry.save(csh);
			}
			 }
			
			enquiry = null;
			
			 LOGGER.log(Level.INFO,"saveenquiry ==> "+saveenquiry.getCrmrecordid());
			
			for(int i=0;i<contactnames.length;i++)
			{
				CRMRecordsContacts enquiriescontacts = new CRMRecordsContacts();
				
				enquiriescontacts.setCrmrecordsid(saveenquiry);
				
				enquiriescontacts.setContactname(contactnames[i]);
				
				enquiriescontacts.setDesignation(designations[i]);
				
				enquiriescontacts.setMobileno(mobilenos[i]);
				
				enquiriescontacts.setOfficeno(officenos[i]);
				
				enquiriescontacts.setEmailid(contactemails[i]);
				
				enquiriescontacts.setAltemail(altemails[i]);
				
				enquiriescontacts.setAuthority(auhorities[i]);
				
				enquiriesContactsRepository.save(enquiriescontacts);
				
				enquiriescontacts = null;
			}
			
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			
//			System.out.println("Crmeventdate timestamp ==> "+timestamp);
			
			CRMEvents crmevents = new CRMEvents();
			
			crmevents.setCrmevent(crmevent);
			
			if(purposeofevent.equals("Other"))
			{
				othpurposeofevent = request.getParameter("othpofevent");
				crmevents.setPurposeofevent(othpurposeofevent);
			}
			else
			{
				crmevents.setPurposeofevent(purposeofevent);
			}
			
			crmevents.setCrmeventdate(timestamp);
			
			crmevents.setStatus(status);
			
			crmevents.setRemark(remark);
			
			crmevents.setCrmrecordid(saveenquiry);
			
			crmEventsRepository.save(crmevents);
			
			if(status.equals("Converted to Lead"))
			{
				 String document_name[] = request.getParameterValues("document_name");
				 
				 int var=0;
				 
				 if (document_upload != null) 
				{
						for (MultipartFile multipartFile : document_upload) 
						{
						  LeadDocuments leaddoc = new LeadDocuments();
						  leaddoc.setDocumentupload(multipartFile.getBytes()); 
						  leaddoc.setDocumentname(document_name[var]);
						  leaddoc.setFilename(multipartFile.getOriginalFilename());
						  leaddoc.setFilesize(multipartFile.getSize());
						  leaddoc.setFiletype(multipartFile.getContentType());
						  leaddoc.setCrmevents(crmevents);
						  leaddoc.setCrmrecordid(saveenquiry);
						  leaddoc.setLastupdatedby(employeeid);
						  leaddoc.setLastupdateddate(new Date());
						  leaddocumentsRepository.save(leaddoc);
						  var++;
						  leaddoc = null;
						}
					}
			}
			
			crmevents = null;
			
			saveenquiry = null;
			
			if(isbdh.equalsIgnoreCase("true"))
			{
				if(status.equals("Converted to Lead"))
				{
					savemsg = "successleadfromenquiry";
					
					return new ModelAndView("redirect:leadshr?savemsg='" + URLEncoder.encode(savemsg) + "'");
				}
				else
				{
					savemsg = "successcontact";
					 
					return new ModelAndView("redirect:enquirieshr?savemsg='" + URLEncoder.encode(savemsg) + "'");
				}
			}
			else
			{
				if(status.equals("Converted to Lead"))
				{
					savemsg = "successleadfromenquiry";
					
					return new ModelAndView("redirect:leads?savemsg='" + URLEncoder.encode(savemsg) + "'");
				}
				else
				{
					savemsg = "successcontact";
					 
					return new ModelAndView("redirect:enquiries?savemsg='" + URLEncoder.encode(savemsg) + "'");
				}
			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
			if(status.equals("Converted to Lead"))
			{
				savemsg = "successlead";
				
				return new ModelAndView("redirect:leads?savemsg='" + URLEncoder.encode(savemsg) + "'");
			}
			else
			{
				savemsg = "failure";
				
				return new ModelAndView("redirect:enquiries?savemsg='" + URLEncoder.encode(savemsg) + "'");
			}
		}
		
	}
	
	@RequestMapping("/saveaddeventdetails")
	public ModelAndView saveaddeventdetails(HttpServletRequest request,Model model,@RequestParam(value = "document_upload", required = false) CommonsMultipartFile[] document_upload)
	{
		List<Lead_to_Customer> mailSending=new ArrayList<Lead_to_Customer>();

		String savemsg = "";
		
		String status = request.getParameter("status");
		
		try
		{
			HttpSession session = request.getSession();

			EmployeeMaster employee = (EmployeeMaster) session.getAttribute("emp");
			
			if(employee == null)
			{
				String errormsg = "Sorry!Your session has expired.Please login again to continue";
				
				model.addAttribute("errormsg", errormsg);
				
				//return new ModelAndView("crmerror");
			}

			int employeeid = employee.getEmpid();
			
			int crmid = Integer.parseInt(request.getParameter("cemrecordsid"));
			
			Long potentialopp ,poamount;
			
			String projectdesc = "", chanceofsale = "",forecastclosedatestr ="",podatestr="",otherpurposeofevent="",ponumber="",remark="",needbyDatestr = "",currencytype="",amount="";
			
			Date forecastclosedate = null,podate = null, needbyDate = null;
			
			String crmevent = request.getParameter("crmevent");
			
			String margin = request.getParameter("margin");

			String purposeofevent = request.getParameter("purposeofevent");
			
			remark = request.getParameter("remark");
			
			String offering = request.getParameter("offering");
			
			SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
			
			if(purposeofevent.equalsIgnoreCase("Other"))
			{
				otherpurposeofevent = request.getParameter("othpofevent");
			}
			
			CRMRecords crmrecords = crmrecordsRespositoty.findByCrmrecordid(crmid);
			
			crmrecords.setCrmevent(crmevent);
			crmrecords.setCrmtype(status);
			crmrecords.setStatus(status);
			
			
			
			
			
			
			
			if(purposeofevent.equalsIgnoreCase("Other"))
			{
				crmrecords.setPurposeofevent(otherpurposeofevent);
			}
			else
			{
				crmrecords.setPurposeofevent(purposeofevent);
			}
			
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			
			String document_name[] = request.getParameterValues("document_name");
			
			//added by santosh sales member's
    		 int primarysalespersonid1 = Integer.parseInt(request.getParameter("primarysalesperson"));
			 
			 int secondarysalespersonid1 = Integer.parseInt(request.getParameter("secondarysalesperson"));
			 
			 int presalespersonid1 = Integer.parseInt(request.getParameter("presalesperson"));
			 
			 int bdheadid1 = Integer.parseInt(request.getParameter("bdhead"));
			 
			 EmployeeMaster primarysalesperson1 = employeeMasterRepository.findByEmpid(primarysalespersonid1);
			 
			 EmployeeMaster secondarysalesperson1 = employeeMasterRepository.findByEmpid(secondarysalespersonid1);
			 
			 EmployeeMaster presalesperson1 = employeeMasterRepository.findByEmpid(presalespersonid1);
			 
			 EmployeeMaster bdhead1 = employeeMasterRepository.findByEmpid(bdheadid1);
			//
			if(status.equals("Converted to Lead"))
			{
				
				
				if(margin != null && !margin.equals("")) {
					crmrecords.setMargin(margin);
				}else {
					crmrecords.setMargin("NA");
				}
				
				
				//Changed sk
				  document_name = request.getParameterValues("document_name");
				 
				 potentialopp=(long) 0;
				 
//				 if(!request.getParameter("potentialopp").equals("")) {
//						
//					 potentialopp = Long.parseLong(request.getParameter("potentialopp"));
//					 
//				 }
				 
				 //potentialopp = Long.parseLong(request.getParameter("potentialopp"));
				 
				 
				 currencytype= request.getParameter("currencytype");
				 
				 currencytype = "INR";
				 
				 amount = request.getParameter("foreigncurrency");
				
				 projectdesc = request.getParameter("projectdesc");
				
				 chanceofsale = request.getParameter("chanceofsale");
				
				 forecastclosedatestr = request.getParameter("forecastclosedate");
				 
				 forecastclosedate = format.parse(forecastclosedatestr);
				 
				 remark = request.getParameter("remark");
				 
				 int primarysalespersonid = Integer.parseInt(request.getParameter("primarysalesperson"));
				 
				 int secondarysalespersonid = Integer.parseInt(request.getParameter("secondarysalesperson"));
				 
				 int presalespersonid = Integer.parseInt(request.getParameter("presalesperson"));
				 
				 int bdheadid = Integer.parseInt(request.getParameter("bdhead"));
				 
				 EmployeeMaster primarysalesperson = employeeMasterRepository.findByEmpid(primarysalespersonid);
				 
				 EmployeeMaster secondarysalesperson = employeeMasterRepository.findByEmpid(secondarysalespersonid);
				 
				 EmployeeMaster presalesperson = employeeMasterRepository.findByEmpid(presalespersonid);
				 
				 EmployeeMaster bdhead = employeeMasterRepository.findByEmpid(bdheadid);
				 
				 crmrecords.setCrmtype("Lead");	
				 crmrecords.setStatus(status);
					
				 crmrecords.setProjectdescription(projectdesc);
				 
//				 if(!request.getParameter("potentialopp").equals("")) {
//									 
//				 crmrecords.setPotentialopp(potentialopp);
//				 
//				 }
					
				 crmrecords.setChanceofsale(chanceofsale);
					
				 crmrecords.setProjectdescription(projectdesc);
				 
				 crmrecords.setForecastclose(forecastclosedate);
				 
				 crmrecords.setPrimarysalesperson(primarysalesperson);
				 
				 crmrecords.setSecondarysalesperson(secondarysalesperson);
				 
				 crmrecords.setPresalesperson(presalesperson);
				 
				 if(!currencytype.equals("")) {
					 crmrecords.setCurrencytype(currencytype);
				 }
				 
				 if(!amount.equals("")) {
					 crmrecords.setForeigncurrency(amount);
				 }
				 crmrecords.setBdhead(bdhead);
				 
				 CRMEvents crmevents = new CRMEvents();
					
				 crmevents.setCrmrecordid(crmrecords);
				 
				 crmevents.setProjectdescription(projectdesc);
					
				 crmevents.setCrmevent(crmevent);
					
				 crmevents.setPurposeofevent(purposeofevent);
				 
				 crmevents.setCrmeventdate(timestamp);
				 
				 if(purposeofevent.equalsIgnoreCase("Other"))
				 {
						crmrecords.setPurposeofevent(otherpurposeofevent);
				 }
				 else
					{
						crmrecords.setPurposeofevent(purposeofevent);
					}
					
					crmevents.setPotentialopp(potentialopp);
					
					crmevents.setProjectdescription(projectdesc);
					
					crmevents.setChanceofsale(chanceofsale);
					
					crmevents.setForecastclose(forecastclosedate);
					
					crmevents.setStatus(status);
					
					crmevents.setRemark(remark);
					
					crmevents.setCreatedby(employeeid);
					
					crmevents.setCreationdate(new Date());
					
					crmevents.setLastupdatedby(employeeid);
					
					crmevents.setLastupdateddate(new Date());
					
					crmevents.setRenew("N");
					
					crmEventsRepository.save(crmevents);
					
					crmevents = null;
					
					int var=0;
					
					if (document_upload != null) 
					{
						for (MultipartFile multipartFile : document_upload) 
						{
						  LeadDocuments leaddoc = new LeadDocuments();
						  leaddoc.setCrmevents(crmevents);
						  leaddoc.setDocumentupload(multipartFile.getBytes()); 
						  leaddoc.setDocumentname(document_name[var]);
						  leaddoc.setFilename(multipartFile.getOriginalFilename());
						  leaddoc.setFilesize(multipartFile.getSize());
						  leaddoc.setFiletype(multipartFile.getContentType());
						  leaddoc.setCrmevents(crmevents);
						  leaddoc.setCrmrecordid(crmrecords);
						  leaddoc.setLastupdatedby(employeeid);
						  leaddoc.setLastupdateddate(new Date());
						  leaddocumentsRepository.save(leaddoc);
						  var++;
						  leaddoc = null;
						}
					}
					
					
					//crmrecordsRespositoty.save(crmrecords);
			}
			
			else if(status.equals("PO"))
			{
				needbyDatestr = request.getParameter("needbydate");
				
				  String sDate1=needbyDatestr;  
				    Date date1=new SimpleDateFormat("MM/dd/yyyy").parse(sDate1);  
				    System.out.println(sDate1+"\t"+date1); 
				    
				    DateFormat dateFormat = new SimpleDateFormat("dd-MMM-yy");  
	                String strDate = dateFormat.format(date1);  
				
				
				 String message = "<html>\r\n" + 
					 		"   <head>\r\n" + 
					 		"      <style>\r\n" + 
					 		"         table, th, td {\r\n" + 
					 		"            border: 1px solid black;\r\n" + 
					 		"            width: 500px;\r\n" + 
					 		"            height: 50px;\r\n" + 
					 		"         }\r\n" + 
					 		"         .center {\r\n" + 
					 		"  margin-left: auto;\r\n" + 
					 		"  margin-right: auto;\r\n" + 
					 		"}\r\n" + 
					 		"      </style>\r\n" + 
					 		"   </head>" + 
					 		"\r\n" + 
					 		"<body>\r\n" + 
					 		"<p> Hello " + employee.getEmpfirstname() + ",<br><br></p>\r\n"+  
					 		"      <table class=\"center\">\r\n" + 
					 		"         <tr>\r\n" + 
					 		"            <th colspan=\"2\">Omfys Technologies India Pvt Ltd</th>\r\n" + 
					 		"         </tr> \r\n" + 
					 		"         <tr>\r\n" + 
					 		"            <th colspan=\"2\">Order Confirmation</th>\r\n" + 
					 		"         </tr>\r\n" + 
					 		"         <tr>\r\n" + 
					 		"            <td>Customer Name:</td>\r\n" + 
					 		"            <td>"+crmrecords.getCompanyname()+"</td>\r\n" + 
					 		"            \r\n" + 
					 		"         </tr>\r\n" + 
					 		"         <tr>\r\n" + 
					 		"            <td>Technology:</td>\r\n" + 
					 		"            <td>"+offering+"</td>\r\n" + 
					 		"         </tr>\r\n" + 
					 		"         <tr>\r\n" + 
					 		"            <td>Project Completion:</td>\r\n" + 
					 		"            <td>"+strDate+"</td>\r\n" + 
					 		"         </tr>\r\n" + 
					 		"         <tr>\r\n" + 
					 		"            <td>Order Confirmed By:</td>\r\n" + 
					 		"            <td>"+employee.getEmpfirstname()+" "+employee.getEmplastname()+"</td>\r\n" + 
					 		"         </tr>\r\n" + 
					 		" </table>\r\n" + 
					 		"   </body>        \r\n" + 
					 		"</html>";
			 	 
					
			 			 		 RenewedMailCommunication mail = new RenewedMailCommunication();
							    	 mail.setComm_type("Email");
							 		 mail.setSub_type("");
							 		 mail.setFrom_mail("santosh.kotgyale@omfysgroup.com.com");
							 		 mail.setTo_mail(employee.getEmail());
							 		 mail.setSubject("Project Deal");
							 		 mail.setBody(message);
							 		 mail.setStatus("Completed");
							 		 mail.setCreated_by(employeeid);
							 		 mail.setLast_updated_by(employeeid);
							 		 mailService.updatedSendMail(mail);
							 		 
				
				 mailSending=crmdao.leadToCustomer();
				 
				 for(int i=0;i<mailSending.size();i++) {
				
				
				 String message1 = "<html>\r\n" + 
					 		"   <head>\r\n" + 
					 		"      <style>\r\n" + 
					 		"         table, th, td {\r\n" + 
					 		"            border: 1px solid black;\r\n" + 
					 		"            width: 500px;\r\n" + 
					 		"            height: 50px;\r\n" + 
					 		"         }\r\n" + 
					 		"         .center {\r\n" + 
					 		"  margin-left: auto;\r\n" + 
					 		"  margin-right: auto;\r\n" + 
					 		"}\r\n" + 
					 		"      </style>\r\n" + 
					 		"   </head>" + 
					 		"\r\n" + 
					 		"<body>\r\n" + 
					 		"<p> Hello " + mailSending.get(i).getFirstname()+",<br><br></p>\r\n"+  
					 		"      <table class=\"center\">\r\n" + 
					 		"         <tr>\r\n" + 
					 		"            <th colspan=\"2\">Omfys Technologies India Pvt Ltd</th>\r\n" + 
					 		"         </tr> \r\n" + 
					 		"         <tr>\r\n" + 
					 		"            <th colspan=\"2\">Order Confirmation</th>\r\n" + 
					 		"         </tr>\r\n" + 
					 		"         <tr>\r\n" + 
					 		"            <td>Customer Name:</td>\r\n" + 
					 		"            <td>"+crmrecords.getCompanyname()+"</td>\r\n" + 
					 		"            \r\n" + 
					 		"         </tr>\r\n" + 
					 		"         <tr>\r\n" + 
					 		"            <td>Technology:</td>\r\n" + 
					 		"            <td>"+offering+"</td>\r\n" + 
					 		"         </tr>\r\n" + 
					 		"         <tr>\r\n" + 
					 		"            <td>Project Completion:</td>\r\n" + 
					 		"            <td>"+strDate+"</td>\r\n" + 
					 		"         </tr>\r\n" + 
					 		"         <tr>\r\n" + 
					 		"            <td>Order Confirmed By:</td>\r\n" + 
					 		"            <td>"+employee.getEmpfirstname()+" "+employee.getEmplastname()+"</td>\r\n" + 
					 		"         </tr>\r\n" + 
					 		" </table>\r\n" + 
					 		"<br><br>Thanks & Regards<br>HR Desk"+
					 		"   </body>        \r\n" + 
					 		"</html>";
			 	 
					
			 			 		 RenewedMailCommunication mail1 = new RenewedMailCommunication();
							    	 mail.setComm_type("Email");
							 		 mail.setSub_type("");
							 		 mail.setFrom_mail("santosh.kotgyale@omfysgroup.com.com");
							 		 mail.setTo_mail(mailSending.get(i).getEmail());
							 		 mail.setSubject("Project Deal");
							 		 mail.setBody(message1);
							 		 mail.setStatus("Completed");
							 		 mail.setCreated_by(employeeid);
							 		 mail.setLast_updated_by(employeeid);
							 		 mailService.updatedSendMail(mail);
							 		 
					 }
				 
				 
				
				ponumber = request.getParameter("ponumber");
				
			    poamount = Long.parseLong(request.getParameter("poamount"));
				
				podatestr = request.getParameter("podate");
				
				needbyDatestr = request.getParameter("needbydate");
				
				needbyDate = format.parse(needbyDatestr);
				
				remark = request.getParameter("remark");
				
				podate = format.parse(podatestr);
				
				crmrecords.setCrmtype("PO");
			    crmrecords.setStatus(status);
				
				crmrecords.setPoamount(poamount);
				
				crmrecords.setPonumber(ponumber);
				
				crmrecords.setPodate(podate);
				
				crmrecords.setIsactivatedcustomer("Y");
				
                CRMEvents crmevents = new CRMEvents();
				
				crmevents.setCrmrecordid(crmrecords);
				
				crmevents.setCrmeventdate(timestamp);
				                              
				crmevents.setCrmevent(crmevent);
				
				crmevents.setPurposeofevent(purposeofevent);
				
				crmevents.setProjectdescription(crmrecords.getProjectdescription());
				
				crmevents.setNeedbyDate(needbyDate);
				
			
				if(purposeofevent.equalsIgnoreCase("Other"))
				{
					crmrecords.setPurposeofevent(otherpurposeofevent);
				}
				else
				{
					crmrecords.setPurposeofevent(purposeofevent);
				}
				
				crmevents.setPoamount(poamount);
				
				crmevents.setPonumber(ponumber);
				
				crmevents.setStatus(status);
				
				crmevents.setOffering(offering);
				
				crmevents.setRemark(remark);
				
				crmevents.setPodate(podate);
				
                crmevents.setCreatedby(employeeid);
				
				crmevents.setCreationdate(new Date());
				
				crmevents.setLastupdatedby(employeeid);
				
				crmevents.setLastupdateddate(new Date());
				
				crmevents.setRenew("N");
				
				crmEventsRepository.save(crmevents);
				
				//crmevents = null;
				
				int var=0;
				
				//Added new document uploaded filleds
				if (document_upload != null) 
				{
						for (MultipartFile multipartFile : document_upload) 
						{
							
						  LeadDocuments leaddoc = new LeadDocuments();
						  leaddoc.setDocumentupload(multipartFile.getBytes()); 
						  leaddoc.setDocumentname(document_name[var]);
						  leaddoc.setFilename(multipartFile.getOriginalFilename());
						  leaddoc.setFilesize(multipartFile.getSize());
						  leaddoc.setFiletype(multipartFile.getContentType());
						  leaddoc.setCrmevents(crmevents);
						  leaddoc.setCrmrecordid(crmrecords);
						  leaddoc.setLastupdatedby(employeeid);
						  leaddoc.setLastupdateddate(new Date());
						  leaddocumentsRepository.save(leaddoc);
						  var++;
						  leaddoc = null;
						}
					}

				crmevents = null;
				//
				
//				//BAS API
//				URL url = new URL("http://15.206.16.104:6614/Api/SalesOrder/PostCRMDetails");
//				HttpURLConnection http = (HttpURLConnection)url.openConnection();
//				http.setRequestMethod("POST");
//				http.setDoOutput(true);
//				http.setRequestProperty("Content-Type", "application/json");
//				
//				String data="{\r\n" + 
//						" \"CRMRECORDID\": "+crmrecords.getCrmrecordid()+",\r\n" + 
//						" \"ANNUALTURNOVER\": \'"+crmrecords.getAnnualturnover()+"',\r\n" + 
//						" \"COMPANYNAME\": \'"+crmrecords.getCompanyname()+"',\r\n" + 
//						" \"CRMEVENT\": \'"+crmrecords.getCrmevent()+"',\r\n" + 
//						" \"CRMTYPE\": \'"+crmrecords.getCrmtype()+"',\r\n" + 
//						" \"EMPLOYEESIZE\": \'"+crmrecords.getEmployeesize()+"',\r\n" + 
//						" \"OFFERING\": \'"+crmrecords.getOffering()+"',\r\n" + 
//						" \"PURPOSEOFEVENT\": \'"+crmrecords.getPurposeofevent()+"',\r\n" + 
//						" \"STATUS\": \'"+crmrecords.getStatus()+"',\r\n" + 
//						" \"CHANCEOFSALE\": \'"+crmrecords.getChanceofsale()+"',\r\n" + 
//						" \"POTENTIALOPP\": "+crmrecords.getPotentialopp()+",\r\n" + 
//						" \"PROJECTDESCRIPTION\":\'"+crmrecords.getProjectdescription()+"',\r\n" + 
//						" \"POAMOUNT\": "+crmrecords.getPoamount()+",\r\n" + 
//						" \"PODATE\": \'"+podatestr.substring(6,10)+"-"+podatestr.substring(0,2)+"-"+podatestr.substring(3,5)+"',\r\n" + 
//						" \"PONUMBER\": "+crmrecords.getPonumber()+",\r\n" + 
//						" \"BDHEAD\": "+crmrecords.getBdhead().getEmpid()+",\r\n" + 
//						" \"PRESALESPERSON\": "+crmrecords.getPresalesperson().getEmpid()+",\r\n" + 
//						" \"PRIMARYSALESPERSON\": "+crmrecords.getPrimarysalesperson().getEmpid()+",\r\n" + 
//						" \"SECONDARYSALESPERSON\": "+crmrecords.getSecondarysalesperson().getEmpid()+",\r\n" + 
//						" \"PRESALESPERSONName\": \'"+crmrecords.getPresalesperson().getEmpfirstname()+" "+crmrecords.getPresalesperson().getEmplastname()+"',\r\n" + 
//						" \"PRIMARYSALESPERSOName\": \'"+crmrecords.getPrimarysalesperson().getEmpfirstname()+" "+crmrecords.getPrimarysalesperson().getEmplastname()+"',\r\n" + 
//						" \"SECONDARYSALESPERSOName\": \'"+crmrecords.getSecondarysalesperson().getEmpfirstname()+" "+crmrecords.getSecondarysalesperson().getEmplastname()+"',\r\n" + 
//						" \"site_name\": \"Not Applicable\",\r\n" + 
//						" \"billtoaddrss\": \"Not Applicable\",\r\n" + 
//						" \"GSTRegNo\": \"Not Applicable\",\r\n" + 
//						" \"item\": \"Not Applicable\",\r\n" + 
//						" \"quantity\": \"0\"\r\n" + 
//						"}";
//				
//				System.out.println("data======>"+data);
//				
//				byte[] out = data.getBytes(StandardCharsets.UTF_8);
//
//				OutputStream stream = http.getOutputStream();
//				stream.write(out);
//
//				System.out.println(http.getResponseCode() + " " + http.getResponseMessage());
//				http.disconnect();
				
				//
			}else if(status.equals("Cancelled")) {
				
				crmrecords.setCrmtype(status);
				crmrecords.setStatus(status);
				}
			else
			{
				
				if(status.equals("Enquiry")) {
				crmrecords.setCrmtype("Enquiry");
				}else {
					crmrecords.setCrmtype("Lead");
				}
				
                CRMEvents crmevents = new CRMEvents();
				
				crmevents.setCrmrecordid(crmrecords);
				
				crmevents.setCrmevent(crmevent);
				
				crmevents.setCrmeventdate(timestamp);
				
				crmevents.setPurposeofevent(purposeofevent);
				
				crmevents.setRemark(remark);
				
				if(purposeofevent.equalsIgnoreCase("Other"))
				{
					crmrecords.setPurposeofevent(otherpurposeofevent);
				}
				else
				{
					crmrecords.setPurposeofevent(purposeofevent);
				}
				
				crmevents.setStatus(status);
				
                crmevents.setCreatedby(employeeid);
				
				crmevents.setCreationdate(new Date());
				
				crmevents.setLastupdatedby(employeeid);
				
				crmevents.setLastupdateddate(new Date());
				
				crmEventsRepository.save(crmevents);
				
				crmevents = null;
			}

			
			crmrecords.setLastupdatedby(employeeid);
			
			crmrecords.setLastupdateddate(new Date());
			
			 crmrecords.setPrimarysalesperson(primarysalesperson1);
			 
			 crmrecords.setSecondarysalesperson(secondarysalesperson1);
			 
			 crmrecords.setPresalesperson(presalesperson1);
			 
			 crmrecords.setBdhead(bdhead1);
			 
			 
			 
			
			crmrecordsRespositoty.save(crmrecords);
			
			System.out.println("STATUS : "+crmrecords.getStatus());
			System.out.println("TYPE : "+crmrecords.getCrmtype());

			
			
			crmrecords = null;
			
			if(status.equals("Converted to Lead"))
			{
				savemsg = "successlead";
				//savemsg = "Lead added successfully";
				
				return new ModelAndView("redirect:leads?savemsg='" + URLEncoder.encode(savemsg) + "'");
			}
			else if(status.equals("PO"))
			{
				savemsg = "successpo";
				
				return new ModelAndView("redirect:customers?savemsg='" + URLEncoder.encode(savemsg) + "'");
			}
			else if(status.equals("Interested") || status.equals("Not Interested"))
			{
				savemsg = "success";
				
				return new ModelAndView("redirect:enquiries?savemsg='" + URLEncoder.encode(savemsg) + "'");
			}
			else if(status.equals("Cancelled"))
			{
                savemsg = "cancelled";
				
				return new ModelAndView("redirect:Cancelled?savemsg='" + URLEncoder.encode(savemsg) + "'");
			}
			else if (status.equals("Tender Submitted") || status.equals("Awaiting for Tender Result"))
			{
                savemsg = "successlead";
				
				return new ModelAndView("redirect:leads?savemsg='" + URLEncoder.encode(savemsg) + "'");
			}
			else if (status.equals("Pipeline") || status.equals("On Hold"))
			{
                savemsg = "successlead";
				
				return new ModelAndView("redirect:leads?savemsg='" + URLEncoder.encode(savemsg) + "'");
			}
			else if (status.equals("Opportunity") )
			{
                savemsg = "successlead";
				
				return new ModelAndView("redirect:leads?savemsg='" + URLEncoder.encode(savemsg) + "'");
			}
			
			else if (status.equals("PoC") || status.equals("Proposal"))
			{
                savemsg = "successlead";
				
				return new ModelAndView("redirect:leads?savemsg='" + URLEncoder.encode(savemsg) + "'");
			}
			else if (status.equals("Negotiation")|| status.equals("Order Closed"))
			{
				savemsg = "successlead";
				
				return new ModelAndView("redirect:leads?savemsg='" + URLEncoder.encode(savemsg) + "'");
			}
			else if (status.equals("RFP won") || status.equals("RFP Lost"))
			{
				savemsg = "successlead";
				
				return new ModelAndView("redirect:leads?savemsg='" + URLEncoder.encode(savemsg) + "'");
			}
			else
			{
				return new ModelAndView("redirect:dashboard");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
			if(status.equals("Converted to Lead"))
			{
				savemsg = "failure";
				
				return new ModelAndView("redirect:leads?savemsg='" + URLEncoder.encode(savemsg) + "'");
			}
			else if(status.equals("PO"))
			{
				savemsg = "failurepo";
				
				return new ModelAndView("redirect:customers?savemsg='" + URLEncoder.encode(savemsg) + "'");
			}
			else if(status.equals("Interested") || status.equals("Not Interested")) 
			{
				savemsg = "failure";
				
				return new ModelAndView("redirect:enquiries?savemsg='" + URLEncoder.encode(savemsg) + "'");
			}
			else if(status.equals("Cancelled") || status.equals("On Hold"))
			{
				savemsg = "failure";
				
				return new ModelAndView("redirect:enquiries?savemsg='" + URLEncoder.encode(savemsg) + "'");
			}
				
			else if (status.equals("Tender Submitted") || status.equals("Awaiting for Tender Result"))
			{
                savemsg = "failurepo";
				
				return new ModelAndView("redirect:leads?savemsg='" + URLEncoder.encode(savemsg) + "'");
			}
			
			else if (status.equals("PoC") || status.equals("Proposal") )
			{
                savemsg = "failurepo";
				
				return new ModelAndView("redirect:leads?savemsg='" + URLEncoder.encode(savemsg) + "'");
			}
			
			else if (status.equals("Negotiation") || status.equals("Order Close"))  
			{
               savemsg = "failurepo";
				
			   return new ModelAndView("redirect:leads?savemsg='" + URLEncoder.encode(savemsg) + "'");
			}
			else if (status.equals("RFP won") || status.equals("RFP Lost"))  
			{
				savemsg = "failurepo";
				
				return new ModelAndView("redirect:leads?savemsg='" + URLEncoder.encode(savemsg) + "'");
			}
			else
			{
				 return new ModelAndView("redirect:dashboard");
			}
		}
	}
	
	@RequestMapping("/leads")
	public ModelAndView getLeadRecords(HttpServletRequest request,Model model,@RequestParam(value = "savemsg", required = false) String savemsg)
	{
        String recordstitle = "Lead";
		
		HttpSession session = request.getSession();

		EmployeeMaster employee = (EmployeeMaster) session.getAttribute("emp");
		
		if(employee == null)
		{
			String errormsg = "Sorry!Your session has expired.Please login again to continue";
			
			model.addAttribute("errormsg", errormsg);
			
			return new ModelAndView("crmerror");
		}

		int employeeid = employee.getEmpid();
		
		String isbdh = projectRoleMappingRepository.isBusinessDevelopmentHead(employee.getEmpid(), 19, employee.getEmpid(), 19);
		
		List<CRMRecords> leads = crmrecordsRespositoty.findAllActivatedLeads(employeeid);
		
		List<CRMEventMaster> crmevents = crmEventRepository.findByOrderByCrmeventAsc();
		
		List<PurposeOfEvent> purposeOfEvent = purposeOfEventRepository.getPurposeofeventforLead();
		
//		List<PurposeOfEvent> purposeOfEvent = purposeOfEventRepository.findByOrderByPurposeofeventidAsc();
		
        List<CrmDataSource> crmdatasources = crmDataSourceRepository.findActivatedDatasourceByOrderByCrmdsidAsc();
		
		List<Offering> offerings = offeringRepository.findActivatedOfferingByOrderByOfferingdescAsc();
		
        ArrayList<EmployeeMaster> primarysseconalespersons = new ArrayList<EmployeeMaster>();
		
		ArrayList<EmployeeMaster> presalespersons = new ArrayList<EmployeeMaster>();
		
		ArrayList<EmployeeMaster> bdheads = new ArrayList<EmployeeMaster>();
		
		List<Integer> primarysseconalesperson  = projectRoleMappingRepository.getPrimarySalesPerson();
		
		List<Integer> presalesperson  = projectRoleMappingRepository.getPresalesPerson();
		
		List<Integer> bdhead  = projectRoleMappingRepository.getBDHead();
		
		for(int i=0;i<primarysseconalesperson.size();i++)
		{
			EmployeeMaster emp = employeeMasterRepository.findByEmpid(primarysseconalesperson.get(i));
			
			primarysseconalespersons.add(emp);
			
			emp = null;
		}
		
		for(int i=0;i<presalesperson.size();i++)
		{
			EmployeeMaster emp = employeeMasterRepository.findByEmpid(presalesperson.get(i));
			
			presalespersons.add(emp);
			
			emp = null;
		}
		
		for(int i=0;i<bdhead.size();i++)
		{
			EmployeeMaster emp = employeeMasterRepository.findByEmpid(bdhead.get(i));
			
			bdheads.add(emp);
			
			emp = null;
		}
		
        primarysseconalesperson  = null;
		
		presalesperson  = null;
		
		bdhead  = null;
		
		model.addAttribute("primarysseconalespersons",primarysseconalespersons);
		
		model.addAttribute("presalespersons",presalespersons);
		
		model.addAttribute("bdheads",bdheads);
		
		model.addAttribute("recordstitle",recordstitle);
		
		model.addAttribute("leads",leads);
		
		model.addAttribute("crmevents",crmevents);
		
		model.addAttribute("purposeOfEvent",purposeOfEvent);
		
		model.addAttribute("savemsg",savemsg);
		
		model.addAttribute("crmdatasources",crmdatasources);
		   
		model.addAttribute("offerings",offerings);
		
        if(isbdh.equalsIgnoreCase("true"))
        {
    		return new ModelAndView("redirect:leadshr");
        }
        else
        {
    		return new ModelAndView("crmrecords");
        }
		

	}
	
	@RequestMapping("/customers")
	public ModelAndView getcustomersRecords(HttpServletRequest request,Model model,@RequestParam(value = "savemsg", required = false) String savemsg) throws MessagingException
	{
		List<Lead_to_Customer> mailSending=new ArrayList<Lead_to_Customer>();
        String recordstitle = "Customer";
		
		HttpSession session = request.getSession();

		EmployeeMaster employee = (EmployeeMaster) session.getAttribute("emp");
		
		if(employee == null)
		{
			String errormsg = "Sorry!Your session has expired.Please login again to continue";
			
			model.addAttribute("errormsg", errormsg);
			
			return new ModelAndView("crmerror");
		}

		int employeeid = employee.getEmpid();
		
		String isbdh = projectRoleMappingRepository.isBusinessDevelopmentHead(employee.getEmpid(), 19, employee.getEmpid(), 19);
		
		List<CRMRecords> customers = crmrecordsRespositoty.findAllActivatedCustomers(employeeid);
		
		List<Offering> offerings = offeringRepository.findActivatedOfferingByOrderByOfferingdescAsc();
		
		List<CRMEventMaster> crmevents = crmEventRepository.findByOrderByCrmeventAsc();
				 		
		model.addAttribute("recordstitle",recordstitle);
		
		model.addAttribute("customers",customers);
		
		model.addAttribute("offerings",offerings);
		
		model.addAttribute("savemsg",savemsg);
		
		model.addAttribute("crmevents",crmevents);
		
		if(isbdh.equalsIgnoreCase("true"))
		{
			return new ModelAndView("redirect:customershr");
		}
		else
		{
			return new ModelAndView("crmrecords");
		}
		
	}
	
	@RequestMapping("/saveediteventdetails")
	public ModelAndView saveediteventdetails(HttpServletRequest request,Model model,@RequestParam(value = "savemsg", required = false) String savemsg,@RequestParam(value = "document_upload", required = false) CommonsMultipartFile[] document_upload)
	{
		String offeringList ="";
		
		HttpSession session = request.getSession();

		EmployeeMaster employee = (EmployeeMaster) session.getAttribute("emp");
		
		if(employee == null)
		{
			String errormsg = "Sorry!Your session has expired.Please login again to continue";
			
			model.addAttribute("errormsg", errormsg);
			
			return new ModelAndView("crmerror");
		}

		int employeeid = employee.getEmpid();
		
		int crmrecordid  = Integer.parseInt(request.getParameter("editcemrecordsid"));
		
		String crmtype = request.getParameter("editrecordstitle");
		
		SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
		
		try
		{
			CRMRecords crmrecord = crmrecordsRespositoty.findByCrmrecordid(employeeid);
			
			int datasources = Integer.parseInt(request.getParameter("editdatasource"));
			
			CrmDataSource crmDataSource = crmDataSourceRepository.findByCrmdsid(datasources);
			
			String offering[] = request.getParameterValues("editoffering");
			
			for(int i=0;i<offering.length;i++)
			{
				if(i==0)
				{
					offeringList = offering[0];
				}
				else if(i == (offering.length - 1))
				{
					offeringList = offeringList+","+offering[i];
				}
				else
				{
					offeringList = offeringList+","+offering[i];
				}
			}
			
            String companyname = request.getParameter("editcompanyname");	
			
			String nickname = request.getParameter("editnickname");
			
			String employeesize = request.getParameter("editemployeesize");
			
			String annualturnover = request.getParameter("editannualturnover");
			
            String contactnames[] = request.getParameterValues("editcontactname");
			
			String designations[] = request.getParameterValues("editDesignation");
			
			String mobilenos[] = request.getParameterValues("editmobilenos");
			
			String officenos[] = request.getParameterValues("editofficenos");
			
			String contactemails[] = request.getParameterValues("editcontactemail");
			
			String altemails[] = request.getParameterValues("editaltemail");
			
			String auhorities[] = request.getParameterValues("editauhority");
			
			crmrecord.setCrmDataSource(crmDataSource);
			
			crmrecord.setOffering(offeringList);
			
			crmrecord.setCompanyname(companyname);
			
			crmrecord.setNickname(nickname);
			
			crmrecord.setEmployeesize(employeesize);
			
			crmrecord.setAnnualturnover(annualturnover);
			
			if(crmtype.equalsIgnoreCase("Lead"))
			{
				String document_name[] = request.getParameterValues("editdocument_name");
				
				Long potentialopp = Long.parseLong(request.getParameter("potentialopp"));
				
				String projectdesc = request.getParameter("projectdesc");
				
				 String chanceofsale = request.getParameter("chanceofsale");
				
				 String forecastclosedatestr = request.getParameter("forecastclosedate");
				 
				 Date forecastclosedate = format.parse(forecastclosedatestr);
				 
				 if (document_upload != null) 
					{
					    int var=0;
						for (MultipartFile multipartFile : document_upload) 
						{
						  LeadDocuments leaddoc = new LeadDocuments();
						  leaddoc.setDocumentupload(multipartFile.getBytes()); 
						  leaddoc.setDocumentname(document_name[var]);
						  leaddoc.setFilename(multipartFile.getOriginalFilename());
						  leaddoc.setFilesize(multipartFile.getSize());
						  leaddoc.setFiletype(multipartFile.getContentType());
						  leaddoc.setCrmrecordid(crmrecord);
						  leaddoc.setLastupdatedby(employeeid);
						  leaddoc.setLastupdateddate(new Date());
						  leaddocumentsRepository.save(leaddoc);
						  var++;
						}
					}
				 
				 crmrecord.setPotentialopp(potentialopp);
				 
				 crmrecord.setProjectdescription(projectdesc);
				 
				 crmrecord.setChanceofsale(chanceofsale);
				 
				 crmrecord.setForecastclose(forecastclosedate);

			}
			
			crmrecord.setLastupdatedby(employeeid);
			
			crmrecord.setLastupdateddate(new Date());
			
			crmrecordsRespositoty.save(crmrecord);
			
			for(int i=0;i<contactnames.length;i++)
			{
				CRMRecordsContacts enquiriescontacts = new CRMRecordsContacts();
				
                enquiriescontacts.setCrmrecordsid(crmrecord);
				
				enquiriescontacts.setContactname(contactnames[i]);
				
				enquiriescontacts.setDesignation(designations[i]);
				
				enquiriescontacts.setMobileno(mobilenos[i]);
				
				enquiriescontacts.setOfficeno(officenos[i]);
				
				enquiriescontacts.setEmailid(contactemails[i]);
				
				enquiriescontacts.setAltemail(altemails[i]);
				
				enquiriescontacts.setAuthority(auhorities[i]);
				
				enquiriesContactsRepository.save(enquiriescontacts);
			}
			
			if(crmtype.equalsIgnoreCase("Enquiry"))
			{
				savemsg = "editenquirysuccess";
				 
				return new ModelAndView("redirect:enquiries?savemsg='" + URLEncoder.encode(savemsg) + "'");
			}
			else if(crmtype.equalsIgnoreCase("Lead"))
			{
				savemsg = "editcontactsuccess";
				 
				return new ModelAndView("redirect:leads?savemsg='" + URLEncoder.encode(savemsg) + "'");
			}
			else
			{
				return null;
			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping("/savemodifiedDetails")
	public ModelAndView savemodifiedDetails(HttpServletRequest request,Model model,@RequestParam(value = "savemsg", required = false) String savemsg,@RequestParam(value = "editdocument_upload", required = false) CommonsMultipartFile[] editdocument_upload)
	{
		
		String crmrecordtype = request.getParameter("editrecordstitle");
		try
		{
			String offeringList ="";
			
			HttpSession session = request.getSession();

			EmployeeMaster employee = (EmployeeMaster) session.getAttribute("emp");
			
			if(employee == null)
			{
				String errormsg = "Sorry!Your session has expired.Please login again to continue";
				
				model.addAttribute("errormsg", errormsg);
				
				return new ModelAndView("crmerror");
			}

			int employeeid = employee.getEmpid();
			
			int crmrecordid  = Integer.parseInt(request.getParameter("editacemrecordsid"));
			
			CRMRecords crmrecords = crmrecordsRespositoty.findByCrmrecordid(crmrecordid);
			
			SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
			String calling_status= "";
			
			if(request.getParameter("calling_status") != null) {
			  calling_status = request.getParameter("calling_status"); //call_status_text
			}
			
			
			String call_status_text = request.getParameter("call_status_text");

			String calling_status_remark = request.getParameter("calling_status_remark");
			
			String industry_of_company = request.getParameter("industry_of_company");

			String alternative_email_id = request.getParameter("alternative_email_id");

			//String designation_of_prospect = request.getParameter("designation_of_prospect");//status_text
			
			String status_text = request.getParameter("status_text");
			
			String final_status = request.getParameter("final_status");//editchanceofsale

			String editchanceofsale = request.getParameter("editchanceofsale");//editforecastclosedate
			
			String edit_margin = request.getParameter("edit_margin"); //call_status_text

			
			String editforecastclosedate = request.getParameter("forecastclosedate1");
			String editpotentialopp = request.getParameter("editpotentialopp");
			
			String editassigneto = request.getParameter("editassigneto");
			 int emp_Id = 0;
           if(request.getParameter("editassigneto") != null && !request.getParameter("editassigneto").equals("")) {
        	    emp_Id = Integer.parseInt(request.getParameter("editassigneto"));
        	ArrayList<EmployeeMaster>empList = (ArrayList<EmployeeMaster>) employeeMasterRepository.getemployeebasedonid(emp_Id);
        	   EmployeeMaster assign = empList.get(0);
        	   crmrecords.setAssigneto(assign);
        	   System.out.println("crmrecords.getAssigneto() ........................................ <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< "+crmrecords.getAssigneto());
           }
			
			//System.out.println("DATE ................................. "+editforecastclosedate);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date d = null;
			
			
			if(edit_margin != null && !edit_margin.equals("")) {
				crmrecords.setMargin(edit_margin);
			}else {
				crmrecords.setMargin("");
			}
			
			
			
			Calling_Status_History c = new Calling_Status_History();

			if(!calling_status.equals("") && calling_status != null) {
				
			crmrecords.setCalling_status(calling_status);
			ArrayList<Calling_Status_History>latest =  (ArrayList<Calling_Status_History>) crm_calling_history_repositry.checkLatestCallingStatus(crmrecordid);
			System.out.println("LATEST LIST SIZE ...................************************************************************......................... "+latest.size());
			if(latest.size() > 0) {
			
			if(latest.get(0).getCalling_status().equalsIgnoreCase(calling_status)) {
				System.out.println("CALLING REMARK IS ALREADY PRESENT..................(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((...........................................");
			}else {
				CRMRecords crm = crmrecordsRespositoty.findByCrmrecordid(crmrecordid);
				c.setCrm_id(crm);
				c.setCalling_status(calling_status);
				
				Timestamp timestamp = new Timestamp(System.currentTimeMillis());

				  c.setCalling_date(timestamp);				

				
				if(calling_status_remark != null && !calling_status_remark.equals("")) {
					c.setCalling_remark(calling_status_remark);
				}

			 }
			
			}else {
				
				CRMRecords crm = crmrecordsRespositoty.findByCrmrecordid(crmrecordid);

				c.setCrm_id(crm);
				c.setCalling_status(calling_status);
				
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MMM-yyyy");
				String strDate = LocalDate.now().format(formatter);
				
				Timestamp timestamp = new Timestamp(System.currentTimeMillis());

				c.setCalling_date(timestamp);				
				
				if(calling_status_remark != null && !calling_status_remark.equals("")) {
					c.setCalling_remark(calling_status_remark);
				}
			}
			
			crm_calling_history_repositry.save(c);

			
		  }else {
				crmrecords.setCalling_status(call_status_text);
			}
			crmrecords.setIndustry_of_company(industry_of_company);

			crmrecords.setAlternative_email_id(alternative_email_id);

			//crmrecords.setDesignation_of_prospect(designation_of_prospect);
			if(calling_status_remark != null && !calling_status_remark.equals("")) {
				crmrecords.setCalling_status_remark(calling_status_remark);
			}
			
			System.out.println("edit forcasrt date is saved............00000000000000...............");

			
			
			
			if(request.getParameter("forecastclosedate1")!= null && !request.getParameter("forecastclosedate1").equals("") )
			{
				System.out.println("edit forcasrt date is saved...........11111111111111...............");

				String forecastclosedatestr1 = request.getParameter("forecastclosedate1");
				
                Date forecastclosedate = format.parse(forecastclosedatestr1);
				
				crmrecords.setForecastclose(forecastclosedate);
				System.out.println("edit forcasrt date is saved............222222222222222...............");
			}
			
			if(request.getParameter("editpotentialopp") != null && !request.getParameter("editpotentialopp").equals("")) {
				long l = Long.parseLong(editpotentialopp);
				crmrecords.setPotentialopp(l);
			}
			
			////
if(final_status != null) {
			if(!final_status.equals("")) {
				if(final_status.equals("Converted to Lead")) {
					crmrecords.setStatus(final_status);
					crmrecords.setCrmtype("Lead");
					crmrecords.setChanceofsale(editchanceofsale);
					System.out.println("edit forcasrt date is saved............333333333333333333...............");

					
				}else {
				crmrecords.setStatus(final_status);
				crmrecords.setCrmtype(final_status);
				}
			}
			
			
			else {
				if(status_text.equals("Converted to Lead") || status_text.equals("Opportunity") || status_text.equals("Pipeline") || status_text.equals("On Hold")) {
					crmrecords.setStatus(status_text);
					crmrecords.setCrmtype("Lead");
					crmrecords.setChanceofsale(editchanceofsale);

				}else {
				crmrecords.setStatus(status_text);
				crmrecords.setCrmtype(status_text);
				}
			}
}	
			////
			
			
if(final_status != null) {
			if(!final_status.equals("")) {
				if(final_status.equals("Cancelled")) {
					crmrecords.setIsactivated("N");
			}
			}else {
				crmrecords.setIsactivated("Y");
			}
}	
			
			
			
			/*
			 * System.out.println("editdatasource ==> "+request.getParameter(
			 * "editdatasource")+"\n" +
			 * "****  editoffering ==>  "+request.getParameter("editdatasource")+" \n " +
			 * "****  editcompanyname ==> "+request.getParameter("editcompanyname")+"\n" +
			 * "****  editnickname ==> "+request.getParameter("editnickname") +"\n" +
			 * "****  editemployeesize ==> "+request.getParameter("editemployeesize")+"\n" +
			 * "****  editannualturnover ==> "+request.getParameter("editannualturnover")+
			 * "\n" + "**** potentialopp ==> "+request.getParameter("potentialopp")+"\n" +
			 * "**** projectdesc ==> "+request.getParameter("projectdesc")+"\n" +
			 * "**** editdocument_name ==> "+request.getParameterValues("editdocument_name")
			 * );
			 */
			
			if(!request.getParameter("editdatasource").equals(""))
			{
	             int datasources = Integer.parseInt(request.getParameter("editdatasource"));
				
				 CrmDataSource crmDataSource = crmDataSourceRepository.findByCrmdsid(datasources);
				 
				 crmrecords.setCrmDataSource(crmDataSource);
			}
			
			if(request.getParameterValues("editoffering") != null)
			{
	            String offering[] = request.getParameterValues("editoffering");
				
				for(int i=0;i<offering.length;i++)
				{
					if(i==0)
					{
						offeringList = offering[0];
					}
					else if(i == (offering.length - 1))
					{
						offeringList = offeringList+","+offering[i];
					}
					else
					{
						offeringList = offeringList+","+offering[i];
					}
				}
				
				crmrecords.setOffering(offeringList);
			}
			
			if(!request.getParameter("editcompanyname").equals(""))
			{
				String companyname = request.getParameter("editcompanyname");	
				crmrecords.setCompanyname(companyname);
			}
			
			
			
			if(!request.getParameter("editnickname").equals(""))
			{
				String nickname = request.getParameter("editnickname");
				crmrecords.setNickname(nickname);
			}
			
			if(!request.getParameter("editemployeesize").equals(""))
			{
				String employeesize = request.getParameter("editemployeesize");
				crmrecords.setEmployeesize(employeesize);
			}
			
			if(!request.getParameter("editannualturnover").equals(""))
			{
				String annualturnover = request.getParameter("editannualturnover");
				crmrecords.setAnnualturnover(annualturnover);
			}
			
			if(!request.getParameter("editpotentialopp").equals(""))
			{
				Long potentialopp = Long.parseLong(request.getParameter("editpotentialopp"));
				crmrecords.setPotentialopp(potentialopp);
			}
			
			
			if(!request.getParameter("editprojectdesc").equals(""))
			{
				String projectdesc = request.getParameter("editprojectdesc");
				crmrecords.setProjectdescription(projectdesc);
			}
			
			
			if(request.getParameter("editaddress1") != null)
			{
				String editaddress1 = request.getParameter("editaddress1");
				crmrecords.setAddress1(editaddress1);
			}
			
			if(request.getParameter("editaddress2") != null)
			{
				String editaddress2 = request.getParameter("editaddress2");
				crmrecords.setAddress2(editaddress2);
			}
			
			if(request.getParameter("editcity") != null)
			{
				String editcity = request.getParameter("editcity");
				crmrecords.setCity(editcity);
			}
			
            String countrytype=request.getParameter("countrytype");
			crmrecords.setCountrytype(countrytype);
			
			if(request.getParameter("country") != null) 
			{
			   String country1 = request.getParameter("country");
			   
			   int countryid = Integer.parseInt(country1);
				
			   String  country = countriesRepository.findByCountryid(countryid).getName();
			   
			   crmrecords.setCountry(country);
		
			}
			
			if(request.getParameter("editflow_of_Date") != null)
			{

				String editflow_of_Date = request.getParameter("editflow_of_Date");
				SimpleDateFormat formatter11 = new SimpleDateFormat("yyyy-MM-dd"); // Use the correct date format here
				Date flow_of_date = null;

				try {
					flow_of_date = formatter11.parse(editflow_of_Date);
				} catch (ParseException e) {
				    e.printStackTrace(); // Handle the exception (e.g., invalid date format)
				}
				
				crmrecords.setFlow_of_date(flow_of_date);
				
				
			}
			
			
		int state1=0;
		int district1=0;
		
		try {
			 if(request.getParameter("instate") !=null) {
				 
			 state1 = Integer.parseInt(request.getParameter("instate"));
			 
			 district1 = Integer.parseInt(request.getParameter("indistricts"));
			 
			if(state1!=0)
			{
				
				String state = stateMasterRepository.findByStateid(state1).getStatename();	
			
				crmrecords.setState(state);
			}
			
						
			if(district1 !=0)
			{
				
				String district = districtMasterRepository.findByDistrictid(district1).getDistrictname();
				
				crmrecords.setDistrict(district);
			}
			
			 }
		}catch(NumberFormatException e) {
			
		}
			 
		
		
			 
			if(!request.getParameter("editprimarysalesperson").equals("") ) {
				
			int primarysalespersonid = Integer.parseInt(request.getParameter("editprimarysalesperson"));
			EmployeeMaster primarysalesperson = employeeMasterRepository.findByEmpid(primarysalespersonid);
			crmrecords.setPrimarysalesperson(primarysalesperson);

			}
			
			if(!request.getParameter("editsecondarysalesperson").equals("")) {
				
			int secondarysalespersonid = Integer.parseInt(request.getParameter("editsecondarysalesperson"));
			EmployeeMaster secondarysalesperson = employeeMasterRepository.findByEmpid(secondarysalespersonid);
			crmrecords.setSecondarysalesperson(secondarysalesperson);

			}
			
			
			if(!request.getParameter("editpresalesperson").equals("")) {
				
			int presalespersonid = Integer.parseInt(request.getParameter("editpresalesperson"));
			EmployeeMaster presalesperson = employeeMasterRepository.findByEmpid(presalespersonid);
			crmrecords.setPresalesperson(presalesperson);

			}
			
			
			if(!request.getParameter("editbdhead").equals("")) {
			
			int bdheadid = Integer.parseInt(request.getParameter("editbdhead"));
			EmployeeMaster bdhead = employeeMasterRepository.findByEmpid(bdheadid);
			crmrecords.setBdhead(bdhead);

			}
			 
			 
			
			 
			 if(final_status != null) {
				 
			if(final_status.equals("PO")) {
				crmrecords.setCrmtype("PO");
			}
		}
			
			
			
			
			crmrecords.setLastupdatedby(employeeid);
			
			crmrecords.setLastupdateddate(new Date());
			crmrecords.setIsactivatedcustomer("Y");
			System.out.println(crmrecords);
			crmrecordsRespositoty.save(crmrecords);
			
			if(request.getParameterValues("editcontactname") != null)
			{
	            String contactnames[] = request.getParameterValues("editcontactname");
				
				String designations[] = request.getParameterValues("editDesignation");
				
				String mobilenos[] = request.getParameterValues("editmobilenos");
				
				String officenos[] = request.getParameterValues("editofficenos");
				
				String contactemails[] = request.getParameterValues("editcontactemail");
				
				String altemails[] = request.getParameterValues("editaltemail");
				
				String auhorities[] = request.getParameterValues("editauhority");
				
				for(int i=0;i<contactnames.length;i++)
				{
	                CRMRecordsContacts enquiriescontacts = new CRMRecordsContacts();
					
	                enquiriescontacts.setCrmrecordsid(crmrecords);
					
					enquiriescontacts.setContactname(contactnames[i]);
					
					enquiriescontacts.setDesignation(designations[i]);
					
					enquiriescontacts.setMobileno(mobilenos[i]);
					
					enquiriescontacts.setOfficeno(officenos[i]);
					
					enquiriescontacts.setEmailid(contactemails[i]);
					
					enquiriescontacts.setAltemail(altemails[i]);
					
					enquiriescontacts.setAuthority(auhorities[i]);
					
					enquiriesContactsRepository.save(enquiriescontacts);
				}
			}
			
			if(request.getParameterValues("editdocument_name") != null)
			{
				String document_name[] = request.getParameterValues("editdocument_name");
				
				if (editdocument_upload != null) 
				{
				    int var=0;
					for (MultipartFile multipartFile : editdocument_upload) 
					{
					  LeadDocuments leaddoc = new LeadDocuments();
					  leaddoc.setDocumentupload(multipartFile.getBytes()); 
					  leaddoc.setDocumentname(document_name[var]);
					  leaddoc.setFilename(multipartFile.getOriginalFilename());
					  leaddoc.setFilesize(multipartFile.getSize());
					  leaddoc.setFiletype(multipartFile.getContentType());
					  leaddoc.setCrmrecordid(crmrecords);
					  leaddoc.setLastupdatedby(employeeid);
					  leaddoc.setLastupdateddate(new Date());
					  leaddocumentsRepository.save(leaddoc);
					  var++;
					  leaddoc = null;
					}
				}
			}
			
//			System.out.println("  crmrecordtype  ==> "+crmrecordtype);
			
			String primarysalesperson = null;
				
			String secondarysalesperson = null;
			 
			String presalesperson = null;
			 
			String bdhead = null;
			 
			 crmrecords = null;
			
			if(crmrecordtype.equalsIgnoreCase("Enquiry"))
			{
				savemsg = "editenquirysuccess";
				
				return new ModelAndView("redirect:enquiries?savemsg='" + URLEncoder.encode(savemsg) + "'");
			}
			
			else if(crmrecordtype.equalsIgnoreCase("Lead"))
			{
				savemsg = "editleadsuccess";
				 
				return new ModelAndView("redirect:leads?savemsg='" + URLEncoder.encode(savemsg) + "'");
			}
			else
			{
				return null;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
			/*
			 * if(crmrecordtype.equalsIgnoreCase("Enquiry")) { savemsg = "failure";
			 * 
			 * return new ModelAndView("redirect:enquiries?savemsg='" +
			 * URLEncoder.encode(savemsg) + "'"); }
			 * 
			 * else if(crmrecordtype.equalsIgnoreCase("Lead")) { savemsg = "failure";
			 * 
			 * return new ModelAndView("redirect:leads?savemsg='" +
			 * URLEncoder.encode(savemsg) + "'"); } else { return null; }
			 */
			
		}
		return null;
	}
	

	
	@RequestMapping("/targetConfiguration")
	public ModelAndView targetConfiguration(HttpServletRequest request,Model model,@RequestParam(value = "savemsg", required = false) String savemsg)
	{
		String configtype = "targetconfiguration";
		
		List<TargetConfiguration> targetconfigurations = targetConfigurationRepository.findAll();
		
		model.addAttribute("targetconfigurations", targetconfigurations);
		
		model.addAttribute("configtype", configtype);
		
		model.addAttribute("savemsg", savemsg);
		
		return new ModelAndView("crmconfiguration");
	}
	
	@RequestMapping("/addtargetconfig")
	public ModelAndView addtargetconfig(HttpServletRequest request,Model model,@RequestParam(value = "savemsg", required = false) String savemsg)
	{
        List<Integer> projectRoles  = projectRoleMappingRepository.findByEmployeeMaster();
		
        ArrayList<EmployeeMaster> empMaster  =  new ArrayList<EmployeeMaster>();
		
		for(int i=0;i<projectRoles.size();i++)
		{
			EmployeeMaster emp = employeeMasterRepository.findByEmpid(projectRoles.get(i));
			
			empMaster.add(emp);
		}
		
		model.addAttribute("empMaster", empMaster);
		
		return new ModelAndView("addtargetconfig");
	}
	
	@RequestMapping("/savetargetconfiguration")
	public ModelAndView savetargetconfiguration(HttpServletRequest request,Model model)
	{
		String savemsg = "";
		
		try
		{
			int empid = Integer.parseInt(request.getParameter("salesperson"));
			
			String targettype = request.getParameter("targettype");
			
			String targetfrequency = request.getParameter("targetfrequency");
			
			int target = Integer.parseInt(request.getParameter("target"));
			
			String remark = request.getParameter("remark");
			
			EmployeeMaster emp = employeeMasterRepository.findByEmpid(empid);
			
			TargetConfiguration targetConfig = new TargetConfiguration();
			
			targetConfig.setSalesperson(emp);
			
			targetConfig.setTargettype(targettype);
			
			targetConfig.setTarget(target);
			
			targetConfig.setTargetfrequency(targetfrequency);
			
			targetConfig.setRemark(remark);
			
			targetConfigurationRepository.save(targetConfig);
			
			savemsg = "successtarget";
			
//			return new ModelAndView("redirect:addtargetconfig?savemsg='" + URLEncoder.encode(savemsg) + "'");
			
			return new ModelAndView("redirect:targetConfiguration?savemsg='" + URLEncoder.encode(savemsg) + "'");
		}
		catch(Exception e)
		{
		    e.printStackTrace();
		    
		    savemsg = "failtarget";
		    
		    return new ModelAndView("redirect:targetConfiguration?savemsg='" + URLEncoder.encode(savemsg) + "'");
		}
	}
	

	@RequestMapping("/incentiveConfiguration")
	public ModelAndView incentiveConfiguration(HttpServletRequest request,Model model,@RequestParam(value = "savemsg", required = false) String savemsg)
	{
        String configtype = "incentiveconfiguration";
		
		List<IncentiveConfiguration> incentiveconfiguration = incentiveConfigurationRepository.findAll();
		
		model.addAttribute("incentiveconfiguration", incentiveconfiguration);
		
		model.addAttribute("configtype", configtype);
		
		model.addAttribute("savemsg", savemsg);
		
		return new ModelAndView("crmconfiguration");
		
	}
	
	@RequestMapping("/addincentiveconfig")
	public ModelAndView addincentiveconfig(HttpServletRequest request,Model model,@RequestParam(value = "savemsg", required = false) String savemsg)
	{
		model.addAttribute("savemsg", savemsg);
		
		return new ModelAndView("addincentiveConfiguration");
		
	}
	
	
	@RequestMapping("/saveincentiveconfiguration")
	public ModelAndView saveincentiveconfiguration(HttpServletRequest request,Model model)
	{
		String savemsg = "";
		
		try
		{
			int year = Year.now().getValue();
			
			int year1 = Year.now().getValue()+1;
			
			String incentiverole = request.getParameter("incentiverole");
			
			String incentiveeligibility = request.getParameter("incentiveeligibility");
			
			String incentivetype = request.getParameter("incentivetype");
			
			String incentivetype1 = request.getParameter("incentivetype1");
			
			String incentivetobecal = request.getParameter("inctobecal");
			
			String remark = request.getParameter("remark");
			
			IncentiveConfiguration incentiveconfig = new IncentiveConfiguration();
			
			incentiveconfig.setIncentiverole(incentiverole);
			
			incentiveconfig.setIncentiveeligibility(incentiveeligibility);
			
			incentiveconfig.setIncentivetype(incentivetype);
			
			incentiveconfig.setIncentivetype1(incentivetype1);
			
			incentiveconfig.setIncentivetobecal(incentivetobecal);
			
			incentiveconfig.setCurrentfinyear(year+"-"+year1);	
			
			incentiveconfig.setRemark(remark);
			
			incentiveConfigurationRepository.save(incentiveconfig);
			
			savemsg = "successincentive";
			
			return new ModelAndView("redirect:incentiveConfiguration?savemsg='" + URLEncoder.encode(savemsg) + "'");
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
			 savemsg = "failincentive";
			
			return new ModelAndView("redirect:incentiveConfiguration?savemsg='" + URLEncoder.encode(savemsg) + "'");
		}
		
	}
	
	@RequestMapping("/enquirieshr")
	public ModelAndView enquirieshr(HttpServletRequest request,Model model,@RequestParam(value = "savemsg", required = false) String savemsg)
	{
		String recordstitle = "enquiry";
		
		HttpSession session = request.getSession();

		EmployeeMaster employee = (EmployeeMaster) session.getAttribute("emp");
		
		if(employee == null)
		{
			String errormsg = "Sorry!Your session has expired.Please login again to continue";
			
			model.addAttribute("errormsg", errormsg);
			
			return new ModelAndView("crmerror");
		}

		int employeeid = employee.getEmpid();
		
		String isbdh = projectRoleMappingRepository.isBusinessDevelopmentHead(employee.getEmpid(), 19, employee.getEmpid(), 19);
		
		List<CRMRecords> enquiries = crmrecordsRespositoty.findAllActivatedEnquiriesForHr();
		
		List<CrmDataSource> crmdatasources = crmDataSourceRepository.findActivatedDatasourceByOrderByCrmdsidAsc();
		
		List<Offering> offerings = offeringRepository.findActivatedOfferingByOrderByOfferingdescAsc();
		
        ArrayList<EmployeeMaster> primarysseconalespersons = new ArrayList<EmployeeMaster>();
		
		ArrayList<EmployeeMaster> presalespersons = new ArrayList<EmployeeMaster>();
		
		ArrayList<EmployeeMaster> bdheads = new ArrayList<EmployeeMaster>();
		
        List<CRMEventMaster> crmevents = crmEventRepository.findByOrderByCrmeventAsc();
		
        List<PurposeOfEvent> purposeOfEvent = purposeOfEventRepository.getPurposeofeventforenquiry();
		
//		List<PurposeOfEvent> purposeOfEvent = purposeOfEventRepository.findByOrderByPurposeofeventidAsc();
		
		List<Integer> primarysseconalesperson  = projectRoleMappingRepository.getPrimarySalesPerson();
		
		List<Integer> presalesperson  = projectRoleMappingRepository.getPresalesPerson();
		
		List<Integer> bdhead  = projectRoleMappingRepository.getBDHead();
		
		for(int i=0;i<primarysseconalesperson.size();i++)
		{
			EmployeeMaster emp = employeeMasterRepository.findByEmpid(primarysseconalesperson.get(i));
			
			primarysseconalespersons.add(emp);
			
			emp = null;
		}
		
		for(int i=0;i<presalesperson.size();i++)
		{
			EmployeeMaster emp = employeeMasterRepository.findByEmpid(presalesperson.get(i));
			
			presalespersons.add(emp);
			
			emp = null;
		}
		
		for(int i=0;i<bdhead.size();i++)
		{
			EmployeeMaster emp = employeeMasterRepository.findByEmpid(bdhead.get(i));
			
			bdheads.add(emp);
			
			emp = null;
		}
		
        primarysseconalesperson  = null;
		
		presalesperson  = null;
		
		bdhead  = null;
		
		model.addAttribute("crmevents",crmevents);
		
		model.addAttribute("purposeOfEvent",purposeOfEvent);
		
		model.addAttribute("primarysseconalespersons",primarysseconalespersons);
		
		model.addAttribute("presalespersons",presalespersons);
		
		model.addAttribute("bdheads",bdheads);
		
		model.addAttribute("crmdatasources",crmdatasources);
		
		model.addAttribute("offerings",offerings);
		
		model.addAttribute("employeeid",employeeid);
		
		model.addAttribute("savemsg",savemsg);
		
		model.addAttribute("recordstitle",recordstitle);
		
		model.addAttribute("enquiries",enquiries);
		
		model.addAttribute("isbdh",isbdh);
		
		return new ModelAndView("crmrecordshr"); 
		
	}
	
	@RequestMapping("/leadshr")
	public ModelAndView leadshr(HttpServletRequest request,Model model,@RequestParam(value = "savemsg", required = false) String savemsg)
	{
		String recordstitle = "Lead";
			
		HttpSession session = request.getSession();

		EmployeeMaster employee = (EmployeeMaster) session.getAttribute("emp");
		
		if(employee == null)
		{
			String errormsg = "Sorry!Your session has expired.Please login again to continue";
			
			model.addAttribute("errormsg", errormsg);
			
			return new ModelAndView("crmerror");
		}
		
		int employeeid = employee.getEmpid();

		String isbdh = projectRoleMappingRepository.isBusinessDevelopmentHead(employee.getEmpid(), 19, employee.getEmpid(), 19);
		   
		List<CRMRecords> leads = crmrecordsRespositoty.findAllActivatedLeadsForHr();
		
        List<CrmDataSource> crmdatasources = crmDataSourceRepository.findActivatedDatasourceByOrderByCrmdsidAsc();
		
		List<Offering> offerings = offeringRepository.findActivatedOfferingByOrderByOfferingdescAsc();
		
        List<CRMEventMaster> crmevents = crmEventRepository.findByOrderByCrmeventAsc();
		
        List<PurposeOfEvent> purposeOfEvent = purposeOfEventRepository.getPurposeofeventforLead();
		
//		List<PurposeOfEvent> purposeOfEvent = purposeOfEventRepository.findByOrderByPurposeofeventidAsc();
		
        ArrayList<EmployeeMaster> primarysseconalespersons = new ArrayList<EmployeeMaster>();
		
		ArrayList<EmployeeMaster> presalespersons = new ArrayList<EmployeeMaster>();
		
		ArrayList<EmployeeMaster> bdheads = new ArrayList<EmployeeMaster>();
		
		List<Integer> primarysseconalesperson  = projectRoleMappingRepository.getPrimarySalesPerson();
		
		List<Integer> presalesperson  = projectRoleMappingRepository.getPresalesPerson();
		
		List<Integer> bdhead  = projectRoleMappingRepository.getBDHead();
		
		for(int i=0;i<primarysseconalesperson.size();i++)
		{
			EmployeeMaster emp = employeeMasterRepository.findByEmpid(primarysseconalesperson.get(i));
			
			primarysseconalespersons.add(emp);
			
			emp = null;
		}
		
		for(int i=0;i<presalesperson.size();i++)
		{
			EmployeeMaster emp = employeeMasterRepository.findByEmpid(presalesperson.get(i));
			
			presalespersons.add(emp);
			
			emp = null;
		}
		
		for(int i=0;i<bdhead.size();i++)
		{
			EmployeeMaster emp = employeeMasterRepository.findByEmpid(bdhead.get(i));
			
			bdheads.add(emp);
			
			emp = null;
		}
		
        primarysseconalesperson  = null;
		
		presalesperson  = null;
		
		bdhead  = null;
		
		model.addAttribute("employeeid",employeeid);
		
		model.addAttribute("crmevents",crmevents);
		model.addAttribute("purposeOfEvent",purposeOfEvent);
		
		model.addAttribute("primarysseconalespersons",primarysseconalespersons);
		
		model.addAttribute("presalespersons",presalespersons);
		
		model.addAttribute("bdheads",bdheads);
		
		model.addAttribute("isbdh",isbdh);
		
		model.addAttribute("crmdatasources",crmdatasources);
		
		model.addAttribute("offerings",offerings);
		
		model.addAttribute("savemsg",savemsg);
		
		model.addAttribute("recordstitle",recordstitle);
		
		model.addAttribute("leads",leads);
		
		return new ModelAndView("crmrecordshr"); 
		
	}
	
	@RequestMapping("/customershr")
	public ModelAndView customershr(HttpServletRequest request,Model model)
	{
        String recordstitle = "Customer";
		
		HttpSession session = request.getSession();

		EmployeeMaster employee = (EmployeeMaster) session.getAttribute("emp");
		
		if(employee == null)
		{
			String errormsg = "Sorry!Your session has expired.Please login again to continue";
			
			model.addAttribute("errormsg", errormsg);
			
			return new ModelAndView("crmerror");
		}
		
		int employeeid = employee.getEmpid();

		String isbdh = projectRoleMappingRepository.isBusinessDevelopmentHead(employee.getEmpid(), 19, employee.getEmpid(), 19);
		   
		List<CRMRecords> customers = crmrecordsRespositoty.findAllActivatedCustomersForHr();
		
        List<CrmDataSource> crmdatasources = crmDataSourceRepository.findActivatedDatasourceByOrderByCrmdsidAsc();
		
		List<Offering> offerings = offeringRepository.findActivatedOfferingByOrderByOfferingdescAsc();
		
		model.addAttribute("employeeid",employeeid);
		
		model.addAttribute("isbdh",isbdh);
		
		model.addAttribute("crmdatasources",crmdatasources);
		
		model.addAttribute("offerings",offerings);
		
		model.addAttribute("recordstitle",recordstitle);
		
		model.addAttribute("customers",customers);
		
		return new ModelAndView("crmrecordshr"); 
		
	}
	
	@RequestMapping("/profile")
	public ModelAndView profile(HttpServletRequest request,Model model)
	{
        String recordstitle = "Customer";
		
		HttpSession session = request.getSession();

		EmployeeMaster employee = (EmployeeMaster) session.getAttribute("emp");
		
		if(employee == null)
		{
			String errormsg = "Sorry!Your session has expired.Please login again to continue";
			
			model.addAttribute("errormsg", errormsg);
			
			return new ModelAndView("crmerror");
		}
		
		JoiningDetails jdl = joiningDetailsReposiory.findByEmpid(employee.getEmpid());
				
		PersonalDetails per_det = personalDetailsRepository.findByEmpid(employee.getEmpid());
		
		System.out.println("jdl ==> "+jdl.getEmpid().getEmpfirstname());
		
		System.out.println("per_det ==> "+per_det.getEmpid().getEmpfirstname());
		
		model.addAttribute("jdl",jdl);
		
		model.addAttribute("per_det",per_det);
		
		return new ModelAndView("profile"); 
	}
	
	
     @RequestMapping("/logout")
	 public RedirectView LogoutForm(Model model,HttpServletRequest request)
	 {
    	 HttpSession session = request.getSession();

    	 RedirectView rv = new RedirectView();
    	 rv.setContextRelative(true);

    	 Integer profile_id = (Integer) request.getSession().getAttribute("profile_id");

    	 String url = environment.getRequiredProperty("minds_connect_url") + "/logout";

    	 //String url = request.getScheme() + "://" + request.getServerName();

    	 System.out.println("logout url ==> " + url);

    	 //String[] spliturl = url.split("/");

    	 session.removeAttribute("menus");

    	 session.removeAttribute("kwm_user");
    	 session.removeAttribute("username");
    	 session.removeAttribute("userid");
    	 session.removeAttribute("profileid");

    	 session.removeAttribute("newenquirygen");
    	 
    	 session.removeAttribute("monthname");

    	 session.removeAttribute("leadgen");
    	 session.removeAttribute("ordergen");
    	 session.removeAttribute("opportunitygen");
    	 session.removeAttribute("pipelinegen");

    	 session.removeAttribute("cancelledgen");

    	 session.removeAttribute("enquirygen");
    	 session.removeAttribute("interestedgen");
    	 
    	 session.removeAttribute("notinterestedgen");
    	 session.removeAttribute("leadqualifiedgen");

    	 session.removeAttribute("pocgen");
    	 session.removeAttribute("proposalsubmittedgen");
    	 session.removeAttribute("waitingforpogen");
    	 session.removeAttribute("pogen");
    	 session.removeAttribute("lostgen");

    	 // request.getSession(false);
    	 //session.invalidate();
    	 session.invalidate();
    	 rv.setUrl(url);

    	 return rv;
	 }
	 
	 @RequestMapping("/minds_connect")
	 public RedirectView handleTestRequest (Model model,HttpServletRequest request) throws UnsupportedEncodingException 
		{

			 HttpSession session = request.getSession();
			 EmployeeMaster emp = (EmployeeMaster) session.getAttribute("emp");
	
			 RedirectView rv = new RedirectView();
			 rv.setContextRelative(true);
	
			 String url = environment.getRequiredProperty("minds_connect_url") + "/loginfrompgmt?id=";
	
			 // String url = request.getScheme() + "://" + request.getServerName() +
			 // request.getContextPath()+"/loginfrompgmt?id=";
	
			 // url = url.replaceAll("\\s", "");
			 /* rv.setUrl("http://localhost:8087/Login_User?id="+emp.getEmp_id()); */
			 rv.setUrl(url + emp.getEmpid());
			 return rv;
	    }
	 
	 @RequestMapping("/savedealdetails")
	 public ModelAndView savedealdetails(Model model,HttpServletRequest request,@RequestParam(value = "dealdocument_upload", required = false) CommonsMultipartFile[] document_upload1) throws ParseException, IOException
	 {
		 
		HttpSession session = request.getSession();

		EmployeeMaster employee = (EmployeeMaster) session.getAttribute("emp");
		
		int crmid = Integer.parseInt(request.getParameter("crmrecordid"));
		
		String projectdesc = request.getParameter("dealprojectdesc");
		
		String offering[] = request.getParameterValues("dealoffering");
		
		String crmevent = request.getParameter("dealevent");
		
		String offeringList ="", ponumber = "" , podatestr1 = "", needbyDatestr = "" ,needbyDatestr1 = "",podatestr = "";
		
		Date needbyDate = null, podate = null;
		
		Long poamount;
		
		SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
		
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		
		int employeeid = employee.getEmpid();
		
		for(int i=0;i<offering.length;i++)
		{
			if(i==0)
			{
				offeringList = offering[0];
			}
			else if(i == (offering.length - 1))
			{
				offeringList = offeringList+","+offering[i];
			}
			else
			{
				offeringList = offeringList+","+offering[i];
			}
		}
		
		ponumber = request.getParameter("dealponumber");
		
	    poamount = Long.parseLong(request.getParameter("dealpoamount"));
		
		podatestr1 = request.getParameter("dealpodate");
		
		String[] podatestr2 = podatestr1.split("-");
		
		for(int i =0;i<podatestr2.length;i++)
		{
			podatestr = podatestr2[1]+"/"+podatestr2[2]+"/"+podatestr2[0];
		}
		
		podate = format.parse(podatestr);
		
		needbyDatestr1 = request.getParameter("dealneedbydate");
		
		String[] needbyDatestr2 = needbyDatestr1.split("-");
		
		for(int i =0;i<needbyDatestr2.length;i++)
		{
			needbyDatestr = needbyDatestr2[1]+"/"+needbyDatestr2[2]+"/"+needbyDatestr2[0];
		}
		
		needbyDate = format.parse(needbyDatestr);
		
		String remark = request.getParameter("dealremark");
		
		CRMRecords crmrecordid = crmrecordsRespositoty.findByCrmrecordid(crmid);
		
		CRMEvents crmevents = new CRMEvents();
		
		crmevents.setCrmevent(crmevent);
		
		crmevents.setProjectdescription(projectdesc);
		
		crmevents.setCrmrecordid(crmrecordid);
		
		crmevents.setCrmeventdate(timestamp);
		
		crmevents.setNeedbyDate(needbyDate);
		
		crmevents.setPoamount(poamount);
		
		crmevents.setPonumber(ponumber);
		
		crmevents.setStatus("PO");
		
		crmevents.setRemark(remark);
		
		crmevents.setPodate(podate);
		
        crmevents.setCreatedby(employeeid);
		
		crmevents.setCreationdate(new Date());
		
		crmevents.setLastupdatedby(employeeid);
		
		crmevents.setLastupdateddate(new Date());
		
		crmevents.setOffering(offeringList);
		
		crmevents.setRenew("N");
		
		String savemsg = "";
		
		try
		{
			savemsg = "donedeal";
		}
		catch(Exception e)
		{
			savemsg = "errordeal";
		}
		
		crmEventsRepository.save(crmevents);
		
		if(request.getParameterValues("dealdocument_name") != null)
		{
			String document_name[] = request.getParameterValues("dealdocument_name");
			
			if (document_upload1 != null) 
			{
			    int var=0;
				for (MultipartFile multipartFile : document_upload1) 
				{
				  LeadDocuments leaddoc = new LeadDocuments();
				  leaddoc.setCrmevents(crmevents);
				  leaddoc.setDocumentupload(multipartFile.getBytes()); 
				  leaddoc.setDocumentname(document_name[var]);
				  leaddoc.setFilename(multipartFile.getOriginalFilename());
				  leaddoc.setFilesize(multipartFile.getSize());
				  leaddoc.setFiletype(multipartFile.getContentType());
				  leaddoc.setCrmrecordid(crmrecordid);
				  leaddoc.setCrmevents(crmevents);
				  leaddoc.setLastupdatedby(employeeid);
				  leaddoc.setLastupdateddate(new Date());
				  
				  System.out.println("Lead document===>"+leaddoc);
				  
				  leaddocumentsRepository.save(leaddoc);
				  var++;
				  leaddoc = null;
				}
			}
		}
		
		//
		return new ModelAndView("redirect:customers?savemsg='" + URLEncoder.encode(savemsg) + "'");
		 
	 }
	 
//	 @RequestMapping("/assigntertory")
//	 public ModelAndView assigntertory(Model model,HttpServletRequest request) throws ParseException
//	 {
//		 
//		 List<Lead_to_Customer> issalesPerson=crmdao.isSalesPerson();
//
//		 List<Lead_to_Customer> t = new ArrayList<Lead_to_Customer>();
//		 
//		 
//		 if(issalesPerson.size()!=0) {
//			 for(int i=0;i<issalesPerson.size();i++) {
//				 Lead_to_Customer emp=new Lead_to_Customer();
//				 
//				 emp.setEmployee_resource(issalesPerson.get(i).getEmployee_resource());
//				 emp.setFirstname(issalesPerson.get(i).getFirstname());
//				 emp.setLastname(issalesPerson.get(i).getLastname());
//				 
//				 if(issalesPerson.get(i).getIsinternational()!= null) {
//					 
//				 if(issalesPerson.get(i).getIsinternational().equalsIgnoreCase("Y")) {
//					 emp.setIsinternational("International");
//				 }else if(issalesPerson.get(i).getIsinternational().equalsIgnoreCase("N")) {
//					 emp.setIsinternational("Domestic");
//				 }else if(issalesPerson.get(i).getIsinternational().equalsIgnoreCase("All")) {
//					 emp.setIsinternational("All");
//				 }
//				 
//				 }
//				 
//				 t.add(emp);
//			 }
//		 
//		 }
//		 
//		 model.addAttribute("empMaster",t);
//		 return new ModelAndView("assigntertory");
//	 }
	 
//	 @RequestMapping("/UpdateIsInternational")
//	 public ModelAndView updateisInternational(Model model,HttpServletRequest request) throws ParseException
//	 {
//		   String empId = request.getParameter("salesperson");
//		   
//		   int empid1=Integer.valueOf(empId);
//		   
//		   //EmployeeMaster emp = employeeMasterRepository.findByEmpid(empid1);
//		   
//		   //EmployeeMaster e =new EmployeeMaster(); 		   
//		   String isinternational = request.getParameter("teritory");
//		 
//		 String sql = "UPDATE EMPLOYEE_MASTER SET ISINTERNATIONAL='"+isinternational+"' WHERE EMP_ID='"+empid1+"'";
//		 
//		 System.out.println("sql=====>"+sql);
//		 
//		   jdbcTemplate.execute(sql);
////		 
////		 if(rows>0) {
////			 System.out.println("Successful Updated !");
////			 
////		 }else {
////			 System.out.println("Not seccessful !");
////		 }
//		 
//		 return new ModelAndView("redirect:assigntertory");
//	 }
	 
	 
	 @RequestMapping("/updatedealdetails")
	 public ModelAndView upatedealdetails(Model model,HttpServletRequest request,@RequestParam(value = "updatedealdocument_upload", required = false) CommonsMultipartFile[] document_upload1) throws ParseException, IOException
	 {
		 
		HttpSession session = request.getSession();

		EmployeeMaster employee = (EmployeeMaster) session.getAttribute("emp");
		
		int crmid = Integer.parseInt(request.getParameter("updatecrmrecordid"));
		
		String projectdesc = request.getParameter("updatedealprojectdesc");
		
		int crmeventid=Integer.valueOf(request.getParameter("updatedcrmeventid"));
		
		System.out.println("crmevent id========>"+crmeventid);
		
		String leaddocumentid=request.getParameter("documenteventid");
		
		String offering[] = request.getParameterValues("updateddealoffering");
		
		String crmevent = request.getParameter("updatedealevent");
		
		String offeringList ="", ponumber = "" , podatestr1 = "", needbyDatestr = "" ,needbyDatestr1 = "",podatestr = "";
		
		Date needbyDate = null, podate = null;
		
		Long poamount;
		
		SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
		
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		
		int employeeid = employee.getEmpid();
		
		if(offering != null) {
		for(int i=0;i<offering.length;i++)
		{
			if(i==0)
			{
				offeringList = offering[0];
			}
			else if(i == (offering.length - 1))
			{
				offeringList = offeringList+","+offering[i];
			}
			else
			{
				offeringList = offeringList+","+offering[i];
			}
		}
	}
		
		ponumber = request.getParameter("updatedealponumber");
		
	    poamount = Long.parseLong(request.getParameter("updatedealpoamount"));
		
		podatestr1 = request.getParameter("updatedealpodate");
		
		String[] podatestr2 = podatestr1.split("-");
		
		for(int i =0;i<podatestr2.length;i++)
		{
			podatestr = podatestr2[1]+"/"+podatestr2[2]+"/"+podatestr2[0];
		}
		
		podate = format.parse(podatestr);
		
		needbyDatestr1 = request.getParameter("updatedealneedbydate");
		
		String[] needbyDatestr2 = needbyDatestr1.split("-");
		
		
		for(int i =0;i<needbyDatestr2.length;i++)
		{
			needbyDatestr = needbyDatestr2[1]+"/"+needbyDatestr2[2]+"/"+needbyDatestr2[0];
		}
		
		needbyDate = format.parse(needbyDatestr);
		
		String remark = request.getParameter("updatedealremark");
		
		CRMRecords crmrecordid = crmrecordsRespositoty.findByCrmrecordid(crmid);
		
		List<CRMEvents> crmrventsdetails = crmeventsRepository.findCrmEventdetail(crmeventid);
		
		CRMEvents crmevents = new CRMEvents();
		
		//crmevents.setCrmeventid(Integer.valueOf(crmeventid));
		
		if(crmevent!=null) {
		crmevents.setCrmevent(crmevent);
		}else {
			crmevents.setCrmevent(crmrventsdetails.get(0).getCrmevent());
		}
		
		crmevents.setProjectdescription(projectdesc);
		
		crmevents.setCrmrecordid(crmrecordid);
		
		crmevents.setCrmeventdate(timestamp);
		
		crmevents.setNeedbyDate(needbyDate);
		
		crmevents.setPoamount(poamount);
		
		crmevents.setPonumber(ponumber);
		
		crmevents.setStatus("PO");
		
		crmevents.setRemark(remark);
		
		crmevents.setPodate(podate);
		
        crmevents.setCreatedby(employeeid);
		
		crmevents.setCreationdate(new Date());
		
		crmevents.setLastupdatedby(employeeid);
		
		crmevents.setLastupdateddate(new Date());
		
		if(offering!=null) {
			crmevents.setOffering(offeringList);
		}else {
		crmevents.setOffering(crmrventsdetails.get(0).getOffering());
		}
		
		crmevents.setRenew("N");
		
		String savemsg = "";
		
		try
		{
			savemsg = "donedeal";
		}
		catch(Exception e)
		{
			savemsg = "errordeal";
		}
		
		crmEventsRepository.save(crmevents);
		
		if(offering==null) {
		
		CRMEvents crmeventsupdate= new CRMEvents();
		
		crmeventsupdate.setCrmeventid(crmrventsdetails.get(0).getCrmeventid());
		
		crmeventsupdate.setCrmevent(crmrventsdetails.get(0).getCrmevent());
		
		crmeventsupdate.setProjectdescription(crmrventsdetails.get(0).getProjectdescription());
		
		crmeventsupdate.setCrmrecordid(crmrventsdetails.get(0).getCrmrecordid());
		
		crmeventsupdate.setCrmeventdate(crmrventsdetails.get(0).getCrmeventdate());
		
		crmeventsupdate.setNeedbyDate(crmrventsdetails.get(0).getNeedbyDate());
		
		crmeventsupdate.setPoamount(crmrventsdetails.get(0).getPoamount());
		
		crmeventsupdate.setPonumber(crmrventsdetails.get(0).getPonumber());
		
		crmeventsupdate.setStatus("PO");
		
		crmeventsupdate.setRemark(crmrventsdetails.get(0).getRemark());
		
		crmeventsupdate.setPodate(crmrventsdetails.get(0).getPodate());
		
		crmeventsupdate.setCreatedby(crmrventsdetails.get(0).getCreatedby());
		
		crmeventsupdate.setCreationdate(crmrventsdetails.get(0).getCreationdate());
		
		crmeventsupdate.setLastupdatedby(crmrventsdetails.get(0).getLastupdatedby());
		
		crmeventsupdate.setLastupdateddate(crmrventsdetails.get(0).getLastupdateddate());
		
		crmeventsupdate.setOffering(crmrventsdetails.get(0).getOffering());
		
		crmeventsupdate.setRenew("Y");
		//
		crmEventsRepository.save(crmeventsupdate);
		}
		if(request.getParameterValues("updatedealdocument_name") != null)
		{
			String document_name[] = request.getParameterValues("updatedealdocument_name");
			
			if (document_upload1 != null) 
			{
			    int var=0;
				for (MultipartFile multipartFile : document_upload1) 
				{
				  LeadDocuments leaddoc = new LeadDocuments();
				  leaddoc.setDocumentupload(multipartFile.getBytes()); 
				  leaddoc.setDocumentname(document_name[var]);
				  leaddoc.setFilename(multipartFile.getOriginalFilename());
				  leaddoc.setFilesize(multipartFile.getSize());
				  leaddoc.setFiletype(multipartFile.getContentType());
				  leaddoc.setCrmrecordid(crmrecordid);
				  leaddoc.setCrmevents(crmevents);
				  leaddoc.setLastupdatedby(employeeid);
				  leaddoc.setLastupdateddate(new Date());
				  
				  leaddocumentsRepository.save(leaddoc);
				  var++;
				  leaddoc = null;
				}
			}
		}
		
		//
		return new ModelAndView("redirect:customers?savemsg='" + URLEncoder.encode(savemsg) + "'");
		 
	 }
	 
	 
	 @RequestMapping("/reports")
	 public ModelAndView reports(Model model,HttpServletRequest request) throws ParseException, IOException
	 {
		 
		 return new ModelAndView("reports");
	 }
	 
	 
		/*
		 * @RequestMapping("/cancelled") public ModelAndView cancelled(Model
		 * model,HttpServletRequest request) throws ParseException, IOException { return
		 * new ModelAndView("reports"); }
		 */
	 
	 @RequestMapping("/getAssignToEmployees")
		public void getAssignToEmployees(HttpServletResponse response) throws IOException {
		
			List<Integer> projectRoles  = projectRoleMappingRepository.findByEmployeeMaster();
			
			ArrayList<EmployeeMaster> employeemaster  =  new ArrayList<EmployeeMaster>();
			
			
			for(int i=0; i < projectRoles.size();i++)
			{
				EmployeeMaster emp = employeeMasterRepository.findByEmpid(projectRoles.get(i));
				System.out.println("emp id : "+emp.getEmpid());
				employeemaster.add(emp);
				
				emp =null;
			}
		 
			System.out.println("employeemaster.size() ...................................... "+employeemaster.size());
			
			if(employeemaster.size() > 0) {
			String json = null;
			json = new Gson().toJson(employeemaster);
			response.setContentType("application/json");
			response.getWriter().write(json);
			}
		}
	
	 @RequestMapping("/getHistoryDetails")
	public void getHistoryDetails(@RequestParam("crmid")int crmid , HttpServletResponse response) throws IOException, ParseException {
		ArrayList<Calling_Status_History>historyList = (ArrayList<Calling_Status_History>) crm_calling_history_repositry.getAllCrmHistoryOnCrmId(crmid);
		System.out.println("HISTORY LIST SIZE ..............................................................................................................."+historyList.size());
		if(historyList.size() > 0) {

			   SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy HH.mm.ss");

	        for (int i = 0; i < historyList.size(); i++) {
	            if (historyList.get(i).getCalling_date() != null) {
	            	
	                // Parse the date from the database
	            	historyList.get(i).setCallingdatestr( sdf1.format(historyList.get(i).getCalling_date()));
	                // Format the date to the desired output format
	               System.out.println("FORMATEDD DTAE .........................."+ historyList.get(i).getCallingdatestr());
	            }
	        }
			String json = null;
			json = new Gson().toJson(historyList);
			response.setContentType("application/json");
			response.getWriter().write(json);
			}
	 }
	 
	 
	 @RequestMapping("/import_file")
	    public ModelAndView import_file(@RequestParam(value = "upload_file", required = true) CommonsMultipartFile[] upload_file , Model m , HttpServletRequest request) throws ParseException {
	        ModelAndView modelAndView = new ModelAndView("import_result");
	        HttpSession session = request.getSession();
			EmployeeMaster employee = (EmployeeMaster) session.getAttribute("emp");
	        
	        int emp = employee.getEmpid();
	    ArrayList <EmployeeMaster> assingedToempList =  (ArrayList<EmployeeMaster>) employeeMasterRepository.getemployeebasedonid(emp);
	      
	    for (CommonsMultipartFile file : upload_file) {
	            if (!file.isEmpty()) {
	                try (InputStream inputStream = file.getInputStream()) {
	                    Workbook workbook = new XSSFWorkbook(inputStream);
	                    Sheet sheet = workbook.getSheetAt(0); // Get the first sheet
int r = 0;
int w = 0;
SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yy");

	                    Iterator<Row> rowIterator = sheet.iterator();
	                    while (rowIterator.hasNext()) {
	                    // int maxCrmId = crm_calling_history_repositry.getmaximumCrmId()+1;
	                    	CRMRecords crm = new CRMRecords();
	                    	CRMRecordsContacts crc = new CRMRecordsContacts();

	                    	int c = 0;
	                    	//System.out.println("r ::::::::::::::::::: "+r);
	                        Row row = rowIterator.next();
	                        Iterator<Cell> cellIterator = row.cellIterator();

	                        while (cellIterator.hasNext()) {
	                        	Cell cell = cellIterator.next();
	                        	
	                        	if(r == 0) {
	                        		if(cell == null) {
                        				m.addAttribute("errormsg"," 400 Bad Request !");
                        				m.addAttribute("msg"," Sorry, You have uploaded wrong file , please check your file");

                        				return new ModelAndView("crmerror");
	                        		}
	                        		 
	                        		if(c == 2) {
	                        			if(! cell.getStringCellValue().equals("Company Name")) {
	                        				m.addAttribute("errormsg"," 400 Bad Request !");
	                        				m.addAttribute("msg"," Sorry, You have uploaded wrong file , please check your file");

	                        				return new ModelAndView("crmerror");
	                        			}
	                        			
	                        		}
	                        		
	                        	}
	                        	
	                        	   if(r > 0) {
		                            	String cell_value="";
		                            	////////////
		                            	        switch (cell.getCellType()) {
		                            	            case STRING:
		                            	            	 cell_value =  cell.getStringCellValue();
		                            	        }
		                            	
		                            if(c == 1) {
		                            	if(cell != null) {
		                            	System.out.println("DATE :::::::::::::::::::::::::::::::::::: :::::::::::::::::::::::::::::"+ cell);
		                            	if (cell != null && cell.getCellType() == CellType.NUMERIC && DateUtil.isCellDateFormatted(cell)) {
		                                    Date date = cell.getDateCellValue();
		                                    crm.setCreationdate(date);
		                                    crm.setLastupdateddate(date);
		                                    crm.setSourcingdate(date);
		                                    System.out.println("DATE: " + date);
		                                }
		                              } 
		                            }
		                            
		                            
		                            if(c == 2) {
		                            	
		                            	if(cell != null) {
			                            	System.out.println("COMPANY NAME :::::::::::::::::::::::::::::::::::: :::::::::::::::::::::::::::::"+ cell);
			                            	crm.setCompanyname(cell_value);
			                             }else {
				                            	crm.setCompanyname("Not Provided");
			                             }
		                            }
		                            
		                            
		                            if(c == 3) {
		                            	
		                            	if(cell != null) {
		                            	System.out.println("INDUSTRY :::::::::::::::::::::::::::::::::::: :::::::::::::::::::::::::::::"+ cell);
		                            	crm.setIndustry_of_company(cell_value);
		                            	}else {
			                            	crm.setIndustry_of_company("Not Provided");
		                            	}
		                             }
		                            
		                            
		                            if(c == 4) {
		                            	if(cell != null) {
		                            	System.out.println("EMP SIZE :::::::::::::::::::::::::::::::::::: :::::::::::::::::::::::::::::"+ cell);
		                            	crm.setEmployeesize(cell_value);
		                              } else {
			                            	crm.setEmployeesize("Not Provided");
	 
		                              }
		                            }
		                            
		                            
		                            if(c == 5) {
		                            	if(cell != null) {
		                            		
		                            	System.out.println("CONTACT PERSON NAME :::::::::::::::::::::::::::::::::::: :::::::::::::::::::::::::::::"+ cell);
		                            	crc.setContactname(cell_value);
		                             }else {
			                            	crc.setContactname("Not Provided");
 
		                             }
		                            	}
		                            
		                            
		                            if(c == 6) {
		                            	if(cell != null) {

		                            	System.out.println("MEDIUM :::::::::::::::::::::::::::::::::::: :::::::::::::::::::::::::::::"+ cell);
		                              }
		                            }
		                            
		                            
		                            if(c == 7) {
		                            	if(cell != null) {

		                            	System.out.println("CONTACT NUMBER :::::::::::::::::::::::::::::::::::: :::::::::::::::::::::::::::::"+ cell);
		                            	crc.setMobileno(cell_value);
		                              }else {
			                            	crc.setMobileno("Not Provided");
 
		                              }
		                            }
		                            
		                            
		                            if(c == 8) {
		                            	
		                            	if(cell != null) {

		                            	System.out.println("ALTERNATIVE NUMBER :::::::::::::::::::::::::::::::::::: :::::::::::::::::::::::::::::"+ cell);
		                            	crc.setOfficeno(cell_value);

		                              }else {
			                            	crc.setOfficeno("Not Provided");
		                              }
		                            }
		                            
		                            
		                            if(c == 9) {
		                            	if(cell != null) {

			                            	System.out.println("EMAIL ID :::::::::::::::::::::::::::::::::::: :::::::::::::::::::::::::::::"+ cell);
			                            	crc.setEmailid(cell_value);
			                              }else {
				                            	crc.setEmailid("Not Provided");
			                              }
		                            	}
		                            
		                            
		                            if(c == 10) {
		                            	if(cell != null) {
			                            	System.out.println("ALTERNATIVE EMAIL ID :::::::::::::::::::::::::::::::::::: :::::::::::::::::::::::::::::"+ cell);
			                            	crc.setAltemail(cell_value);
			                              }else {
				                            	crc.setAltemail("Not Provided");
			                              }
		                            	}
		                            	
		                             if(c == 11) {
		                            	if(cell != null) {

			                            	System.out.println("DESIGNATION :::::::::::::::::::::::::::::::::::: :::::::::::::::::::::::::::::"+ cell);
			                            	crc.setDesignation(cell_value);
			                              }else {
				                            	crc.setDesignation("Not Provided");
			                              }
		                            }
		                            	
		                             if(c == 12) {
		                            	if(cell != null) {
			                            	System.out.println("STATUS :::::::::::::::::::::::::::::::::::: :::::::::::::::::::::::::::::"+ cell);
			                            	crm.setCalling_status(cell_value);
			                              }else {
				                            	crm.setCalling_status("Not Provided");
			                              }
		                            }
		                            	
		                            	
		                             if(c == 13) {
		                            	if(cell != null) {
			                            	System.out.println("MADIUM :::::::::::::::::::::::::::::::::::: :::::::::::::::::::::::::::::"+ cell);
			                              }else {}
		                            }
		                            	
		                             if(c == 14) {
		                            	if(cell != null) {
			                            	System.out.println("CHALLENGES :::::::::::::::::::::::::::::::::::: :::::::::::::::::::::::::::::"+ cell);
			                              }else {}
		                            }	
		                            
		                            
	                        }
		                    c++;
	                      } 
	                        
	                        if(r > 0) {
	                        	//Enquiry
	                        	int crmDatasouceId = 1;
	                        	CrmDataSource cds = crmDataSourceRepository.findByCrmdsid(crmDatasouceId);
	                        	crm.setCrmDataSource(cds);
	                        	crm.setCrmtype("Enquiry");
	                        	crm.setStatus("Enquiry");
	                        	crm.setCrmevent("Excel");
	                        	crm.setPurposeofevent("Enquiry");
	                        	crm.setIsactivated("Y");
	                        	crm.setAssigneto(assingedToempList.get(0));
	                        	crm.setCreatedby(assingedToempList.get(0));
	                        	crm.setLastupdatedby(emp);
	                        	crm.setCountry("India");
	                        	crm.setCountrytype("282");
	                        	CRMRecords saveenquiry = crmrecordsRespositoty.save(crm);
	            				crc.setCrmrecordsid(saveenquiry);
	            				CRMRecordsContacts cr = enquiriesContactsRepository.save(crc);
	            				System.out.println(" $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$    Data save successfully in CRM_RECORDS TABLE  $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
	                        }

	                        System.out.println();    
                            r++;
	                    }
	                    workbook.close();
	                } catch (IOException e) {
	                    e.printStackTrace();
	                }
	                        	              
	            } 
	              
	            } 
	        
	            
	        return new ModelAndView("redirect:/enquiries");
 }
	 
	 
	@RequestMapping("/Cancelled")
	public ModelAndView Cancelled(Model m , HttpServletRequest request) {
        HttpSession session = request.getSession();

		EmployeeMaster employee = (EmployeeMaster) session.getAttribute("emp");

		
		String status = "Cancelled";
		ArrayList<CRMRecords>cancelledRecords = (ArrayList<CRMRecords>) crmrecordsRespositoty.findAllCancelledCrmRecordsByEmpId(status , employee.getEmpid());
        System.out.println("cancelledRecords size ................................................................................................."+cancelledRecords.size());
		m.addAttribute("recordstitle" , "Cancelled");
		m.addAttribute("cancelledRecords" , cancelledRecords);
		return new ModelAndView("crmrecords");

	}
	
	
	@RequestMapping("/cancelledBDA")
	public ModelAndView cancelledBDA(Model m , HttpServletRequest request) {
        HttpSession session = request.getSession();

		EmployeeMaster employee = (EmployeeMaster) session.getAttribute("emp");

		String isbdh = projectRoleMappingRepository.isBusinessDevelopmentHead(employee.getEmpid(), 19, employee.getEmpid(), 19);

		String status = "Cancelled";
		ArrayList<CRMRecords>cancelledRecords = (ArrayList<CRMRecords>) crmrecordsRespositoty.findAllCancelledCrmRecords(status);
		m.addAttribute("employeeid",employee.getEmpid());
		m.addAttribute("recordstitle" , "Cancelled");
		m.addAttribute("cancelledRecords" , cancelledRecords);
		m.addAttribute("isbdh" , isbdh);
		return new ModelAndView("crmrecordshr"); 
	}
	
	
	@RequestMapping("/addOffering")
	public ModelAndView addOffering(Model m , HttpServletRequest request) {
		HttpSession session = request.getSession();
		EmployeeMaster employee = (EmployeeMaster) session.getAttribute("emp");
		m.addAttribute("employeeid",employee.getEmpid());
		m.addAttribute("recordstitle" , "Offering");
	    ArrayList<Offering>offeringList = (ArrayList<Offering>) offeringRepository.findActivatedOfferingByOrderByOfferingdescAsc();
	    if(offeringList.size() > 0) {
			m.addAttribute("Offerings" , offeringList); 
	    }
	return new ModelAndView("crmrecords"); 	
	}
	
	@Transactional
	@RequestMapping("/saveOffering")
	public ModelAndView saveAddOffering(Model m , HttpServletRequest request) {
		HttpSession session = request.getSession();
		EmployeeMaster employee = (EmployeeMaster) session.getAttribute("emp");
		m.addAttribute("employeeid",employee.getEmpid());
		//m.addAttribute("recordstitle" , "Offering");
		Offering o = new Offering();
		String offering = request.getParameter("offering");
		if(offering != null && !offering.equals("")) {
		Date d = new Date();	
		o.setOfferingdesc(offering);
		o.setCreationdate(d);
		o.setCreatedby(1);
		o.setIs_activated("Y");
		o.setLastupdatedby(1);
		o.setLastupdateddate(d);
		//o.setOfferingid(offeringRepository.getMaxValue() + 1);
		offeringRepository.save(o);
		}
		return new ModelAndView("redirect:/addOffering"); 	
	}
	
	@RequestMapping("/updateOffering")
	public ModelAndView updateOffering(Model m , HttpServletRequest request) {
		int offeringId = Integer.parseInt(request.getParameter("offeringId"));
		String offering = request.getParameter("editofferingtext");
		ArrayList<Offering> offeringList = (ArrayList<Offering>) offeringRepository.getOfferingById(offeringId);
		if(offeringList.size() > 0) {
			offeringList.get(0).setOfferingdesc(offering);
			offeringRepository.save(offeringList.get(0));
		}
		return new ModelAndView("redirect:/addOffering");

		
	}
	
	/*
	@RequestMapping("/deleteOffering")
	public ModelAndView deleteOffering(@RequestParam("offeringId")String offeringId , Model m , HttpServletRequest request) {
		int offerId = Integer.parseInt(offeringId);
		ArrayList<Offering> offeringList = (ArrayList<Offering>) offeringRepository.getOfferingById(offerId);
		if(offeringList.size() > 0) {
			offeringRepository.deleteById(offerId);
		}
		return new ModelAndView("redirect:/addOffering");

		
	}
	*/
	
	
	@RequestMapping("/deleteOffering")
	public void deleteOfferingDeactive(Model m , HttpServletRequest request , HttpServletResponse response) throws IOException {
		int offeringId = Integer.parseInt(request.getParameter("offeringId"));
		ArrayList<Offering> offeringList = (ArrayList<Offering>) offeringRepository.getOfferingById(offeringId);
		if(offeringList.size() > 0) {
			String json = null;
			json = new Gson().toJson("Offering deleted succesfully");
			
			offeringList.get(0).setIs_activated("N");	
			offeringRepository.save(offeringList.get(0));
			response.setContentType("application/json");
			response.getWriter().write(json);
		}
		//return new ModelAndView("redirect:/addOffering");

		
	}
	
	
	
	
	@RequestMapping("/callApiForOrder")
	public void callApiForOrder() {
		String jsonInputString = "{"
	            + "\"CRMRECORDID\": 777,"
	            + "\"ANNUALTURNOVER\": \"arcd\","
	            + "\"COMPANYNAME\": \"Chetan Pvt Ltd\","
	            + "\"CRMEVENT\": \"abrcd\","
	            + "\"CRMTYPE\": \"h\","
	            + "\"EMPLOYEESIZE\": \"abcd\","
	            + "\"OFFERING\": \"abcd\","
	            + "\"PURPOSEOFEVENT\": \"abcd\","
	            + "\"STATUS\": \"abcd\","
	            + "\"CHANCEOFSALE\": \"abcd\","
	            + "\"POTENTIALOPP\": 3,"
	            + "\"PROJECTDESCRIPTION\": \"ss\","
	            + "\"POAMOUNT\": 7,"
	            + "\"PODATE\": \"2024-10-01\","
	            + "\"PONUMBER\": \"abcd\","
	            + "\"BDHEAD\": 1,"
	            + "\"PRESALESPERSON\": 9,"
	            + "\"PRIMARYSALESPERSON\": 8,"
	            + "\"SECONDARYSALESPERSON\": 2,"
	            + "\"PRESALESPERSONName\": \"abcd\","
	            + "\"PRIMARYSALESPERSOName\": \"f\","
	            + "\"SECONDARYSALESPERSOName\": \"zz\","
	            + "\"site_name\": \"z\","
	            + "\"billtoaddrss\": \"z\","
	            + "\"GSTRegNo\": \"abcd\","
	            + "\"item\": \"ee\","
	            + "\"quantity\": \"hh\","
	            + "\"PO_Num_New\": \"jj\","
	            + "\"SO_Order_NO\": \"kk\""
	            + "}";

		try {
            // Replace with your actual URL
            URL url = new URL("http://103.110.242.59:6614/Api/SalesOrder/PostCRMDetails");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json; utf-8");
            conn.setRequestProperty("Accept", "application/json");
            conn.setDoOutput(true);

            // Write the JSON input string to the connection output stream
            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = jsonInputString.getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            // Get the response code
            int responseCode = conn.getResponseCode();
            System.out.println("Response Code: " + responseCode);

            // Read the response from the input stream
            if (responseCode == HttpURLConnection.HTTP_OK) { // success
                try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"))) {
                    StringBuilder response = new StringBuilder();
                    String responseLine;
                    while ((responseLine = br.readLine()) != null) {
                        response.append(responseLine.trim());
                    }
                    // Print the JSON response
                    System.out.println("Response: " + response.toString());
                }
            } else {
                System.out.println("POST request not worked");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	 
	  }