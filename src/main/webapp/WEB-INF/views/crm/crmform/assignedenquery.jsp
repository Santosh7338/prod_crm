<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="block-header">
   <% 
      String title = (String)request.getAttribute("recordstitle");
      if(title.equalsIgnoreCase("enquiry"))
      {
   %>
       <h2></h2>
   <%	  
      }
   %>
</div>


<!-- Exportable Table -->
         <div class="row clearfix">
              <div class="col-md-12">
                  <div class="card">
                       <div class="header">
                          <h2>
                           <% 
						      if(title.equalsIgnoreCase("enquiry"))
						      {
						   %>
						      Enquiries
						   <%	  
						      }
                           %>
                          </h2>
                          
                          <h2>
                           <% 
						      if(title.equalsIgnoreCase("Lead"))
						      {
						   %>
						      Leads
						   <%	  
						      }
                           %>
                          </h2>
                          
                          <h2>
                           <% 
						      if(title.equalsIgnoreCase("Customer"))
						      {
						   %>
						      Customers
						   <%	  
						      }
                           %>
                          </h2>
                          
                       </div>
                       
                       
                       
                       <div class="body">
                       <input type="hidden" id="redocrdtype" name="redocrdtype" value="${recordstitle}">
                               <% 
							      if(title.equalsIgnoreCase("enquiry"))
								  {
							   %>
								  <div class="row clearfix">
									 <div class="col-sm-12"  align="right" style="padding-right: 30px;">
									   <button type="button" class="btn bg-blue waves-effect waves-light"  title="Create Enquiry" onclick="addEnquiry()">
<!-- 									   <i class="material-icons">add</i> -->
									   Create Enquiry
									   </button>
									  </div>
								  </div>
									       
								<%	  
									}
						        %>
                             <div class="table-responsive">
                                     <table class="table table-bordered table-striped table-hover dataTable js-exportable">
                                            <thead>
		                                        <tr>
		                                            <th>Sr No.</th>
		                                            <th>Company Name</th>
		                                             <% 
												      if(title.equalsIgnoreCase("Customer"))
													  {
												    	  %>
												    	  <th>Onboard Date</th>
												    	  <% 
													  }
												      else
												      {
												    	  %>
												    	  <th>Sourcing Date</th>
												    	  <%   
												      }
		                                     
							  		 				 %>
<!-- 		                                            <th>Sourcing Date</th> -->
													
