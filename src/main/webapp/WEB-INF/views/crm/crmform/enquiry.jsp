<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<meta name="viewport" content="width=device-width, initial-scale=1.0">


<div class="block-header">
           <h2></h2>
</div>

 <!-- Start -->
 
 		<div class="row clearfix">
 			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
 				<div class="card">
 					<!-- Page Header -->
	    			<div class="header" style="background-color:#2196F3;">
	    				<h2 style="color:white;">
	                     Enquiry Registration
	                    </h2>
	    			</div>
	    			<!-- End Page Header -->
	    			
	    				<!-- Page Body -->
	    				<div class="body">
	    					<form class="form-horizontal" method="post" action="saveenquirydetails" name="enuiryreg" id="enuiryreg" autocomplete="off" enctype="multipart/form-data">
	    					
	    					 <input type="hidden" id="reginassinged" name="reginassinged" class="form-control">
	    					
	    					    <div class="row clearfix" style="background-color:#eee; margin-bottom: 0px;">
								 <div class="col-sm-2 form-control-label" style="background-color:#eee; margin-bottom: 0px;text-align:left;"><h6>Company Details :</h6></div>
								</div>
	    						
	    						<div class="row clearfix" style="padding-top: 15px;">
	    						
	    							<div class="col-sm-2" style="width:10%">
                                          <label for="datasource"><span class="" style="color:red">*</span>Data Source :</label>
                                    </div>
	    						
	    							<div class="col-sm-2" style="width:19%">
	    								<div class="form-group">
                                        	<div class="form-line">
                                                <select class="form-control show-tick" data-live-search="true" id="datasource" name="datasource" onchange="" required>
                                                	<option value="">Select</option>
                                                	<c:forEach items="${crmdatasources}" var="crmdatasources">
                                            			<option value="${crmdatasources.crmdsid}">${crmdatasources.datasource}</option>
                                            		</c:forEach>
                                                </select>
                                        	</div>
                                    	</div>
	    							</div>
	    							
	    							<div class="col-sm-2" style="width:10%">
                                         <label for="offering"><span class="" style="color:red">*</span>Offering :</label>
                                    </div>
	    							
	    							<div class="col-sm-2" style="width:19%">
	    								<div class="form-group">
                                        	<div class="form-line">
                                                <select class="form-control show-tick" data-live-search="true" id="offering" name="offering" onchange="" multiple required>
                                                	<c:forEach items="${offerings}" var="offerings">
                                            			<option value="${offerings.offeringdesc}">${offerings.offeringdesc}</option>
                                            		</c:forEach>
                                                </select>
                                        	</div>
                                    	</div>
	    							</div>
	    							
	    							<div class="col-sm-2" style="width:15%">
	    								<label for="companyname"><span class="" style="color:red">*</span>Company Name:</label>
                                    </div>
	    						
	    							<div class="col-sm-2" style="width:19%">
	    								<div class="form-group">
                                        	<div class="form-line">
                                               <input type="text" id="companyname" name="companyname" class="form-control" onchange=""  placeholder="Enter Company Name" required>
                                            </div>
                                    	</div>
	    							</div>
	    							
	    							
	    							 <div class="col-sm-2" style="width:12%;">
                                          <label for="remark">Industry :</label>
	                                  </div>
	                                    
		                                <div class="col-sm-2"  style="width:19%">
		                                      <div class="form-group" ><div class="form-line" style="margin-left:-24px;">
	                                          <input type="text" id="industry_of_company" name="industry_of_company" class="form-control"  placeholder="Enter Industry" value="" >
		                                      </div></div>
		                                </div>
		                                
		                                
		                            <div class="col-sm-2" style="width:10%; margin-left:-17px;">
		    								<label for="nickname">Nick Name:</label>
	                                </div>
		    						
		    						<div class="col-sm-2" style="width:19%;">
		    								<div class="form-group" >
	                                        	<div class="form-line">
	                                                <input type="text" id="nickname" name="nickname" class="form-control" onchange=""  placeholder="Enter Nick Name" >
	                                        	</div>
	                                    	</div>
		    						</div>
		    						
		    						
		    						
		    						<div class="col-sm-2" style="width:10%">
		    								<label for="Address">Address1:</label>
	                                </div>
		    						
		    						<div class="col-sm-2" style="width:19%; margin-left:5%;">
		    								<div class="form-group" >
	                                        	<div class="form-line">
	                                                <input type="text" id="address1" name="address1" class="form-control" onchange=""  placeholder="Enter Address" >
	                                        	</div>
	                                    	</div>
		    						</div>
		                                
		                                
	    							
	    						</div>
	    						
	    						<div class="row clearfix">
	    						
		    							
		    						
		    						<div class="col-sm-2" style="width:10%">
		    								<label for="Address">Address2:</label>
	                                </div>
		    						
		    						<div class="col-sm-2" style="width:19%">
		    								<div class="form-group" >
	                                        	<div class="form-line">
	                                                <input type="text" id="address2" name="address2" class="form-control" onchange=""  placeholder="Enter Address" >
	                                        	</div>
	                                    	</div>
		    						</div>	
	    							
	    							<div class="col-sm-2" style="width:10%">
		    								<label for="City "> <span class="" style="color:red">*</span> City :</label>
	                                </div>
		    						
		    						<div class="col-sm-2" style="width:19%;">
		    								<div class="form-group" >
	                                        	<div class="form-line">
	                                                <input type="text" id="city" name="city" class="form-control" onchange=""  placeholder="City" >
	                                        	</div>
	                                    	</div>
		    						</div>
		    						
		    						 <div class="col-sm-2" style="width:10%">
	    								<label for="country"> <span class="" style="color:red">*</span> Territory:</label>
                                	</div>
                                	
                                	<div class="col-sm-2" style="width:19%; margin-left:5%;">
	    								<div class="form-group">
                                        	<div class="form-line" >
                                                <select class="form-control show-tick"  id="terrioryid" name="terrioryid" onchange="contrytype()">
                                                	
                                                </select>
                                        	</div>
                                    	</div>
	    							</div>
		    							
                                </div>
                                
                                <div class="row clearfix">
                                
	    							
                                    <div class="col-sm-2" style="width:10%">
	    								<label for="country"><span class="" style="color:red">*</span>Region:</label>
                                	</div>
                                	
                                	<div class="col-sm-2" style="width:19%">
	    								<div class="form-group">
                                        	<div class="form-line" >
                                                <select class="form-control show-tick" id="country" name="country" onchange="indianstate()">
                                                	
                                                </select>
                                        	</div>
                                    	</div>
	    							</div>
	    							
	    							
	    							<div class="col-sm-2" style="width:10%;display:none" id="indianstate1" >
	    								<label for="state"><span class="state" id="state" style="color:red">*</span>State:</label>
                                	</div>
                                	
                                	<div class="col-sm-2" style="width:19%; display:none" id="indianstate">
	    								<div class="form-group">
                                        	<div class="form-line" >                          
                                                <select class="form-control show-tick" data-live-search="true"id="instate" name="instate" onchange="getStateList()">
                                                	
                                                </select>
                                        	</div>
                                    	</div>   
	    							</div>
	    							
	    							<div class="col-sm-2" style="width:19%; display:none" id="otherthanindianstate">
	    								<div class="form-group">
                                        	<div class="form-line" >
                                                <input type="text" id="otherstate" name="otherstate" class="form-control" onkeypress="return alphaOnly(event)"  placeholder=""  >
                                            </div>
                                    	</div>
	    							</div>
	    							
	    							<div class="col-sm-2" style="width:10%;display:none" id="districts" >
	    								<label for="districts"><span class="" style="color:red">*</span>District:</label>
                                	</div>
                                	
                                	<div class="col-sm-2" style="width:19%; display:none; margin-left:5%;" id="indiandistricts">
	    								<div class="form-group">
                                        	<div class="form-line" >                          
                                                <select class="form-control show-tick" data-live-search="true"id="indistricts"  name="indistricts" onchange=""  >
                                                	
                                                </select>
                                        	</div>
                                    	</div>
	    							</div>
	    							
	    							
	    							
	    								<div class="col-sm-2" style="width:10%">
	    								<label for="employeesize"><span class="" style="color:red">*</span>Employee Size:</label>
                                	</div>
                                	
                                	<div class="col-sm-2" style="width:19%">
	    								<div class="form-group">
                                        	<div class="form-line" >
                                                <select class="form-control show-tick" data-live-search="true" id="employeesize" name="employeesize" onchange="" required>
                                                	<option value="">Select</option>
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
	    								<label for="annualturnover"><span class="" style="color:red">*</span>Turnover(Cr):</label>
                                	</div>
                                	
                                	<div id="turnoverselectdiv" class="col-sm-2" style="width:19%;">
	    								<div class="form-group">
                                        	<div class="form-line">
                                                <select class="form-control show-tick" data-live-search="true" id="annualturnover" name="annualturnover" onchange="" required>
                                                	<option value="">Select</option>
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
	    							
	    							
	    							<div class="col-sm-2" style="width:12%; display:none" id="otherthanindiandistricts">
	    								<div class="form-group">
                                        	<div class="form-line" >
                                                <input type="text" id="otherdistricts" name="otherdistricts" class="form-control" onkeypress="return alphaOnly(event)" placeholder=""  >
                                            </div>
                                    	</div>
	    							</div>
	    							
	    							
	    							  <div class="col-sm-2" style="width:20%">
	    								   <label for="isassigneto"><span class="" style="color:red">*</span> Assign enquiry: </label>
                                	   </div>
                                	   
                                	   <div id="assignenquiryselectdiv" class="col-sm-2" style="width:19%; margin-left:-10%;" >
		    								<div class="form-group">
	                                        	<div class="form-line">
	                                                <select class="form-control show-tick" data-live-search="true" id="isassigneto" name="isassigneto" onchange="showassigneto()" required>
	                                                	<option value="">Select</option>
	                                                	<option value="Yes">Yes</option>
	                                                	<option value="No">No</option>
	                                                </select>
	                                        	</div>
	                                    	</div>
	    						      </div>
	    						      
	    						           <div id="assignetodiv" style="display:none">
	    						      
	    						           <div class="col-sm-2" style="width:10%">
	    								     <label for="assigneto"><span class="" style="color:red">*</span>Assign To:</label>
                                	       </div>
                                	       
                                	       <div class="col-sm-2" style="width:19%">
			    								<div class="form-group">
		                                        	<div class="form-line">
		                                                <select class="form-control show-tick" data-live-search="true" id="assigneto" name="assigneto" onchange="setprimarysales()"  >
		                                                	<option value="">Select</option>
		                                                	<c:forEach items="${employeemaster}" var="employeemaster">
		                                            			<option value="${employeemaster.empid}">${employeemaster.empfirstname} ${employeemaster.emplastname}</option>
		                                            		</c:forEach>
		                                                </select>
		                                        	</div>
		                                    	</div>
			    							</div>
			    							
                                	   </div>
                                	   
                                	   
                                	       	      	<div class="col-sm-2" style="width:10%">
                                          <label for="status"> <span class="" style="color:red">*</span> Calling Status :</label>
	                                    </div>
		    						
		    							<div class="col-sm-2" style="width:19%">
		    								<div class="form-group">
	                                        	<div class="form-line">
	                                                <select class="form-control show-tick" data-live-search="true" id="calling_status" name="calling_status" onchange="showleadinfodiv()" required>
	                                    <option value="">Select</option>
										<option value="Not Received">Not Received</option>
										<option value="Not Connect">Not Connect</option>
										<option value="Busy">Busy</option>
										<option value="Call Back">Call Back</option>
										<option value="Invalid">Invalid</option>
										<option value="Not Interested">Not Interested</option>
										<option value="Follow Up">Follow Up</option>
										<option value="Wrong No">Wrong No</option>
										<option value="Language Barrier">Language Barrier</option>
										<option value="Meet Scheduled">Meet Scheduled</option>
										<option value="Meeting Cancle">Meet Cancel</option>
										<option value="Meet Postponed">Meet Postponed</option>
										<option value="Meet Done">Meet Done</option>
										<option value="Other">Other</option>

									</select>
	                                        	</div>
	                                    	</div>
		    							</div>
		    							
		    							
		    						  <div class="col-sm-2" style="width:14%">
                                          <label for="remark"> <span class="" style="color:red">*</span> Remark:</label>
	                                  </div>
	                                    
		                                <div id="remarktextdiv" class="col-sm-2" style="width:19%;">
		                                      <div class="form-group" ><div class="form-line">
	                                          <input type="text" id="calling_status_remark" name="calling_status_remark" class="form-control"  placeholder="" value="" >
		                                      </div></div>
		                                </div>
		                                
	    							
	    						</div>
	    						
	    						<div class="row clearfix" style="padding-top: 15px;">
	    						
	    							<div class="col-sm-2" style="width:10%">
                                          <label for="datasource"><span class="" style="color:red">*</span>Follow-up date :</label>
                                    </div>
	    						
	    							<div class="col-sm-2" style="width:19%">
	    								<div class="form-group">
                                        	<div class="form-line">
                                                <input type="Date" id="flow_of_Date" name="flow_of_Date" class="form-control"  placeholder="" value="" >
                                        	</div>
                                    	</div>
	    							</div>
	    						
	    						
	    						
	    						<div class="row clearfix">
                                </div>
	    						<div class="row clearfix">
                                 
		                                </div>		                                
		                               <div class="row clearfix" style="margin-left:-5px;">
                  
		                              <!--    <div class="col-sm-2"  style="width:12%">
                                          <label for="remark">Alternative Email Id:</label>
	                                  </div>
	                                    
		                                <div class="col-sm-2" >
		                                      <div class="form-group" ><div class="form-line">
	                                          <input type="text" id="alternative_email_id" name="alternative_email_id" class="form-control"  placeholder="" value="" >
		                                      </div></div>
		                                </div> -->
		                                
		                                
		                                
		                                 <!-- <div class="col-sm-2"  style="width:14%">
                                          <label for="remark">Designation Of Prospect:</label>
	                                  </div>
	                                    
		                                <div class="col-sm-2" >
		                                      <div class="form-group" ><div class="form-line">
	                                          <input type="text" id="designation_of_prospect" name="designation_of_prospect" class="form-control"  placeholder="" value="" >
		                                      </div></div>
		                                </div> -->
                                	   
                                	   
                                	   </div>
	    						
	    						<div class="row clearfix" style="background-color:#eee; margin-bottom: 0px;">
								    <div class="col-sm-2 form-control-label" style="background-color:#eee; margin-bottom: 0px; text-align:left;"><h6></span>Contact Details :</h6></div>
								</div>
                                
                                <div class="row clearfix" style="padding-top: 15px;">
                                	<div class="col-md-12">
                                		<div class="form-group">
                                			<div class="body table-responsive">
                                				<table class="table" id="tab" class="form-control show-tick" style="padding:3px;">
                                					<thead>
                                						<tr>
                                							<th style="font-weight:normal;"><b>Sr No</b></th>
                                							<th style="font-weight:normal;" ><span class="" style="color:red">*</span><b>Contact Name</b> </th>
                                							<th style="font-weight:normal;"><span class="" style="color:red">*</span><b>Designation</b></th>
                                							<th style="font-weight:normal;"><b>Mobile</b></th>
                                							<th style="font-weight:normal;"><span class="" style="color:red"></span><b>Alternative No</b></th>
                                							<th style="font-weight:normal;"><span class="" style="color:red"></span><b>Email</b></th>
                                							<th style="font-weight:normal;"><b>Alt Email</b></th>
                                							<th style="font-weight:normal;"><b>Authority</b></th>
                                							<th style="font-weight:normal;"><b>Delete</b></th>
                                						</tr>
                                					</thead>
                                					<tbody>
                                						<tr>
                                						</tr>
                                					</tbody>
                                					<tfoot>
                                						<tr>
                                							<th><button type="button" class="btn waves-effect waves-light" title="Add Contact" onclick="AddRow()">
                                   			                   <i class="material-icons">add</i>
                               			                     </button></th>
                                							<th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th>
                                						</tr>
                                					</tfoot>
                                				</table>
                                			</div>
                                		</div>
                                	</div>
                                </div>
                                
                                 <div class="row clearfix" style="background-color:#eee; margin-bottom: 0px;">
								    <div class="col-sm-2 form-control-label" style="background-color:#eee; margin-bottom: 0px;text-align: left"><h6>Sales Life Cycle:</h6></div>
								</div>
								
                                 
                                 <div class="row clearfix" style="padding-top: 15px;">
                                        <div class="col-sm-2" style="width:9%">
                                          <label for="crmevent"><span class="" style="color:red">*</span>Event :</label>
	                                    </div>
		    						
		    							<div class="col-sm-2" style="width:17%">
		    								<div class="form-group">
	                                        	<div class="form-line">
	                                                <select class="form-control show-tick" data-live-search="true" id="crmevent" name="crmevent" onchange="" required>
	                                                	<option value="">Select</option>
	                                                	<c:forEach items="${crmevents}" var="crmevents">
	                                            			<option value="${crmevents.crmevent}">${crmevents.crmevent}</option>
	                                            		</c:forEach>
	                                                </select>
	                                        	</div>
	                                    	</div>
		    							</div>
		    							
		    							<div class="col-sm-2" style="width:13%">
                                          <label for="purposeofevent"><span class="" style="color:red">*</span>Event Stages:</label>
	                                    </div>
		    						
		    							<div class="col-sm-2" style="width:18%">
		    								<div class="form-group">
	                                        	<div class="form-line">
	                                                <select class="form-control show-tick" data-live-search="true" id="purposeofevent" name="purposeofevent" onchange="showotherpofevent()" required>
	                                                	<option value="">Select</option>
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
		    						
		    							<div class="col-sm-2" style="width:15%">
		    								<div class="form-group">
	                                        	<div class="form-line">
	                                                <select class="form-control show-tick" data-live-search="true" id="status" name="status" onchange="showleadinfodiv()" required>
	                                                	<option value="">Select</option>
	                                                	<c:forEach items="${statusofevent}" var="statusofevent">
	                                            			<option value="${statusofevent.eventstatus}">${statusofevent.eventstatusname}</option>
	                                            		</c:forEach>
	                                                </select>
	                                        	</div>
	                                    	</div>
		    							</div>
		    							
		    							<!--    -->
		    							
		    						
		    							
		    							<!--   -->
		    							
                                 </div>
                                 
                                  <div class="row clearfix" style="margin-left:-38px;">
                                  
                                      <div class="col-sm-2" style="margin-left: 28px;width:9%">
                                          <label for="remark">Remark:</label>
	                                  </div>
	                                    
		                                <div class="col-sm-2" style="width:17%;">
		                                      <div class="form-group" ><div class="form-line">
	                                          <input type="text" id="remark" name="remark" class="form-control"  placeholder="" value="" >
		                                      </div></div>
		                                </div>
                                  </div>
                                  
                                  <div class="" id="converttoleads" style="display:none">
				             
				                   <div class="row clearfix">
				                         <div class="col-sm-2" style="width:15%">
                                          <label for="projectdesc"><span class="" style="color:red">*</span>Opportunity Discription:</label>
	                                    </div>
	                                    
	                                    <div class="col-sm-8" style="">
	                                      <div class="form-group" ><div class="form-line">
                                          <input type="text" id="projectdesc" name="projectdesc" class="form-control"  placeholder="" value="">
	                                      </div></div>
	                                    </div>
				                   </div>
				                   
				                  
				                   <div class="row clearfix">
				                         
	                                    <div class="col-sm-2" style="width:13%">
                                          <label for="chanceofsale"><span class="" style="color:red">*</span>Lead conversion stage :</label>
	                                    </div>
		    						
		    							<div class="col-sm-2" style="width:15%">
		    								<div class="form-group">
	                                        	<div class="form-line">
	                                                <select class="form-control show-tick" data-live-search="true" id="chanceofsale" name="chanceofsale" onchange="showMarginDiv()" required>
	                                                	<option value="">Select</option>
	                                                	<option value="Next level meet">Next level meet</option>
	                                                	<option value="Demonstration">Demonstration</option>
	                                                	<option value="POC">POC</option>
	                                                    <option value="Proposal expected">Proposal expected</option>
	                                                	<!-- <option value="Proposal shared">Proposal shared</option> -->
	                                                	<option value="Price Negotiation">Price Negotiation</option>
	                                                	<!-- <option value="Order Closed">Order Closed</option> -->
	                                                	<!-- <option value="Lost">Lost</option> -->
	                                                	<!-- <option value="Solution Development Service">Solution Development Service</option> -->
	                                                    <option value="License reselling">License reselling</option>
	                                                    <option value="Resource Augmentation">Resource Augmentation</option>
	                                                	
	                                                </select>
	                                        	</div>
	                                    	</div>
		    							</div>
		    							
		    							
		    							<div id="margin_div" style="display:none;">
		    							   <div class="col-sm-2" style="width:9%">
                                          <label for="projectdesc"><span class="" style="color:red">*</span>Margin(%):</label>
	                                    </div>
	                                    
	                                    <div class="col-sm-2" style="">
	                                      <div class="form-group" ><div class="form-line">
                                          <input type="text" id="margin" name="margin" class="form-control"  placeholder="" value="">
	                                      </div></div>
	                                    </div>
		    							</div>
		    							
		    							
		    							<div class="col-sm-2" style="">
                                          <label for="forecastclosedate"><span class="" style="color:red">*</span>Target Close Date:</label>
	                                    </div>
	                                    
	                                    <div class="col-sm-2" style="width:15%">
	                                      <div class="input-group date" id="bs_datepicker_component_container">
	                                        <div class="form-line">
	                                            <input type="text" class="form-control" name="forecastclosedate" id="forecastclosedate" placeholder="Please choose a date..." >
	                                        </div>
	                                        <span class="input-group-addon">
	                                            <i class="material-icons">date_range</i>
	                                        </span>
	                                    </div>
	                                    </div>
		    							
				                   </div>
				                    <div class="row clearfix" style="margin-left:-2px;display:none" id="expdeal">
				                   <div class="col-sm-2" style="margin-left: -1%;">
                                          <label for="potentialopp" ><span class="" style="color:red">*</span>Expected Deal Amt(INR):</label>
	                                    </div>
										
										<div class="col-sm-2" style="width:15%">
	                                      <div class="form-group" ><div class="form-line">
                                          <input type="text" id="potentialopp" name="potentialopp" class="form-control" onkeypress="return isNumber(event)" placeholder="" value="">
	                                      </div></div>
	                                    </div>
				                   </div>
				   
				   
				                 <div class="row clearfix" style="margin-left:-2px;display:none" id="othercurrency">
				                        <div class="col-sm-2" style="margin-left:-13px;" id="currencytype1">
                                          <label for="potentialopp"><span class="" style="color:red">*</span>Currency Type:</label>
	                                    </div>
										
										<div class="col-sm-2" style="width:12%;margin-left:-2%"  id="currencytypes">
	    								<div class="form-group">
                                        	<div class="form-line" >
                                                 <input type="text" id="currencytype" name="currencytype" class="form-control" onkeypress="return isNumber(event)" placeholder="" value="" readonly>
                                        	</div>
                                    	</div>
	    							</div>
				                
				                   <div class="col-sm-2" id="foreigncurrency1" style="margin-left: 6%;">
                                          <label for="potentialopp"><span class="" style="color:red">*</span>Deal value :</label>
	                                    </div>
										
										<div class="col-sm-2" style="width:15%;margin-left:-5%" id="foreign">
	                                      <div class="form-group" ><div class="form-line">
                                          <input type="text" id="foreigncurrency" name="foreigncurrency" class="form-control" onkeypress="return isNumber(event)" placeholder="" value="">
	                                      </div></div>
	                                    </div>
	                                    </div>
				                   
				                   
				                   <div class="clearfix" style="background-color:#eee; margin-bottom: 0px;">
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
				             
				                  <div class="clearfix" style="background-color:#eee; margin-bottom: 0px;">
								     <div class="col-sm-2 form-control-label" style="background-color:#eee; margin-bottom: 0px;text-align:left;"><h6>Documents Detail:</h6></div>
								   </div>
				                  
				                  <div class="row clearfix">
				                       <div class="col-md-12">
				                            <div class="form-group">
				                                 <div class="body table-responsive">
				                                      <table class="table" id="documenttab" class="form-control show-tick" style="padding:3px;">
				                                        <thead>
	                                						<tr>
	                                							<th class="text-center" style="min-width: 50px; width: 50px; font-weight:normal;"><b>Sr No</b></th>
	                                						    <th class="text-center" style="min-width: 150px; width: 150px; font-weight:normal;"><b>Document</b></th>
	                                							<th class="text-center" style="min-width: 150px; width: 150px; font-weight:normal;"><b>Document Description</b></th>
	                                							<th class="text-center" style="min-width: 50px; width: 50px; font-weight:normal;"><b>Delete</b></th>
	                                						</tr>
	                                					</thead>
	                                					
	                                					<tbody>
                                						<tr>
                                						</tr>
                                					    </tbody>
                                					    
                                					    <tfoot>
                                						<tr>
                                							<th><button type="button" class="btn waves-effect waves-light" title="Add Document" onclick="AddDocumentRow()">
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
	    						
	    						<div class="">
	    						    <div class="form-group">
	    						         <div class="button-demo" align="center">
	    						                <button type="button" value="Save" id="mySaveBtn"  onclick="checkforallfield()" class="btn bg-blue waves-effect"
													style="font-weight: bold;">Save</button>
												
												<button type="button" value="Close" onclick="closeProjectDetails()" class="btn bg-blue-grey waves-effect"
													style="font-weight: bold;">Close</button>
	    						         </div>
	    						    </div>
	    						</div>
                                
                                
	    						
	    					</form>
	    				</div>
	    				<!--End of Page Body -->
 				</div>
 			</div>
 		</div>
 
 <!-- End -->
 
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

  <script type="text/javascript">
  
  
  function showMarginDiv(){
	var a =  $('#chanceofsale').val();
	//alert(a);
	if(a == 'License reselling'){
		$('#margin_div').css('display', 'block');
	}else{
		$('#margin_div').css('display', 'none');

	}
  }
  
  $(document).keydown(function(e) {
	    // ESCAPE key pressed
	    if (e.keyCode == 27) {
	    	window.location.href = "enquiries";
	    }
	});
  
