<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="block-header">
   <% 
      String title = (String)request.getAttribute("recordstitle");
      String isbdh = (String)request.getAttribute("isbdh");
      int employeeid = (int) request.getAttribute("employeeid");
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
                          
                          
                           <h2>
                           <% 
						      if(title.equalsIgnoreCase("Cancelled"))
						      {
						   %>
						      Cancelled
						   <%	  
						      }
                           %>
                          </h2>
                          
                       </div>
                       
                       <div class="body">
                            <input type="hidden" id="redocrdtype" name="redocrdtype" value="${recordstitle}">
                            <input type="hidden" name="savemsg" id="savemsg" value="${savemsg}">
                               <% 
                                  if(isbdh.equalsIgnoreCase("TRUE")&&(title.equalsIgnoreCase("enquiry")))
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
		                                            <th>Sourcing Date</th>
		                                            <th>Event</th>
		                                            <th>Created By</th>
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
		                                          <td><fmt:formatDate pattern="dd-MM-yyyy" value="${enquiries.sourcingdate}"/></td>
		                                          <td>${enquiries.crmevent}</td>
		                                          <td>${enquiries.createdby.empfirstname} ${enquiries.createdby.emplastname}</td>
		                                          <td>${enquiries.status}</td>
		                                          <td>
		                                          <c:set var="assignedtoid">${enquiries.assigneto.empid}</c:set>
		                                          <%
		                                          String assignidi = (String) pageContext.getAttribute("assignedtoid");
		                                          int assignid = Integer.parseInt(assignidi);
		                                          if(assignid == employeeid)
		                                          {
		                                          %>
		                                          <button type="button" class="btn btn-default waves-effect waves-light" title="Edit" data-toggle="modal" data-target="#editevent"
															onclick="setDetailsforEditEvent(${enquiries.crmrecordid})">
															<i class="material-icons">edit</i>
												  </button>
												  <button type="button" class="btn btn-default waves-effect waves-light" title="Add Event" data-toggle="modal" data-target="#addevent"
															onclick="setDetailsforAddEvent(${enquiries.crmrecordid})">
															<i class="material-icons">event</i>
												  </button>
												  <button type="button" class="btn btn-default waves-effect waves-light" title="Delete" data-toggle="modal" data-target="#"
															onclick="setenquiryDetailsforDeleteEnquiry(${enquiries.crmrecordid})">
															<i class="material-icons">delete</i>
												  </button>
		                                          <%   
		                                          }
		                                          %>
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
		                                              <td>${leads.crmevent}</td>
		                                              <td>${leads.createdby.empfirstname} ${leads.createdby.emplastname}</td>
		                                              <td>${leads.status}</td>
		                                              <td>
		                                              <c:set var="assignedtoid">${leads.assigneto.empid}</c:set>
		                                              <%
				                                          String assignidi = (String) pageContext.getAttribute("assignedtoid");
				                                          int assignid = Integer.parseInt(assignidi);
				                                          
				                                          if(assignid == employeeid)
				                                          {
				                                        %>
				                                        <button type="button" class="btn btn-default waves-effect waves-light" title="Edit" data-toggle="modal" data-target="#editevent"
															onclick="setDetailsforEditEvent(${leads.crmrecordid})">
															<i class="material-icons">edit</i>
														</button>
														<button type="button" class="btn btn-default waves-effect waves-light" title="Add Event" data-toggle="modal" data-target="#addevent"
															onclick="setDetailsforAddEvent(${leads.crmrecordid})">
															<i class="material-icons">event</i>
														</button>
				                                        <%  
				                                          }
				                                        %>
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
		                                              <td><fmt:formatDate pattern="dd-MM-yyyy" value="${customers.sourcingdate}" /></td>
		                                              <td>${customers.crmevent}</td>
		                                              <td>${customers.createdby.empfirstname} ${customers.createdby.emplastname}</td>
		                                              <td>Order</td>