<!-- 		                                            <th>Event</th> -->
		                                            <th>Status</th>
		                                            <th>Action</th>
		                                         </tr>
		                                    </thead>
		                                    
		                                   <tbody>
		                                      <%int j = 1;%>
		                                      <% 
		                                      if(title.equalsIgnoreCase("enquiry"))
		        						      {
		                                      %>
		                                      <c:forEach items="${enquiries}" var="enquiries">
		                                       <tr>
		                                          <td><%=j%></td>
		                                          <td>${enquiries.companyname}</td>
		                                          <td><fmt:formatDate pattern="dd-MM-yyyy" value="${enquiries.sourcingdate}" /></td>
<%-- 		                                          <td>${enquiries.crmevent}</td> --%>
		                                         
		                                          <td>${enquiries.status}</td>
		                                        
		                                          <td>
<!-- 		                                          <button type="button" class="btn btn-default waves-effect waves-light" title="Edit" data-toggle="modal" data-target="#editevent" -->
<%-- 															onclick="setDetailsforEditEvent(${enquiries.crmrecordid})"> --%>
<!-- 															<i class="material-icons">edit</i> -->
<!-- 														</button> -->
<!-- 														<button type="button" class="btn btn-default waves-effect waves-light" title="Add Event" data-toggle="modal" data-target="#addevent" -->
<%-- 															onclick="setDetailsforAddEvent(${enquiries.crmrecordid})"> --%>
<!-- 															<i class="material-icons">event</i> -->
<!-- 														</button> -->
<!-- 														<button type="button" class="btn btn-default waves-effect waves-light" title="Delete" data-toggle="modal" data-target="#" -->
<%-- 															onclick="setenquiryDetailsforDeleteEnquiry(${enquiries.crmrecordid})"> --%>
<!-- 															<i class="material-icons">delete</i> -->
<!-- 														</button> -->
														<button type="button" class="btn btn-default waves-effect waves-light" title="View" data-toggle="modal" data-target="#viewdetails"
															onclick="setDetailsforview(${enquiries.crmrecordid})">
															<i class="material-icons">visibility</i>
														</button>
													</td>
		                                       </tr>
		                                       <%j= j + 1;%>
		                                      </c:forEach>
		                                      
		                                      <%  
		        						      }
		                                      else if(title.equalsIgnoreCase("Lead"))
		                                      {
		                                      %> 
		                                      <c:forEach items="${leads}" var="leads">
		                                          <tr>
		                                              <td><%=j%></td>
		                                              <td>${leads.companyname}</td>
		                                              <td><fmt:formatDate pattern="dd-MM-yyyy" value="${leads.sourcingdate}" /></td>
<%-- 		                                              <td>${leads.crmevent}</td> --%>
		                                              <td>${leads.status}</td>
		                                              <td>
<!-- 		                                              <button type="button" class="btn btn-default waves-effect waves-light" title="Edit" data-toggle="modal" data-target="#editevent" -->
<%-- 															onclick="setDetailsforEditEvent(${leads.crmrecordid})"> --%>
<!-- 															<i class="material-icons">edit</i> -->
<!-- 														</button> -->
<!-- 														<button type="button" class="btn btn-default waves-effect waves-light" title="Add Event" data-toggle="modal" data-target="#addevent" -->
<%-- 															onclick="setDetailsforAddEvent(${leads.crmrecordid})"> --%>
<!-- 															<i class="material-icons">event</i> -->
<!-- 														</button> -->
														<button type="button" class="btn btn-default waves-effect waves-light" title="View" data-toggle="modal" data-target="#viewdetails"
															onclick="setDetailsforview(${leads.crmrecordid})">
															<i class="material-icons">visibility</i>
														</button>
													</td>
		                                          </tr>   
		                                          <%j= j + 1;%>
		                                      </c:forEach>
		                                      
		                                      <%  
		                                      }
		                                      else if(title.equalsIgnoreCase("Customer"))
		                                      {
		                                      %>
		                                       <c:forEach items="${customers}" var="customers">
		                                          <tr>
		                                              <td><%=j%></td>
		                                              <td>${customers.companyname}</td>
		                                              <td><fmt:formatDate pattern="dd-MM-yyyy" value="${customers.podate}" /></td>
<%-- 		                                              <td>${customers.crmevent}</td> --%>
<!-- 		                                              <td>Order</td> -->
<%-- 		                                              <td>${customers.status}</td> --%>
													  <c:set var="custometstatus">${customers.isactivatedcustomer}</c:set>
		                                          <%
		                                          String custometstatus = (String) pageContext.getAttribute("custometstatus");
		                                          if(custometstatus.equalsIgnoreCase("Y"))
		                                          {
		                                          %>
		                                           <td>Active</td>
		                                          <%  
		                                          }
		                                          else
		                                          {
		                                          %>
		                                       		<td>Deactive</td>
		                                       	  <%
		                                          }
		                                          %>
		                                              <td>
														<button type="button" class="btn btn-default waves-effect waves-light" title="View" data-toggle="modal" data-target="#viewdetails"
															onclick="setDetailsforview(${customers.crmrecordid})">
															<i class="material-icons">visibility</i>
														</button>
														
<!-- 														<button type="button" class="btn btn-default waves-effect waves-light" title="Add Deal" data-toggle="modal" data-target="#viewcustomer" -->
<%-- 															onclick="setDetailsforAddNewDealForCustomer(${customers.crmrecordid})"> --%>
<!-- 															<i class="material-icons">check</i> -->
<!-- 														</button> -->
													  </td>
		                                          </tr>   
		                                          <%j= j + 1;%>
		                                      </c:forEach>
		                                      
		                                      <%
		                                      }
		                                       %>
		                                    </tbody>
                                     </table>
                             </div>
                       </div>
                  </div>
              </div>
        </div>

     <!-- end of Exportable Table -->
     
     <div class="modal fade" id="addevent" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static">
	      <div class="modal-dialog modal-lg modal-dialog-scrollable" role="document">
	          <div class="modal-content">
	                <div class="modal-header" style="background-color: #0073b1">
					     <h4 class="modal-title" id="addeventmodel" style="color: white">Add Event</h4>
				    </div>
				    <form class="form-horizontal" method="post" action="saveaddeventdetails" name="addeventid" id="addeventid" autocomplete="off" enctype="multipart/form-data">
				    <div class="modal-body">
				         <input type="hidden" name="recordstitle" id="recordstitle" value="${recordstitle}">
				         <input type="hidden" name="cemrecordsid" id="cemrecordsid" value="">
				         <input type="hidden" name="savemsg" id="savemsg" value="${savemsg}">
				         <div >
				              <div class="row clearfix" style="background-color:#eee">
								    <div class="col-sm-2 form-control-label" style="background-color:#eee; margin-bottom: 0px; text-align:left;"><h6>Company Details :</h6></div>
									<div class="col-sm-2">
										<button type="button" class="btn btn-circle waves-effect waves-circle waves-float" id="compdetails" onclick="viewCompanyDetails()" style="background-color: #eee;  font-size:12px; width:25%; height:20%;">
									     <i class="material-icons">keyboard_arrow_down</i>
								         </button> 
								    </div>
							  </div>
							 
							 <div id="companydetails" style="display:none; padding-top: 15px;">
							       <div class="clearfix">
							            <div class="col-sm-2" style="">
                                          <label for="datasource"><span class="" style="color:red">*</span>Data Source:</label>
	                                    </div>
	                                    
	                                    <div class="col-sm-2" style="">
	                                      <div class="form-group" ><div class="form-line">
	                                       <input type="text" id="datasource" name="datasource" class="form-control"  placeholder="" value="" readonly>
	                                      </div></div>
                                        </div>
	                                    
	                                    <div class="col-sm-2" style="">
                                          <label for="companyname"><span class="" style="color:red">*</span>Company Name:</label>
	                                    </div>
	                                    
	                                    <div class="col-sm-2" style="width:20%">
	                                      <div class="form-group" ><div class="form-line">
	                                      <input type="text" id="companyname" name="companyname" class="form-control"  placeholder="" value="" readonly>
	                                      </div></div>
                                        </div>
	                                    
	                                     <div class="col-sm-2" style="">
                                          <label for="nickname">Nick Name:</label>
	                                    </div>
	                                    
	                                    <div class="col-sm-2" style="">
	                                      <div class="form-group" ><div class="form-line">
	                                      <input type="text" id="nickname" name="nickname" class="form-control"  placeholder="" value="" readonly>
	                                      </div></div>
                                         </div>
							       </div>
							       
							       <div class="clearfix">
							       
							            <div class="col-sm-2" style="">
                                          <label for="employeesize"><span class="" style="color:red">*</span>Employee Size:</label>
	                                    </div>
	                                    
	                                    <div class="col-sm-2" style="">
	                                       <div class="form-group" ><div class="form-line">
                                          <input type="text" id="employeesize" name="employeesize" class="form-control"  placeholder="" value="" readonly>
	                                      </div></div>
	                                    </div>
	                                    
	                                    <div class="col-sm-2" style="">
                                          <label for="annualturnover"><span class="" style="color:red">*</span>Annual Turnover:</label>
	                                    </div>
	                                    
	                                    <div class="col-sm-2" style="width:20%">
	                                      <div class="form-group" ><div class="form-line">
                                          <input type="text" id="annualturnover" name="annualturnover" class="form-control"  placeholder="" value="" readonly>
	                                      </div></div>
	                                    </div>
	                                    
	                                    <div class="col-sm-2" style="">
                                          <label for="offering"><span class="" style="color:red">*</span>Offering:</label>
	                                    </div>
	                                    
	                                    <div class="col-sm-2" style="">
	                                      <div class="form-group" ><div class="form-line">
                                          <input type="text" id="offering" name="offering" class="form-control"  placeholder="" value="" readonly>
	                                      </div></div>
	                                    </div>
	                                    
							       </div>
							           
							       <div class="clearfix" style="padding-bottom: 15px;">
							            <div class="col-sm-2" >
                                          <label for="crmeventdetails"><span class="" style="color:red">*</span>Event:</label>
	                                    </div>
	                                    
	                                    <div class="col-sm-2" style="">
	                                       <div class="form-group" ><div class="form-line">
                                          <input type="text" id="crmeventdetails" name="crmeventdetails" class="form-control"  placeholder="" value="" readonly>
	                                      </div></div>
	                                    </div>
							      
							      
							            <div class="col-sm-2" style="">
                                          <label for="purposeofeventdetails"><span class="" style="color:red">*</span>Event Stages:</label>
	                                    </div>
	                                    
	                                    <div class="col-sm-2" style="width:20%">
	                                      <div class="form-group" ><div class="form-line">
                                          <input type="text" id="purposeofeventdetails" name="purposeofeventdetails" class="form-control"  placeholder="" value="" readonly>
	                                      </div></div>
	                                    </div>
							      
							            <div class="col-sm-2" style="">
                                          <label for="statusofeventdetails"><span class="" style="color:red">*</span>Status:</label>
	                                    </div>
	                                    
	                                    <div class="col-sm-2" style="">
	                                      <div class="form-group" ><div class="form-line">
                                          <input type="text" id="statusofeventdetails" name="statusofeventdetails" class="form-control"  placeholder="" value="" readonly>
	                                      </div></div>
	                                    </div>
							       </div>
							       
							         <div class="clearfix" style="padding-bottom: 15px;">
							            <div class="col-sm-2" >
                                          <label for="countrytypetext"><span class="" style="color:red">*</span>Region:</label>
	                                    </div>
	                              
	                                    <div class="col-sm-2" style="">
	                                       <div class="form-group" ><div class="form-line">
                                          <input type="text" id="countrytype000" name="countrytype0000" class="form-control"  placeholder="" value="" readonly>
	                                      </div></div>
	                                    </div>
							      
							      
							            <div class="col-sm-2" style="" >
                                          <label for="countrytext"><span class="" style="color:red">*</span>Country :</label>
	                                    </div>
	                                    
	                                    <div class="col-sm-2" style="width:20%">
	                                      <div class="form-group" ><div class="form-line">
                                          <input type="text" id="country000" name="country000" class="form-control"  placeholder="" value="" readonly>
	                                      </div></div>
	                                    </div>
	                                    

 	                                  <div class="clearfix" id="hidestate" style="padding-bottom: 15px;">
							           <div class="col-sm-2" style="">
                                          <label for="statetext"><span class="" style="color:red">*</span>State :</label>
	                                    </div>
	                                    
	                                    <div class="col-sm-2" style="" id="">
	                                      <div class="form-group" ><div class="form-line">
                                          <input type="text" id="state000" name="state000" class="form-control"  placeholder="" value="" readonly>
	                                      </div></div>
	                                    </div>
							   
							       </div>
							       </div>
							       
							       <div class="clearfix" id="hidedistrict" style="padding-bottom: 15px;">
							           <div class="col-sm-2" style="">
                                          <label for="distext"><span class="" style="color:red">*</span>District:</label>
	                                    </div>
	                                    
	                                    <div class="col-sm-2" style="" >
	                                      <div class="form-group" ><div class="form-line">
                                          <input type="text" id="district000" name="district000" class="form-control"  placeholder="" value="" readonly>
	                                      </div></div>
	                                    </div>
							       </div>
							       
							       <div class="row clearfix" style="background-color:#eee;  margin-bottom: 0px;" >
								        <div class="col-sm-2 form-control-label" style="background-color:#eee; margin-bottom: 0px; text-align:left;"><h6>Contact Details :</h6></div>
								   </div>
							       
							       <div class="clearfix" style="padding-top: 15px;">
							              <div class="col-md-12">
							                    <div class="table-responsive" id="contactdetailstable" style="">
												  	<table class="table table-bordered table-striped table-hover js-basic-example dataTable" id="contactdetails">
												  	
												  		<thead>
															<tr>
																<th style="font-weight:normal;">Sr.No.</th>
																<th style="font-weight:normal;">Contact Name</th>
																<th style="font-weight:normal;">Designation</th>
																<th style="font-weight:normal;">Mobile</th>
																<th style="font-weight:normal;">Office No</th>
																<th style="font-weight:normal;">Email</th>
																<th style="font-weight:normal;">Alt Email</th>
																<th style="font-weight:normal;">Authority</th>
															</tr>
														</thead>
							
														<tbody>
														</tbody>
														
												  	</table>
												  </div>
		                                		
		                                	</div>
                                     </div>
							 </div>
				             	
				         </div>
				         
				         <hr>
				         
				         <div class="row clearfix" style="background-color:#eee; margin-bottom: 0px;">
								    <div class="col-sm-2 form-control-label" style="background-color:#eee; margin-bottom: 0px; text-align:left;"><h6>Sales Life Cycle:</h6></div>
								</div>
				    
				         <div class="row clearfix" style="padding-top: 15px;">
				                        <div class="col-sm-2" style="width:12%">
                                          <label for="crmevent"><span class="" style="color:red">*</span>Event :</label>
	                                    </div>
		    						
		    							<div class="col-sm-3" style="width:20%">
		    								<div class="form-group">
	                                        	<div class="form-line">
	                                                <select class="form-control show-tick" data-live-search="true" id="crmevent" name="crmevent" onchange="" required>
	                                                	<c:forEach items="${crmevents}" var="crmevents">
	                                            			<option value="${crmevents.crmevent}">${crmevents.crmevent}</option>
	                                            		</c:forEach>
	                                                </select>
	                                        	</div>
	                                    	</div>
		    							</div>
		    							
		    							<div class="col-sm-2" style="width:12%">
                                          <label for="purposeofevent"><span class="" style="color:red">*</span>Event Stages:</label>
	                                    </div>
		    						
		    							<div class="col-sm-3" style="width:20%">
		    								<div class="form-group">
	                                        	<div class="form-line">
	                                                <select class="form-control show-tick" data-live-search="true" id="purposeofevent" name="purposeofevent" onchange="showotherpofevent()" required>
	                                                	<c:forEach items="${purposeOfEvent}" var="purposeOfEvent">
	                                            			<option value="${purposeOfEvent.purposeofevent}">${purposeOfEvent.purposeofevent}</option>
	                                            		</c:forEach>
	                                                </select>
	                                        	</div>
	                                    	</div>
		    							</div>
		    							
		    							<div class="" id="otherpofevent" style="display:none">
		                                       <div class="col-sm-2" style="width:12%">
				    								<div class="form-group" >
			                                        	<div class="form-line">
			                                                <input type="text" id="othpofevent" name="othpofevent" class="form-control" onchange=""  placeholder="Event Stages" >
			                                        	</div>
			                                     </div>
				    						</div>	
		                                        
		                                  </div>
		    							
		    							<div class="col-sm-2" style="width:9%">
                                          <label for="status"><span class="" style="color:red">*</span>Status :</label>
	                                    </div>
		    						
		    							<div class="col-sm-3" style="width:20%">
		    								<div class="form-group">
	                                        	<div class="form-line">
	                                                <select class="form-control show-tick" data-live-search="true" id="status" name="status" onchange="showleadinfodiv()" required>
	                                                   <option value="">Select</option>
	                                                </select>
	                                        	</div>
	                                    	</div>
		    							</div>     
				             </div>
				             
				             <div class="row clearfix">
				             		
	                               
	                               <div class="col-sm-2" style="width:12%">
                                          <label for="remark">Remarks:</label>
	                                </div>
	                                    
	                                <div class="col-sm-8" style="">
	                                      <div class="form-group" ><div class="form-line">
                                          <input type="text" id="remark" name="remark" class="form-control"  placeholder="" value="" >
	                                      </div></div>
	                                </div>
				             </div>
				             
				             <div class="" id="converttoleads" style="display:none">
				             
				                   <div class="row clearfix">
				                         <div class="col-sm-2" style="width:13%">
                                          <label for="projectdesc"><span class="" style="color:red">*</span>Project Description:</label>
	                                    </div>
	                                    
	                                    <div class="col-sm-8" style="">
	                                      <div class="form-group" ><div class="form-line">
                                          <input type="text" id="projectdesc" name="projectdesc" class="form-control"  placeholder="" value="">
	                                      </div></div>
	                                    </div>
				                   </div>
				                   
				                  
				                   <div class="row clearfix">
				                        <div class="col-sm-2" style="width:13%">
                                          <label for="chanceofsale"><span class="" style="color:red">*</span>Winning Stage %:</label>
	                                    </div>
		    						
		    							<div class="col-sm-2" style="width:15%">
		    								<div class="form-group">
	                                        	<div class="form-line">
	                                                <select class="form-control show-tick" data-live-search="true" id="chanceofsale" name="chanceofsale" onchange="" required>
	                                                	<option value="">Select</option>
	                                                	<option value="Cold Calling">Cold Calling</option>
	                                                	<option value="Demonstration">Demonstration</option>
	                                                	<option value="POC">POC</option>
	                                                	<option value="Proposal shared">Proposal shared</option>
	                                                	<option value="Price Negotiation">Price Negotiation</option>
	                                                	<option value="Closed">Closed</option>
	                                                	<option value="Lost">Lost</option>
	                                                </select>
	                                        	</div>
	                                    	</div>
		    							</div>
		    							
		    							
		    							<div class="col-sm-2" style="">
                                          <label for="forecastclosedate"><span class="" style="color:red">*</span>Target Close Date:</label>
	                                    </div>
	                                    
	                                    <div class="col-sm-2" style="width:20%">
	                                      <div class="input-group date" id="bs3">
	                                        <div class="form-line">
	                                            <input type="text" class="form-control" name="forecastclosedate" id="forecastclosedate" placeholder="Please choose a date...">
	                                        </div>
	                                        <span class="input-group-addon">
	                                            <i class="material-icons">date_range</i>
	                                        </span>
	                                    </div>
	                                    </div>
		    							
				                   </div>
				   
				                 <div class="row clearfix" id="globle12" style="display: none;">
				                        <div class="col-sm-2"  id="currencytype122">
                                          <label for="potentialopp" id="curr" ><span class="" style="color:red">*</span>Currency Type:</label>
	                                    </div>
										
										<div class="col-sm-2" style="width:12%"  id="currencytype10000" style="display: none;">
	    								<div class="form-group" >
                                        	<div class="form-line">
                                                 <input type="text" id="currencytype" name="currencytype" class="form-control" onkeypress="return isNumber(event)" placeholder="" value="">
                                        	</div>
                                    	</div>
	    							</div>
				                
 				                   <div class="row clearfix" id="currencytype1224"> 
				                   <div class="col-sm-2" style="" id="fore12">
                                          <label for="potentialopp"><span class="" style="color:red">*</span>Amount :</label>
	                                    </div>
										
										<div class="col-sm-2" style="width:15%" >
	                                      <div class="form-group" ><div class="form-line">
                                          <input type="text" id="foreigncurrency" name="foreigncurrency" class="form-control" onkeypress="return isNumber(event)" placeholder="" value="">
	                                      </div></div>
	                                    </div>
	                                 </div>
				                   </div>    
				                    </div> 
				                   
				                   <div class="row clearfix" style="background-color:#eee; margin-bottom: 0px;">
								     <div class="col-sm-2 form-control-label" style="background-color:#eee; margin-bottom: 0px;text-align:left;"><h6>Sales Team:</h6></div>
								   </div>
				             
				                  <div class="row clearfix" style="padding-top: 15px;">
				                       <div class="col-sm-2" style="width:15%">
                                          <label for="primarysalesperson"><span class="" style="color:red">*</span>Primary Sales Person:</label>
	                                    </div>
	                                    
	                                    <div class="col-sm-4 form-control-label" style="">
	                                      <div class="form-group">
		                                        	<div class="form-line">
		                                                <select class="form-control show-tick" id="primarysalesperson" name="primarysalesperson" onchange="" >
		                                                	<c:forEach items="${primarysseconalespersons}" var="primarysseconalespersons">
		                                            			<option value="${primarysseconalespersons.empid}">${primarysseconalespersons.empfirstname} ${primarysseconalespersons.emplastname}</option>
		                                            		</c:forEach>
		                                            		<option value="0">Not Applicable</option>
		                                                </select>
		                                        	</div>
		                                   </div>
	                                    </div>
	                                    
	                                    <div class="col-sm-2" style="width:16%">
                                          <label for="secondarysalesperson"><span class="" style="color:red">*</span>Secondary Sales Person:</label>
	                                    </div>
	                                    
	                                    <div class="col-sm-4" style="">
	                                      <div class="form-group">
		                                        	<div class="form-line">
		                                                <select class="form-control show-tick"  id="secondarysalesperson" name="secondarysalesperson" onchange=""  >
		                                                	<c:forEach items="${primarysseconalespersons}" var="primarysseconalespersons">
		                                            			<option value="${primarysseconalespersons.empid}">${primarysseconalespersons.empfirstname} ${primarysseconalespersons.emplastname}</option>
		                                            		</c:forEach>
		                                            		<option value="0">Not Applicable</option>
		                                                </select>
		                                        	</div>
		                                   </div>
	                                    </div>
	                                    
	                                   
	                                    
				                   </div>
				                   
				                   <div class="row clearfix">
				                   
				                       <div class="col-sm-2" style="width:15%">
                                          <label for="presalesperson"><span class="" style="color:red">*</span>Presales Person:</label>
	                                    </div>
	                                    
	                                    <div class="col-sm-4" style="">
	                                      <div class="form-group">
		                                        	<div class="form-line">
		                                                <select class="form-control show-tick" id="presalesperson" name="presalesperson" onchange=""  >
		                                                	<c:forEach items="${presalespersons}" var="presalespersons">
		                                            			<option value="${presalespersons.empid}">${presalespersons.empfirstname} ${presalespersons.emplastname}</option>
		                                            		</c:forEach>
		                                            		 <option value="0">Not Applicable</option>
		                                                </select>
		                                        	</div>
		                                   </div>
	                                    </div>
	                                    
	                                    <div class="col-sm-2" style="width:16%">
                                          <label for="bdhead"><span class="" style="color:red">*</span>BD Head: </label>
	                                    </div>
	                                    
	                                    <div class="col-sm-4" style="">
	                                      <div class="form-group">
		                                        	<div class="form-line">
		                                                <select class="form-control show-tick" data-live-search="true" id="bdhead" name="bdhead" onchange=""  required>
		                                                	<c:forEach items="${bdheads}" var="bdheads">
		                                            			<option value="${bdheads.empid}">${bdheads.empfirstname} ${bdheads.emplastname}</option>
		                                            		</c:forEach>
		                                            		 <option value="0">Not Applicable</option>
		                                                </select>
		                                            </div>
		                                   </div>
	                                    </div>
				                   </div>
				             
				                  <div class="row clearfix" style="background-color:#eee; margin-bottom: 0px;">
								     <div class="col-sm-2 form-control-label" style="background-color:#eee; margin-bottom: 0px;text-align:left;"><h6>Documents Detail:</h6></div>
								   </div>
				                  
				                  <div class="row clearfix">
				                       <div class="col-md-12">
				                            <div class="form-group">
				                                 <div class="body table-responsive">
				                                      <table class="table" id="tab" class="form-control show-tick" style="padding:3px;">
				                                        <thead>
	                                						<tr>
	                                							<th class="text-center" style="min-width: 50px; width: 50px; font-weight:normal;">Sr No</th>
	                                							<th class="text-center" style="min-width: 150px; width: 150px; font-weight:normal;">Name of Documents</th>
	                                							<th class="text-center" style="min-width: 150px; width: 150px; font-weight:normal;">Document</th>
	                                							<th class="text-center" style="min-width: 50px; width: 50px; font-weight:normal;">Delete</th>
	                                						</tr>
	                                					</thead>
	                                					
	                                					<tbody>
                                						<tr>
                                						</tr>
                                					    </tbody>
                                					    
                                					    <tfoot>
                                						<tr>
                                							<th><button type="button" class="btn waves-effect waves-light" title="Add Document" onclick="AddRow()">
                                   			                   <i class="material-icons">add</i>
                               			                     </button></th>
                                							<th></th><th></th><th></th>
                                						</tr>
                                					   </tfoot>
                                					                                                                                                                                                 
				                                      </table>
				                                 </div>
				                            </div>   
				                       </div>
				                  </div>
				                  
				                   
				              </div>
				              
				               <div class="" id="converttopo" style="display:none">
				                    <div class="row clearfix">
				                         <div class="col-sm-2" style="width:12%">
	                                       <label for="ponumber" style="margin-left: 25px;"><span class="" style="color:red">*</span>PO Number:</label>
		                                 </div>
		                                
		                                <div class="col-sm-2" style="width:20%">
		                                    <div class="form-group" ><div class="form-line">
	                                          <input type="text" id="ponumber" name="ponumber" class="form-control"  onkeypress="return isNumber(event)"  placeholder="" value="">
		                                    </div></div>
		                                </div>
		                                
		                                <div class="col-sm-2" style="width:10%">
	                                       <label for="podate"><span class="" style="color:red">*</span>PO Date:</label>
		                                 </div>
		                                
		                                <div class="col-sm-2" style="width:20%">
		                                    <div class="input-group date" id="bs" >
		                                        <div class="form-line">
		                                            <input type="text" class="form-control" name="podate" id="podate" placeholder="Please choose a date...">
		                                        </div>
		                                        <span class="input-group-addon">
		                                            <i class="material-icons">date_range</i>
		                                        </span>
	                                        </div>
		                                </div>
		                                
		                                <div class="col-sm-2" style="width:12%">
	                                       <label for="poamount"><span class="" style="color:red">*</span>PO Amount:</label>
		                                </div>
		                                
		                                <div class="col-sm-2" style="width:20%">
		                                    <div class="form-group" ><div class="form-line">
	                                          <input type="text" id="poamount" name="poamount" class="form-control" onkeypress="return isNumber(event)"  placeholder="" value="">
		                                    </div></div>
		                                </div>
		                            </div>
		                            
		                            <div class="row clearfix">
		                            	<div class="col-sm-2" style="width:12%">
                                          <label for="needbydate" style="margin-left: 24px;"><span class="" style="color:red">*</span>Need By Date:</label>
	                                	</div>
	                                	
	                                	<div class="col-sm-2" style="width:30%">
	                                		<div class="input-group date" id="bs1" >
	                                			<div class="form-line">
			                                    <input type="text" class="form-control" name="needbydate" id="needbydate" placeholder="Please choose a date...">
					                               </div>
					                              <span class="input-group-addon">
					                                     <i class="material-icons">date_range</i>
					                              </span>
	                                		</div>
	                                	</div>
	                                	
	                                	
		                            </div>
				               </div>
				               
				               
				     </div>
				    
				    <div class="modal-footer" style="background-color:#0073b1">
				          <button type="button"  class="btn btn-link waves-effect" id="addeventbutton" name="addeventbutton" style="color:white;font-weight: bold;font-size:12px;" onclick="submitionofaddevent()" onmouseover="changemyaddeventcolor()" onmouseout="changeaddeventcolormouseOut()">Submit</button>
					      <button type="button" class="btn btn-link waves-effect" data-dismiss="modal" style="color: white; font-weight: bold; font-size: 12px;" id="addeventclosebutton" name="addeventclosebutton" onmouseover="changemyaddeventclosecolor()" onmouseout="changeaddeventclosecolormouseOut()">Close</button>
				    </div>
				    
				    </form>
	          </div>
	      </div>
	</div>
	
	
	<div class="modal fade" id="editevent" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static">
	      <div class="modal-dialog modal-lg modal-dialog-scrollable" role="document">
	           <div class="modal-content">
	               <div class="modal-header" style="background-color: #0073b1">
					     <h4 class="modal-title" id="editeventmodel" style="color: white">Edit Event</h4>
				   </div>
				   
				   <form class="form-horizontal" method="post" action="savemodifiedDetails" name="modifieddetails" id="modifieddetails" autocomplete="off" enctype="multipart/form-data">
				         <div class="modal-body">
				              <input type="hidden" name="editrecordstitle" id="editrecordstitle" value="">
				              <input type="hidden" name="isinternatioanlordomestic" id="isinternatioanlordomestic" value="">
				              <input type="hidden" name="editacemrecordsid" id="editacemrecordsid" value="">
				              <input type="hidden" name="savemsg" id="savemsg" value="${savemsg}">
				              
				              <div class="row clearfix" style="background-color:#eee; margin-bottom: 0px;">
								    <div class="col-sm-2 form-control-label" style="background-color:#eee; margin-bottom: 0px; text-align:left;"><h6>Company Details :</h6></div>
							  </div>
				              
				              <div class="row clearfix" style="padding-top: 15px;">
				                    <div class="col-sm-2" style="width:10%;">
                                        <label for="editdatasource"><span class="" style="color:red">*</span>Data Source:</label>
	                                </div>
	                                
	                                <div class="col-sm-2" style="width:13%">
	    								<div class="form-group">
                                        	<div class="form-line">
                                                <select class="form-control show-tick" data-live-search="true" id="editdatasource" name="editdatasource" onchange="" required>
                                                	<c:forEach items="${crmdatasources}" var="crmdatasources">
                                            			<option value="${crmdatasources.crmdsid}">${crmdatasources.datasource}</option>
                                            		</c:forEach>
                                                </select>
                                        	</div>
                                    	</div>
	    							</div>
	    							
	    							<div class="col-sm-2" style="width:13%">
                                         <label for="editoffering"><span class="" style="color:red">*</span>Offering :</label>
                                    </div>
                                    
                                    
                                    <div class="col-sm-2" style="width:15%; display:block" id="editofferingshowdiv">
	    								<div class="form-group">
                                        	<div class="form-line">
                                               <input type="text" id="editofferingshow" name="editofferingshow" class="form-control" onclick="showeditofferingdiv()"  placeholder="" readonly>
                                            </div>
                                    	</div>
	    							</div>
	    							
	    							<div class="col-sm-2" id="editofferingdetails" style="width:15%; display:none">
	    								<div class="form-group">
                                        	<div class="form-line">
                                                <select class="form-control show-tick" data-live-search="true" id="editoffering" name="editoffering" onchange="" multiple required>
                                                	<c:forEach items="${offerings}" var="offerings">
                                            			<option value="${offerings.offeringdesc}">${offerings.offeringdesc}</option>
                                            		</c:forEach>
                                                </select>
                                        	</div>
                                    	</div>
	    							</div>
	    							
	    							<div class="col-sm-2" style="width:15%">
	    								<label for="editcompanyname"><span class="" style="color:red">*</span>Company Name:</label>
                                    </div>
	    						
	    							<div class="col-sm-2" style="width:15%">
	    								<div class="form-group">
                                        	<div class="form-line">
                                               <input type="text" id="editcompanyname" name="editcompanyname" class="form-control" onchange=""  placeholder="Enter Company Name" required>
                                            </div>
                                    	</div>
	    							</div>
				              </div>
				              
				              <div class="row clearfix" style="padding-top: 15px;">
	    						
		    						<div class="col-sm-2" style="width:10%">
		    								<label for="Address">Address1:</label>
	                                </div>
		    						
		    						<div class="col-sm-2" style="width:13%">
		    								<div class="form-group" >
	                                        	<div class="form-line">
	                                                <input type="text" id="editaddress1" name="editaddress1" class="form-control" onchange=""  placeholder="Enter Address" >
	                                        	</div>
	                                    	</div>
		    						</div>	
		    						
		    						<div class="col-sm-2" style="width:13%">
		    								<label for="Address">Address2:</label>
	                                </div>
		    						
		    						<div class="col-sm-2" style="width:15%">
		    								<div class="form-group" >
	                                        	<div class="form-line">
	                                                <input type="text" id="editaddress2" name="editaddress2" class="form-control" onchange=""  placeholder="Enter Address" >
	                                        	</div>
	                                    	</div>
		    						</div>	
	    							
	    							<div class="col-sm-2" style="width:15%">
		    								<label for="City">City :</label>
	                                </div>
		    						
		    						<div class="col-sm-2" style="width:12%">
		    								<div class="form-group" >
	                                        	<div class="form-line">
	                                                <input type="text" id="editcity" name="editcity" class="form-control" onchange=""  placeholder="City" >
	                                        	</div>
	                                    	</div>
		    						</div>	
                                </div>
                                
				               <div class="row clearfix" style="padding-top: 15px;">
                                 <div class="col-sm-2" style="width:09%">
	    								<label for="country"><span class="" style="color:red">*</span>Region :</label>
                                	</div>
                                	
                                	<div class="col-sm-2" style="width:14%;">
	    								<div class="form-group">
                                        	<div class="form-line" >
                                                <select class="form-control show-tick" id="countrytype" name="countrytype"> 
                                                	
                                                </select>
                                        	</div>
                                    	</div>
	    							</div>
                                
                                    <div class="col-sm-2" style="width:13%">
	    								<label for="country"><span class="" style="color:red">*</span>Country:</label>
                                	</div>
                                	
                                	<div class="col-sm-2" style="width:15%; display:none" id="countrys1">
	    								<div class="form-group">
                                        	<div class="form-line">
                                               <input type="text" id="countrys" name="countrys" class="form-control" onclick=""  placeholder="" readonly>
                                            </div>
                                    	</div>
	    							</div>
	    							
	    							<div class="col-sm-2" style="width:15%"  class="state" id="state" >
	    								<label for="state" ><span style="color:red">*</span>State:</label>
                                	</div>
                                	
                                	<div class="col-sm-2" style="width:12%; display:none" id="indianstate">
	    								<div class="form-group">
                                        	<div class="form-line" >                          
                                                <select class="form-control show-tick" data-live-search="true"id="instate" name="instate" onchange="getCityList()">
                                                	
                                                </select>
                                        	</div>
                                    	</div>
	    							</div>
	    							
	    							<div class="col-sm-2" style="width:12%; display:none" id="otherthanindianstate">
	    								<div class="form-group">
                                        	<div class="form-line" >
                                                <input type="text" id="otherstate" name="otherstate" class="form-control" onkeypress="return alphaOnly(event)" onclick="showeditstatediv()"  placeholder=""  >
                                            </div>
                                    	</div>
	    							</div>
	    							
	    							<div class="col-sm-2" style="width:10%" id="districts" class="districts">
	    								<label for="district" ><span style="color:red">*</span>Districts:</label>
                                	</div>
                                	
                                	<div class="col-sm-2" style="width:12%; display:none" id="indiandistricts">
	    								<div class="form-group">
                                        	<div class="form-line" >                          
                                                <select class="form-control show-tick" data-live-search="true"id="indistricts"  name="indistricts" onchange=""  >
                                                	
                                                </select>
                                        	</div>
                                    	</div>
	    							</div>
	    							
	    							<div class="col-sm-2" style="width:12%; display:none" id="otherthanindiandistricts">
	    								<div class="form-group">
                                        	<div class="form-line" >
                                                <input type="text" id="otherdistricts" name="otherdistricts" class="form-control" onkeypress="return alphaOnly(event)" placeholder=""  >
                                            </div>
                                    	</div>
	    							</div>
	    						</div>
	    						
	    						
	    						    <div class="row clearfix">
				              
				                   <div class="col-sm-2" style="width:10%">
		    								<label for="editnickname">Nick Name:</label>
	                                </div>
		    						
		    						<div class="col-sm-2" style="width:13%">
		    								<div class="form-group" >
	                                        	<div class="form-line">
	                                                <input type="text" id="editnickname" name="editnickname" class="form-control" onchange=""  placeholder="Enter Nick Name" required>
	                                        	</div>
	                                    	</div>
		    						</div>	
		    						
		    						<div class="col-sm-2" style="width:13%">
	    								<label for="editemployeesize"><span class="" style="color:red">*</span>Employee Size:</label>
                                	</div>
                                	
                                	<div class="col-sm-2" style="width:15%">
	    								<div class="form-group">
                                        	<div class="form-line" >
                                                <select class="form-control show-tick" data-live-search="true" id="editemployeesize" name="editemployeesize" onchange="" required>
                                                	<option value="1 to 50">1 to 50</option>
                                                	<option value="50 to 100">50 to 100</option>
                                                	<option value="100 to 500">100 to 500</option>
                                                	<option value="500 to 1000">500 to 1000</option>
                                                	<option value="1000 and more">1000 and more</option>
                                            	</select>
                                        	</div>
                                    	</div>
	    							</div>
	    							
	    							<div class="col-sm-2" style="width:15%">
	    								<label for="editannualturnover"><span class="" style="color:red">*</span>Annual Turnover(Cr):</label>
                                	</div>
                                	
                                	<div class="col-sm-2" style="width:15%">
	    								<div class="form-group">
                                        	<div class="form-line">
                                                <select class="form-control show-tick" data-live-search="true" id="editannualturnover" name="editannualturnover" onchange="" required>
                                                	<option value="1 to 5">1 to 5</option>
                                                	<option value="5 to 10">5 to 10</option>
                                                	<option value="10 to 50">10 to 50</option>
                                                	<option value="50 to 100">50 to 100</option>
                                                	<option value="100 and 500">100 and 500</option>
                                                	<option value="500 and 1000">500 and 1000</option>
                                                	<option value="1000 and more">1000 and more</option>
                                            	</select>
                                        	</div>
                                    	</div>
	    							</div>
				              </div>
				        
				              <div class="row clearfix" style="background-color:#eee; margin-bottom: 0px;">
								    <div class="col-sm-2 form-control-label" style="background-color:#eee; margin-bottom: 0px; text-align:left;"><h6>Contact Details :</h6></div>
								</div>
				              
				              
				              <input type="hidden" id="contactdetsize" name="contactdetsize" value="0">
				               <div class="row clearfix" style="padding-top: 15px;">
				                    <div class="col-md-12">
				                          <div class="table-responsive" id="editcontactdetailstable" style="">
											   <table class="table table-bordered table-striped table-hover js-basic-example dataTable" id="editcontactdetails">
												  	<thead>
															<tr>
																<th style="font-weight:normal;">Sr.No.</th>
																<th style="font-weight:normal;">Contact Name</th>
																<th style="font-weight:normal;">Designation</th>
																<th style="font-weight:normal;">Mobile</th>
																<th style="font-weight:normal;">Office No</th>
																<th style="font-weight:normal;">Email</th>
																<th style="font-weight:normal;">Alt Email</th>
																<th style="font-weight:normal;">Authority</th>
																<th style="font-weight:normal;">Action</th>
															</tr>
													 </thead>
							
													 <tbody>
													 </tbody>
													 
													 <tfoot>
                                						<tr>
                                							<th><button type="button" class="btn waves-effect waves-light" title="Add Contact" onclick="AddRowforEdit()">
                                   			                   <i class="material-icons">add</i>
                               			                     </button></th>
                                							<th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th>
                                						</tr>
                                					</tfoot>
												</table>
									      </div>
				                    </div>
				               </div>
				               
				               
				               
				                <div class="row clearfix" id="editconverttoleads" style="display:none;padding-left:20px;">
				                	<div class="row clearfix" style="padding-top: 15px;">
				                         <div class="col-sm-2" style="">
                                          <label for="editprojectdesc"><span class="" style="color:red">*</span>Project Description:</label>
	                                     </div>
	                                    
	                                     <div class="col-sm-8" style="">
	                                       <div class="form-group" ><div class="form-line">
	                                       <textarea rows="1" class="form-control no-resize" id="editprojectdesc" name="editprojectdesc" placeholder=""></textarea>
                                          
	                                       </div></div>
	                                     </div>
	                                     
<!-- 	                                     <div class="col-sm-2" style="width:15%"> -->
<!-- 	                                          <label for="editforecastclosedate"><span class="" style="color:red">*</span>Forecast Close:</label> -->
<!-- 		                                    </div> -->
		                                    
<!-- 		                                    <div class="col-sm-2" style="width:15%; display:block" id="showforcastdate"> -->
<!-- 		                                      <div class="form-group" ><div class="form-line"> -->
<!-- 	                                          <input type="text" id="edforecastclosedate" name="edforecastclosedate" class="form-control"  placeholder="" value="" onclick="showforecastdatediv()" readonly> -->
<!-- 		                                      </div></div> -->
<!-- 		                                    </div> -->
		                                    
<!-- 		                                    <div class="col-sm-2" id="forecastedition" style="width:15%; display:none;"> -->
<!-- 		                                      <div class="input-group date" id="bs_datepicker_container"> -->
<!-- 		                                        <div class="form-line"> -->
<!-- 		                                            <input type="text" class="form-control" name="editforecastclosedate" id="editforecastclosedate" placeholder="Please choose a date..."> -->
<!-- 		                                        </div> -->
<!-- 		                                        <span class="input-group-addon"> -->
<!-- 		                                            <i class="material-icons">date_range</i> -->
<!-- 		                                        </span> -->
<!-- 		                                      </div> -->
<!-- 		                                    </div> -->
	                                 </div>
	                                 
	                                  <div class="row clearfix">
					                        <div class="col-sm-2" style="width:13%">
	                                          <label for="editchanceofsale"><span class="" style="color:red">*</span>Winning Stage %::</label>
		                                    </div>
			    						
			    							<div class="col-sm-2" style="width:15%">
			    								<div class="form-group">
		                                        	<div class="form-line">
		                                                <select class="form-control show-tick" data-live-search="true" id="editchanceofsale" name="editchanceofsale" onchange="" required>
		                                                <option value="Cold Calling">Cold Calling</option>
	                                                	<option value="Demonstration">Demonstration</option>
	                                                	<option value="POC">POC</option>
	                                                	<option value="Proposal shared">Proposal shared</option>
	                                                	<option value="Price Negotiation">Price Negotiation</option>
	                                                	<option value="Closed">Closed</option>
	                                                	<option value="Lost">Lost</option>
		                                                </select>
		                                        	</div>
		                                    	</div>
			    							</div>
			    							
			    							<div class="col-sm-2" style="">
	                                          <label for="editforecastclosedate"><span class="" style="color:red">*</span>Target Close Date:</label>
		                                    </div>
		                                    
		                                    <div class="col-sm-2" style="width:15%; display:block" id="showforcastdate">
		                                      <div class="form-group" ><div class="form-line">
	                                          <input type="text" id="edforecastclosedate" name="edforecastclosedate" class="form-control"  placeholder="" value="" onclick="showforecastdatediv()" readonly>
		                                      </div></div>
		                                    </div>
		                                    
		                                    <div class="col-sm-2" id="forecastedition" style="width:15%; display:none;">
		                                       <input type="date" id="editforecastclosedate" name="editforecastclosedate">