function  indianstate(){


var country = $('select[name=country]').val();
 
 //alert(country);
 
 if(country==101){
	 $('#turnoverselectdiv').css('margin-left' , '-5%');
	 $('#assignenquiryselectdiv').css('margin-left' , '-5%');
	 $('#remarktextdiv').css('margin-left' , '-4%');
	//remarktextdiv 
		var instate = document.getElementById("instate").value;
		var x = document.getElementById("indianstate");
		var y = document.getElementById("otherthanindianstate");
		var z = document.getElementById("indianstate1");
		var x1 = document.getElementById("districts");
		
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
		
		if (z.style.display === "none")
		   {
			    z.style.display = "block";
		   }
		
		    if (y.style.display === "block")
  		   {
  			    y.style.display = "none";
  		   }
		    
		    if (x1.style.display === "none")
	  		   {
	  			    x1.style.display = "block";
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
	 
 }else{
	 
	 $('#turnoverselectdiv').css('margin-left' , '0%');
	 $('#assignenquiryselectdiv').css('margin-left' , '-10%');
	 $('#remarktextdiv').css('margin-left' , '0%');
	 
		var instate = document.getElementById("instate").value;
		var x = document.getElementById("indianstate");
		var y = document.getElementById("otherthanindianstate");
		var z = document.getElementById("indianstate1");
		var x1 = document.getElementById("districts");
		
		var p = document.getElementById("indiandistricts");
		var q = document.getElementById("otherthanindiandistricts");
		
		
		if (p.style.display === "block")
  		   {
  			    p.style.display = "none";
  		   } 
		
		if (q.style.display === "block")
  		   {
  			    q.style.display = "none";
  		   } 
		
		if (x.style.display === "block")
  		   {
  			    x.style.display = "none";
  		   }
		
		if (z.style.display === "block")
		   {
			    z.style.display = "none";
		   }
		
		    if (y.style.display === "block")
  		   {
  			    y.style.display = "none";
  		   }
		    
		    if (x1.style.display === "block")
	  		   {
	  			    x1.style.display = "none";
	  		   } 
	 
 }
 

}
  
  window.addEventListener("load", (event) => {
	  var empid=${employeeid};

     $.ajax({
		type: 'GET',
	 		dataType: 'json',
	 		url :'${pageContext.request.contextPath}/getAssignedterritory',
	 		data : ({'assigned_id' : empid}),
	 		success : function(data){
	 			var country = $('#terrioryid');
	 		    country.find('option').remove();
	 			var options = '';
	 			options +='<option value=\"\">Select</option>'	
	 		for (var i = 0; i < data.length; i++) {
	 			
	 			if(data[i].territory_id.is_activated=="Y"){
	 			options += '<option value="' + data[i].territory_id.tr_id + '">' + data[i].territory_id.territory_name +'</option>';
 	 			$("#terrioryid").append(options);
 				$("#terrioryid").selectpicker("refresh");
	 			}
	 		}
	 	}
 	 		
    	  	   	 			
});
	  
	  
	  //
	  var lenthtable = $('#tab tr').length - 2;
	  $('#tab tbody tr').last().after('<tr id="test'+lenthtable+'">'
	  +'<td class="text-center" style="min-width: 50px; width: 50px;">'+(lenthtable)+'</td>'
	  +'<td class="text-center" style="min-width: 115px; width: 150px;"><input type="text" class="form-control" id="contactname'+lenthtable+'" name="contactname" onchange=""  placeholder="Enter Name" required></td>'
	  +'<td class="text-center" style="min-width: 150px; width: 150px;"><input type="text" class="form-control" id="designation'+lenthtable+'" name="Designation" onchange=""  placeholder="Enter designation" required></td>'
	  +'<td class="text-center" style="min-width: 150px; width: 150px;"><input type="text" class="form-control mobile-phone-number" id="mobilenos'+lenthtable+'" name="mobilenos" onchange="mobnumber('+lenthtable+')" placeholder="Ex:0000000000" onkeypress="return isNumber(event)"  maxlength="20" ></td>'
	  +'<td class="text-center" style="min-width: 110px; width: 110px;"><input type="text" class="form-control mobile-phone-number" id="officenos'+lenthtable+'" name="officenos" onchange="" placeholder="Ex: +00 (000) 000-00-00" onkeypress="return isNumber(event)" required></td>'
	  +'<td class="text-center" style="min-width: 150px; width: 150px;"><input type="text" class="form-control email" id="contactemail'+lenthtable+'" name="contactemail" placeholder="Ex: example@example.com" onchange="validateEmail('+lenthtable+')"></td>'
	  +'<td class="text-center" style="min-width: 110px; width: 110px;"><input type="text" class="form-control email" id="altemail'+lenthtable+'" name="altemail" placeholder="Ex: example@example.com" onchange="validatealtEmail('+lenthtable+')"></td>'
	  +'<td class="text-center" style="min-width: 136px; width: 110px;"><select class="form-control show-tick" data-live-search="true" id="auhority'+lenthtable+'" name="auhority" required><option value="Manager">Manager</option>'
	  +'<option value="CEO">CEO</option>'
	  +'<option value="CTO">CTO</option>'
	  +'<option value="Director">Director</option>'
	  +'<option value="Project Manager">Project Manager</option>'
	  +'<option value="Influencer">Influencer</option>'
	  +'<option value="Decision Maker">Decision Maker</option>'
	  +'</select></td>'
	  +'<td class="text-center" style="min-width: 50px; width: 50px;"><button type="button" class="btn waves-effect waves-light" title="Delete Contact" onclick="DelRow('+lenthtable+')"><i class="material-icons">delete</i></button></td>'
	  +'</tr>');
	});
  
  
  
   $('#bs_datepicker_component_container').datepicker({
	  startDate: new Date()
	  });

   function mobnumber1(){
	   alert("test");
   }
   
//   function warning()
//   {
//  	  var empid = ${employeeid};
// // 	  var empid = '41';
// 	  $("#primarysalesperson option[value='"+empid+"']").prop("selected",true);
// 	  $("#primarysalesperson").selectpicker("refresh");
//   }
  
//   window.onbeforeunload = warning();
  
	  function AddRow()
	  {
		  console.log("inside add row");
		  
		  var lenthtable = $('#tab tr').length - 2;
		  $('#tab tbody tr').last().after('<tr id="test'+lenthtable+'">'
		  +'<td class="text-center" style="min-width: 50px; width: 50px;">'+(lenthtable)+'</td>'
		  +'<td class="text-center" style="min-width: 150px; width: 150px;"><input type="text" class="form-control" id="contactname'+lenthtable+'" name="contactname" onchange=""  placeholder="Enter Contact Name" required></td>'
		  +'<td class="text-center" style="min-width: 150px; width: 150px;"><input type="text" class="form-control" id="designation'+lenthtable+'" name="Designation" onchange=""  placeholder="Enter designation" required></td>'
		  +'<td class="text-center" style="min-width: 150px; width: 150px;"><input type="text" class="form-control mobile-phone-number" id="mobilenos'+lenthtable+'" name="mobilenos" onchange="mobnumber('+lenthtable+')" placeholder="Ex:0000000000" onkeypress="return isNumber(event)" maxlength="20" ></td>'
		  +'<td class="text-center" style="min-width: 110px; width: 110px;"><input type="text" class="form-control mobile-phone-number" id="officenos'+lenthtable+'" name="officenos" onchange="" placeholder="Ex: +00 (000) 000-00-00" onkeypress="return isNumber(event)" ></td>'
		  +'<td class="text-center" style="min-width: 150px; width: 150px;"><input type="text" class="form-control email" id="contactemail'+lenthtable+'" name="contactemail" placeholder="Ex: example@example.com" onchange="validateEmail('+lenthtable+')" required></td>'
		  +'<td class="text-center" style="min-width: 110px; width: 110px;"><input type="text" class="form-control email" id="altemail'+lenthtable+'" name="altemail" placeholder="Ex: example@example.com" onchange="validatealtEmail('+lenthtable+')"></td>'
		  +'<td class="text-center" style="min-width: 136px; width: 110px;"><select class="form-control show-tick" data-live-search="true" id="auhority'+lenthtable+'" name="auhority" required><option value="Manager">Manager</option>'
		  +'<option value="CEO">CEO</option>'
		  +'<option value="CTO">CTO</option>'
		  +'<option value="Director">Director</option>'
		  +'<option value="Project Manager">Project Manager</option>'
		  +'<option value="Influencer">Influencer</option>'
		  +'<option value="Decision Maker">Decision Maker</option>'
		  +'</select></td>'
		  +'<td class="text-center" style="min-width: 50px; width: 50px;"><button type="button" class="btn waves-effect waves-light" title="Delete Contact" onclick="DelRow('+lenthtable+')"><i class="material-icons">delete</i></button></td>'
		  +'</tr>');
		  
	}
	  
	  function DelRow(inputtxt)
	  {
		  console.log("inside delee row");
		  var totallenthtable = $('#tab tr').length;
		  $("#test"+inputtxt).remove();

		}
	  
</script>


<script type="text/javascript">

var countrytype1 = $("#countrytype").val();

if(countrytype1===""){
const box = document.getElementById('state');

box.style.display = 'none'; 

const box1 = document.getElementById('districts'); 
box1.style.display = 'none'; 
}

function mobnumber(inputtxt)
{
	var tlength = $('#tab tr').length-2;
	 var arr = [];
	 for(var i=1; i<=tlength; i++)
	 {
		 var mobilenos = $('#mobilenos'+i).val();
		 arr[i] = mobilenos;
	 }
	 let hasDuplicate = arr.some((val, i) => arr.indexOf(val) !== i);
	// hasDuplicate = true
	if(hasDuplicate==true){
		alert("Moblie number should not be same!");
		document.getElementById("mobilenos"+inputtxt).value = "";
		return false
	}
	
// 	Santosh commit this code on 09-02-2025
        var entermob = document.getElementById("mobilenos"+inputtxt);
	        if (/^\d{10}$/.test(entermob.value))
			{
			
			}
	    else
			{
// 				alert("Enter valid  Mobile Number !");
// // 				$('#mobilenos'+inputtxt).val(" ");
// 				document.getElementById("mobilenos"+inputtxt).value = "";
// 				return false;
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
// 				$('#mobilenos'+inputtxt).val(" ");
				document.getElementById("officenos"+inputtxt).value = "";
				return false;
			}
}

function validateEmail(inputtxt) {
    const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    var enteremail = document.getElementById("contactemail"+inputtxt).value;
//     alert(re.test(String(enteremail).toLowerCase()));
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
//         alert(re.test(String(enteremail).toLowerCase()));
        if(!(re.test(String(enteremail).toLowerCase())))
        {
        	alert("Enter valid Email !");
//    			$('#mobilenos'+inputtxt).val(" ");
    		document.getElementById("altemail"+inputtxt).value = "";
    		return false;
        }
    }
    
    function showassigneto()
    {
    	var assigneto = $('select[name=isassigneto]').val();
    	
    	if(assigneto === "Yes")
    		{
    		  var x = document.getElementById("assignetodiv");
    		  if (x.style.display === "none")
    		      {
    			    x.style.display = "block";
    			  } 
    		}
    	else
    		{
    		 var x = document.getElementById("assignetodiv");
    		 if (x.style.display === "block")
		      {
			    x.style.display = "none";
			  }
    		 
    		 var empid = ${employeeid};
   	 	     $("#primarysalesperson option[value='"+empid+"']").prop("selected",true);
    		 $("#primarysalesperson").selectpicker("refresh");
    		}
    }
    
    function setprimarysales()
    {
    	var assigntoemp = $('select[name=assigneto]').val();
		  
		  $("#primarysalesperson option[value='"+assigntoemp+"']").prop("selected",true);
		  $("#primarysalesperson").selectpicker("refresh");
    }
    
    function showotherpofevent()
    {
    	var pofevent = $('select[name=purposeOfEvent]').val();
    	
    	if(pofevent === "Other")
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
    
    function isNumber(evt) {
        evt = (evt) ? evt : window.event;
        var charCode = (evt.which) ? evt.which : evt.keyCode;
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            return false;
        }
        return true;
    }
    
    function alphaOnly(event) {
    	 evt = (event) ? event : window.event;
         var charCode = (event.which) ? event.which : event.keyCode;
         if  (charCode > 31 && (charCode < 48 || charCode > 57)) {
             return true;
         }
         return false;
    	  
    
    }
    	
    	function contrytype(){
    		
    		var terriotryid = $('select[name=terrioryid]').val();
    		
  		   $.ajax({
 	      		type: 'GET',
 	   	 		dataType: 'json',
 	   	 		url :'${pageContext.request.contextPath}/getterritoryidbasedonmainterriotry',
 	   	 		data : ({'tr_id' : terriotryid}),
 	   	 		success : function(data){
 	   	 		
 	   	 		for (var i = 0; i < data.length; i++) {
 	   	 		getcountry(data[i].regionid.countryid);
 	   	 		
 	 			}
 	   	 			
 	   	 		}
 	      		 
 	      	 });
    }   		
    	
    function getcountry(countryid){
    	
    	$.ajax({
      		type: 'GET',
   	 		dataType: 'json',
   	 		url :'${pageContext.request.contextPath}/getcountrybasedonid',
   	 	    data : ({'country' : countryid}),
   	 		success : function(data){
   	 			//alert(data);
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
    	
    
    function getStateList()
    {
    	
    	var country = $('select[name=country]').val();
    	
    	if(country === "101")
    		{
    		var instate = document.getElementById("instate").value;
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
    		
//     		 $.ajax({
//     	      		type: 'GET',
//     	   	 		dataType: 'json',
//     	   	 		url :'${pageContext.request.contextPath}/getStateList',
//     	   	 		data : ({'country':country}),
//     	   	 		success : function(data){
//     	   	 			console.log(data);
//     	   	 			var instate = $('#instate');
//     	   	 		    instate.find('option').remove();
//     	   	 			var options = '';
//     	   	 			options +='<option value=\"\">Select</option>'
//     	   	 			 for (var i = 0; i < data.length; i++) {
//     	   	 			      options += '<option value="' + data[i].stateid + '">' + data[i].statename +'</option>';
//     	   	 			      /* alert(options); */
//     	   	 			}
//     	   	 		    $("#instate").append(options);
//     	   	 			$("#instate").selectpicker("refresh");
    	   	 		
//     	   	 		}
    	      		 
//     	      	 });

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
    
    function getCityList()
    {
    	var country = $('select[name=country]').val();
    	
    	var instate = $('select[name=instate]').val();
    	
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
    
    
    function showleadinfodiv()
	 {
		 var status = $('select[name=status]').val();
		 		 
		 var x = document.getElementById("converttoleads");
		 
		 var countrytype = $('select[name=countrytype]').val();
		 
		 //var region = document.getElementById("reginassinged").value;
		 
		  var country = $('select[name=country]').val();
		  
		  var expdeal  = document.getElementById('expdeal');
		  
		  var othercurrency  = document.getElementById('othercurrency');
		  
		  var countryid = document.getElementById("country").value;
		  
		 if(status == "Converted to Lead")
			 {
			    if (x.style.display === "none")
	   		      {
	   			    x.style.display = "block";
	   			  }
				 
				 if (expdeal.style.display === "block")
	   		      {
					 expdeal.style.display = "none";
	   			  }
				 
				 if (othercurrency.style.display === "none")
	   		      {
					 othercurrency.style.display = "block";
	   			  }
				 
				 $.ajax({
		   	      		type: 'GET',
		   	   	 		dataType: 'json',
		   	   	 		url :'${pageContext.request.contextPath}/getCurrecydetails',
		   	   	 		data : ({'countryid' : countryid}),
		   	   	 		success : function(data){
		   	   	 			 for (var i = 0; i < data.length; i++) {
		   	   	 			      $("#currencytype").val(data[i].currency);
		   	   	 			}
		   	   	 		    
		   	   	 		}
		   	      		 
		   	      	 });
			 }
		 else
			 {
				 if (x.style.display === "block")
	  		      {
	  			    x.style.display = "none";
	  			  } 
			 }
		
	 }
    
    
    function AddDocumentRow()
	  {
		  console.log("inside add row");
		  var lenthtable = $('#documenttab tr').length - 2;
		  $('#documenttab tbody tr').last().after('<tr id="doctest'+lenthtable+'">'
		  +'<td class="text-center" style="min-width: 50px; width: 50px;">'+(lenthtable)+'</td>'
		  +'<td class="text-center" style="min-width: 150px; width: 150px;"><input type="file" style="width:100%;color:black;text-align:centre;" id="document_upload'+lenthtable+'" name="document_upload"/></td>'
		  +'<td class="text-center" style="min-width: 150px; width: 150px;"><div class="form-group" ><div class="form-line"><input type="text" class="form-control" style="width:100%;color:black;text-align:centre;" id="document_name'+lenthtable+'" name="document_name" maxlength="100"  placeholder="Enter Document Name"/></div></div></td>'
		  +'<td class="text-center" style="min-width: 50px; width: 50px;"><button type="button" class="btn waves-effect waves-light" title="Delete Document" onclick="DelDocumentRow('+lenthtable+')"><i class="material-icons">delete</i></button></td>'
		  +'</tr>');
	  }
	 
	 function DelDocumentRow(inputtxt)
	  {
		  console.log("inside delete row");
		  var totallenthtable = $('#documenttab tr').length;
		  $("#doctest"+inputtxt).remove();
    }
	 
	 function checkforallfield()
	 {
		 
		 var lenthtable =  document.getElementsByName("contactname");
		 
		 var tlength = $('#tab tr').length-2;


// 		 alert("lenthtable ==> "+lenthtable.length);
		 
// 		 if(lenthtable.length === 0)
// 			 {
// 			    alert("Please Enter Contact Details!");
// 	 		    return false;
// 			 }
		 
		 var datasource = $('select[name=datasource]').val();
		 
		 var offering = $('select[name=offering]').val();
		 
		 var companyname = $('#companyname').val();
		 
		 var employeesize = $('select[name=employeesize]').val();
		 
		 var annualturnover = $('select[name=annualturnover]').val();
		 
		 var countrytype = $('select[name=countrytype]').val();
		 
		 var country = $('select[name=country]').val();
		 
		 var instate = $('select[name=instate]').val();
		 
		 var indistricts = $('select[name=indistricts]').val();
		 
		 var otherdistricts = $('#otherdistricts').val();
		 
		 var otherstate = $('#otherstate').val();
		 
		 var isassigneto = $('select[name=isassigneto]').val();
		 
		 var projectdesc = $('#projectdesc').val();
		 
		 var forecastclosedate = $('#forecastclosedate').val();
		 
		 var potentialopp = $('#potentialopp').val();
		 
		 var status = $('#status').val();
		 
		 var currencytype = $('#currencytype').val();
		 
		 var amount = $('#foreigncurrency').val();
		 
		 var foreigncurrency = $('#foreigncurrency').val();
		 
		 var crmevent = $('#crmevent').val();

		 var purposeofevent = $('#purposeofevent').val();
		 
		 var status11 = $('#status').val();
		 
		 var chanceofsale = $('#chanceofsale').val();
		 
		 var reginassinged1 = $('#reginassinged').val();
		 
		 var calling_status = $('#calling_status').val();
		 
		 var calling_status_remark = $('#calling_status_remark').val();

		 var terrioryid = $('#terrioryid').val();
		 
		 var conind = $('#country').val();
		 
		 var instate = $('#instate').val();
		 
		 var indistricts = $('#indistricts').val();
		 
		 var city = $('#city').val();

// 		 var contactlenthtable = $('#documenttab tr').length;


		 if(datasource == "")
		 {
			    alert("Please select datasource !");
			    return false;
		 }
		 
		 if(offering == null)
		 {
		    alert("Please select offering !");
		    return false;
		 }
		 
		 if(companyname == "")
		 {
		    alert("Please enter company name !");
		    return false;
		 }
		 
		 if(city == "")
		 {
		    alert("Please enter city !");
		    return false;
		 }
		 
		 
		 if(calling_status == "")
		 {
		    alert("Please select calling status !");
		    return false;
		 }
		 
		 if(calling_status_remark == "")
		 {
		    alert("Please enter calling remark !");
		    return false;
		 }
		 
		 if(terrioryid == "")
		 {
		    alert("Please select territory !");
		    return false;
		 }
		 
		 if(conind == "")
		 {
		    alert("Please select region !");
		    return false;
		 }
		 
		 
		 if(instate == "")
		 {
		    alert("Please select state !");
		    return false;
		 }
		 
		 
		 if(indistricts == "")
		 {
		    alert("Please select district !");
		    return false;
		 }
		 
		 
		 
		 
		 
		 if(reginassinged1=="N"){
			
			 if(country === "101")
			 {
				 if(instate == "")
				 {
				    alert("Please select state !");
				    return false;
				 }
				 
				 if(indistricts == "")
				 {
				    alert("Please select district !");
				    return false;
				 }
			 }
			 
		 }else if(reginassinged1=="Y"){
			 if(country == "")
			 {
			    alert("Please select country !");
			    return false;
			 }
			 
		 }else if(reginassinged1=="All"){
			 
		 
		 if(countrytype == "")
		 {
		    alert("Please select region !");
		    return false;
		 }
		 
		 if(country == "")
		 {
		    alert("Please select country !");
		    return false;
		 }
		 
// 		 if(countryType==""){
// 			 alert("Please select Country Type !");
// 			    return false;
			 
// 		 }
		 
		 else
		 {
			 if(country === "101")
				 {
					 if(instate == "")
					 {
					    alert("Please select state !");
					    return false;
					 }
					 
					 if(indistricts == "")
					 {
					    alert("Please select district !");
					    return false;
					 }
				 }
			 
		 }
	}
		 
		 if(employeesize == "")
		 {
		    alert("Please select employee size !");
		    return false;
		 }
		 
		 if(annualturnover == "")
		 {
		    alert("Please select annual turnover !");
		    return false;
		 }
		 
		 if(isassigneto == "")
		 {
		    alert("Please select do you want to assign the enquiry !");
		    return false;
		 }
		 else
			 {
			      if(isassigneto === "Yes")
			    	  {
			    	     var assigneto = $('select[name=assigneto]').val();
			    	     if(assigneto == "")
			    		 {
			    		    alert("Please select assign to !");
			    		    return false;
			    		 }
			    	  }
			 }
		 
//          alert(contactlenthtable);
// 		 if(contactlenthtable < 4)
// 		 {
// 		    alert("Please Enter Contact Length!");
// 		    return false;
// 		 }


 if(lenthtable.length === 0)
			 {
			    alert("Please enter contact details!");
	 		    return false;
			 }
 
 for(var i=1; i<=tlength; i++)
 {
	 var contact_name = $('#contactname'+i).val();
	 
	 var designation = $('#designation'+i).val();
	 
	 var mobilenos = $('#mobilenos'+i).val();
	 
	 var officenos= $('#officenos'+i).val();
	 
	 //var contactemail=$('#contactemail'+i).val();
	 
	 //var altemail =$('#altemail'+i).val();
	 
	 if(contact_name == ""){
		 alert("Please enter name !");
		 return false;
	 }
	 
	 if(designation == ""){
		 alert("Please enter designation !");
		 return false;
	 }
	 
	 /*  if(mobilenos == ""){
		 alert("Please enter mobile number !");
		 return false;
	 }  */
	 
	 
	 /* if(officenos == ""){
		 alert("Please enter office number !");
		 return false;
	 } */
	 
	 /* if(contactemail == ""){
		 alert("Please enter email !");
		 return false;
	 } */
	
// 	 if(altemail == ""){
// 		 alert("Please enter alt email !");
// 		 return false;
// 	 }
	 
 }
 
 
 
 
 if(crmevent==""){
	 alert("Please select event !");
	 return false;
 }
 
 if(purposeofevent==""){
	 alert("Please select event stages !");
	 return false;
 }
 
 if(status11==""){
	 alert("Please select status !");
	 return false;
 }
		 
		 if(status == "Converted to Lead")
			 {
				 if(projectdesc == "")
				 {
				    alert("Please enter project description!");
				    return false;
				 }
				 
				 if(chanceofsale == "")
				 {
				    alert("Please select lead conversion stage !");
				    return false;
				 }
				 
				 if(forecastclosedate == "")
				 {
				    alert("Please enter target close date !");
				    return false;
				 }
				 
				 
				 if(foreigncurrency == "")
				 {
				    alert("Please enter deal value !");
				    return false;
				 } 
				 
				 
				 if(reginassinged1=="N"){
					 
					  if(potentialopp == "")
					 {
					    alert("Please enter expected deal amount!");
					    return false;
					 } 
					  
					  
					 
					  
					  
				 }else if(reginassinged1=="Y"){
					 if(currencytype == "")
					 {
					    alert("Please enter currency type !");
					    return false;
					 }
					 
					  if(foreigncurrency == "")
					 {
					    alert("Please enter amount !");
					    return false;
					 } 
					 
				 }else if(reginassinged1=="All"){
				 
				 if(countrytype =="Domestic"){
				 if(potentialopp == "")
				 {
				    alert("Please enter expected deal amount!");
				    return false;
				 }
				 
				 }
				 
				 if(countrytype != "Domestic"){
				 if(currencytype == "")
				 {
				    alert("Please enter currency type !");
				    return false;
				 }
				 
				  if(foreigncurrency == "")
				 {
				    alert("Please enter amount !");
				    return false;
				 } 
				 
				 }
				}
				 
				 
				/*  var doclenthtable = document.getElementsByName("document_name");;
				 
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
   		      } */
				 
			 }
		 
		 var aa = confirm('Do you want to submit ?');
	 		
	     	if(aa == true)
	     		{
	     		   $("#enuiryreg").submit(); 
	     		}
	     	else
	     		{
	     		   return false;
	     		}
		 
	 }
	 
	 function closeProjectDetails()
	 {
		 window.location.href = "dashboard";
	 }
    
</script>