<%-- 		                                              <td>${customers.status}</td> --%>
		                                              <td>
														<button type="button" class="btn btn-default waves-effect waves-light" title="View" data-toggle="modal" data-target="#viewdetails"
															onclick="setDetailsforview(${customers.crmrecordid})">
															<i class="material-icons">visibility</i>
														</button>
													</td>
		                                          </tr> 
		                                          <%j= j + 1;%>  
		                                      </c:forEach>
		                                      
		                                    <%	  
		                                      }
		                                      else if(title.equalsIgnoreCase("Cancelled"))
		                                      {
		                                     %>
		                                     
		                                      <c:forEach items="${cancelledRecords}" var="cancelled">
		                                          <tr>
		                                              <td><%=j%></td>
		                                              <td>${cancelled.companyname}</td>
		                                              <td><fmt:formatDate pattern="dd-MM-yyyy" value="${cancelled.sourcingdate}" /></td>
		                                              <td>${cancelled.crmevent}</td>
		                                              <td>${cancelled.createdby.empfirstname} ${cancelled.createdby.emplastname}</td>
		                                              <td>Cancel</td>
<%-- 		                                              <td>${customers.status}</td> --%>
		                                              <td>
														<button type="button" class="btn btn-default waves-effect waves-light" title="View" data-toggle="modal" data-target="#viewdetails"
															onclick="setDetailsforview(${cancelled.crmrecordid})">
															<i class="material-icons">visibility</i>
														</button>
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
         
   <div class="modal fade" id="editevent" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static">
	      <div class="modal-dialog modal-lg modal-dialog-scrollable" role="document">
	           <div class="modal-content">
	               <div class="modal-header" style="background-color: #0073b1">
					     <h4 class="modal-title" id="editeventmodel" style="color: white">Edit Event</h4>
				   </div>
				   
				   <form class="form-horizontal" method="post" action="savemodifiedDetails" name="modifieddetails" id="modifieddetails" autocomplete="off" enctype="multipart/form-data">
				         <div class="modal-body">
				              <input type="hidden" name="editrecordstitle" id="editrecordstitle" value="">
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
				                         <div class="col-sm-2" style="width:17%;">
                                          <label for="editprojectdesc"><span class="" style="color:red">*</span>Opportunity Description:</label>
	                                     </div>
	                                    
	                                     <div class="col-sm-8" style="">
	                                       <div class="form-group" ><div class="form-line">
	                                       <textarea rows="1" class="form-control no-resize" id="editprojectdesc" name="editprojectdesc" placeholder=""></textarea>
                                          
	                                       </div></div>
	                                     </div>
	                                     
	                                 </div>
	                                 
	                                  <div class="row clearfix">
					                        <div class="col-sm-2" style="width:17%">
	                                          <label for="editchanceofsale"><span class="" style="color:red">*</span>Lead conversion stage%:</label>
		                                    </div>
			    						
			    							<div class="col-sm-2" style="width:15%">
			    								<div class="form-group">
		                                        	<div class="form-line">
		                                                <select class="form-control show-tick" data-live-search="true" id="editchanceofsale" name="editchanceofsale" onchange="" required>
		                                                	<option value="10%">10%</option>
		                                                	<option value="20%">20%</option>
		                                                	<option value="30%">30%</option>
		                                                	<option value="40%">40%</option>
		                                                	<option value="50%">50%</option>
		                                                	<option value="60%">60%</option>
		                                                	<option value="70%">70%</option>
		                                                	<option value="80%">80%</option>
		                                                	<option value="90%">90%</option>
		                                                	<option value="100%">100%</option>
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
	                                          <label for="editpotentialopp"><span class="" style="color:red">*</span>Expected Deal value:</label>
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
	                                							<th class="text-center" style="min-width: 150px; width: 150px; font-weight:normal;">Documents </th>
	                                							<th class="text-center" style="min-width: 150px; width: 150px; font-weight:normal;">Document Description</th>
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
		                                       <label for="editponumber"><span class="" style="color:red">*</span>PO Number:</label>
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
			                                    <div class="input-group date" id="" >
			                                        <div class="form-line">
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
					      <button type="button" class="btn btn-link waves-effect" id="closeeditdetails" name="closeeditdetails"  onmouseover="changemyclosebuttoncolor()" onmouseout="changemyclosebuttoncolormouseOut()" onclick="closemodifieddetails()" style="color: white; font-weight: bold; font-size: 12px;" >Close</button>
				        </div>
				         
				   </form>
	           </div>   
	      </div>
	</div>
	
	
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
                                          <label for="crmevent"><span class="" style="color:red">*</span>Event:</label>
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
                                          <label for="remark">Remark:</label>
	                                    </div>
	                                    
	                                <div class="col-sm-8" style="">
	                                      <div class="form-group" ><div class="form-line">
                                          <input type="text" id="remark" name="remark" class="form-control"  placeholder="" value="" >
	                                      </div></div>
	                                </div>
				             </div>
				             
				             <div class="" id="converttoleads" style="display:none">
				             
				                   <div class="row clearfix">
				                         <div class="col-sm-2" style="width:17%">
                                          <label for="projectdesc"><span class="" style="color:red">*</span>Opportunity Description:</label>
	                                    </div>
	                                    
	                                    <div class="col-sm-8" style="">
	                                      <div class="form-group" ><div class="form-line">
                                          <input type="text" id="projectdesc" name="projectdesc" class="form-control"  placeholder="" value="">
	                                      </div></div>
	                                    </div>
				                   </div>
				                   
				                  
				                   <div class="row clearfix">
				                        <div class="col-sm-2" style="width:17%">
                                          <label for="chanceofsale"><span class="" style="color:red">*</span>Lead conversion stage %:</label>
	                                    </div>
		    						
		    							<div class="col-sm-2" style="width:15%">
		    								<div class="form-group">
	                                        	<div class="form-line">
	                                                <select class="form-control show-tick" data-live-search="true" id="chanceofsale" name="chanceofsale" onchange="" required>
	                                                	<option value="10%">10%</option>
	                                                	<option value="20%">20%</option>
	                                                	<option value="30%">30%</option>
	                                                	<option value="40%">40%</option>
	                                                	<option value="50%">50%</option>
	                                                	<option value="60%">60%</option>
	                                                	<option value="70%">70%</option>
	                                                	<option value="80%">80%</option>
	                                                	<option value="90%">90%</option>
	                                                	<option value="100%">100%</option>
	                                                </select>
	                                        	</div>
	                                    	</div>
		    							</div>
		    							
		    							
		    							<div class="col-sm-2" style="">
                                          <label for="forecastclosedate"><span class="" style="color:red">*</span>Target Close Date:</label>
	                                    </div>
	                                    
	                                    <div class="col-sm-2" style="width:20%">
	                                      <div class="input-group date" id="bs_datepicker_component_container">
	                                        <div class="form-line">
	                                            <input type="text" class="form-control" name="forecastclosedate" id="forecastclosedate" placeholder="Please choose a date...">
	                                        </div>
	                                        <span class="input-group-addon">
	                                            <i class="material-icons">date_range</i>
	                                        </span>
	                                    </div>
	                                    </div>
		    							
				                   </div>
				                   
				                    <div class="row clearfix">
				                        <div class="col-sm-2" style="width:14%">
                                          <label for="potentialopp"><span class="" style="color:red">*</span>Expected Deal value:</label>
	                                    </div>
	                                    
	                                    <div class="col-sm-2" style="width:15%">
	                                      <div class="form-group" ><div class="form-line">
                                          <input type="text" id="potentialopp" name="foreigncurrency" class="form-control" onkeypress="return isNumber(event)" placeholder="" value="">
	                                      </div></div>
	                                    </div>
				                    </div>
				                        
				                   
				                   <div class="row clearfix" style="background-color:#eee; margin-bottom: 0px;">
								     <div class="col-sm-2 form-control-label" style="background-color:#eee; margin-bottom: 0px;text-align:left;"><h6>Sales Team:</h6></div>
								   </div>
				             
				                  <div class="row clearfix" style="padding-top: 15px;">
				                       <div class="col-sm-2" style="width:15%">
                                          <label for="primarysalesperson"><span class="" style="color:red">*</span>Primary Sales Person:</label>
	                                    </div>
	                                    
	                                    <div class="col-sm-4" style="">
	                                      <div class="form-group">
		                                        	<div class="form-line">
		                                                <select class="form-control show-tick" data-live-search="true" id="primarysalesperson" name="primarysalesperson" onchange=""  >
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
		                                                <select class="form-control show-tick" data-live-search="true" id="secondarysalesperson" name="secondarysalesperson" onchange=""  >
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
		                                                <select class="form-control show-tick" data-live-search="true" id="presalesperson" name="presalesperson" onchange=""  >
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
	                                							<th class="text-center" style="min-width: 150px; width: 150px; font-weight:normal;">Document </th>
	                                							<th class="text-center" style="min-width: 150px; width: 150px; font-weight:normal;">Document Description</th>
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
	                                       <label for="ponumber"><span class="" style="color:red">*</span>PO Number:</label>
		                                 </div>
		                                
		                                <div class="col-sm-2" style="width:20%">
		                                    <div class="form-group" ><div class="form-line">
	                                          <input type="text" id="ponumber" name="ponumber" class="form-control"   placeholder="" value="">
		                                    </div></div>
		                                </div>
		                                
		                                <div class="col-sm-2" style="width:10%">
	                                       <label for="podate"><span class="" style="color:red">*</span>PO Date:</label>
		                                 </div>
		                                
		                                <div class="col-sm-2" style="width:20%">
		                                    <div class="input-group date" id="bs_datepicker_container" >
		                                        <div class="form-line">
		                                            <input type="text" class="form-control" id="podate" name="podate" placeholder="Please choose a date...">
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
		                            
		                                <div class="row clearfix"  style="margin-left: -4%;">
		                            	<div class="col-sm-2" style="width:12%">
                                          <label for="needbydate" style="margin-left: 24px;"><span class="" style="color:red">*</span>Need By Date:</label>
	                                	</div>
	                                	
	                                	  <div class="col-sm-2" style="width:20%">
		                                    <div class="input-group date" id="bs_datepicker_container" >
		                                        <div class="form-line">
		                                            <input type="text" class="form-control" id="needbydate" name="needbydate" placeholder="Please choose a date...">
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
         
         
         
         <div class="modal fade" id="viewdetails" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static">
	      <div class="modal-dialog modal-lg modal-dialog-scrollable" role="document">
	            <div class="modal-content">
	                 <div class="modal-header" style="background-color: #0073b1">
					     <h4 class="modal-title" id="viewdetailsmodel" style="color: white"></h4>
				     </div>
				     
				     <div class="modal-body">
				            <div class="row clearfix" style="background-color:#eee; margin-bottom: 0px; margin-right: 0px;">
								 <div class="col-sm-2 form-control-label" style="background-color:#eee; text-align: left"><h6>Company Details :</h6></div>
					        </div>
				           <div class="row clearfix" style="padding-top: 15px;">
				                <div class="col-sm-2" style="width:10%">
                                        <label for="viewdatasource">Data Source:</label>
	                            </div>
	                            
	                            <div class="col-sm-2" style="width:13%">
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
	    						
	    						<div class="col-sm-2" style="width:13%">
                                         <label for="viewcompanyname">Company Name :</label>
                                </div>   
                                
                                <div class="col-sm-3">
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
		    						
		    					<div class="col-sm-2" style="width:13%">
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
	    					
	    				    <div class="row clearfix" id="viewconverttoleads" style="display:none;padding-left:15px;">
	    					      <div class="row clearfix">
	    					           <div class="col-sm-2" style="width:15%;">
	    								<label for="viewprojectdesc">Opportunity Description:</label>
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
			    				      <div class="col-sm-2" style="width:17%">
	    								<label for="viewchanceofsale">Lead conversion stage %:</label>
                                      </div>
                                	
		                              <div class="col-sm-2" style="width:15%">
			    						 <div class="form-group">
		                                        	<div class="form-line">
		                                               <input type="text" id="viewchanceofsale" name="viewchanceofsale" class="form-control" onchange=""  placeholder="" readonly>
		                                            </div>
		                                  </div>
			    					  </div>
			    					  
			    					  
			    					  <div class="col-sm-2" style="width:15%">
	    								<label for="viewchanceofsale">Margin(%):</label>
                                      </div>
                                	
		                              <div class="col-sm-2" style="width:15%">
			    						 <div class="form-group">
		                                        	<div class="form-line">
		                                               <input type="text" id="viewmargin" name="viewmargin" class="form-control" onchange=""  placeholder="" readonly>
		                                            </div>
		                                  </div>
			    					  </div>
			    					  
			    					  <div class="row clearfix">
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
			    				</div>
			    				
			    				<div class="row clearfix">
			    				<div class="col-sm-2" style="width:15%">
	    								<label for="viewpotentialopp">Expected Deal value:</label>
                                      </div>
                                	
		                                <div class="col-sm-2" style="width:15%">
			    								<div class="form-group">
		                                        	<div class="form-line">
		                                               <input type="text" id="viewpotentialopp" name="viewpotentialopp" class="form-control" onchange=""  placeholder="" readonly>
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
	    					
	    					<div class="" id="viewconverttopo" style="display:none;">
	    					    
	    					     <div class="row clearfix">
					                             <div class="col-sm-2" style="width:10%">
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
			                                
			                                <div class="col-sm-2" style="width:20%">
			                                    <div class="input-group date" id="" >
			                                        <div class="form-line">
			                                            <input type="text" id="viewpodate" name="viewpodate" class="form-control"  placeholder="" value="" readonly>
			                                        </div>
			                                     </div>
			                                </div>
			                                
			                                <div class="col-sm-2" style="width:10%">
		                                       <label for="viewpoamount">PO Amount:</label>
			                                </div>
			                                
			                                <div class="col-sm-2" style="width:15%">
			                                    <div class="form-group" ><div class="form-line">
		                                          <input type="number" id="viewpoamount" name="viewpoamount" class="form-control"  placeholder="" value="">
			                                    </div></div>
			                                </div>
					               </div>
					               
	    					</div>
	    					
<!-- 	    					t -->
	    					<div class="row clearfix" style="background-color:#eee;margin-right: 0px;">
								    <div class="col-sm-2 form-control-label" style="text-align: left"><h6>Deal Renewal :</h6></div>
									<div class="col-sm-2">
										<button type="button" class="btn btn-circle waves-effect waves-circle waves-float" id="dealdeails" onclick="viewdealDetails()" style="background-color: #eee;  font-size:12px; width:25%; height:20%;">
									     <i class="material-icons">keyboard_arrow_down</i>
								         </button> 
								    </div>
							  </div>
					     
					     <div id="viewdealdetail" style="display:none;">
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
	                                				
	                                			</tr>
	                                	</thead>
	                                	
	                                	
	                                	<tbody>
	                               			
                                		</tbody>
                                					    
                                		<tfoot>
                                		<tr>
	                               		<th ><button type="button" class="btn bg-blue waves-effect waves-light" title="Add Deal" onclick="openNewDeal()">
                                   										 <i class="material-icons">add</i>
                               											 </button></th>
	                               		</tr> 
                                		</tfoot>
					     				 
					     				 </table>
					     			</div>
					     		</div>
					     	</div>
					     </div>
	    				
				     </div>
	    					
	    					
	    					
	    					
	    					
	    					
	    					
	    					
<!-- 	    					t -->
	    					
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
								    <div class="col-sm-2 form-control-label" style="text-align: left;margin-right: 0px;"><h6>Documents Detail:</h6></div>
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
	                                							<th  style="min-width: 50px; width: 50px; font-weight:normal;">Sr No</th>
	                                							<th  style="min-width: 150px; width: 150px; font-weight:normal;">Document</th>
	                                							<th  style="min-width: 150px; width: 150px; font-weight:normal;">Document Description</th>
	                                							
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
	    					
	    					
	    					  <div class="row clearfix" style="background-color:#eee;margin-right: 0px;" style="padding-top:15px">
								    <div class="col-sm-2 form-control-label" style=" margin-right: 0px;text-align: left" ><h6>Sales Life Cycle:</h6></div>
									<div class="col-sm-2" >
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
				          <button type="button" class="btn btn-link waves-effect" id="viewclosebtn" name="viewclosebtn" data-dismiss="modal" style="color: white; font-weight: bold; font-size: 12px;" onmouseover="changemyviewbtnclosecolor()" onmouseout="changeviewbtnclosecolormouseOut()">Close</button>
				      </div>
	            </div>
	      </div>
	</div>
	
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<script type = "text/javascript" >  
    function preventBack() { window.history.forward(); }  
    setTimeout("preventBack()", 0);  
    window.onunload = function () { null };  
</script> 
	
	
	<script type="text/javascript">
	
	function warning()
	{
		var msg = $("#savemsg").val();
		
		if(msg == "'successleadfromenquiry'")
	  	  {
	  	    swal({title: "Done", text: "Lead Added Successfully!", icon:"success"}).then(function(){ 
				      window.location.href="leadshr";
	  	 		});
	  	  }
		
		if(msg == "'successcontact'")
	   	  {
	   	    swal({title: "Done", text: "Enquiry Added Successfully!", icon:"success"}).then(function(){ 
	 			      window.location.href="enquirieshr";
	   	 		});
	   	  }
	}
	
	window.onbeforeunload = warning();
	
	function viewdealDetails()
	{
		var x1 = document.getElementById('viewdealdetail');
		var y1 = document.getElementById('viewdealdetail').style.display;
		
		if(y1 === "block")
		{
		      $('#dealdeails').html("<i class='material-icons'>keyboard_arrow_down</i>");
		  x1.style.display = "none";
		}
		if(y1 === "none")
		{
		  $('#dealdeails').html("<i class='material-icons'>keyboard_arrow_up</i>");
		  x1.style.display = "block";
		}
	}
	

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
		 				  
		 				  $("#viewmargin").val(data.margin);

		 				  
		 				  $("#viewpotentialopp").val(data.potentialopp);
		 				  
		 				 if(data.potentialopp==null){
		 					 $("#viewpotentialopp").val(data.foreigncurrency);
		 				  }
		 				  
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
		 				  
		 				  $("#viewmargin").val(data.margin);

		 				  
		 				  $("#viewpotentialopp").val(data.potentialopp);
		 				  
		 				  if(data.potentialopp==null){
		 					 $("#viewpotentialopp").val(data.foreigncurrency);
		 				  }
		 				  
		 				  $("#viewforecastclosedate").val(data.forecastdatestr);
					   
					      $("#viewponumber").val(data.ponumber);
		 				  
		 				  $("#viewpodate").val(data.podatestr);
		 				  
		 				  $("#viewpoamount").val(data.poamount);
		 				  
		 				 $("#viewprimarysalesperson").val(data.primarysalespersonname);
		 				 
		 				  $("#viewsecondarysalesperson").val(data.secondarysalespersonname);
		 				
		 				  $("#viewpresalesperson").val(data.presalespersonname);
		 				
		 				  $("#viewbdhead").val(data.bdheadname);
		 				  
		 				  
		 				 var t2 = $('#viewcustomersdealstab').DataTable();
		 		    	   
		 		    	   t2.clear().draw();
		 		    	   
		 		    	   $.ajax({
		 		    		   
		 		    		   type:'GET',
		 						dataType: 'json',
		 				 		url :'${pageContext.request.contextPath}/getDealDetails',
		 				 		data : ({'crmid':crmid}),
		 				 		success : function(data)
		 				 		{
		 				 			for(var i=0;i<data.length;i++)
		 				 				{
		 				 				t2.row.add( [
		 				 					i+1,
		 				 					data[i].projectdescription,
		 				 					data[i].offering,
		 				 					data[i].ponumber,
		 				 					data[i].crmpodatestr,
		 				 					data[i].poamount,
		 				 					data[i].needbydatestr,
		 				 					//$("#validateButton").html('<i class="fas fa-shield-check"></i> Re-Check').Value(),
		 				 					] ).draw( false );	
		 				 				}
		 				 		}
		 		    		   
		 		    	   });
		 				  
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
		  	 			            
		  	 			            '<td><a href="downloadLeadDocument?doc_id='+data[i].leaddocumentid+'"><i class="material-icons">file_download</i></a></td>',
		  	 			             data[i].documentname,		
		  	 			             ]).draw( false );
			 				}
			 		}
			  });
		   }
}