<!-- 		                                      <div class="input-group date" class="bs_datepicker_component_container"> -->
<!-- 		                                        <div class="form-line"> -->
<!-- 		                                            <input type="text" class="form-control" name="editforecastclosedate" id="editforecastclosedate" placeholder="Please choose a date..."> -->
<!-- 		                                        </div> -->
<!-- 		                                        <span class="input-group-addon"> -->
<!-- 		                                            <i class="material-icons">date_range</i> -->
<!-- 		                                        </span> -->
<!-- 		                                      </div> -->
		                                    </div>
			    						</div>
			    						
			    						  <div class="row clearfix">
			    						    <div class="col-sm-2" style="width:13%;">
	                                          <label for="editpotentialopp"><span class="" style="color:red">*</span>Expected Deal Amt:</label>
		                                    </div>
		                                    
		                                    
		                                    <div class="col-sm-2" style="width:18%;">
		                                      <div class="form-group" ><div class="form-line">
	                                          <input type="text" id="editpotentialopp" name="editpotentialopp" class="form-control" onkeypress="return isNumber(event)"  placeholder="" value="">
		                                      </div></div>
		                                    </div>
		                                    
		                                   </div>
		                                   
		                                   <div class="row clearfix" style="background-color:#eee; margin-bottom: 0px; margin-right:0px">
								                <div class="col-sm-2 form-control-label" style="background-color:#eee; margin-bottom: 0px;text-align: left"><h6>Sales Team:</h6></div>
								            </div>
								            
								       <div class="row clearfix" style="padding-top: 15px;">
				                       <div class="col-sm-2" style="width:15%">
                                          <label for="primarysalesperson"><span class="" style="color:red">*</span>Primary Sales Person:</label>
	                                    </div>
	                                    
	                                    <div class="col-sm-4" style="">
	                                      <div class="form-group">
		                                        	<div class="form-line">
		                                                <select class="form-control show-tick" data-live-search="true" id="editprimarysalesperson" name="editprimarysalesperson" onchange=""  >
		                                                	<c:forEach items="${primarysseconalespersons}" var="primarysseconalespersons">
		                                            			<option value="${primarysseconalespersons.empid}">${primarysseconalespersons.empfirstname} ${primarysseconalespersons.emplastname}</option>
		                                            		</c:forEach>
		                                            		<option value="0">Not Applicable</option>
		                                                </select>
		                                        	</div>
		                                   </div>
	                                    </div>
	                                    
	                                    <div class="col-sm-2" style="width:16%">
                                          <label for="secondarysalesperson"><span class="" style="color:red">*</span>Secondary Sales Person:</label>
	                                    </div>
	                                    
	                                    <div class="col-sm-4" style="">
	                                      <div class="form-group">
		                                        	<div class="form-line">
		                                                <select class="form-control show-tick" data-live-search="true" id="editsecondarysalesperson" name="editsecondarysalesperson" onchange=""  >
		                                                	<c:forEach items="${primarysseconalespersons}" var="primarysseconalespersons">
		                                            			<option value="${primarysseconalespersons.empid}">${primarysseconalespersons.empfirstname} ${primarysseconalespersons.emplastname}</option>
		                                            		</c:forEach>
		                                            		<option value="0">Not Applicable</option>
		                                                </select>
		                                        	</div>
		                                   </div>
	                                    </div>
	                                    
	                                   
	                                    
				                   </div>
				                   
				                   <div class="row clearfix">
				                   
				                       <div class="col-sm-2" style="width:15%">
                                          <label for="presalesperson"><span class="" style="color:red">*</span>Presales Person:</label>
	                                    </div>
	                                    
	                                    <div class="col-sm-4" style="">
	                                      <div class="form-group">
		                                        	<div class="form-line">
		                                                <select class="form-control show-tick" data-live-search="true" id="editpresalesperson" name="editpresalesperson" onchange=""  >
		                                                	<c:forEach items="${presalespersons}" var="presalespersons">
		                                            			<option value="${presalespersons.empid}">${presalespersons.empfirstname} ${presalespersons.emplastname}</option>
		                                            		</c:forEach>
		                                            		 <option value="0">Not Applicable</option>
		                                                </select>
		                                        	</div>
		                                   </div>
	                                    </div>
	                                    
	                                    <div class="col-sm-2" style="width:16%">
                                          <label for="bdhead"><span class="" style="color:red">*</span>BD Head: </label>
	                                    </div>
	                                    
	                                    <div class="col-sm-4" style="">
	                                      <div class="form-group">
		                                        	<div class="form-line">
		                                                <select class="form-control show-tick" data-live-search="true" id="editbdhead" name="editbdhead" onchange=""  required>
		                                                	<c:forEach items="${bdheads}" var="bdheads">
		                                            			<option value="${bdheads.empid}">${bdheads.empfirstname} ${bdheads.emplastname}</option>
		                                            		</c:forEach>
		                                            		 <option value="0">Not Applicable</option>
		                                                </select>
		                                            </div>
		                                   </div>
	                                    </div>
	                                    
				                   </div>
			    						
			    						
			    						<div class="row clearfix" style="background-color:#eee; margin-bottom: 0px;margin-right:0px">
										 <div class="col-sm-2 form-control-label" style="background-color:#eee; margin-bottom: 0px;text-align:left;"><h6>Documents Detail:</h6></div>
										</div>	
				                
				                	<input type="hidden" id="editleaddocumentsize" name="editleaddocumentsize" value="0">
				                
				                    <div class="row clearfix" style="padding-top: 15px;">
				                          <div class="col-md-12">
				                               <div class="form-group">
				                                    <div class="body table-responsive">
				                                        <table class="table" id="editleaddocumenttab" class="form-control show-tick" style="padding:3px;">
				                                        <thead>
	                                						<tr>
	                                							<th class="text-center" style="min-width: 50px; width: 50px; font-weight:normal;">Sr No</th>
	                                							<th class="text-center" style="min-width: 150px; width: 150px; font-weight:normal;">Name of Documents</th>
	                                							<th class="text-center" style="min-width: 150px; width: 150px; font-weight:normal;">Document</th>
	                                							<th class="text-center" style="min-width: 50px; width: 50px; font-weight:normal;">Delete</th>
	                                						</tr>
	                                					</thead>
	                                					
	                                					<tbody >
                                						
                                					    </tbody>
                                					    
                                					    <tfoot>
                                						<tr>
                                							<th><button type="button" class="btn waves-effect waves-light" title="Add Documents" onclick="AddRoweditctl()">
                                   			                   <i class="material-icons">add</i>
                               			                     </button></th>
                                							<th></th><th></th><th></th>
                                						</tr>
                                					   </tfoot>
                                					                                                                                                                                                 
				                                      </table>
				                                    </div>
				                               </div>
				                          </div>
				                    </div>
				                    
				                 </div>
				               
				                 <div class="" id="editconverttopo" style="display:none">
				                 
					                        <div class="row clearfix">
					                             <div class="col-sm-2" style="width:10%">
		                                       <label for="editponumber" ><span class="" style="color:red">*</span>PO Number:</label>
			                                 </div>
			                                
			                                <div class="col-sm-2" style="width:15%">
			                                    <div class="form-group" ><div class="form-line">
		                                          <input type="text" id="editponumber" name="editponumber" class="form-control"  placeholder="" value="">
			                                    </div></div>
			                                </div>
			                                
			                                <div class="col-sm-2" style="width:8%">
		                                       <label for="editpodate"><span class="" style="color:red">*</span>PO Date:</label>
			                                 </div>
			                                
			                                <div class="col-sm-2" style="width:20%">
			                                    <div class="input-group date" >
			                                        <div class="form-line" id="bs_datepicker_component_container">
			                                            <input type="text" class="form-control" name="editpodate" name="editpodate" placeholder="Please choose a date...">
			                                        </div>
			                                        <span class="input-group-addon">
			                                            <i class="material-icons">date_range</i>
			                                        </span>
		                                        </div>
			                                </div>
			                                
			                                <div class="col-sm-2" style="width:10%">
		                                       <label for="editpoamount"><span class="" style="color:red">*</span>PO Amount:</label>
			                                </div>
			                                
			                                <div class="col-sm-2" style="width:15%">
			                                    <div class="form-group" ><div class="form-line">
		                                          <input type="text" id="editpoamount" name="editpoamount" class="form-control"  placeholder="" value="">
			                                    </div></div>
			                                </div>
					                        </div>
				                 </div>
				               
				         </div>
				         
				         <div class="modal-footer"  style="background-color:#0073b1">
				          <button type="button"  class="btn btn-link waves-effect" id="addeditdetails" name="addeditdetails" style="color:white;font-weight: bold;font-size:12px;" onclick="submitmodifieddetails()" onmouseover="changemybuttoncolor()" onmouseout="changemybuttoncolormouseOut()">Submit</button>
					      <button type="button" class="btn btn-link waves-effect" id="closeeditdetails" name="closeeditdetails"  onmouseover="changemyclosebuttoncolor()" onmouseout="changemyclosebuttoncolormouseOut()" style="color: white; font-weight: bold; font-size: 12px;" onclick="closemodifieddetails()" >Close</button>
				        </div>
				         
				   </form>
	           </div>   
	      </div>
	</div>
	
	<div class="modal fade" id="viewdetails" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static">
	      <div class="modal-dialog modal-lg modal-dialog-scrollable" role="document">
	            <div class="modal-content">
	                 <div class="modal-header" style="background-color: #0073b1">
					     <h4 class="modal-title" id="viewdetailsmodel" style="color: white"></h4>
				     </div>
				     
				    <div class="modal-body" >
				            <div class="row clearfix" style="background-color:#eee; margin-bottom: 0px; margin-right: 0px;">
								 <div class="col-sm-2 form-control-label" style="background-color:#eee; text-align: left"><h6>Company Details :</h6></div>
					        </div>	
				           <div class="row clearfix" style="padding-top: 15px;">
				                <div class="col-sm-2" style="width:10%">
                                        <label for="viewdatasource">Data Source:</label>
	                            </div>
	                            
	                            <div class="col-sm-2" style="width:15%">
	    								<div class="form-group">
                                        	<div class="form-line">
                                                <input type="text" id="viewdatasource" name="viewdatasource" class="form-control" onclick=""  placeholder="" readonly>
                                        	</div>
                                    	</div>
	    						</div> 
	    						
	    						<div class="col-sm-3" style="width:13%">
                                         <label for="viewoffering">Offering :</label>
                                </div>   
                                
                                <div class="col-sm-2">
	    								<div class="form-group">
                                        	<div class="form-line">
                                               <input type="text" id="viewoffering" name="viewoffering" class="form-control" onclick=""  placeholder="" readonly>
                                            </div>
                                    	</div>
	    						</div>
	    						
	    						<div class="col-sm-2" style="width:15%">
                                         <label for="viewcompanyname">Company Name :</label>
                                </div>   
                                
                                <div class="col-sm-3" style="width:15%">
	    								<div class="form-group">
                                        	<div class="form-line">
                                               <input type="text" id="viewcompanyname" name="viewcompanyname" class="form-control" onclick=""  placeholder="" readonly>
                                            </div>
                                    	</div>
	    						</div>
				           </div>
				           
				           <div class="row clearfix">
				                <div class="col-sm-2" style="width:10%">
		    						  <label for="viewnickname">Nick Name:</label>
	                             </div>
		    						
		    					<div class="col-sm-2" style="width:15%">
		    						 <div class="form-group" >
	                                       <div class="form-line">
	                                             <input type="text" id="viewnickname" name="viewnickname" class="form-control" onchange=""  placeholder=""  readonly>
	                                        </div>
	                                  </div>
		    					</div>
		    					
		    					<div class="col-sm-2" style="width:13%">
	    								<label for="viewemployeesize">Employee Size:</label>
                                </div>	
                                
                                <div class="col-sm-2" style="width:13%">
		    						 <div class="form-group" >
	                                       <div class="form-line">
	                                             <input type="text" id="viewemployeesize" name="viewemployeesize" class="form-control" onchange=""  placeholder="" readonly>
	                                        </div>
	                                  </div>
		    					</div>
		    					
		    					<div class="col-sm-2" style="width:15%">
	    								<label for="viewannualturnover">Annual Turnover(Cr):</label>
                                </div>
                                	
                                <div class="col-sm-2" style="width:15%">
	    								<div class="form-group">
                                        	<div class="form-line">
                                               <input type="text" id="viewannualturnover" name="viewannualturnover" class="form-control" onchange=""  placeholder="" readonly>
                                            </div>
                                    	</div>
	    					    </div>
	    					</div>
	    					
	    				    <div class="row clearfix" id="viewconverttoleads" style="display:none;padding-left:20px;">
	    					      <div class="row clearfix">
	    					           <div class="col-sm-2" style="width:13%">
	    								<label for="viewprojectdesc">Project Description:</label>
                                       </div>
                                	
		                                <div class="col-sm-10" style="">
			    								<div class="form-group">
		                                        	<div class="form-line">
		                                               <input type="text" id="viewprojectdesc" name="viewprojectdesc" class="form-control" onchange=""  placeholder="" readonly>
		                                            </div>
		                                    	</div>
			    					    </div>
			    					    
			    				</div>
			    				
			    				<div class="row clearfix">
			    				      <div class="col-sm-2" style="width:13%">
	    								<label for="viewchanceofsale">Winning Stage %:</label>
                                      </div>
                                	
		                              <div class="col-sm-2" style="width:13%">
			    						 <div class="form-group">
		                                        	<div class="form-line">
		                                               <input type="text" id="viewchanceofsale" name="viewchanceofsale" class="form-control" onchange=""  placeholder="" readonly>
		                                            </div>
		                                  </div>
			    					  </div>
			    					  
			    					  
			    					    <div class="col-sm-2" style="">
	    								<label for="viewforecastclosedate">Target Close Date:</label>
                                       </div>
                                	
		                                <div class="col-sm-2" style="width:15%">
			    								<div class="form-group">
		                                        	<div class="form-line">
		                                               <input type="text" id="viewforecastclosedate" name="viewforecastclosedate" class="form-control" onchange=""  placeholder="" readonly>
		                                            </div>
		                                    	</div>
			    					    </div>
			    				</div>
			    				
			    				      <div class="row clearfix">
			    				      <div id="indiancurrency">
			    				      <div class="col-sm-2" style="width:13%">
	    								<label for="viewpotentialopp">Exp Deal Amt(INR):</label>
                                      </div>
                                	
		                                <div class="col-sm-2" style="width:15%">
			    								<div class="form-group">
		                                        	<div class="form-line">
		                                               <input type="text" id="viewpotentialopp" name="viewpotentialopp" class="form-control" onchange=""  placeholder="" readonly>
		                                            </div>
		                                    	</div>
			    					    </div>
			    					    
			    					    </div>
			    					    
			    					    <div id="ForginCurrency">
			    					    
			    					    <div class="col-sm-2" style="width:13%">
	    								<label for="viewpotentialopp">Currency Type:</label>
                                      </div>
                                	
		                                <div class="col-sm-2" style="width:13%">
			    								<div class="form-group">
		                                        	<div class="form-line">
		                                               <input type="text" id="viewcurrencytype" name="viewcurrencytype" class="form-control" onchange=""  placeholder="" readonly>
		                                            </div>
		                                    	</div>
			    					    </div>
			    					    
			    					    <div class="col-sm-2" style="width:13%">
	    								<label for="viewpotentialopp">Amount:</label>
                                      </div>
                                	
		                                <div class="col-sm-2" style="width:15%">
			    								<div class="form-group">
		                                        	<div class="form-line">
		                                               <input type="text"  id="viewforeigncurrency" name="viewforeigncurrency" class="form-control" onchange=""  placeholder="" readonly>
		                                            </div>
		                                    	</div>
			    					    </div>
			    					    
			    					    </div>
			    					    </div>
			    				
			    				<div class="row clearfix" style="background-color:#eee; margin-bottom: 0px; margin-right: 0px;">
								     <div class="col-sm-2 form-control-label" style="background-color:#eee; margin-bottom: 0px;text-align: left"><h6>Sales Team:</h6></div>
								</div>
			    				
			    				<div class="row clearfix" style="padding-top: 15px;">
				                       <div class="col-sm-2" style="width:15%">
                                          <label for="viewprimarysalesperson">Primary Sales Person:</label>
	                                    </div>
	                                    
	                                    <div class="col-sm-4" style="">
	                                      <div class="form-group">
		                                        <div class="form-line">
		                                             <input type="text" id="viewprimarysalesperson" name="viewprimarysalesperson" class="form-control" onchange=""  placeholder="" readonly>
												</div>
		                                   </div>
	                                    </div>
	                                    
	                                    <div class="col-sm-2" style="width:16%">
                                          <label for="viewsecondarysalesperson">Secondary Sales Person:</label>
	                                    </div>
	                                    
	                                    <div class="col-sm-4" style="">
	                                      <div class="form-group">
		                                       <div class="form-line">
		                                           	<input type="text" id="viewsecondarysalesperson" name="viewsecondarysalesperson" class="form-control" onchange=""  placeholder="" readonly>
		                                       </div>
		                                   </div>
	                                    </div>
	                                    
	                                   
	                                    
				                   </div>
				                   
				                   <div class="row clearfix">
				                   
				                       <div class="col-sm-2" style="width:15%">
                                          <label for="viewpresalesperson">Presales Person:</label>
	                                    </div>
	                                    
	                                    <div class="col-sm-4" style="">
	                                      <div class="form-group">
		                                       <div class="form-line">
		                                          <input type="text" id="viewpresalesperson" name="viewpresalesperson" class="form-control" onchange=""  placeholder="" readonly>
												</div>
		                                   </div>
	                                    </div>
	                                    
	                                    <div class="col-sm-2" style="width:16%">
                                          <label for="viewbdhead">BD Head: </label>
	                                    </div>
	                                    
	                                    <div class="col-sm-4" style="">
	                                      <div class="form-group">
		                                       <div class="form-line">
		                                            <input type="text" id="viewbdhead" name="viewbdhead" class="form-control" onchange=""  placeholder="" readonly>
												</div>
		                                   </div>
	                                    </div>
				                   </div>
			    				
			    			
			    			</div>
	    					
	    					
	    					<div class="row clearfix" id="viewconverttopo" style="display:none;padding-left:20px;">
	    					    
	    					     <div class="row clearfix">
					                         <div class="col-sm-2" style="width:15%">
		                                       <label for="viewponumber">PO Number:</label>
			                                 </div>
			                                
			                                <div class="col-sm-2" style="width:15%">
			                                    <div class="form-group" ><div class="form-line">
		                                          <input type="text" id="viewponumber" name="viewponumber" class="form-control"  placeholder="" value="" readonly>
			                                    </div></div>
			                                </div>
			                                
			                                <div class="col-sm-2" style="width:8%">
		                                       <label for="viewpodate">PO Date:</label>
			                                 </div>
			                                
			                                <div class="col-sm-2" style="width:10%">
			                                    <div class="input-group date" id="bs_datepicker_component_container">
			                                        <div class="form-line">
			                                            <input type="text" id="viewpodate" name="viewpodate" class="form-control"  placeholder="" value="" readonly>
			                                        </div>
			                                     </div>
			                                </div>
			                                
			                                <div class="col-sm-2" style="width:16%">
		                                       <label for="viewpoamount">PO Amount:</label>
			                                </div>
			                                
			                                <div class="col-sm-2" style="width:15%">
			                                    <div class="form-group" ><div class="form-line">
		                                          <input type="number" id="viewpoamount" name="viewpoamount" class="form-control"  placeholder="" value="">
			                                    </div></div>
			                                </div>
					               </div>
					               
	    					</div>
	    					
	    					<div class="row clearfix" style="background-color:#eee;margin-right: 0px;">
								    <div class="col-sm-2 form-control-label" style="text-align: left"><h6>Contact Details :</h6></div>
									<div class="col-sm-2">
										<button type="button" class="btn btn-circle waves-effect waves-circle waves-float" id="contactdet" onclick="viewContactDetails()" style="background-color: #eee;  font-size:12px; width:25%; height:20%;">
									     <i class="material-icons">keyboard_arrow_down</i>
								         </button> 
								    </div>
							  </div>
	    					
	    					<div id="viewcontdetail" style="display:none;">
	    					    <div class="row clearfix">
	    					     <div class="col-md-12">
	    					          <div class="table-responsive" id="" style="">
	    					               <table class="table table-bordered table-striped table-hover js-basic-example dataTable" id="viewcontactdetails">
	    					                        <thead>
															<tr>
																<th style="font-weight:normal;">Sr.No.</th>
																<th style="font-weight:normal;">Contact Name</th>
																<th style="font-weight:normal;">Designation</th>
																<th style="font-weight:normal;">Mobile</th>
																<th style="font-weight:normal;">Office No</th>
																<th style="font-weight:normal;">Email</th>
																<th style="font-weight:normal;">Alt Email</th>
																<th style="font-weight:normal;">Authority</th>
															</tr>
													 </thead>
							
													 <tbody>
													 </tbody>
													 
													 <tfoot>
                                					</tfoot>
	    					               </table>
	    					          </div>
	    					     </div>
	    					  </div>
	    					</div>

	    					<div class="row clearfix"  style="display:none;background-color:#eee;" id="divforviewdetails">
								    <div class="col-sm-2 form-control-label" style="text-align: left"><h6>Documents Detail:</h6></div>
									<div class="col-sm-2">
										<button type="button" class="btn btn-circle waves-effect waves-circle waves-float" id="docdetail" onclick="viewDocumentDetails()" style="background-color: #eee;  font-size:12px; width:25%; height:20%;">
									     <i class="material-icons">keyboard_arrow_down</i>
								         </button> 
								    </div>
							  </div>
							  
							  <div id="viewdocdetail" style="display:none;">
							     <div class="row clearfix">
			    				      <div class="col-md-12">
				                               <div class="form-group">
				                                    <div class="body table-responsive">
				                                        <table class="table" id="viewleaddocumenttab" class="form-control show-tick" style="padding:3px;">
				                                        <thead>
	                                						<tr>
	                                							<th class="text-center" style="min-width: 50px; width: 50px; font-weight:normal;">Sr No</th>
	                                							<th class="text-center" style="min-width: 150px; width: 150px; font-weight:normal;">Name of Documents</th>
	                                							<th class="text-center" style="min-width: 150px; width: 150px; font-weight:normal;">Document</th>
	                                							
	                                						</tr>
	                                					</thead>
	                                					
	                                					<tbody>
                                						
                                					    </tbody>
                                					    
                                					    <tfoot>
                                						 </tfoot>
                                					                                                                                                                                                 
				                                      </table>
				                                    </div>
				                               </div>
				                          </div>
			    				  </div>
							  </div>
	    					
	    					
	    					  <div class="row clearfix" style="background-color:#eee;margin-right: 0px;">
								    <div class="col-sm-2 form-control-label" style=" text-align: left"><h6>Sales Life Cycle:</h6></div>
									<div class="col-sm-2">
										<button type="button" class="btn btn-circle waves-effect waves-circle waves-float" id="vieweventdetail" onclick="viewEventDetails()" style="background-color: #eee;  font-size:12px; width:25%; height:20%;">
									     <i class="material-icons">keyboard_arrow_down</i>
								         </button> 
								    </div>
							  </div>
							  
							  <div id="viewevedetail" style="display:none;">
							       <div class="row clearfix">
			    				      <div class="col-md-12">
				                               <div class="form-group">
				                                    <div class="body table-responsive">
				                                        <table class="table" id="viewleadeventtab" class="form-control show-tick" style="padding:3px;">
				                                        <thead>
	                                						<tr>
	                                						    <th style="font-weight:normal;">Sr No</th>
	                                							<th style="font-weight:normal;">Event</th>
	                                							<th style="font-weight:normal;">Event Stages</th>
	                                							<th style="font-weight:normal;">Status</th>
	                                							<th style="font-weight:normal;">Event Date</th>
	                                							<th style="font-weight:normal;">Remark</th>
	                                						</tr>
	                                					</thead>
	                                					
	                                					<tbody>
                                						</tbody>
                                					    
                                					    <tfoot>
                                					    	
                                						 </tfoot>
                                					                                                                                                                                                 
				                                      </table>
				                                    </div>
				                               </div>
				                          </div>
			    				    </div>
							   </div>
	    					     
	    					
				     </div>
				     
				     <div class="modal-footer" style="background-color:#0073b1">
				          <button type="button" id="viewclosebtn" name="viewclosebtn" class="btn btn-link waves-effect" data-dismiss="modal"  style="color: white; font-weight: bold; font-size: 12px;" onmouseover="changemyviewbtnclosecolor()" onmouseout="changeviewbtnclosecolormouseOut()">Close</button>
				      </div>
	            </div>
	      </div>
	</div>
	
	
	<div class="modal fade" id="viewcustomer" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static">
		
		<div class="modal-dialog modal-lg modal-dialog-scrollable" role="document">
			 <div class="modal-content">
				 	<div class="modal-header" style="background-color: #0073b1">
					     <h4 class="modal-title" id="viewdetailcustomer" style="color: white">Customer Details</h4>
				     </div>
				     
				     <div class="modal-body" >
				     	 <div class="row clearfix" style="padding-top: 15px;">
				     	 	<div class="col-sm-2" style="width:15%">
                                         <label for="companyname1">Customer Name:</label>
                            </div>
                            
                             <div class="col-sm-3" style="width:15%">
	    								<div class="form-group">
                                        	<div class="form-line">
                                               <input type="text" id="companyname1" name="companyname1" class="form-control"  placeholder="" readonly>
                                            </div>
                                    	</div>
	    					</div>
	    					
	    					
	    					 
	    					<div class="col-sm-2" style="width:15%">
                                 <label for="onboarddate1">Onboard Date:</label>
                            </div>
                            
                             <div class="col-sm-3" style="width:15%">
	    						    <div class="form-group">
                                       <div class="form-line">
                                           <input type="text" id="onboarddate1" name="onboarddate1" class="form-control" placeholder="" readonly>
                                       </div>
                                    </div>
	    					 </div> <div class="col-sm-2" style="width:15%">
                                         <label for="customerstatus">Satus:</label>
                             </div>
                            
                             <div class="col-sm-3" style="width:15%">
	    							<div class="form-group">
                                       <div class="form-line">
                                           <input type="text" id="customerstatus" name="customerstatus" class="form-control" placeholder="" readonly>
                                       </div>
                                    </div>
	    					 </div>
	    				</div>
	    				