function AddRoweditctl()
{
	 var lenthtable = $('#editleaddocumenttab tr').length - 2;
	  $('#editleaddocumenttab tbody tr').last().after('<tr id="editloaddoctest'+lenthtable+'">'
	  +'<td >'+(lenthtable)+'</td>'
	  +'<td><input type="file" style="width:100%;color:black;text-align:centre;" id="editdocument_upload'+lenthtable+'" name="editdocument_upload"/></td>'
	  +'<td ><div class="form-group"><div class="form-line"><input type="text" class="form-control" style="width:100%;color:black;text-align:centre;" id="editdocument_name'+lenthtable+'" name="editdocument_name" maxlength="100" placeholder="Enter Document Name"/></div></div></td>'
	  +'<td><button type="button" class="btn waves-effect waves-light" title="Delete Document" onclick="DelleaddocRow('+lenthtable+')"><i class="material-icons">delete</i></button></td>'
	  +'</tr>');
}

function DelleaddocRow(inputtxt)
{
	$("#editloaddoctest"+inputtxt).remove();
}

function DelExistLeadDocument(docloadid,i,crmid)
{
//	 alert("inside DelExistLeadDocument");
	 var table = $('#editleaddocumenttab').DataTable();
	 $.ajax({
		    type:'GET',
			dataType: 'json',
	 		url :'${pageContext.request.contextPath}/deleteLeadDocument',
	 		data : ({'docloadid':docloadid , 'crmid':crmid}),
	 		success : function(data)
	 		{
//	 			alert("inside  "+data.errorDescription);
                  if(data.errorDescription == 'successloaddoc')
	 			   {
//                	   alert("inside DelExistLeadDocument success "+data.errorDescription);
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
	 			console.log("getDetailsToaddEvent"+data);
	 			
	 			$("#datasource").val(data.crmDataSource.datasource);
	 			
	 			$("#companyname").val(data.companyname);
	 			
	 			$("#nickname").val(data.nickname);
	 			
	 			$("#employeesize").val(data.employeesize);
	 			
	 			$("#annualturnover").val(data.annualturnover);
	 			
	 			$("#offering").val(data.offering);
	 			
	 			$("#crmeventdetails").val(data.crmevent);
	 			
	 			$("#purposeofeventdetails").val(data.purposeofevent);
	 			
	 			$("#primarysalesperson option[value='"+data.createdby+"']").prop("selected",true);
	     		$("#primarysalesperson").selectpicker("refresh");
	 			
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
</script>

<script type="text/javascript">


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
	 
	 if(crmtype === "Lead")
		 {
		        var editprojectdesc = $("#editprojectdesc").val();
		       
		      // var editpotentialopp = $("#editpotentialopp").val();
		       
		       var editchanceofsale =  $('select[name=editchanceofsale]').val();
		       
		       var editforecastclosedate =  $("#forecastclosedate").val();
		       
		       var doclenthtable = document.getElementsByName("editdocument_name");;
				 
		       
		       
		       if(editprojectdesc  ===  "")
				 {
				       alert("Please Enter Opportunity Description!");
				       return false;
				 } 
		       
		       /* if(editpotentialopp  ===  "")
				 {
				       alert("Please Enter Potensial Opportunity!");
				       return false;
				 } */
		       
		       if(editchanceofsale  ===  "")
				 {
				       alert("Please Enter Winning Stage %:!");
				       return false;
				 }
		       
		       var existdocsize = $("#editleaddocumentsize").val();
		       
		       var doclenthtable = document.getElementsByName("editdocument_name");
		       
		       if(existdocsize === "0")
				 {
		    	     if(doclenthtable.length === 0)
					 {
					    alert("Please Enter Documents Detail!");
					    return false;
					 }
				 }
		
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
//	 		    console.log("getDetailsToaddEvent"+data.length);
                   for(var i=0;i<data.length;i++)
	 				{
                     $("#editleaddocumentsize").val(data[0].docsize);
                   	
	 				  t.row.add([
 	 			            i+1,
 	 			            
 	 			            '<td><a href="downloadLeadDocument?doc_id='+data[i].leaddocumentid+'"><i class="material-icons">file_download</i></a></td>',
 	 			             data[i].documentname,
 	 			            '<td><button type="button" class="btn waves-effect waves-light" title="Delete Document" onclick="DelExistLeadDocument('+data[i].leaddocumentid+','+i+','+crmid+')"><i class="material-icons">delete</i></button></td>'
 	 			            ]).draw( false );
	 				}
	 		}
	  });
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
	 			
	 			console.log("offerining String is "+data.offering);
	 			
	 			$("#editofferingshow").val(data.offering);
	 			
	 			$("#editcompanyname").val(data.companyname);
	 			
	 			$("#editnickname").val(data.nickname);
	 			
	 			$("#editemployeesize option[value='"+data.employeesize+"']").prop("selected",true);
	 			$("#editemployeesize").selectpicker("refresh");
	 			
	 			$("#editannualturnover option[value='"+data.annualturnover+"']").prop("selected",true);
	 			$("#editannualturnover").selectpicker("refresh");
	 			
	 			if(data.crmtype === "Lead")
	 				{
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
	 				  
	 				 if(data.potentialopp == null){
		 	        $("#editpotentialopp").val(data.foreigncurrency);

	 				 }else{
	 				  $("#editpotentialopp").val(data.potentialopp);
	 				 }
	 				  
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

function DelRowEditExistData(i,enqcontid,crmid)
{
	 var table = $('#editcontactdetails').DataTable();
	 
//	 $('#editcontactdetails tbody').on( 'click', 'tr', function () {
//// 			    alert( 'Row index: '+table.row( this ).index() );
//		    table.row(this).remove().draw();
//		} );

	 
	 $.ajax({
		    type:'GET',
			dataType: 'json',
	 		url :'${pageContext.request.contextPath}/deleteContactDetails',
	 		data : ({'enqcontid':enqcontid ,'crmid':crmid}),
	 		success : function(data)
	 		{
//		 		   alert("Record deleted  "+data.errorDescription);
	 		   
	 		   if(data.errorDescription === 'successcon')
	 			   {
//	 			    alert("Record ded");
//	 			   $('#editcontactdetails tbody').on( 'click', 'tr', function () {
//	 				    alert( 'Row index: '+table.row( this ).index() );
	 				    table.row(i).remove().draw();
//	 				} );

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

function AddRow()
{
	  console.log("inside add row");
	  var lenthtable = $('#tab tr').length - 2;
	  $('#tab tbody tr').last().after('<tr id="test'+lenthtable+'">'
	  +'<td class="text-center" style="min-width: 50px; width: 50px;">'+(lenthtable)+'</td>'
	  +'<td class="text-center" style="min-width: 150px; width: 150px;"><input type="file" style="width:100%;color:black;text-align:centre;" id="document_upload'+lenthtable+'" name="document_upload"/></td>'
	  +'<td class="text-center" style="min-width: 150px; width: 150px;"><div class="form-group" ><div class="form-line"><input type="text" class="form-control" style="width:100%;color:black;text-align:centre;" id="document_name'+lenthtable+'" name="document_name" maxlength="100" placeholder="Enter Document Name"/></div></div></td>'
	  +'<td class="text-center" style="min-width: 50px; width: 50px;"><button type="button" class="btn waves-effect waves-light" title="Delete Document" onclick="DelRow('+lenthtable+')"><i class="material-icons">delete</i></button></td>'
	  +'</tr>');
}

function DelRow(inputtxt)
{
	  console.log("inside delete row");
	  var totallenthtable = $('#tab tr').length;
	  $("#test"+inputtxt).remove();
}

function submitionofaddevent()
{
	 var event = $("#crmevent").val();
	 
	 var purposeofevent =  $("#purposeofevent").val();
	 
	 var status =  $('select[name=status]').val();
	 
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
			    var othpurposeofevent =  $("#othpofevent").val();
			    
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
	 
	 if(status == "Converted to Lead")
		 {
		      /* console.log("in convert to lead block"); */
		      
		      var doclenthtable = document.getElementsByName("document_name");;
	 
			 if(doclenthtable.length === 0)
			 {
			    alert("Please Enter Documents Detail!");
			    return false;
			 }
		      
		      var totallenthtable = $('#tab tr').length;
		      
		      var projectdesc = $("#projectdesc").val();
		      
		      var potentialopp = $("#potentialopp").val();
		      
		      var forecastclose = $("#forecastclosedate").val();
		      
		      if(totallenthtable == 0)
		    	  {
		    	    alert("Please submit document!")
		    	    return false;
		    	  }
		      
		      if(projectdesc == "")
		    	  {
		    	    alert("Please Enter Opportunity Description!")
		    	    return false;
		    	  }
		      
		      if(potentialopp == "")
	    	  {
	    	    alert("Please Enter Deal value !")
	    	    return false;
	    	  }
		      
		      if(forecastclose == "")
	    	  {
	    	    alert("Please Enter Target Close Date !")
	    	    return false;
	    	  }
		 }
	 
	 
	 if(status == 'PO'){
		 var podate = $("#podate").val();
		 var poamount = $("#poamount").val();
		 var needbydate = $("#needbydate").val();
		 var ponumber = $("#ponumber").val();
		 
		 if(podate == "")
   	  {
   	    alert("Please Enter PO Date !")
   	    return false;
   	  }
		 
		 if(poamount == "")
	   	  {
	   	    alert("Please Enter PO amount !")
	   	    return false;
	   	  }
		 
		 if(needbydate == "")
	   	  {
	   	    alert("Please Enter need by date !")
	   	    return false;
	   	  }
		 
		 if(ponumber == "")
	   	  {
	   	    alert("Please Enter PO number !")
	   	    return false;
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

function closemodifieddetails()
{
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

function showleadinfodiv()
{
	 var status = $('select[name=status]').val();
	 
	 var x = document.getElementById("converttoleads");
	 
	 var y = document.getElementById("converttopo");
	 
	 if(status == "Converted to Lead")
		 {
		    if (x.style.display === "none")
  		      {
  			    x.style.display = "block";
  			  } 
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
    
function addEnquiry()
{
	 window.location.href =  "enquiry";
}

function changemybuttoncolor()
{
	   document.getElementById("addeditdetails").style.color = "black";
}

function changemybuttoncolormouseOut()
{
	   document.getElementById("addeditdetails").style.color = "white";
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

function changemyclosebuttoncolor()
{
	   document.getElementById("closeeditdetails").style.color = "black";
}

function changemyclosebuttoncolormouseOut()
{
	   document.getElementById("closeeditdetails").style.color = "white";
}

function changemyaddeventclosecolor()
{
	   document.getElementById("addeventclosebutton").style.color = "black";
}

function changeaddeventclosecolormouseOut()
{
	   document.getElementById("addeventclosebutton").style.color = "white";
}

function AddRowforEdit()
{
	 var lenthtable = $('#editcontactdetails tr').length - 2;
	 
	 $('#editcontactdetails tbody tr').last().after('<tr id="test'+(lenthtable)+'">'
			  +'<td>'+(lenthtable)+'</td>'
			  +'<td ><input type="text" class="form-control" id="editcontactname'+lenthtable+'" name="editcontactname" onchange=""  placeholder="Enter Contact Name" required></td>'
			  +'<td><input type="text" class="form-control" id="editDesignation'+lenthtable+'" name="editDesignation" onchange=""  placeholder="Enter designation" required></td>'
			  +'<td><input type="text" class="form-control mobile-phone-number" id="editmobilenos'+lenthtable+'" name="editmobilenos" placeholder="Ex:0000000000" onkeypress="return isNumber(event)" onchange="" required></td>'
			  +'<td><input type="text" class="form-control mobile-phone-number" id="editofficenos'+lenthtable+'" name="editofficenos" placeholder="Ex: +00 (000) 000-00-00"  onkeypress="return isNumber(event)" onchange=""></td>'
			  +'<td><input type="text" class="form-control email" id="editcontactemail'+lenthtable+'" name="editcontactemail" placeholder="Ex: example@example.com" onchange="editvalidateEmail('+lenthtable+')" required></td>'
			  +'<td><input type="text" class="form-control email" id="editaltemail'+lenthtable+'" name="editaltemail" placeholder="Ex: example@example.com" onchange="editvalidatealtEmail('+lenthtable+')"></td>'
			  +'<td><select class="form-control show-tick" data-live-search="true" id="editauhority'+lenthtable+'" name="editauhority" onchange="" required><option value="Manager">Manager</option>'
			  +'<option value="CEO">CEO</option>'
			  +'<option value="CTO">CTO</option>'
			  +'<option value="Director">Director</option>'
			  +'<option value="Project Manager">Project Manager</option>'
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

window.onhashchange = function() {
	 alert("browser button");
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
	
	