<!-- 	    				<button onclick="Validate()" type="button" class="btn btn-success" id="validateButton"><i class="fas fa-shield-check"></i> Check</button> -->
	    				
	    				<div class="row clearfix" style="background-color:#eee; margin-bottom: 0px; margin-right: 0px;">
								 <div class="col-sm-2 form-control-label" style="background-color:#eee; text-align: left"><h6>Deal Details:</h6></div>
					     </div>
					     
					     
					     <div class="row clearfix">
					     	<div class="col-md-12">
					     		<div class="form-group">
					     			<div class="body table-responsive">
					     				 <table class="table" id="viewcustomersdealstab" class="form-control show-tick" style="padding:3px;">
					     				 
					     				 <thead>
	                                			<tr>
	                                				<th style="font-weight:normal;">Sr No</th>
	                                				<th style="font-weight:normal;">Project Description</th>
	                                				<th style="font-weight:normal;">Technologies</th>
	                                				<th style="font-weight:normal;">PO Number</th>
	                                				<th style="font-weight:normal;">Order Date</th>
	                                				<th style="font-weight:normal;">Amount</th>
	                                				<th style="font-weight:normal;">Need By Date</th>
	                                				<th style="font-weight:normal;">Update</th>
	                                				<th style="font-weight:normal;">Download</th>
	                                				
	                                			</tr>
	                                	</thead>
	                                	
	                                	
	                                	<tbody>
	                               			
                                		</tbody>
                                					    
                                		<tfoot>
                                		<tr>
	                               		<th colspan="4"></th>
	                               		
	                               		<th colspan="2"><span><button type="button" class="btn bg-blue waves-effect waves-light" title="Add Deal" onclick="openNewDeal()">Add new project</button><span></th>
	                               		</tr> 
                                		</tfoot>
					     				 
					     				 </table>
					     				 
					     			</div>
					     		</div>
					     	</div>
					     </div>
	    				
				     </div>
				     
				     <div class="modal-footer" style="background-color:#0073b1">
				          <button type="button" id="viewclosebtn" name="viewclosebtn" class="btn btn-link waves-effect" data-dismiss="modal"  style="color: white; font-weight: bold; font-size: 12px;" onmouseover="changemyviewbtnclosecolor()" onmouseout="changeviewbtnclosecolormouseOut()">Close</button>
				      </div>
			 </div>
		</div>
	</div>
	
	
	<div class="modal fade" id="adddeal" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg modal-dialog-scrollable" role="document">
			 <div class="modal-content">
			 	<div class="modal-header" style="background-color:#0073b1">
					   <h4 class="modal-title" id="newdealcrm" style="color:white">Add New Deal</h4>
				</div>
				<form class="form-horizontal" method="post" action="savedealdetails" name="dealdeatilsid" id="dealdeatilsid" autocomplete="off"  enctype="multipart/form-data">
				<input type="hidden" name="crmrecordid" id = "crmrecordid" value="">
				<div class="modal-body">
					<div class="row clearfix">
							<div class="col-sm-2" style="width:13%">
                                 <label for="dealprojectdesc"><span class="" style="color:red">*</span>Project Description:</label>
	                        </div>
	                                    
	                        <div class="col-sm-8" style="">
	                            <div class="form-group" ><div class="form-line">
                                    <input type="text" id="dealprojectdesc" name="dealprojectdesc" class="form-control"  placeholder="" value="">
	                            </div></div>
	                        </div>	
	                </div>
	                <div class="row clearfix">        
	                        <div class="col-sm-2" style="width:10%">
                                 <label for="dealoffering"><span class="" style="color:red">*</span>Offering:</label>
	                        </div>
	                                    
	                        <div class="col-sm-2" style="width:20%">
	                             <select class="form-control show-tick" data-live-search="true" id="dealoffering" name="dealoffering"  multiple >
                                       <c:forEach items="${offerings}" var="offerings">
                                            <option value="${offerings.offeringdesc}">${offerings.offeringdesc}</option>
                                       </c:forEach>
                                  </select>
	                        </div>
	                        
	                        <div class="col-sm-2" style="width:10%">
	                        	<label for="dealponumber"><span class="" style="color:red">*</span>PO Number:</label>
                            </div>
	                                    
	                        <div class="col-sm-2" style="width:20%">
	                        	<div class="form-group" ><div class="form-line">
	                             <input type="text" id="dealponumber" name="dealponumber" class="form-control" onkeypress="return isNumber(event)" placeholder="" value="">
	                             </div></div>
							</div>
							
							 <div class="col-sm-2" style="width:10%">
                                 <label for="dealpoamount"><span class="" style="color:red">*</span>PO Amount:</label>
	                        </div>
	                                    
	                        <div class="col-sm-2" style="width:20%">
	                        	 <div class="form-group" ><div class="form-line">
	                             <input type="text" id="dealpoamount" name="dealpoamount" class="form-control" onkeypress="return isNumber(event)" placeholder="" value="">
	                             </div></div>
							</div>
	                </div>	
	                
	                <div class="row clearfix">  
	                		<div class="col-sm-2" style="width:10%">
                                 <label for="dealevent"><span class="" style="color:red">*</span>Event:</label>
	                        </div>
	                                    
	                        <div class="col-sm-2" style="width:20%">
	                             <select class="form-control show-tick" data-live-search="true" id="dealevent" name="dealevent"  multiple >
                                       <c:forEach items="${crmevents}" var="crmevents">
	                                           <option value="${crmevents.crmevent}">${crmevents.crmevent}</option>
	                                    </c:forEach>
                                  </select>
	                        </div>
	                
	                
	                 
							<div class="col-sm-2" style="width:10%">
	                                       <label for="dealorderdate"><span class="" style="color:red">*</span>Order Date:</label>
		                     </div>
		                                
		                   <div class="col-sm-2" style="width:20%">
		                          <input type="date" id="dealpodate" name="dealpodate">
		                     </div>	                	
	    				
	    				<div class="col-sm-2" style="width:10%">
                                 <label for="dealneedbydate">Need By Date:</label>
                        </div>
                            
                        <div class="col-sm-2" style="width:25%">
	    				 	<input type="date" id="dealneedbydate" name="dealneedbydate" min={new Date().toISOString().split('T')[0]}>
		                </div>
	                </div>
	                
	                	<div class="row clearfix" style="background-color:#eee; margin-bottom: 0px;">
								     <div class="col-sm-2 form-control-label" style="background-color:#eee; margin-bottom: 0px;text-align:left;"><h6>Documents Detail:</h6></div>
								   </div>
				                  
				                  <div class="row clearfix">
				                       <div class="col-md-12">
				                            <div class="form-group">
				                                 <div class="body table-responsive">
				                                      <table class="table" id="deal" class="form-control show-tick" style="padding:3px;">
				                                        <thead>
	                                						<tr>
	                                							<th class="text-center" style="min-width: 50px; width: 50px; font-weight:normal;">Sr No</th>
	                                							<th class="text-center" style="min-width: 150px; width: 150px; font-weight:normal;">Name of Documents</th>
	                                							<th class="text-center" style="min-width: 150px; width: 150px; font-weight:normal;">Document</th>
	                                							<th class="text-center" style="min-width: 50px; width: 50px; font-weight:normal;">Delete</th>
	                                						</tr>
	                                					</thead>
	                                					
	                                					<tbody>
                                						<tr>
                                						</tr>
                                					    </tbody>
                                					    
                                					    <tfoot>
                                						<tr>
                                							<th><button type="button" class="btn waves-effect waves-light" title="Add Document" onclick="AddRowDeal()">
                                   			                   <i class="material-icons">add</i>
                               			                     </button></th>
                                							<th></th><th></th><th></th>
                                						</tr>
                                					   </tfoot>
                                					                                                                                                                                                 
				                                      </table>
				                                 </div>
				                            </div>   
				                       </div>
				                  </div>
				              </div>
	                
	                <div class="row clearfix"> 
	                	<div class="col-sm-2" style="width:13%">
                                 <label for="dealprojectdesc" style="padding-left: 24%;">Remark:</label>
	                   </div>
	                                    
	                    <div class="col-sm-8" style="">
	                            <div class="form-group" ><div class="form-line">
                                    <input type="text" id="dealremark" name="dealremark" class="form-control"  placeholder="" value="">
	                            </div></div>
	                   </div>
	                </div>
				</div>
				
				</form>
				<div class="modal-footer" style="background-color:#0073b1;">
					     <button type="button"  class="btn btn-link waves-effect" style="color: white; font-weight: bold; font-size: 12px;;" onclick="submitDealDetails()">Save</button>
				         <button type="button" id="viewclosebtn" name="viewclosebtn" class="btn btn-link waves-effect" data-dismiss="modal"  style="color: white; font-weight: bold; font-size: 12px;" onmouseover="changemyviewbtnclosecolor()" onmouseout="changeviewbtnclosecolormouseOut()">Close</button>
				</div>
			 </div>
		</div>
	</div>
<!-- 	T -->

<input type="hidden" id="updateeditleaddocumentsize" name="updateeditleaddocumentsize" value="0">
	<div class="modal fade" id="updatedeal" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg modal-dialog-scrollable" role="document">
			 <div class="modal-content">
			 	<div class="modal-header" style="background-color:#0073b1;margin-top:20%">
					   <h4 class="modal-title" id="updatedealcrm" style="color:white">Update Deal details</h4>
				</div>
				<form class="form-horizontal" method="post" action="updatedealdetails" name="updatedealdetails" id="updatedealdetails" autocomplete="off"  enctype="multipart/form-data">
				<input type="hidden" name="updatedcrmeventid" id = "updatedcrmeventid" value="">
				<input type="hidden" name="updatecrmrecordid" id = "updatecrmrecordid" value="">
					<input type="hidden" name="documenteventid" id = "documenteventid" value="">
				<div class="modal-body">
					<div class="row clearfix">
							<div class="col-sm-2" style="width:13%">
                                 <label for="dealprojectdesc"><span class="" style="color:red">*</span>Project Description:</label>
	                        </div>
	                                    
	                        <div class="col-sm-8" style="">
	                            <div class="form-group" ><div class="form-line">
                                    <input type="text" id="updatedealprojectdesc" name="updatedealprojectdesc" class="form-control"  placeholder="" value="" readonly>
	                            </div></div>
	                        </div>	
	                </div>
	                <div class="row clearfix">        
	                        <div class="col-sm-2" style="width:10%">
                                 <label for="dealoffering"><span class="" style="color:red">*</span>Offering:</label>
	                        </div>
	                                    
	                        <div class="col-sm-2" style="width:20%">
	                             <select class="form-control show-tick" data-live-search="true" id="updateddealoffering" name="updateddealoffering" disabled>
                                       <c:forEach items="${offerings}" var="offerings">
                                            <option value="${offerings.offeringdesc}">${offerings.offeringdesc}</option>
                                       </c:forEach>
                                  </select>
	                        </div>
	                        
	                        <div class="col-sm-2" style="width:10%">
	                        	<label for="dealponumber"><span class="" style="color:red">*</span>PO Number:</label>
                            </div>
	                                    
	                        <div class="col-sm-2" style="width:20%">
	                        	<div class="form-group" ><div class="form-line">
	                             <input type="text" id="updatedealponumber" name="updatedealponumber" class="form-control" onkeypress="return isNumber(event)" placeholder="" value="">
	                             </div></div>
							</div>
							
							 <div class="col-sm-2" style="width:10%">
                                 <label for="dealpoamount"><span class="" style="color:red">*</span>PO Amount:</label>
	                        </div>
	                                    
	                        <div class="col-sm-2" style="width:20%">
	                        	 <div class="form-group" ><div class="form-line">
	                             <input type="text" id="updatedealpoamount" name="updatedealpoamount" class="form-control" onkeypress="return isNumber(event)" placeholder="" value="">
	                             </div></div>
							</div>
	                </div>	
	                
	                <div class="row clearfix">  
	                		<div class="col-sm-2" style="width:10%">
                                 <label for="dealevent"><span class="" style="color:red">*</span>Event:</label>
	                        </div>
	                                    
	                        <div class="col-sm-2" style="width:20%">
	                             <select class="form-control show-tick" data-live-search="true" id="updatedealevent" name="updatedealevent" >
                                       <c:forEach items="${crmevents}" var="crmevents">
	                                           <option value="${crmevents.crmevent}">${crmevents.crmevent}</option>
	                                    </c:forEach>
                                  </select>
	                        </div>
	                
	                
	                 
							<div class="col-sm-2" style="width:10%">
	                                       <label for="dealorderdate"><span class="" style="color:red">*</span>Order Date:</label>
		                     </div>
		                                
		                   <div class="col-sm-2" style="width:20%">
		                          <input type="date" id="updatedealpodate" name="updatedealpodate">
		                     </div>	                	
	    				
	    				<div class="col-sm-2" style="width:10%">
                                 <label for="dealneedbydate">Need By Date:</label>
                        </div>
                            
                        <div class="col-sm-2" style="width:25%">
	    				 	<input type="date" id="updatedealneedbydate" name="updatedealneedbydate" min={new Date().toISOString().split('T')[0]}>
		                </div>
	                </div>

	                	<div class="row clearfix" style="background-color:#eee; margin-bottom: 0px;">
								     <div class="col-sm-2 form-control-label" style="background-color:#eee; margin-bottom: 0px;text-align:left;"><h6>Documents Detail:</h6></div>
								   </div>
				                  
				                  <div class="row clearfix">
				                       <div class="col-md-12">
				                            <div class="form-group">
				                                 <div class="body table-responsive">
				                                      <table class="table" id="updatedeal" class="form-control show-tick" style="padding:3px;">
				                                        <thead>
	                                						<tr>
	                                							<th class="text-center" style="min-width: 50px; width: 50px; font-weight:normal;">Sr No</th>
	                                							<th class="text-center" style="min-width: 150px; width: 150px; font-weight:normal;">Name of Documents</th>
	                                							<th class="text-center" style="min-width: 150px; width: 150px; font-weight:normal;">Document</th>
	                                							<th class="text-center" style="min-width: 50px; width: 50px; font-weight:normal;">Delete</th>
	                                						</tr>
	                                					</thead>
	                                					
	                                					<tbody>
                                						<tr>
                                						</tr>
                                					    </tbody>
                                					    
                                					    <tfoot>
                                						<tr>
                                							<th><button type="button" class="btn waves-effect waves-light" title="Add Document" onclick="updateAddRowDeal()">
                                   			                   <i class="material-icons">add</i>
                               			                     </button></th>
                                							<th></th><th></th><th></th>
                                						</tr>
                                					   </tfoot>
                                					                                                                                                                                                 
				                                      </table>
				                                 </div>
				                            </div>   
				                       </div>
				                  </div>
				              </div>
	                
	                <div class="row clearfix"> 
	                	<div class="col-sm-2" style="width:13%">
                                 <label for="dealprojectdesc" style="padding-left: 24%;">Remark:</label>
	                   </div>
	                                    
	                    <div class="col-sm-8" style="">
	                            <div class="form-group" ><div class="form-line">
                                    <input type="text" id="updatedealremark" name="dealremark" class="form-control"  placeholder="" value="">
	                            </div></div>
	                   </div>
	                </div>
				</div>
				
				</form>
				<div class="modal-footer" style="background-color:#0073b1;">
					     <button type="button"  class="btn btn-link waves-effect" style="color: white; font-weight: bold; font-size: 12px;;" onclick="updatesubmitDealDetails()">Save</button>
				         <button type="button" id="viewclosebtn" name="viewclosebtn" class="btn btn-link waves-effect" data-dismiss="modal"  style="color: white; font-weight: bold; font-size: 12px;" onmouseover="changemyviewbtnclosecolor()" onmouseout="changeviewbtnclosecolormouseOut()">Close</button>
				</div>
			 </div>
		</div>
	</div>
<!-- T	 -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
	
//press Key it will close pop	
window.addEventListener("keyup", function(e){ if(e.keyCode == 27) history.back(); }, false);

	
	 $('#bs').datepicker({
		  startDate: new Date()
		  });
	 
	 $('#bs1').datepicker({
		  startDate: new Date()
		  });
	 
	 $('#bs3').datepicker({
		  startDate: new Date()
		  });
	 
	 
	 var today = new Date();
	    var dd = String(today.getDate()).padStart(2, '0');
	    var mm = String(today.getMonth() + 1).padStart(2, '0');
	    var yyyy = today.getFullYear();

	    today = yyyy + '-' + mm + '-' + dd;
	    $('#updatedealneedbydate').attr('min',today);
	 
	 
	 var today = new Date();
	    var dd = String(today.getDate()).padStart(2, '0');
	    var mm = String(today.getMonth() + 1).padStart(2, '0');
	    var yyyy = today.getFullYear();

	    today = yyyy + '-' + mm + '-' + dd;
	    $('#updatedealpodate').attr('min',today);
	 
	 
	 var today = new Date().toISOString().split('T')[0];
	 document.getElementsByName("dealneedbydate")[0].setAttribute('min', today);
	   
	   var today = new Date().toISOString().split('T')[0];
	   document.getElementsByName("dealpodate")[0].setAttribute('min', today);
	 
//  	 $('#dealpodate').datepicker({
//  		  startDate: new Date()
//  		  });
	 
//  	 $('#dealneedbydate').datepicker({
//  		  startDate: new Date()
//  		  });
	
	function test(){
		 var country = $('select[name=country]').val();
	 		
		if(country==101){
			
			 const box0 = document.getElementById('state');
			 box0.style.display = 'block'; 
			 
            const box00 = document.getElementById('districts'); 
            box00.style.display = 'block';
			 
      			 var x = document.getElementById("indianstate");
	    		var y = document.getElementById("otherthanindianstate");
	    		
	    		var p = document.getElementById("indiandistricts");
	    		var q = document.getElementById("otherthanindiandistricts");
	    	
	    		if (p.style.display === "none")
		  		   {
		  			    p.style.display = "block";
		  		   } 
	    		
	    		if (q.style.display === "block")
		  		   {
		  			    q.style.display = "none";
		  		   } 
	    		
	    		if (x.style.display === "none")
		  		   {
		  			    x.style.display = "block";
		  		   } 
	 		
	 		    if (y.style.display === "block")
		  		   {
		  			    y.style.display = "none";
		  		   }
			 
			 $.ajax({
 	      		type: 'GET',
 	   	 		dataType: 'json',
 	   	 		url :'${pageContext.request.contextPath}/getStateList',
 	   	 		data : ({'country':101}),
 	   	 		success : function(data){
 	   	 			console.log(data);
 	   	 			var instate = $('#instate');
 	   	 		    instate.find('option').remove();
 	   	 			var options = '';
 	   	 			options +='<option value=\"\">Select</option>'
 	   	 			 for (var i = 0; i < data.length; i++) {
 	   	 			      options += '<option value="' + data[i].stateid + '">' + data[i].statename +'</option>';
 	   	 			}
 	   	 		    $("#instate").append(options);
 	   	 			$("#instate").selectpicker("refresh");
 	   	 		}
 	      		 
 	      	 });
			
		}else{
			 const box0 = document.getElementById('state');
			 box0.style.display = 'none'; 
			 
            const box00 = document.getElementById('districts'); 
            box00.style.display = 'none';
            
            const x1 = document.getElementById("indianstate");
            x1.style.display = 'none'; 
           
    	    const p1 = document.getElementById("indiandistricts");
    	    p1.style.display = 'none'; 
    	    
    	    const instate = document.getElementById('instate');
    	    instate.style.display = 'none';
    	    
    	    const otherthanindianstate1 = document.getElementById('otherthanindianstate');
    	    otherthanindianstate1.style.display = 'none';
    	    

    	    const otherthanindiandistricts1 = document.getElementById('otherthanindiandistricts');
    	    otherthanindiandistricts1.style.display = 'none';
			
		}
		
	}
	
	
	
	function showeditstatediv(){
		const indianstate = document.getElementById('indianstate');
		indianstate.style.display = 'block';
		
		const otherthanindianstate = document.getElementById('otherthanindianstate');
		otherthanindianstate.style.display = 'none';
		
		 $.ajax({
	      		type: 'GET',
	   	 		dataType: 'json',
	   	 		url :'${pageContext.request.contextPath}/getStateList',
	   	 		data : ({'country':101}),
	   	 		success : function(data){
	   	 			console.log(data);
	   	 			var instate = $('#instate');
	   	 		    instate.find('option').remove();
	   	 			var options = '';
	   	 			options +='<option value=\"\">Select</option>'
	   	 			 for (var i = 0; i < data.length; i++) {
	   	 			      options += '<option value="' + data[i].stateid + '">' + data[i].statename +'</option>';
	   	 			}
	   	 		    $("#instate").append(options);
	   	 			$("#instate").selectpicker("refresh");
	   	 		}
	      		 
	      	 });
		
	}
	
	
	
	function showedcountrysdiv(){
		
		const countrys1 = document.getElementById('countrys1');
		countrys1.style.display = 'none'; 
		
		 var c = document.getElementById("country01");
	     c.style.display = "block";
	     
	     var region = $('select[name=countrytype]').val();
 		
 		if(region==1){
 			 $.ajax({
 	      		type: 'GET',
 	   	 		dataType: 'json',
 	   	 		url :'${pageContext.request.contextPath}/getcountrylist',
 	   	 		success : function(data){
 	   	 			//alert(JSON.stringify(data));
 	   	 			var country = $('#country');
 	   	 		    country.find('option').remove();
 	   	 			var options = '';
 	   	 			options +='<option value=\"\">Select</option>'
 	   	 			 for (var i = 0; i < data.length; i++) {
 	   	 			      options += '<option value="' + data[i].countryid + '">' + data[i].name +'</option>';
 	   	 			}
 	   	 		    $("#country").append(options);
 	   	 			$("#country").selectpicker("refresh");
 	   	 		}
 	      		 
 	      	 });
 			
 		}else if(region==2){
 			
 			$.ajax({
	      		type: 'GET',
	   	 		dataType: 'json',
	   	 		url :'${pageContext.request.contextPath}/getExceptIndia',
	   	 		success : function(data){
	   	 			//alert(JSON.stringify(data));
	   	 			var country = $('#country');
	   	 		    country.find('option').remove();
	   	 			var options = '';
	   	 			options +='<option value=\"\">Select</option>'
	   	 			 for (var i = 0; i < data.length; i++) {
	   	 			      options += '<option value="' + data[i].countryid + '">' + data[i].name +'</option>';
	   	 			}
	   	 		    $("#country").append(options);
	   	 			$("#country").selectpicker("refresh");
	   	 		}
	      		 
	      	 });
 		}else if(region==3){
 			 $.ajax({
   	      		type: 'GET',
   	   	 		dataType: 'json',
   	   	 		url :'${pageContext.request.contextPath}/getOnlyIndia',
   	   	 		success : function(data){
   	   	 			//alert(JSON.stringify(data));
   	   	 			var country = $('#country');
   	   	 		    country.find('option').remove();
   	   	 			var options = '';
   	   	 			 for (var i = 0; i < data.length; i++) {
   	   	 			      options += '<option value="' + data[i].countryid + '">' + data[i].name +'</option>';
   	   	 			}
   	   	 		    $("#country").append(options);
   	   	 			$("#country").selectpicker("refresh");
   	   	 		}
   	      		 
   	      	 });
 		}
 		
	     
	}

	function showeBothdiv(){
		
		var editinternationalanddomastic = document.getElementById("editinternationalanddomastic");
		editinternationalanddomastic.style.display = "none";
		
		var c = document.getElementById("country01");
	     c.style.display = "block";
	     
	     $.ajax({
	      		type: 'GET',
	   	 		dataType: 'json',
	   	 		url :'${pageContext.request.contextPath}/getcountrylist',
	   	 		success : function(data){
	   	 			//alert(JSON.stringify(data));
	   	 			var country = $('#country');
	   	 		    country.find('option').remove();
	   	 			var options = '';
	   	 			options +='<option value=\"\">Select</option>'
	   	 			 for (var i = 0; i < data.length; i++) {
	   	 			      options += '<option value="' + data[i].countryid + '">' + data[i].name +'</option>';
	   	 			}
	   	 		    $("#country").append(options);
	   	 			$("#country").selectpicker("refresh");
	   	 		}
	      		 
	      	 });
	}
	
function showedinternationalcountrysdiv(){
		
		const editinternatioanCountry = document.getElementById('editinternatioanCountry');
		editinternatioanCountry.style.display = 'none'; 
		
		 var country01 = document.getElementById("country01");
		 country01.style.display = "block";
		 
		 $.ajax({
	      		type: 'GET',
	   	 		dataType: 'json',
	   	 		url :'${pageContext.request.contextPath}/getExceptIndia',
	   	 		success : function(data){
	   	 			//alert(JSON.stringify(data));
	   	 			var country = $('#country');
	   	 		    country.find('option').remove();
	   	 			var options = '';
	   	 			options +='<option value=\"\">Select</option>'
	   	 			 for (var i = 0; i < data.length; i++) {
	   	 			      options += '<option value="' + data[i].countryid + '">' + data[i].name +'</option>';
	   	 			}
	   	 		    $("#country").append(options);
	   	 			$("#country").selectpicker("refresh");
	   	 		}
	      		 
	      	 });
		 
	}
	//
	
		function contrytype(){
    		
    		var region = $('select[name=countrytype]').val();
    		
    		if(region == 2){
    						
    			 $.ajax({
     	      		type: 'GET',
     	   	 		dataType: 'json',
     	   	 		url :'${pageContext.request.contextPath}/getExceptIndia',
     	   	 		success : function(data){
     	   	 			//alert(JSON.stringify(data));
     	   	 			var country = $('#country');
     	   	 		    country.find('option').remove();
     	   	 			var options = '';
     	   	 			options +='<option value=\"\">Select</option>'
     	   	 			 for (var i = 0; i < data.length; i++) {
     	   	 			      options += '<option value="' + data[i].countryid + '">' + data[i].name +'</option>';
     	   	 			}
     	   	 		    $("#country").append(options);
     	   	 			$("#country").selectpicker("refresh");
     	   	 		}
     	      		 
     	      	 });
    			 
    			 
                const box0 = document.getElementById('state');
    			 box0.style.display = 'none'; 
    			 
                const box00 = document.getElementById('districts'); 
                box00.style.display = 'none';
                
                const x1 = document.getElementById("indianstate");
                x1.style.display = 'none'; 
               
	    	    const p1 = document.getElementById("indiandistricts");
	    	    p1.style.display = 'none'; 
	    	    
	    	    const instate = document.getElementById('instate');
	    	    instate.style.display = 'none';
	    	    
	    	    const otherthanindianstate1 = document.getElementById('otherthanindianstate');
	    	    otherthanindianstate1.style.display = 'none';
	    	    

	    	    const otherthanindiandistricts1 = document.getElementById('otherthanindiandistricts');
	    	    otherthanindiandistricts1.style.display = 'none';
	    	    
    		}
    		
    		if(region == 3){
    			
    			 $.ajax({
      	      		type: 'GET',
      	   	 		dataType: 'json',
      	   	 		url :'${pageContext.request.contextPath}/getOnlyIndia',
      	   	 		success : function(data){
      	   	 			//alert(JSON.stringify(data));
      	   	 			var country = $('#country');
      	   	 		    country.find('option').remove();
      	   	 			var options = '';
      	   	 			 for (var i = 0; i < data.length; i++) {
      	   	 			      options += '<option value="' + data[i].countryid + '">' + data[i].name +'</option>';
      	   	 			}
      	   	 		    $("#country").append(options);
      	   	 			$("#country").selectpicker("refresh");
      	   	 		}
      	      		 
      	      	 });
    			 
    			 
                const box0 = document.getElementById('state');
    			 box0.style.display = 'block'; 
    			 
                const box00 = document.getElementById('districts'); 
                box00.style.display = 'block';
    			 
          			 var x = document.getElementById("indianstate");
    	    		var y = document.getElementById("otherthanindianstate");
    	    		
    	    		var p = document.getElementById("indiandistricts");
    	    		var q = document.getElementById("otherthanindiandistricts");
    	    	
    	    		if (p.style.display === "none")
    		  		   {
    		  			    p.style.display = "block";
    		  		   } 
    	    		
    	    		if (q.style.display === "block")
    		  		   {
    		  			    q.style.display = "none";
    		  		   } 
    	    		
    	    		if (x.style.display === "none")
    		  		   {
    		  			    x.style.display = "block";
    		  		   } 
    	 		
    	 		    if (y.style.display === "block")
    		  		   {
    		  			    y.style.display = "none";
    		  		   }
    			 
    			 $.ajax({
     	      		type: 'GET',
     	   	 		dataType: 'json',
     	   	 		url :'${pageContext.request.contextPath}/getStateList',
     	   	 		data : ({'country':101}),
     	   	 		success : function(data){
     	   	 			console.log(data);
     	   	 			var instate = $('#instate');
     	   	 		    instate.find('option').remove();
     	   	 			var options = '';
     	   	 			options +='<option value=\"\">Select</option>'
     	   	 			 for (var i = 0; i < data.length; i++) {
     	   	 			      options += '<option value="' + data[i].stateid + '">' + data[i].statename +'</option>';
     	   	 			}
     	   	 		    $("#instate").append(options);
     	   	 			$("#instate").selectpicker("refresh");
     	   	 		}
     	      		 
     	      	 });

    			
    		}
    		
    		if(region == 1){
				
    			 $.ajax({
      	      		type: 'GET',
      	   	 		dataType: 'json',
      	   	 		url :'${pageContext.request.contextPath}/getcountrylist',
      	   	 		success : function(data){
      	   	 			//alert(JSON.stringify(data));
      	   	 			var country = $('#country');
      	   	 		    country.find('option').remove();
      	   	 			var options = '';
      	   	 			options +='<option value=\"\">Select</option>'
      	   	 			 for (var i = 0; i < data.length; i++) {
      	   	 			      options += '<option value="' + data[i].countryid + '">' + data[i].name +'</option>';
      	   	 			}
      	   	 		    $("#country").append(options);
      	   	 			$("#country").selectpicker("refresh");
      	   	 		}
      	      		 
      	      	 });
     			 
     			 
                 const box0 = document.getElementById('state');
     			 box0.style.display = 'none'; 
     			 
                 const box00 = document.getElementById('districts'); 
                 box00.style.display = 'none';
                 
                 const x1 = document.getElementById("indianstate");
                 x1.style.display = 'none'; 
                
 	    	    const p1 = document.getElementById("indiandistricts");
 	    	    p1.style.display = 'none'; 
 	    	    
 	    	    const instate = document.getElementById('instate');
 	    	    instate.style.display = 'none';
 	    	    
 	    	    const otherthanindianstate1 = document.getElementById('otherthanindianstate');
 	    	    otherthanindianstate1.style.display = 'none';
 	    	    

 	    	    const otherthanindiandistricts1 = document.getElementById('otherthanindiandistricts');
 	    	    otherthanindiandistricts1.style.display = 'none';

   		}
    		
    		
    		
  }
    	
    
    function getStateList()
    {
    	var country = $('select[name=country]').val();
    	
    	if(country === "101")
    		{
    		var x = document.getElementById("indianstate");
    		var y = document.getElementById("otherthanindianstate");
    		
    		var p = document.getElementById("indiandistricts");
    		var q = document.getElementById("otherthanindiandistricts");
    		
    		if (p.style.display === "none")
	  		   {
	  			    p.style.display = "block";
	  		   } 
    		
    		if (q.style.display === "block")
	  		   {
	  			    q.style.display = "none";
	  		   } 
    		
    		if (x.style.display === "none")
	  		   {
	  			    x.style.display = "block";
	  		   } 
 		
 		    if (y.style.display === "block")
	  		   {
	  			    y.style.display = "none";
	  		   }
    		
    		 $.ajax({
    	      		type: 'GET',
    	   	 		dataType: 'json',
    	   	 		url :'${pageContext.request.contextPath}/getStateList',
    	   	 		data : ({'country':country}),
    	   	 		success : function(data){
    	   	 			console.log(data);
    	   	 			var instate = $('#instate');
    	   	 		    instate.find('option').remove();
    	   	 			var options = '';
    	   	 			options +='<option value=\"\">Select</option>'
    	   	 			 for (var i = 0; i < data.length; i++) {
    	   	 			      options += '<option value="' + data[i].stateid + '">' + data[i].statename +'</option>';
    	   	 			      /* alert(options); */
    	   	 			}
    	   	 		    $("#instate").append(options);
    	   	 			$("#instate").selectpicker("refresh");
    	   	 		}
    	      		 
    	      	 });

           }
    	else
    		{
    		var x1 = document.getElementById("indianstate");
    		var y1 = document.getElementById("otherthanindianstate");
    		
    		var p1 = document.getElementById("indiandistricts");
    		var q1 = document.getElementById("otherthanindiandistricts");
    		
    		if (x1.style.display === "block")
	  		   {
	  			    x1.style.display = "none";
	  		   } 
		
		    if (y1.style.display === "none")
	  		   {
	  			    y1.style.display = "block";
	  		   }
    		
    		if (p1.style.display === "block")
	  		   {
	  			    p1.style.display = "none";
	  		   } 
    		
    		if (q1.style.display === "none")
	  		   {
	  			    q1.style.display = "block";
	  		   } 
    		}
    }
    
    function getCityList()
    {
    	var country = $('select[name=country]').val();
    	
    	var instate = $('select[name=instate]').val();
    	
    	if(country==null){
    		
    		var x = document.getElementById("indianstate");
    		var y = document.getElementById("otherthanindianstate");
    		
    		var p = document.getElementById("indiandistricts");
    		var q = document.getElementById("otherthanindiandistricts");
    		
    		if (p.style.display === "none")
	  		   {
	  			    p.style.display = "block";
	  		   } 
    		
    		if (q.style.display === "block")
	  		   {
	  			    q.style.display = "none";
	  		   } 
    		
    		if (x.style.display === "none")
	  		   {
	  			    x.style.display = "block";
	  		   } 
 		
 		    if (y.style.display === "block")
	  		   {
	  			    y.style.display = "none";
	  		   }
 		    
 		   $.ajax({
	      		type: 'GET',
	   	 		dataType: 'json',
	   	 		url :'${pageContext.request.contextPath}/getCityList',
	   	 		data : ({'instate' : instate}),
	   	 		success : function(data){
	   	 			console.log(data);
	   	 			var indistricts = $('#indistricts');
	   	 		    indistricts.find('option').remove();
	   	 			var options = '';
	   	 			options +='<option value=\"\">Select</option>'
	   	 			 for (var i = 0; i < data.length; i++) {
	   	 			      options += '<option value="' + data[i].districtid + '">' + data[i].districtname +'</option>';
	   	 			      /* alert(options); */
	   	 			}
	   	 		    $("#indistricts").append(options);
	   	 			$("#indistricts").selectpicker("refresh");
	   	 		}
	      		 
	      	 });

    		
    	}else if(country === "101")
    		{
	    		var x = document.getElementById("indianstate");
	    		var y = document.getElementById("otherthanindianstate");
	    		
	    		var p = document.getElementById("indiandistricts");
	    		var q = document.getElementById("otherthanindiandistricts");
	    		
	    		if (p.style.display === "none")
		  		   {
		  			    p.style.display = "block";
		  		   } 
	    		
	    		if (q.style.display === "block")
		  		   {
		  			    q.style.display = "none";
		  		   } 
	    		
	    		if (x.style.display === "none")
		  		   {
		  			    x.style.display = "block";
		  		   } 
	 		
	 		    if (y.style.display === "block")
		  		   {
		  			    y.style.display = "none";
		  		   }
	 		    
	 		   $.ajax({
   	      		type: 'GET',
   	   	 		dataType: 'json',
   	   	 		url :'${pageContext.request.contextPath}/getCityList',
   	   	 		data : ({'instate' : instate}),
   	   	 		success : function(data){
   	   	 			console.log(data);
   	   	 			var indistricts = $('#indistricts');
   	   	 		    indistricts.find('option').remove();
   	   	 			var options = '';
   	   	 			options +='<option value=\"\">Select</option>'
   	   	 			 for (var i = 0; i < data.length; i++) {
   	   	 			      options += '<option value="' + data[i].districtid + '">' + data[i].districtname +'</option>';
   	   	 			      /* alert(options); */
   	   	 			}
   	   	 		    $("#indistricts").append(options);
   	   	 			$("#indistricts").selectpicker("refresh");
   	   	 		}
   	      		 
   	      	 });

	 		    
    		}
    	else
    		{
	    		var x1 = document.getElementById("indianstate");
	    		var y1 = document.getElementById("otherthanindianstate");
	    		
	    		var p1 = document.getElementById("indiandistricts");
	    		var q1 = document.getElementById("otherthanindiandistricts");
	    		
	    		if (x1.style.display === "block")
		  		   {
		  			    x1.style.display = "none";
		  		   } 
			
			    if (y1.style.display === "none")
		  		   {
		  			    y1.style.display = "block";
		  		   }
	    		
	    		if (p1.style.display === "block")
		  		   {
		  			    p1.style.display = "none";
		  		   } 
	    		
	    		if (q1.style.display === "none")
		  		   {
		  			    q1.style.display = "block";
		  		   } 
    		}
    }
	
	
	//
	function warning()
	{
		      var msg = $("#savemsg").val();
		 
	          if(msg == "'success'")
	    	  {
	    	    swal({title: "Done", text: "Event Added Successfully!", icon:"success"}).then(function(){ 
	  			      window.location.href="enquiries";
	    	 		});
	    	  }
	          
	          if(msg == "'successlead'")
	    	  {
	    	    swal({title: "Done", text: "Event Added Successfully!", icon:"success"}).then(function(){ 
	  			      window.location.href="leads";
	    	 		});
	    	  }
	          
	          if(msg == "'successleadfromenquiry'")
	    	  {
	    	    swal({title: "Done", text: "Lead Added Successfully!", icon:"success"}).then(function(){ 
	  			      window.location.href="leads";
	    	 		});
	    	  }
	     
		     if(msg == "'successpo'")
		   	  {
		   	    swal({title: "Done", text: "Event Added Successfully!", icon:"success"}).then(function(){ 
		 			      window.location.href="customers";
		   	 		});
		   	  }
	      
	           if(msg == "'successcontact'")
		   	  {
		   	    swal({title: "Done", text: "Enquiry Added Successfully!", icon:"success"}).then(function(){ 
		 			      window.location.href="enquiries";
		   	 		});
		   	  }
	           
	           if(msg == "'donedeal'")
		    	  {
		    	    swal({title: "Done", text: "Deal Added Successfully!", icon:"success"}).then(function(){ 
		  			      window.location.href="customers";
		    	 		});
		    	  }
	           
	           if(msg == "'editenquirysuccess'")
			   	  {
			   	    swal({title: "Done", text: "Enquiry Details Modified Successfully!", icon:"success"}).then(function(){ 
			 			      window.location.href="enquiries";
			   	 		});
			   	  }
	           
	           if(msg == "'editleadsuccess'")
			   	  {
			   	    swal({title: "Done", text: "Lead Details Modified Successfully!", icon:"success"}).then(function(){ 
			 			      window.location.href="leads";
			   	 		});
			   	  }
	      
			 if(msg == "'failure'")
				{
					swal({title: "Error", text: "Something went Wrong!", icon:"error"}).then(function(){  
				 			      window.location.href="enquiries";
				   	 	});
				}
	      
	           if(msg == "'failurepo'")
	   	        {
		    	  swal({title: "Error", text: "Something went Wrong!", icon:"error"}).then(function(){  
	 			      window.location.href="leads";
	   	 		      });
		    	  
	   	        }
	           
	           if(msg == "'errordeal'")
	   	        {
		    	  swal({title: "Error", text: "Something went Wrong!", icon:"error"}).then(function(){  
	 			      window.location.href="customers";
	   	 		      });
		    	  
	   	        }
	           
	           
	  }

	window.onbeforeunload = warning();
	function addEnquiry()
	 {
		 window.location.href =  "enquiry";
	 }
	</script>
	
	
	<script type="text/javascript">
		
	
	
	 function showotherpofevent()
	    {
	    	var pofevent = $('select[name=purposeOfEvent]').val();
	    	
	    	if(pofevent === 'Other')
	    		{
	    		  var x = document.getElementById("otherpofevent");
		  		  if (x.style.display === "none")
		  		      {
		  			    x.style.display = "block";
		  			  } 
	    		}
	    	else
	    		{
	    		var x = document.getElementById("otherpofevent");
		  		if (x.style.display === "block")
		  		   {
		  			    x.style.display = "none";
		  		   } 
	    		}
	    }
	 
	 function getDocumentDetails(crmid)
	 {
         var t = $('#editleaddocumenttab').DataTable();
		 
		 t.clear().draw();
		 
		 $.ajax({
			    type:'GET',
				dataType: 'json',
		 		url :'${pageContext.request.contextPath}/getDocumentDetails',
		 		data : ({'crmid':crmid}),
		 		success : function(data)
		 		{
// 		 		    console.log("getDetailsToaddEvent"+data.length);
                        for(var i=0;i<data.length;i++)
		 				{
                          $("#editleaddocumentsize").val(data[0].docsize);
                        	
		 				  t.row.add([
	  	 			            i+1,
	  	 			            data[i].documentname,
	  	 			            '<td><a href="downloadLeadDocument?doc_id='+data[i].leaddocumentid+'"><i class="material-icons">file_download</i></a></td>',
	  	 			            '<td><button type="button" class="btn waves-effect waves-light" title="Delete Document" onclick="DelExistLeadDocument('+data[i].leaddocumentid+','+i+','+crmid+')"><i class="material-icons">delete</i></button></td>'
	  	 			            ]).draw( false );
		 				}
		 		}
		  });
	 }
	 
	 function setDetailsforAddEvent(crmid)
	 {
		 var recordstitle = $("#recordstitle").val();
		
		 var t = $('#contactdetails').DataTable();
		 
		 t.clear().draw();
		 
		 $.ajax({
			    type:'GET',
				dataType: 'json',
		 		url :'${pageContext.request.contextPath}/getDetailsToaddEvent',
		 		data : ({'crmid':crmid}),
		 		success : function(data)
		 		{
		 			$("#cemrecordsid").val(data.crmrecordid);
		 			
	//	 			alert(alert(JSON.stringify(data)));
		 			
	//	 			alert(alert(JSON.stringify(data.countrytype)));
		 			
		 			console.log("getDetailsToaddEvent"+data);
		 			$("#datasource").val(data.crmDataSource.datasource);
		 			
		 			$("#companyname").val(data.companyname);
		 			
		 			$("#nickname").val(data.nickname);
		 			
		 			$("#employeesize").val(data.employeesize);
		 			
		 			$("#annualturnover").val(data.annualturnover);
		 			
		 			$("#offering").val(data.offering);
		 			
		 			$("#crmeventdetails").val(data.crmevent);
		 			
		 			$("#purposeofeventdetails").val(data.purposeofevent);
		 			
//                     $("#countrytype000").val(data.countrytype);
                    		 			
		 			$("#country000").val(data.country);
		 			
		 			$("#statusofeventdetails").val(data.status);
		 			
		 			$("#state000").val(data.state);
		 			
		 			$("#district000").val(data.district);
		 			
		 			var empid=data.createdby.empid;
		 		     
		 		    $.ajax({
		 				type: 'GET',
		 			 		dataType: 'json',
		 			 		url :'${pageContext.request.contextPath}/getAssignedterritory',
		 			 		data : ({'assigned_id' : empid}),
		 			 		success : function(data){
		 			 			var country = $('#countrytype000');
		 			 		    country.find('option').remove();
		 			 			var options = '';
		 			 		for (var i = 0; i < data.length; i++) {

		 			 			$("#countrytype000").val(data[i].territory_id.territory_name);
		 			 			
		 			 		}
		 			 	}
		 		    	  	   	 			
		 		});
		 			
		 		    
		 			if(data.country != "India"){
		 				//alert(data.countrytype);
		 			
		 				const hidestate = document.getElementById('hidestate');
		 				hidestate.style.display = 'none'; 
		    			
		    			 const hidedistrict = document.getElementById('hidedistrict');
		    			 hidedistrict.style.display = 'none'; 
		    			 
		    			 const box1 = document.getElementById('district000');
		    			 box1.style.display = 'none';
		    			 
		    			 const expmount = document.getElementById('expmount');
		    			 expmount.style.display = 'none';
		    			 
		 			}else{

		 				
		 			}
		    			 
		 			$("#primarysalesperson option[value='"+data.primarysalesperson.empid+"']").prop("selected",true);
		    		 $("#primarysalesperson").selectpicker("refresh");
		 			
		    		 var projTech = $('select[name=primarysalesperson]').val();
		    		 
		    		 
		    		 $("#secondarysalesperson option[value='"+data.secondarysalesperson.empid+"']").prop("selected",true);
		    		 $("#secondarysalesperson").selectpicker("refresh");
		 			
		    		 var projTech = $('select[name=secondarysalesperson]').val();
		    		 
		    		 
		    		 $("#presalesperson option[value='"+data.presalesperson.empid+"']").prop("selected",true);
		    		 $("#presalesperson").selectpicker("refresh");
		 			
		    		 var projTech = $('select[name=secondarysalesperson]').val();
		    		 
		    		 
		    		 $("#bdhead option[value='"+data.bdhead.empid+"']").prop("selected",true);
		    		 $("#bdhead").selectpicker("refresh");
		 			
		    		 var projTech = $('select[name=bdhead]').val();
		    		 
		 			
		 			if(data.status === 'PO')
		 				{
		 				$("#statusofeventdetails").val("Order");
		 				}
		 			else
		 				{
		 				$("#statusofeventdetails").val(data.status);
		 				}
		 			
		 			$("#cemrecordsid").val(data.crmrecordid);
		 			
		 		}
			 
		       });
		 
		 $.ajax({
			    type:'GET',
				dataType: 'json',
		 		url :'${pageContext.request.contextPath}/getContactDetails',
		 		data : ({'crmid':crmid}),
		 		success : function(data)
		 		{
		 			
		 		    console.log("getDetailsToaddEvent"+data.length);
		 			
		 			for(var i=0;i<data.length;i++)
		 				{
		 				  t.row.add( [
	  	 			            i+1,
	  	 			            data[i].contactname,
	  	 			            data[i].designation,
	  	 			            data[i].mobileno,
	  	 			            data[i].officeno,
	  	 			            data[i].emailid,
	  	 			            data[i].altemail,
	  	 			            data[i].authority
								] ).draw( false );
		 				
		 				}
		 		}
		      });
		 
		 
		$.ajax({    
			        type:'GET',
					dataType: 'json',
			 		url :'${pageContext.request.contextPath}/getstatusofcrmevents',
			 		data : ({'recordstitle':recordstitle}),
			 		success : function(data)
			 		{
			 			var status = $('#status');
			 			status.find('option').remove();
		  	 			var options = '';
			 			console.log("getDetailsToaddEvent"+data.length);
			 			options +='<option value=\"\">Select</option>'
			 			for(var i=0;i<data.length;i++)
			 				{
			 				 /* options += '<option value="' + data[i].eventstatus + '">' + data[i].eventstatus  + '</option>'; */
			 				options += '<option value="' + data[i].eventstatus + '">' + data[i].eventstatusname  + '</option>';
			 				}
			 			$("#status").append(options);
			 			$("#status").selectpicker("refresh");
			 		}
		           
		   });
			
	 }
	 
	 
// 	 <script type="text/javascript">
//      function codeAddress() {
     	
//      	 var countrytype1 = $("#countrytype").val();
     	 
//      	 alert("Countrytype======>"+countrytype1);
     	 
//      	 if(countrytype1 ===""){
     		 		 
//      		 const states3 = document.getElementById('states3');
     		 
//               states3.style.display = 'none'; 
     	
//      	 }
     	 
     	 
//      	 if(countrytype1 ==="Domestic"){
     		 		 
//      		 const currencytype122 = document.getElementById('currencytype122');
     		 
//      		 currencytype122.style.display = 'none'; 
     		 
//              const curr12 = document.getElementById('curr12');
     		 
//              curr12.style.display = 'none'; 
             
//              const state222 = document.getElementById('state2');
     		 
//              state222.style.display = 'none'; 
     		 
     		 
     	
//      	 }
         
//      }
//      window.onload = codeAddress;
<!--      </script> -->
	 
	 <script>
	 function viewCompanyDetails()
	 {
		 var x = document.getElementById("companydetails");
  		 var y = document.getElementById('companydetails').style.display;
	  		if(y == "block")
				{
	  		      $('#compdetails').html("<i class='material-icons'>keyboard_arrow_down</i>");
				  x.style.display = "none";
				}
				else
				{
				  $('#compdetails').html("<i class='material-icons'>keyboard_arrow_up</i>");
				  x.style.display = "block";
				}
	 }
	 </script>
	 
	 <script type="text/javascript">
	         function submitionofaddevent()
	         {
	        	 var event = $("#crmevent").val();
	        	 
	        	 var purposeofevent =  $("#purposeofevent").val();
	        	 
	        	 var status =  $('select[name=status]').val();
	        	 
	        	 var ponumber =  $("#ponumber").val();
	        	 
	        	 var podate =  $("#podate").val();
	        	 
	        	 var poamount =  $("#poamount").val();
	        	 
	        	 var needbydate =  $("#needbydate").val();
	        	 
	        	 
	        	 
	        	 if(event == "")
	        		 {
	        		   alert("Enter Event!");
	        		   return false;
	        		 }
	        	 
	        	 if(purposeofevent == "")
	        		 {
	        		   alert("Enter Event Stages !");
	        		   return false;
	        		 }
	        	 else
	        		 {
	        		     if(purposeofevent === "Other")
	        			 {
	        			    var othpurposeofevent =  purposeofevent;
	        			    
	        			    if(othpurposeofevent == "")
	        			    	{
	        			    	   alert("Enter Event Stages!");
	        	        		   return false;
	        			    	}
	        			 }
	        		 }
	        	 
	        	 if(status == "")
	        		 {
	        		    alert("Enter Status !");
	        		    return false;
	        		 }
	        	 
	        	 if(status == "PO")
        		 {
	        		 
	        		 
	        		 var doclenthtable = document.getElementsByName("document_name");;
					 
					 if(doclenthtable.length === 0)
					 {
					    alert("Please enter documents detail!");
					    return false;
					 }
					 
					 var tlength = $('#tab tr').length-2;
	   		      
	   		      for(let i=0;i<tlength;i++){
	   		    	  
	   		    	   var document_name1 = $('#document_name'+i).val();
	   					 
	   					 var document_upload = $('#document_upload'+i).val();
	   		    	  
	   		    	  if(document_name1==""){
	   		    		  alert("Please enter document !");
	   		    		  return false;
	   		    	  }
	   		    	  
	   		    	  if(document_upload==""){
	   		    		  alert("Please upload document !");
	   		    		  return false;
	   		    	  }
	   		      }
	        		 
	        		 
	        		 if(ponumber==""){
	        			 
	        			 alert("Please enter po number !");
	        			 return false;
	        		 }
	        		 
	        		 if(podate==""){
	        			 alert("Please enter po date !");
	        			 return false;
	        		 }
	        		 
	        		 if(poamount==""){
	        			 alert("Please enter po amount !");
	        			 return false;
	        		 }
	        		 
	        		 if(needbydate==""){
	        			 alert("Please enter need by date !");
	        			 return false;
	        		 }
	        		 
        		 
        		 }
	        	 
	        	 
	        	 if(status == "Converted to Lead")
	        		 {
	        		      /* console.log("in convert to lead block"); */
	        		      
	        		      var doclenthtable = document.getElementsByName("document_name");;
	        		      
	        		      
				 
// 						 if(doclenthtable.length === 0)
// 						 {
// 						    alert("Please Enter Documents Detail!");
// 						    return false;
// 						 }
	        		      
	        		      var totallenthtable = $('#tab tr').length;
	        		      
	        		      var projectdesc = $("#projectdesc").val();
	        		      
	        		      var potentialopp = $("#potentialopp").val();
	        		      
	        		      var forecastclose = $("#forecastclosedate").val();
	        		      
	        		      var currencytype2 = $("#currencytype").val();
	        		      
	        		      var countrytype000 = $("#countrytype000").val();
	        		      
	        		      var currencytype = $("#currencytype").val();
	        		      
	        		      var foreigncurrency = $("#foreigncurrency").val();
	        		      
	        		      
	        		      if(projectdesc == "")
        		    	  {
        		    	    alert("Please Enter Project Description!")
        		    	    return false;
        		    	  }
	        		      
	        		      if(forecastclose == "")
        		    	  {
        		    	    alert("Please Enter Target Close Date !")
        		    	    return false;
        		    	  }
	        		      
	        		      if(countrytype000 =="International"){
		        		      
		        		      if(currencytype  === "")
	        		    	  {
	        		    	    alert("Please Enter currency type !")
	        		    	    return false;
	        		    	  }
		        		      
		        		      if(foreigncurrency  == "")
	        		    	  {
	        		    	    alert("Please Enter amount !")
	        		    	    return false;
	        		    	  }
		        		      
		        		      }
	        		      
	        		      if(countrytype000 == "Domestic"){
	        		    	  
		        		      if(potentialopp == "")
	        		    	  {
	        		    	    alert("Please Enter Expected Deal Amount!")
	        		    	    return false;
	        		    	  }
		        		      }
	        		      
	        		      if(totallenthtable == 0)
	        		    	  {
	        		    	    alert("Please submit document!")
	        		    	    return false;
	        		    	  }
	        		      
	        		      
	        		      if(doclenthtable.length === 0)
							 {
							    alert("Please Enter Documents Detail!");
							    return false;
							 }
	        		      
	        		      var tlength = $('#tab tr').length-2;
	        		      
	        		      for(let i=0;i<tlength;i++){
	        		    	  
	        		    	   var document_name1 = $('#document_name'+i).val();
	        					 
	        					 var document_upload = $('#document_upload'+i).val();
	        		    	  
	        		    	  if(document_name1==""){
	        		    		  alert("Please enter document !");
	        		    		  return false;
	        		    	  }
	        		    	  
	        		    	  if(document_upload==""){
	        		    		  alert("Please upload document !");
	        		    		  return false;
	        		    	  }
	        		      }
	        		      
	        		 }
	        	 
	        	var aa = confirm('Do you want to submit ?');
	        		
	        	if(aa == true)
	        		{
	        		 $("#addeventid").submit(); 
	        		}
	        	else
	        		{
	        		return false;
	        		}
	         }
	 </script>
	 
	 <script type="text/javascript">
	 function AddRow()
	  {
		  console.log("inside add row");
		  var lenthtable = $('#tab tr').length - 2;
		  $('#tab tbody tr').last().after('<tr id="test'+lenthtable+'">'
		  +'<td class="text-center" style="min-width: 50px; width: 50px;">'+(lenthtable)+'</td>'
		  +'<td class="text-center" style="min-width: 150px; width: 150px;"><div class="form-group" ><div class="form-line"><input type="text" class="form-control" style="width:100%;color:black;text-align:centre;" id="document_name'+lenthtable+'" name="document_name" maxlength="100" placeholder="Enter Document Name"/></div></div></td>'
		  +'<td class="text-center" style="min-width: 150px; width: 150px;"><input type="file" style="width:100%;color:black;text-align:centre;" id="document_upload'+lenthtable+'" name="document_upload"/></td>'
		  +'<td class="text-center" style="min-width: 50px; width: 50px;"><button type="button" class="btn waves-effect waves-light" title="Delete Document" onclick="DelRow('+lenthtable+')"><i class="material-icons">delete</i></button></td>'
		  +'</tr>');
	  }
	 
	 
	 function AddRowDeal()
	  {
		  console.log("inside add row");
		  var lenthtable = $('#deal tr').length - 2;
		  $('#deal tbody tr').last().after('<tr id="test1'+lenthtable+'">'
				  +'<td class="text-center" style="min-width: 50px; width: 50px;">'+(lenthtable)+'</td>'
				  +'<td class="text-center" style="min-width: 150px; width: 150px;"><div class="form-group" ><div class="form-line"><input type="text" class="form-control" style="width:100%;color:black;text-align:centre;" id="dealdocument_name'+lenthtable+'" name="dealdocument_name" maxlength="100" placeholder="Enter Document Name"/></div></div></td>'
				  +'<td class="text-center" style="min-width: 150px; width: 150px;"><input type="file" style="width:93%;color:black;text-align:centre;padding-left: 38%;" id="dealdocument_upload'+lenthtable+'" name="dealdocument_upload"/></td>'
				  +'<td class="text-center" style="min-width: 50px; width: 50px;"><button type="button" class="btn waves-effect waves-light" title="Delete Document" onclick="DelDealRow('+lenthtable+')"><i class="material-icons">delete</i></button></td>'
				  +'</tr>');
	  }
	 
	 function updateAddRowDeal()
	  {
		  var lenthtable1 = $('#updatedeal tr').length - 2;
		  $('#updatedeal tbody tr').last().after('<tr id="test2'+lenthtable1+'">'
				  +'<td class="text-center" style="min-width: 50px; width: 50px;">'+(lenthtable1)+'</td>'
				  +'<td class="text-center" style="min-width: 150px; width: 150px;"><div class="form-group" ><div class="form-line"><input type="text" class="form-control" style="width:100%;color:black;text-align:centre;" id="updatedealdocument_name'+lenthtable1+'" name="updatedealdocument_name" maxlength="100" placeholder="Enter Document Name"/></div></div></td>'
				  +'<td class="text-center" style="min-width: 150px; width: 150px;"><input type="file" style="width:93%;color:black;text-align:centre;padding-left: 38%;" id="updatedealdocument_upload'+lenthtable1+'" name="updatedealdocument_upload"/></td>'
				  +'<td class="text-center" style="min-width: 50px; width: 50px;"><button type="button" class="btn waves-effect waves-light" title="Delete Document" onclick="updateDelDealRow('+lenthtable1+')"><i class="material-icons">delete</i></button></td>'
				  +'</tr>');
	  }
	 
	 
	 function DelRow(inputtxt)
	  {
		  console.log("inside delete row");
		  var totallenthtable = $('#tab tr').length;
		  $("#test"+inputtxt).remove();
      } 
	 
	 function DelDealRow(inputtxt)
	  {
		  var totallenthtable = $('#deal tr').length;
		  $("#test1"+inputtxt).remove();
     } 
	 
	 function updateDelDealRow(inputtxt)
	  {
		  console.log("inside delete row");
		  var totallenthtable = $('#updatedeal tr').length;
		  $("#test2"+inputtxt).remove();
     } 
	 
	 function showleadinfodiv()
	 {
		 
		 var status = $('select[name=status]').val();
		 
		 
		 var x = document.getElementById("converttoleads");
		 
		 
		 var y = document.getElementById("converttopo");
		 
		 var crmrecordid = document.getElementById("cemrecordsid").value;
		 
		 if(status == "Converted to Lead")
			 {
			 
			    if (x.style.display === "none")
	   		      {
	   			    x.style.display = "block";
	   			  } 
			    
			    var countrytype1 = $("#countrytype000").val();
			    
			    var country = $("#country000").val();
			    
			    $.ajax({
				    type:'GET',
					dataType: 'json',
			 		url :'${pageContext.request.contextPath}/getDetailsToaddEvent',
			 		data : ({'crmid':crmrecordid}),
			 		success : function(data)
			 		{
			 			var empid=data.createdby.empid;
			 			
			 		    $.ajax({
			 				type: 'GET',
			 			 		dataType: 'json',
			 			 		url :'${pageContext.request.contextPath}/getAssignedterritory',
			 			 		data : ({'assigned_id' : empid}),
			 			 		success : function(data){
			 			 		for (var i = 0; i < data.length; i++) {
			 			 			$("#currencytype").val(data[i].currency);
			 			 		}
			 			 	}
			 		    	  	   	 			
			 		});
			 			
			 			
			 		}
			    });
			    
				 const globle12 = document.getElementById('globle12');
					 
				 globle12.style.display = 'block';
				
			    
			 }
		 else
			 {
				 if (x.style.display === "block")
	  		      {
	  			    x.style.display = "none";
	  			  } 
			 }
		 
		 if(status == "PO")
			 {
				 if (y.style.display === "none")
	  		      {
	  			    y.style.display = "block";
	  			  } 
			 }
		 else
			 {
				 if (y.style.display === "block")
	 		      {
	 			    y.style.display = "none";
	 			  } 
			 }
	 }
	 
	 function setenquiryDetailsforDeleteEnquiry(crmid)
	 {
		 
		 var aa = confirm('Do you want to Delete Contact ?');
	 		
	     	if(aa == true)
	     		{
	     		$.ajax({
				    type:'GET',
					dataType: 'json',
			 		url :'${pageContext.request.contextPath}/deletecrmrecord',
			 		data : ({'crmid':crmid}),
			 		success : function(data)
			 		{
			 			if(data.errorDescription === "deletesuccess")
					   	  {
					   	        swal({title: "Done", text: "Contact Deleted Successfully!", icon:"success"}).then(function(){ 
					 			      window.location.href="enquiries";
					   	 		});
					   	  }
				      
			 			else if(data.errorDescription === "deletefailure")
					   	  {
				        	   swal({title: "Error", text: "Something went Wrong!", icon:"error"}).then(function(){  
					 			      window.location.href="enquiries";
					   	 	      });
					   	  }
			 		}
				 
			       });
	     		}
	     	else
	     		{
	     		   return false;
	     		}
	}
	 
	 function setDetailsforEditEvent(crmid)
	 {
		
         var recordstitle = $("#recordstitle").val();
         
          if(recordstitle === "enquiry")
		   {
		      document.getElementById("editeventmodel").innerHTML = "Edit Enquiry Details";
		   }
	   
		   if(recordstitle === "Lead")
		   {
			   document.getElementById("editeventmodel").innerHTML = "Edit Lead Details";
		   }
		 
		 var t = $('#editcontactdetails').DataTable();
		 
		 t.clear().draw();
		 
         var x = document.getElementById("editofferingdetails");
		 
		 var y = document.getElementById("editofferingshowdiv");
		   
		 if (x.style.display === "block")
		   {
			 x.style.display = "none";
		   } 
		   
		 if (y.style.display === "none")
		   {
			 y.style.display = "block";
		   } 
		   
		 
		 $.ajax({
			    type:'GET',
				dataType: 'json',
		 		url :'${pageContext.request.contextPath}/getDetailsToaddEvent',
		 		data : ({'crmid':crmid}),
		 		success : function(data)
		 		{
		 			$("#editrecordstitle").val(data.crmtype);
		 			
		 			$("#editacemrecordsid").val(data.crmrecordid);
		 			
		 			$("#editdatasource option[value='"+data.crmDataSource.crmdsid+"']").prop("selected",true);
		 			$("#editdatasource").selectpicker("refresh");
		 			
		 			$("#editofferingshow").val(data.offering);
		 			
		 			$("#editcompanyname").val(data.companyname);
		 			
		 			$("#editnickname").val(data.nickname);
		 			
		 			$("#editemployeesize option[value='"+data.employeesize+"']").prop("selected",true);
		 			$("#editemployeesize").selectpicker("refresh");
		 			
		 			$("#editannualturnover option[value='"+data.annualturnover+"']").prop("selected",true);
		 			$("#editannualturnover").selectpicker("refresh");
		 			
// 		 			$("#countrytype option[value='"+data.countrytype+"']").prop("selected",true);
// 		 			$("#countrytype").selectpicker("refresh");
		 			
		 			$("#isinternatioanlordomestic").val(data.createdby.isInternational);
		 			
                     var regionid=data.countrytype;
		 			
		 			var empid=data.createdby.empid;
		 			
		 			$.ajax({
		 				type: 'GET',
		 			 		dataType: 'json',
		 			 		url :'${pageContext.request.contextPath}/getAssignedterritory',
		 			 		data : ({'assigned_id' : empid}),
		 			 		success : function(data){
		 			 			var country = $('#countrytype');
		 			 		    country.find('option').remove();
		 			 			var options = '';
		 			 		for (var i = 0; i < data.length; i++) {
		 			 			
		 			 			if(data[i].territory_id.is_activated=="Y"){
		 			 			options += '<option value="' + data[i].territory_id.tr_id + '">' + data[i].territory_id.territory_name +'</option>';
		 		 	 			$("#countrytype").append(options);
		 		 				$("#countrytype").selectpicker("refresh");
		 			 			}
		 			 		}
		 			 	}
		 		    	  	   	 			
		 		});
		 			
	 				 
	 				 var countrys1 = document.getElementById("countrys1");   
	 				 countrys1.style.display = "block";
	 				 
	 				$("#countrys").val(data.country);
	 	   	        
	 	   	        $("#editdomestic").val(data.country);
		 			
		 			$("#countrys1").val(data.country);
		 			
		 			$("#editaddress1").val(data.address1);

		 			$("#editaddress2").val(data.address2);
		 			
		 			$("#editcity").val(data.city);
		 			
// 		 			 var c = document.getElementById("country01");   
// 		    	     c.style.display = "none";

		    	     if(data.country =="India"){
	
		    	    	 var c1 = document.getElementById("state");   
			    	     c1.style.display = "block";
			    	     
			    		 var s1 = document.getElementById("districts");   
			    	     s1.style.display = "block";
		    	    	 
		    	    	 var c2 = document.getElementById("otherthanindianstate");   
			    	     c2.style.display = "block";
			    	     
			    	     $("#otherstate").val(data.state);	
			    	     
			    	     var d = document.getElementById("otherthanindiandistricts");   
			    	     d.style.display = "block";
			    	     
			    	     $("#otherdistricts").val(data.district);
		    	    	 
		    	     }else{
		    	    	 var s1 = document.getElementById("districts");   
			    	     s1.style.display = "none";
		    	    	 
		    	      var c1 = document.getElementById("state"); 
                      c1.style.display = "none";
		    	     
			    	 var c3 = document.getElementById("country");   
			    	 c3.style.display = "block";
			    	 
			    	  var box0 = document.getElementById('state');
		    			 box0.style.display = 'none'; 
		    			 
		                const box00 = document.getElementById('districts'); 
		                box00.style.display = 'none';
		                
		                const x1 = document.getElementById("indianstate");
		                x1.style.display = 'none'; 
		               
			    	    const p1 = document.getElementById("indiandistricts");
			    	    p1.style.display = 'none'; 
			    	    
			    	    const instate = document.getElementById('instate');
			    	    instate.style.display = 'none';
			    	    
			    	    const label1 = document.getElementById('label1');
			    	    label1.style.display = 'none';
			    	    
			    	    const otherstate = document.getElementById('otherstate');
			    	    otherstate.style.display = 'none';
		    	     }
		    	     
		    	     $("#countrytype option[value='"+data.countrytype+"']").prop("selected",true);
	 		 		 $("#countrytype").selectpicker("refresh");
		    	   		 					 			
		 			if(data.crmtype === "Lead")
		 				{
		 				
		 			//	alert("Lead");
		 				   var x = document.getElementById("editconverttoleads");
		 				   
		 				   var y = document.getElementById("editconverttopo");
		 				   
		 				   if (x.style.display === "none")
			    		   {
			    			 x.style.display = "block";
			    		   } 
		 				    
		 				   if (y.style.display === "block")
			    		   {
			    			 y.style.display = "none";
			    		   } 
		 				   
		 				  $("#editprojectdesc").val(data.projectdescription);
		 				  
		 				  $("#editpotentialopp").val(data.potentialopp);
		 				  
		 				  $("#editchanceofsale option[value='"+data.chanceofsale+"']").prop("selected",true);
				 		  $("#editchanceofsale").selectpicker("refresh");
				 		  
				 		 $("#editprimarysalesperson option[value='"+data.primarysalespersonid+"']").prop("selected",true);
				 		  $("#editprimarysalesperson").selectpicker("refresh");
				 		  

				 		 $("#editsecondarysalesperson option[value='"+data.secondarysalespersonid+"']").prop("selected",true);
				 		  $("#editsecondarysalesperson").selectpicker("refresh");
				 		  

		 				  $("#editpresalesperson option[value='"+data.presalespersonid+"']").prop("selected",true);
				 		  $("#editpresalesperson").selectpicker("refresh");
				 		  

		 				  $("#editbdhead option[value='"+data.bdheadid+"']").prop("selected",true);
				 		  $("#editbdhead").selectpicker("refresh");
				 		  
				 		  $("#edforecastclosedate").val(data.forecastdatestr);
		 				}
		 			if(data.crmtype === "PO")
	 				{
	 				   var x = document.getElementById("editconverttoleads");
	 				   
	 				   var y = document.getElementById("editconverttopo");
	 				   
	 				   if (y.style.display === "none")
		    		   {
		    			 y.style.display = "block";
		    		   } 
	 				    
	 				   if (x.style.display === "block")
		    		   {
		    			 x.style.display = "none";
		    		   } 
	 				   
	 				  $("#editponumber").val(data.ponumber);
	 				  
	 				  $("#editpodate").val(data.podate);
	 				  
	 				  $("#editpoamount").val(data.poamount);
	 				}
		 			
		 		}
			 
		       });
		 
        var t = $('#editcontactdetails').DataTable();
		 
		 t.clear().draw();
		 
		 $.ajax({
			    type:'GET',
				dataType: 'json',
		 		url :'${pageContext.request.contextPath}/getContactDetails',
		 		data : ({'crmid':crmid}),
		 		success : function(data)
		 		{

		 			console.log("getContactDetailsEs"+data.length);
		 		    
		 		    for(var i=0;i<data.length;i++)
		 				{
		 		    	
		 		    	$("#contactdetsize").val(data[0].contactsize);
		 		    	
		 				  t.row.add( [
	  	 			           i+1,
	  	 			            data[i].contactname,
	  	 			            data[i].designation,
	  	 			            data[i].mobileno,
	  	 			            data[i].officeno,
	  	 			            data[i].emailid,
	  	 			            data[i].altemail,
	  	 			            data[i].authority,
	  	 			            '<td class="text-center" style="min-width: 50px; width: 50px;"><button type="button" class="btn waves-effect waves-light" title="Delete Contact" onclick="DelRowEditExistData('+i+','+data[i].enqcontid+','+crmid+')"><i class="material-icons">delete</i></button></td>'
								] ).draw( false );
		 				}
		 		}
			 
		 });
		 
		 (recordstitle === "Lead")
		 {
			 getDocumentDetails(crmid);
		 }
	 }
	 
	 function AddRowforEdit()
	 {
		 var lenthtable = $('#editcontactdetails tr').length - 2;
		 
		 $('#editcontactdetails tbody tr').last().after('<tr id="test'+(lenthtable)+'">'
				  +'<td>'+(lenthtable)+'</td>'
				  +'<td ><input type="text" class="form-control" id="editcontactname'+lenthtable+'" name="editcontactname" onchange=""  placeholder="Enter Contact Name" required></td>'
				  +'<td><input type="text" class="form-control" id="editDesignation'+lenthtable+'" name="editDesignation" onchange=""  placeholder="Enter designation" required></td>'
				  +'<td><input type="text" class="form-control mobile-phone-number" id="editmobilenos'+lenthtable+'" name="editmobilenos" placeholder="Ex:0000000000" onkeypress="return isNumber(event)" onchange="editmobnumber('+lenthtable+')" minlength="10" maxlength="10" required></td>'
				  +'<td><input type="text" class="form-control mobile-phone-number" id="editofficenos'+lenthtable+'" name="editofficenos" placeholder="Ex: +00 (000) 000-00-00"  onkeypress="return isNumber(event)" onchange=""></td>'
				  +'<td><input type="text" class="form-control email" id="editcontactemail'+lenthtable+'" name="editcontactemail" placeholder="Ex: example@example.com" onchange="editvalidateEmail('+lenthtable+')" required></td>'
				  +'<td><input type="text" class="form-control email" id="editaltemail'+lenthtable+'" name="editaltemail" placeholder="Ex: example@example.com" onchange="editvalidatealtEmail('+lenthtable+')"></td>'
				  +'<td><select class="form-control show-tick" data-live-search="true" id="editauhority'+lenthtable+'" name="editauhority" onchange="" required><option value="Gatekeeper">Gatekeeper</option>'
				  +'<option value="Blocker">Blocker</option>'
				  +'<option value="Influencer">Influencer</option>'
				  +'<option value="Decision Maker">Decision Maker</option>'
				  +'</select></td>'
				  +'<td><button type="button" class="btn waves-effect waves-light" title="Delete Contact" onclick="DelRowEditnewly('+lenthtable+')"><i class="material-icons">delete</i></button></td>'
				  +'</tr>');
	 }
	 
	 function DelRowEditnewly(i)
	 {
		var totallenthtable = $('#editcontactdetails tr').length;
		$("#test"+i).remove();
	 }
	 //
function editmobnumber1(inputtxt)
{
	 var tlength = $('#editcontactdetails tr').length-2;
	 var arr = [];
	 for(var i=1; i<=tlength; i++)
	 {
		 var mobilenos = $('#editmobilenos'+i).val();
		 arr[i] = mobilenos;
	 }
	 let hasDuplicate = arr.some((val, i) => arr.indexOf(val) !== i);
	// hasDuplicate = true
	if(hasDuplicate==true){
		alert("Moblie number should not be same == !");
		document.getElementById("editmobilenos"+inputtxt).value = "";
		return false
	}
	
        var entermob = document.getElementById("editmobilenos"+inputtxt);
	        if (/^\d{10}$/.test(entermob.value))
			{
			
			}
	    else
			{
				alert("Enter valid  Mobile Number !");
// 				$('#mobilenos'+inputtxt).val(" ");
				document.getElementById("editmobilenos"+inputtxt).value = "";
				return false;
			}
}
	 
	 
	 //
	 function DelRowEditExistData(i,enqcontid,crmid)
	 {
		 var table = $('#editcontactdetails').DataTable();
		 
// 		 $('#editcontactdetails tbody').on( 'click', 'tr', function () {
// // 			    alert( 'Row index: '+table.row( this ).index() );
// 			    table.row(this).remove().draw();
// 			} );
	
		 
		 $.ajax({
			    type:'GET',
				dataType: 'json',
		 		url :'${pageContext.request.contextPath}/deleteContactDetails',
		 		data : ({'enqcontid':enqcontid ,'crmid':crmid}),
		 		success : function(data)
		 		{
//  		 		   alert("Record deleted  "+data.errorDescription);
		 		   
		 		   if(data.errorDescription === 'successcon')
		 			   {
// 		 			    alert("Record ded");
// 		 			   $('#editcontactdetails tbody').on( 'click', 'tr', function () {
// 		 				    alert( 'Row index: '+table.row( this ).index() );
		 				    table.row(i).remove().draw();
// 		 				} );

		 				   if(data.contactsize === 0)
		 					   {
		 					      $("#contactdetsize").val("0");   
		 					   }
		 				   else
		 					   {
		 					     $("#contactdetsize").val(data[0].contactsize);
		 					   }
                        
		 				   

		 			   }
		 		   else
		 			   {
		 			     alert("Sorry ! Something went wrong!");
		 			   }
		 		   
		 		}
		});
	}
	 
	 
	 function AddRoweditctl()
	 {
		 
		 var lenthtable = $('#editleaddocumenttab tr').length - 2;
		  $('#editleaddocumenttab tbody tr').last().after('<tr id="editloaddoctest'+lenthtable+'">'
		  +'<td >'+(lenthtable)+'</td>'
		  +'<td ><div class="form-group"><div class="form-line"><input type="text" class="form-control" style="width:100%;color:black;text-align:centre;" id="editdocument_name'+lenthtable+'" name="editdocument_name" maxlength="100" placeholder="Enter Document Name"/></div></div></td>'
		  +'<td><input type="file" style="width:100%;color:black;text-align:centre;" id="editdocument_upload'+lenthtable+'" name="editdocument_upload"/></td>'
		  +'<td><button type="button" class="btn waves-effect waves-light" title="Delete Document" onclick="DelleaddocRow('+lenthtable+')"><i class="material-icons">delete</i></button></td>'
		  +'</tr>');
	 }
	 
	 
	 function AddRowNewDeal()
	 {
    	  var lenthtable = $('#customerdocumenttab tr').length - 2;
		  $('#customerdocumenttab tbody tr').last().after('<tr id="customerdoctest'+lenthtable+'">'
		  +'<td >'+(lenthtable)+'</td>'
		  +'<td ><div class="form-group"><div class="form-line"><input type="text" class="form-control" style="width:100%;color:black;text-align:centre;" id="customerdocument_name'+lenthtable+'" name="customerdocument_name" maxlength="100" placeholder="Enter Document Name"/></div></div></td>'
		  +'<td><input type="file" style="width:100%;color:black;text-align:centre;" id="customerdocument_upload'+lenthtable+'" name="customerdocument_upload"/></td>'
		  +'</tr>');
	 }
	 
	 
	 function DelleaddocRow(inputtxt)
	 {
		$("#editloaddoctest"+inputtxt).remove();
	 }
	 
	 function DelExistLeadDocument(docloadid,i,crmid)
	 {
// 		 alert("inside DelExistLeadDocument");
		 var table = $('#editleaddocumenttab').DataTable();
		 $.ajax({
			    type:'GET',
				dataType: 'json',
		 		url :'${pageContext.request.contextPath}/deleteLeadDocument',
		 		data : ({'docloadid':docloadid , 'crmid':crmid}),
		 		success : function(data)
		 		{
// 		 			alert("inside  "+data.errorDescription);
                       if(data.errorDescription == 'successloaddoc')
		 			   {
//                     	   alert("inside DelExistLeadDocument success "+data.errorDescription);
                           table.row(i).remove().draw();
                           if(data.docsize === 0)
	 					   {
	 					      $("#editleaddocumentsize").val("0");   
	 					   }
	 				   else
	 					   {
	 					     $("#editleaddocumentsize").val(data[0].docsize);
	 					   }
                         }
		 		   else
		 			   {
		 			     alert("Sorry ! Something went wrong!");
		 			   }
		 		   
		 		}
		});
	 }
	 
	 function showforecastdatediv()
	 {
		   var x = document.getElementById("forecastedition");
		   
		   var y = document.getElementById("showforcastdate");
		   
		   if (x.style.display === "none")
		   {
			 x.style.display = "block";
		   } 
		    
		   if (y.style.display === "block")
		   {
			 y.style.display = "none";
		   }
	 }
	 
	 function showeditofferingdiv()
	 {
		 var x = document.getElementById("editofferingdetails");
		 
		 var y = document.getElementById("editofferingshowdiv");
		   
		   if (x.style.display === "none")
		   {
			 x.style.display = "block";
		   } 
		   
		   if (y.style.display === "block")
		   {
			 y.style.display = "none";
		   } 
	 }
	 
	 function submitmodifieddetails()
	 {
		 
		 var crmtype = $("#editrecordstitle").val();
		 
		 var editdatasource =  $('select[name=editdatasource]').val();
		 
		 var x = document.getElementById("editofferingdetails");
		 
		 if (x.style.display === "block")
			 {
			    var editoffering =  $('select[name=editoffering]').val();
			    
			    if(editoffering  ===  "")
				 {
				       alert("Please select Offering!");
				       return false;
				 }
			 }
		 var editcompanyname = $("#editcompanyname").val();
		 
		 var editnickname = $("#editnickname").val();
		 
		 var editemployeesize =  $('select[name=editemployeesize]').val();
		 
		 var editannualturnover =  $('select[name=editannualturnover]').val();
		 
		 var editcountry =  $('select[name=country]').val();
		 
		 var editinstate =  $('select[name=instate]').val();
		 
		 var editindistricts =  $('select[name=indistricts]').val();
		 
		 var isinternatioanlordomestic = $("#isinternatioanlordomestic").val();
		 
		 if(editcountry===""){
			  alert("Please select country !");
			  return false;
		 }
		 
		 if(editcountry == "101"){
			 if(editinstate===""){
				 alert("Please select status !");
				 return false;
			 }
			 
			 if(editindistricts ===""){
				 alert("Please select district !");
 				 return false;
 			 }
		 }
		 
		 
		 if(crmtype === "Lead")
			 {
			       var editprojectdesc = $("#editprojectdesc").val();
			       
			       var editpotentialopp = $("#editpotentialopp").val();
			       
			       var editchanceofsale =  $('select[name=editchanceofsale]').val();
			       
			       var editforecastclosedate =  $("#forecastclosedate").val();
			       
			       var doclenthtable = document.getElementsByName("editdocument_name");
					 
			       			       
// 			       if(editprojectdesc  ===  "")
// 					 {
// 					       alert("Please Enter Project Description!");
// 					       return false;
// 					 }
			       
// 			       if(editpotentialopp  ===  "")
// 					 {
// 					       alert("Please Enter Potensial Opportunity!");
// 					       return false;
// 					 }
			       
// 			       if(editchanceofsale  ===  "")
// 					 {
// 					       alert("Please Enter Winning Stage %!");
// 					       return false;
// 					 }
			       
// 			       var existdocsize = $("#editleaddocumentsize").val();
			       
// 			       if(existdocsize === "0")
// 					 {
// 			    	     if(doclenthtable.length === 0)
// 						 {
// 						    alert("Please Enter Documents Detail!");
// 						    return false;
// 						 }
// 					 }
			
			 }
		 
		 if(editdatasource  ===  "")
			 {
			       alert("Please select Data Sources!");
			       return false;
			 }
		 
		 if(editcompanyname  ===  "")
		 {
		       alert("Please Enter Nick Name!");
		       return false;
		 }
		 
		 
		 
		 if(editemployeesize  ===  "")
		 {
		       alert("Please Enter Employee Size!");
		       return false;
		 }
		 
		 if(editannualturnover  ===  "")
		 {
		       alert("Please Enter Annual Trunover!");
		       return false;
		 }
		 
		 var existcontsize = $("#contactdetsize").val();
		 
		 var lenthtable =  document.getElementsByName("editcontactname");
		 
		 if(existcontsize === "0")
			 {
				 if(lenthtable.length === 0)
				 {
				    alert("Please Enter Contact Details!");
		 		    return false;
				 }
			 }
		 
        var aa = confirm('Do you want to submit ?');
 		
     	if(aa == true)
     		{
     		   $("#modifieddetails").submit(); 
     		}
     	else
     		{
     		   return false;
     		}
	 }
	  </script>
	  
	  <script type="text/javascript">
	  
	  function isNumber(evt) {
	        evt = (evt) ? evt : window.event;
	        var charCode = (evt.which) ? evt.which : evt.keyCode;
	        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
	            return false;
	        }
	        return true;
	    }
	  
	  function mobnumber(inputtxt)
	  {
	          var entermob = document.getElementById("mobilenos"+inputtxt);
	  	        if (/^\d{10}$/.test(entermob.value))
	  			{
	  			
	  			}
	  	    else
	  			{
	  				alert("Enter valid  Mobile Number !");
//	   				$('#mobilenos'+inputtxt).val(" ");
	  				document.getElementById("mobilenos"+inputtxt).value = "";
	  				return false;
	  			}
	  }

	  function phonenumber(inputtxt)
	  {
	          var entermob = document.getElementById("officenos"+inputtxt);
	  	        if (/^\d{10}$/.test(entermob.value))
	  			{
	  			
	  			}
	  	    else
	  			{
	  				alert("Enter valid Phone Number !");
//	   				$('#mobilenos'+inputtxt).val(" ");
	  				document.getElementById("officenos"+inputtxt).value = "";
	  				return false;
	  			}
	  }

	  function validateEmail(inputtxt) {
	      const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	      var enteremail = document.getElementById("contactemail"+inputtxt).value;
//	       alert(re.test(String(enteremail).toLowerCase()));
	      if(re.test(String(enteremail).toLowerCase()))
	      	{
	      	}
	      else
	      	{
	      	alert("Enter valid Email !");
	  	//		$('#mobilenos'+inputtxt).val(" ");
	  		document.getElementById("contactemail"+inputtxt).value = "";
	  		return false;
	      }
	      	
	  }	
	     
	      
	      function validatealtEmail(inputtxt) {
	          const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	          var enteremail = document.getElementById("altemail"+inputtxt).value;
//	           alert(re.test(String(enteremail).toLowerCase()));
	          if(!(re.test(String(enteremail).toLowerCase())))
	          {
	          	alert("Enter valid Email !");
//	      			$('#mobilenos'+inputtxt).val(" ");
	      		document.getElementById("altemail"+inputtxt).value = "";
	      		return false;
	          }
	      }
	  
	  </script>
	  
	  <script type="text/javascript">
	  function editmobnumber(inputtxt)
	  {
	          var entermob = document.getElementById("editmobilenos"+inputtxt);
	  	        if (/^\d{10}$/.test(entermob.value))
	  			{
	  			
	  			}
	  	    else
	  			{
	  				alert("Enter valid  Mobile Number !");
//	   				$('#mobilenos'+inputtxt).val(" ");
	  				document.getElementById("editmobilenos"+inputtxt).value = "";
	  				return false;
	  			}
	  }

	  function editphonenumber(inputtxt)
	  {
	          var entermob = document.getElementById("editofficenos"+inputtxt);
	  	        if (/^\d{10}$/.test(entermob.value))
	  			{
	  			
	  			}
	  	    else
	  			{
	  				alert("Enter valid Phone Number !");
//	   				$('#mobilenos'+inputtxt).val(" ");
	  				document.getElementById("editofficenos"+inputtxt).value = "";
	  				return false;
	  			}
	  }

	  function editvalidateEmail(inputtxt) {
	      const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	      var enteremail = document.getElementById("editcontactemail"+inputtxt).value;
//	       alert(re.test(String(enteremail).toLowerCase()));
	      if(re.test(String(enteremail).toLowerCase()))
	      	{
	      	}
	      else
	      	{
	      	alert("Enter valid Email !");
	  	//		$('#mobilenos'+inputtxt).val(" ");
	  		document.getElementById("editcontactemail"+inputtxt).value = "";
	  		return false;
	      }
	      	
	  }	
	     
	      
	      function editvalidatealtEmail(inputtxt) {
	          const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	          var enteremail = document.getElementById("editaltemail"+inputtxt).value;
//	           alert(re.test(String(enteremail).toLowerCase()));
	          if(!(re.test(String(enteremail).toLowerCase())))
	          {
	          	alert("Enter valid Email !");
//	      			$('#mobilenos'+inputtxt).val(" ");
	      		document.getElementById("editaltemail"+inputtxt).value = "";
	      		return false;
	          }
	      }
	  
	  </script>
	  
	  <script type="text/javascript">
	    
	  
	        function viewContactDetails()
	        {
	        	var x1 = document.getElementById('viewcontdetail');
	        	var y1 = document.getElementById('viewcontdetail').style.display;
	        	
	        	if(y1 === "block")
				{
	  		      $('#contactdet').html("<i class='material-icons'>keyboard_arrow_down</i>");
				  x1.style.display = "none";
				}
	        	if(y1 === "none")
				{
				  $('#contactdet').html("<i class='material-icons'>keyboard_arrow_up</i>");
				  x1.style.display = "block";
				}
	        }
	        
	        function viewDocumentDetails()
	        {
	        	var x2 = document.getElementById('viewdocdetail')
	        	var y2 = document.getElementById('viewdocdetail').style.display;
	        	
	        	if(y2 === "block")
				{
	  		      $('#docdetail').html("<i class='material-icons'>keyboard_arrow_down</i>");
				  x2.style.display = "none";
				}
				else
				{
				  $('#docdetail').html("<i class='material-icons'>keyboard_arrow_up</i>");
				  x2.style.display = "block";
				}
	        }
	        
	        
	        function updateviewDocumentDetails()
	        {
	        	var x2 = document.getElementById('updateviewdocdetail')
	        	var y2 = document.getElementById('updateviewdocdetail').style.display;
	        	
	        	if(y2 === "block")
				{
	  		      $('#updatedocdetail').html("<i class='material-icons'>keyboard_arrow_down</i>");
				  x2.style.display = "none";
				}
				else
				{
				  $('#updatedocdetail').html("<i class='material-icons'>keyboard_arrow_up</i>");
				  x2.style.display = "block";
				}
	        }
	        
	        
	        function viewEventDetails()
	        {
                var x3 = document.getElementById('viewevedetail');
                var y3 = document.getElementById('viewevedetail').style.display;
                
	        	if(y3 === "block")
				{
	  		      $('#vieweventdetail').html("<i class='material-icons'>keyboard_arrow_down</i>");
				  x3.style.display = "none";
				}
				else
				{
				  $('#vieweventdetail').html("<i class='material-icons'>keyboard_arrow_up</i>");
				  x3.style.display = "block";
				}
	        }
	  
	  
	       function setDetailsforview(crmid)
	       {
	    	   var recordstitle = $("#redocrdtype").val();
	    	   
	    	   if(recordstitle === "enquiry")
	    		   {
	    		      document.getElementById("viewdetailsmodel").innerHTML = "Enquiry Details";
	    		   }
	    	   
	    	   if(recordstitle === "Lead")
    		   {
	    		   document.getElementById("viewdetailsmodel").innerHTML = "Lead Details";
    		   }
	    	   
	    	   if(recordstitle === "Customer")
    		   {
	    		   document.getElementById("viewdetailsmodel").innerHTML = "Customer Details";
    		   }
	    	   
	    	   
	    	   var t = $('#viewcontactdetails').DataTable();
	  		 
	  		   t.clear().draw();
	  		   
	  		   var t2 = $('#viewleadeventtab').DataTable();
			 
			   t2.clear().draw();
	    	   
	    	   $.ajax({
				    type:'GET',
					dataType: 'json',
			 		url :'${pageContext.request.contextPath}/getDetailsToaddEvent',
			 		data : ({'crmid':crmid}),
			 		success : function(data)
			 		{
			 			console.log("getDetailsToaddEvent"+data);
			 			
			 			$("#viewdatasource").val(data.crmDataSource.datasource);
			 			
			 		    $("#viewcompanyname").val(data.companyname);
			 			
			 			$("#viewnickname").val(data.nickname);
			 			
			 			$("#viewemployeesize").val(data.employeesize);
			 			
			 			$("#viewannualturnover").val(data.annualturnover);
			 			
			 			$("#viewoffering").val(data.offering);
			 			
			 			if(recordstitle === "Lead")
			    		   {
				    		   var x = document.getElementById("viewconverttoleads");
				    		   
				    		   var x1 = document.getElementById("divforviewdetails");
			 				   
			 				   var y = document.getElementById("viewconverttopo");
			 				   
			 				  if (x.style.display === "none")
				    		   {
				    			 x.style.display = "block";
				    		   } 
			 				  
			 				 if (x1.style.display === "none")
				    		   {
				    			 x1.style.display = "block";
				    		   } 
							    
							   if (y.style.display === "block")
				    		   {
				    			 y.style.display = "none";
				    		   }
							   
							      $("#viewprojectdesc").val(data.projectdescription);
				 				  
				 				  $("#viewforecastclosedate").val(data.potentialopp);
				 				  
				 				  $("#viewchanceofsale").val(data.chanceofsale);
				 				  
				 				  $("#viewpotentialopp").val(data.potentialopp);
				 				  
				 				 $("#viewcurrencytype").val(data.currencytype);
				 				 
				 				 $("#viewforeigncurrency").val(data.foreigncurrency);
				 				  
				 				  $("#viewforecastclosedate").val(data.forecastdatestr);
				 				  
				 				  $("#viewprimarysalesperson").val(data.primarysalespersonname);
				 				 
				 				  $("#viewsecondarysalesperson").val(data.secondarysalespersonname);
				 				
				 				  $("#viewpresalesperson").val(data.presalespersonname);
				 				
				 				  $("#viewbdhead").val(data.bdheadname);
				 				  
				 			}
			 			
			 			if(recordstitle === "Customer")
			    		   {
				    		   var x = document.getElementById("viewconverttoleads");
				    		   
				    		   var x1 = document.getElementById("divforviewdetails");
			 				   
			 				   var y = document.getElementById("viewconverttopo");
			 				   
			 				  if (x.style.display === "none")
				    		   {
				    			 x.style.display = "block";
				    		   } 
			 				  
			 				 if (x1.style.display === "none")
				    		   {
				    			 x1.style.display = "block";
				    		   } 
							    
							   if (y.style.display === "none")
				    		   {
				    			 y.style.display = "block";
				    		   }
							      $("#viewprojectdesc").val(data.projectdescription);
				 				  
				 				  $("#viewforecastclosedate").val(data.potentialopp);
				 				  
				 				  $("#viewchanceofsale").val(data.chanceofsale);
				 				  
				 				  $("#viewpotentialopp").val(data.potentialopp);
				 				  
                                  $("#viewcurrencytype").val(data.currencytype);
				 				 
				 				 $("#viewforeigncurrency").val(data.foreigncurrency);
				 				  
				 				  $("#viewforecastclosedate").val(data.forecastdatestr);
				 				  
				 				 
				 				 var ForginCurrency1 = document.getElementById("ForginCurrency");
				 				 
				 				 var indiancurrency1 = document.getElementById("indiancurrency");
				 				 
				 				 if(data.potentialopp == null){
				 					indiancurrency1.style.display = "none";
				 					ForginCurrency1.style.display = "block";
				 				 }else{
				 					ForginCurrency1.style.display = "none";
				 					indiancurrency1.style.display = "block";
				 				 }
				 				 
							   
							      $("#viewponumber").val(data.ponumber);
				 				  
				 				  $("#viewpodate").val(data.podatestr);
				 				  
				 				  $("#viewpoamount").val(data.poamount);
				 				  
				 				 $("#viewprimarysalesperson").val(data.primarysalespersonname);
				 				 
				 				  $("#viewsecondarysalesperson").val(data.secondarysalespersonname);
				 				
				 				  $("#viewpresalesperson").val(data.presalespersonname);
				 				
				 				  $("#viewbdhead").val(data.bdheadname);
				 				  
				 			}
			 		}
				 
			       });
	    	   
	    	   
	    	   $.ajax({
				    type:'GET',
					dataType: 'json',
			 		url :'${pageContext.request.contextPath}/getContactDetails',
			 		data : ({'crmid':crmid}),
			 		success : function(data)
			 		{
			 		    console.log("getDetailsToaddEvent"+data.length);
			 			
			 			for(var i=0;i<data.length;i++)
			 				{
			 				  t.row.add( [
		  	 			            i+1,
		  	 			            data[i].contactname,
		  	 			            data[i].designation,
		  	 			            data[i].mobileno,
		  	 			            data[i].officeno,
		  	 			            data[i].emailid,
		  	 			            data[i].altemail,
		  	 			            data[i].authority
									] ).draw( false );
			 				
			 				}
			 		}
			      });
	    	   
	    	   
	    	   $.ajax({
				    type:'GET',
					dataType: 'json',
			 		url :'${pageContext.request.contextPath}/getEventsDetails',
			 		data : ({'crmid':crmid}),
			 		success : function(data)
			 		{
			 		    for(var i=0;i<data.length;i++)
			 				{
			 		    	   if(data[i].status === 'PO')
			 		    		   {
			 		    		        t2.row.add( [
				 					    i+1,
			  	 			            data[i].crmevent,
			  	 			            data[i].purposeofevent,
			  	 			            'Order',
			  	 			            data[i].crmeventstrdate,
			  	 			            data[i].remark
			  	 			            ] ).draw( false );
			 		    		   }
			 		    	   else
			 		    		   {
			 		    		        t2.row.add( [
				 					    i+1,
			  	 			            data[i].crmevent,
			  	 			            data[i].purposeofevent,
			  	 			            data[i].status,
			  	 			            data[i].crmeventstrdate,
			  	 			            data[i].remark
			  	 			            ] ).draw( false );
			 		    		   }
			 				   
			 				}
			 		}
			      });
	    	   
	    	   
	    	   if(recordstitle === "Lead" || recordstitle === "Customer")
	    		   {
	    		     var t1 = $('#viewleaddocumenttab').DataTable();
	    			 
	    			 t1.clear().draw();
	    			 
	    			 $.ajax({
	    				    type:'GET',
	    					dataType: 'json',
	    			 		url :'${pageContext.request.contextPath}/getDocumentDetails',
	    			 		data : ({'crmid':crmid}),
	    			 		success : function(data)
	    			 		{
	    			 		    console.log("getDetailsToaddEvent"+data.length);
	    			 			
	    			 			for(var i=0;i<data.length;i++)
	    			 				{
	    			 				  t1.row.add([
	    		  	 			            i+1,
	    		  	 			            data[i].documentname,
	    		  	 			            '<td><a href="downloadLeadDocument?doc_id='+data[i].leaddocumentid+'"><i class="material-icons">file_download</i></a></td>',
	    		  	 			             ]).draw( false );
	    			 				}
	    			 		}
	    			  });
	    		   }
	    	}
	       
	       
	       function changemybuttoncolor()
	       {
	    	   document.getElementById("addeditdetails").style.color = "black";
	       }
	       
	       function changemybuttoncolormouseOut()
	       {
	    	   document.getElementById("addeditdetails").style.color = "white";
	       }
	       
	       function changemyclosebuttoncolor()
	       {
	    	   document.getElementById("closeeditdetails").style.color = "black";
	       }
	       
	       function changemyclosebuttoncolormouseOut()
	       {
	    	   document.getElementById("closeeditdetails").style.color = "white";
	       }
	       
	       
	       function changemyaddeventcolor()
	       {
	    	   document.getElementById("addeventbutton").style.color = "black";
	       }
	       
	       function changeaddeventcolormouseOut()
	       {
	    	   document.getElementById("addeventbutton").style.color = "white";
	       }
	       
	       function changemyaddeventclosecolor()
	       {
	    	   document.getElementById("addeventclosebutton").style.color = "black";
	       }
	       
	       function changeaddeventclosecolormouseOut()
	       {
	    	   document.getElementById("addeventclosebutton").style.color = "white";
	       }
	       
	       
	       function changemyviewbtnclosecolor()
	       {
	    	   document.getElementById("viewclosebtn").style.color = "black";
	       }
	       
	       function changeviewbtnclosecolormouseOut()
	       {
	    	   document.getElementById("viewclosebtn").style.color = "white";
	       }
	       
	       function closemodifieddetails()
	       {
	    	   window.location.reload();  
	    	   
	       	var $popup = $('#editevent');
	       	var crmtype = $("#editrecordstitle").val();
	       	
	       	 if(crmtype === "Lead")
	       	 {
	       		 var existdocsize = $("#editleaddocumentsize").val();
	       		 
	       		 var doclenthtable = document.getElementsByName("editdocument_name");
	       		 
	       		 if(existdocsize === "0")
	       		 {
	           	     if(doclenthtable.length === 0)
	       			 {
	       			    alert("Documents detail should not be empty!");
	       			    return false;
	       			    $popup.modal("show");
	       			 }
	       		 }
	       	}

	            var existcontsize = $("#contactdetsize").val();
	       	 
	       	 var lenthtable =  document.getElementsByName("editcontactname");
	       	 
	       	 if(existcontsize === "0")
	       		 {
	       			 if(lenthtable.length === 0)
	       			 {
	       			    alert("Contacts detail should not be empty!");
	       	 		    return false;
	       	 		   $popup.modal("show");
	       			 }
	       		 }
	       	 
	       	 $popup.modal("hide");
	       }
	       
	       function setDetailsforAddNewDealForCustomer(crmid)
	       {
	    	   
	    	   $.ajax({
				    type:'GET',
					dataType: 'json',
			 		url :'${pageContext.request.contextPath}/getDetailsToaddEvent',
			 		data : ({'crmid':crmid}),
			 		success : function(data)
			 		{
			 			$("#companyname1").val(data.companyname);
			 			
			 			$("#onboarddate1").val(data.podatestr);
			 			
			 			$("#crmrecordid").val(crmid);
			 			
			 			if(data.isactivatedcustomer == 'Y')
			 				{
			 					$("#customerstatus").val("Active");
			 				}
			 			else
			 				{
			 					$("#customerstatus").val("Deactive");
			 				}
			 		}
			 		
	    	   
	    	   });
	    	   
	    	   var t2 = $('#viewcustomersdealstab').DataTable();
	    	   
	    	    t2.clear().draw();
	    	    
	    	   
	    	   $.ajax({
	    		   
	    		   type:'GET',
					dataType: 'json',
// 			 		url :'${pageContext.request.contextPath}/getDealDetails',
			 		url :'${pageContext.request.contextPath}/getcrmeventdetails',
			 		data : ({'crmid':crmid}),
			 		success : function(data)
			 		{
			 			for(var i=0;i<data.length;i++)
			 				{
			 				let renew=data[i].renew
			 				
			 				tablerow="";

			 				let crmeventid =data[i].crmeventid
			 				
			 				documentdownload="";
			 				
			 				documentdownload='<td><a href="downloadLeadDocument?doc_id='+data[i].crmeventids+'"><i class="material-icons">file_download</i></a></td>'
			 				
			 				if(renew=="N"){
			 					tablerow='<td><button type="button" class="btn bg-blue waves-effect waves-light" title="Add Deal" onclick="updateNewDeal('+data[i].crmeventid+')">Renew</button></td>'
			 				}else{
			 					tablerow='<td><button type="button" class="btn" title="Add Deal" onclick="updateNewDeal('+data[i].crmeventid+')" disabled>Renewed</button></td>'
			 				}
			 				
			 				t2.row.add( [
			 					i+1,
			 					data[i].projectdescription,
			 					data[i].offering,
			 					data[i].ponumber,
			 					data[i].crmpodatestr,
			 					data[i].poamount,
			 					data[i].needbydatestr,
			 					tablerow,
			 					documentdownload,
			 					] ).draw( false );
			 				}
			 		}
	    		   
	    	   });
	       }
	       
	       function openNewDeal()
	       {
	    	   $('#adddeal').modal('show');
	       }
	       
	       function updateNewDeal(crmeventid)
	       {
	    	   $('#updatedeal').modal('show');
	    	   
              $.ajax({
	    		   type:'GET',
					dataType: 'json',
			 		url :'${pageContext.request.contextPath}/getEventDetails',
			 		data : ({'crmeventid':crmeventid}),
			 		success : function(data)
			 		{

 			 			for(var i=0;i<data.length;i++)
			 				{
 			 				
 			 				$("#updatedcrmeventid").val(data[i].crmeventid,);
 			 				
 			 				$("#updatecrmrecordid").val(data[i].crmrecordid.crmrecordid,);
 			 				
 			 				$("#updatedealprojectdesc").val(data[i].projectdescription,);
 			 				
 			 				$("#updateddealoffering option[value='"+data[i].offering,+"']").prop("selected",true);
 					 		$("#updateddealoffering").selectpicker("refresh");
 			 				
//  			 				$("#updatedealponumber").val(data[i].ponumber,);
 			 				
//  			 				$("#updatedealpoamount").val(data[i].poamount,);
 			 				
//  			 				$("#updatedealevent option[value='"+data[i].crmevent,+"']").prop("selected",true);
//  					 		$("#updatedealevent").selectpicker("refresh");
 			 				
//  			 				$("#updatedealpodate").val(data[i].crmpodatestr,);
 			 				
//  			 				$("#updatedealneedbydate").val(data[i].needbydatestr,);
 			 				
			 				}
     		 		}
			 			
			 		});	
              
              var t = $('#updateviewleaddocumenttab').DataTable();
     		 
     		 t.clear().draw();
              
              $.ajax({
  			    type:'GET',
  				dataType: 'json',
  		 		url :'${pageContext.request.contextPath}/getCrmEventDocumentDetails',
  		 		data : ({'crmeventid':crmeventid}),
  		 		success : function(data)
  		 		{
                          for(var i=0;i<data.length;i++)
  		 				{
                        	  $("#updateeditleaddocumentsize").val(data[0].docsize);
                        	  
                            $("#documenteventid").val(data[0].leaddocumentid);
                          	
  		 				  t.row.add([
  	  	 			            i+1,
  	  	 			            data[i].documentname,
  	  	 			            '<td><a href="downloadLeadDocument?doc_id='+data[i].leaddocumentid+'"><i class="material-icons">file_download</i></a></td>',
  	  	 			            ]).draw( false );
  		 				}
  		 		}
  		  });
	    	   
	    	   
	       }
	       
	       function submitDealDetails()
	       {
	    	   
	    	   var today = new Date().toISOString().split('T')[0];
	    	   document.getElementsByName("dealneedbydate")[0].setAttribute('min', today);
	    	   
	    	   var projectdesc = $("#dealprojectdesc").val();
	    	   
	    	   var dealoffering  = $('select[name=dealoffering]').val();
	    	   
	    	   var dealevent  = $('select[name=dealevent]').val();
	    	   
	    	   var ponumber = $("#dealponumber").val();
	    	   
	    	   var dealneedbydate = $("#dealneedbydate").val();
	    	   
	    	   var dealpoamount = $("#dealpoamount").val();
	    	   
	    	   var dealorderdate = $("#dealpodate").val();
	    	   
	    	   var dealneedbydate = $("#dealneedbydate").val();
	    	   
	    	   var dealdocument_name =  document.getElementsByName("dealdocument_name");
	  		 
	  		   var tlength = $('#deal tr').length-2;
	    	   
	    	   
	    	   if(projectdesc == "")
	    		   {
	    		   alert("Please select project description !");
	    		   return false;
	    		   }
	    	   
	    	   if(dealoffering == null)
	    		   {
	    		   alert("Please select offernig !");
	    		   return false;
	    		   }
	    	   if(ponumber == "")
	    		   {
	    		   		alert("Please enter po number !");
	    		   		return false;
	    		   }
	    	   
	    	   if(dealpoamount == "")
    		   {
    		   		alert("Please enter po amount !");
    		   		return false;
    		   }
	    	   if(dealevent == null)
    		   {
    		   		alert("Please select event !");
    		   		return false;
    		   }
	    	   if(dealorderdate == "")
	    		   {
	    		   		alert("Please enter order date !");
	    		   		return false;
	    		   }
	    	   if(dealneedbydate == "")
    		   {
    		   		alert("Please enter need by date !");
    		   		return false;
    		   }
	    	   
	    	   if(dealdocument_name.length === 0){
	    		   alert("Please enter document details!");
	    		   return false;
	    	   }
	    	   
	    	   for(var i=1; i<=tlength; i++)
	    	   {
	    		   var dealdocument_name = $('#dealdocument_name'+i).val();
	    			 
	    			 var dealdocument_upload = $('#dealdocument_upload'+i).val();
	    			 
	    			 if(dealdocument_name==""){
	    				 alert("Please enter document name!");
	    				 return false;
	    			 }
	    		   
	    			 if(dealdocument_upload==""){
	    				 alert("Please Upload document !");
	    				 return false
	    			 }
	    	   }
	    	   
	    	   
	    	   var aa = confirm('Do you want to submit ?');
       		
	        	if(aa == true)
	        		{
	        		 $("#dealdeatilsid").submit(); 
	        		}
	        	else
	        		{
	        		return false;
	        		}
	       }
	       
	       var countrytype1 = $("#countrytype").val();

	       if(countrytype1===""){
	       const box = document.getElementById('state');

	       box.style.display = 'none'; 

	       const box1 = document.getElementById('districts'); 
	       box1.style.display = 'none'; 
	       }
	       
	       
	       function updatesubmitDealDetails()
	       {
	    	   
	    	   var today = new Date().toISOString().split('T')[0];
	    	   document.getElementsByName("dealneedbydate")[0].setAttribute('min', today);
	    	   
	    	   var projectdesc = $("#updatedealprojectdesc").val();
	    	   
	    	   var dealoffering  = $('select[name=updateddealoffering]').val();
	    	   
	    	   var dealevent  = $('select[name=updatedealevent]').val();
	    	   
	    	   var ponumber = $("#updatedealponumber").val();
	    	   
	    	   var dealneedbydate = $("#updatedealneedbydate").val();
	    	   
	    	   var dealpoamount = $("#updatedealpoamount").val();
	    	   
	    	   var dealorderdate = $("#updatedealpodate").val();
	    	   
	    	   var dealneedbydate = $("#updatedealneedbydate").val();
	    	   
	    	   var dealdocument_name =  document.getElementsByName("updatedealdocument_name");
	  		 
	  		   var tlength = $('#updatedeal tr').length-2;
	    	   
	    	   
	    	   if(projectdesc == "")
	    		   {
	    		   alert("Please select project description !");
	    		   return false;
	    		   }
	    	   
	    	   if(dealoffering == null)
	    		   {
	    		   alert("Please select offernig !");
	    		   return false;
	    		   }
	    	   if(ponumber == "")
	    		   {
	    		   		alert("Please enter po number !");
	    		   		return false;
	    		   }
	    	   
	    	   if(dealpoamount == "")
    		   {
    		   		alert("Please enter po amount !");
    		   		return false;
    		   }
	    	   if(dealevent == null)
    		   {
    		   		alert("Please select event !");
    		   		return false;
    		   }
	    	   if(dealorderdate == "")
	    		   {
	    		   		alert("Please enter order date !");
	    		   		return false;
	    		   }
	    	   if(dealneedbydate == "")
    		   {
    		   		alert("Please enter need by date !");
    		   		return false;
    		   }
	    	   
	    	   if(dealdocument_name.length === 0){
	    		   alert("Please enter document details!");
	    		   return false;
	    	   }
	    	   
	    	   for(var i=1; i<=tlength; i++)
	    	   {
	    		   var dealdocument_name = $('#updatedealdocument_name'+i).val();
	    			 
	    			 var dealdocument_upload = $('#updatedealdocument_upload'+i).val();
	    			 
	    			 if(dealdocument_name==""){
	    				 alert("Please enter document name!");
	    				 return false;
	    			 }
	    		   
	    			 if(dealdocument_upload==""){
	    				 alert("Please Upload document !");
	    				 return false
	    			 }
	    	   }
	    	   
	    	   var aa = confirm('Do you want to submit ?');
	       		
	        	if(aa == true)
	        		{
	        		 $("#updatedealdetails").submit(); 
	        		}
	        	else
	        		{
	        		return false;
	        		}
	    	   
	       }
	       
	       
	       
	       
	  </script>