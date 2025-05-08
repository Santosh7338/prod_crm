<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="block-header">
           <h2></h2>
</div>

       <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                  <div class="card">
                       <!-- Page Header -->
		    			<div class="header">
		    				<h2>
		                     Target Configuration
		                    </h2>
		    			</div>
		    			<!-- End Page Header -->
		    			
		    			
		    			<!-- Page Body -->
		    			
		    			     <div class="body">
		    			         <form class="form-horizontal" method="post" action="savetargetconfiguration" name="targetconfig" id="targetconfig" autocomplete="off">
		    			              <input type="hidden" id="savemsg" name="savemsg" value="${savemsg}">
		    			               <div class="row clearfix">
		    			                  <div class="col-sm-2" style="width:12%">
                                               <label for="salesperson"><span class="" style="color:red">*</span>Sales Person:</label>
                                          </div>
                                          
                                          <div class="col-sm-4" style="">
                                               <div class="form-group">
                                                   <div class="form-line">
                                                      <select class="form-control show-tick" data-live-search="true" id="salesperson" name="salesperson" onchange="" required>
                                                         <c:forEach items="${empMaster}" var="empMaster">
                                            			 <option value="${empMaster.empid}">${empMaster.empfirstname} ${empMaster.emplastname}</option>
                                            		     </c:forEach>
                                                      </select>
                                                   </div>
                                               </div>
                                          </div>
                                          
                                          <div class="col-sm-2" style="width:10%">
	                                         <label for="targettype"><span class="" style="color:red">*</span>Target Type :</label>
		                                    </div>
			    							
			    							<div class="col-sm-4" style="">
			    								<div class="form-group">
		                                        	<div class="form-line">
		                                                <select class="form-control show-tick" data-live-search="true" id="targettype" name="targettype" onchange=""  required>
		                                                	<option value="No of Accounts">No of Accounts</option>
		                                                	<option value="Revenue">Revenue</option>
		                                            	</select>
		                                        	</div>
		                                    	</div>
			    							</div>
		    			               </div>
		    			               
		    			               
		    			               <div class="row clearfix">
		    			                   <div class="col-sm-2" style="width:12%">
	                                         <label for="targetfrequency"><span class="" style="color:red">*</span>Target Frequency :</label>
		                                    </div>
			    							
			    							<div class="col-sm-4" style="">
			    								<div class="form-group">
		                                        	<div class="form-line">
		                                                <select class="form-control show-tick" data-live-search="true" id="targetfrequency" name="targetfrequency" onchange=""  required>
		                                                	<option value="Monthly">Monthly</option>
		                                                	<option value="Quarterly">Quarterly</option>
		                                                	<option value="Annual">Annual</option>
		                                            	</select>
		                                        	</div>
		                                    	</div>
			    							</div>
			    							
			    							<div class="col-sm-2" style="width:10%">
	                                         <label for="target"><span class="" style="color:red">*</span>Target:</label>
		                                    </div>
			    							
			    							<div class="col-sm-4" style="">
			    								<div class="form-group">
		                                        	<div class="form-line">
		                                                <input type="text" id="target" name="target" class="form-control" onkeypress="return isNumber(event)" onchange=""  placeholder="Enter Target" required>
		                                            </div>
		                                    	</div>
			    							</div>
			    							
		    			               </div>
		    			               
		    			               <div class="row clearfix">
		    			               
		    			                    <div class="col-sm-2" style="width:12%">
	                                         <label for="remark">Remark:</label>
		                                    </div>
			    							
			    							<div class="col-sm-10" style="">
			    								<div class="form-group">
		                                        	<div class="form-line">
		                                                <input type="text" id="remark" name="remark" class="form-control" onchange=""  placeholder="Enter Remark" required>
		                                            </div>
		                                    	</div>
			    							</div>
		    			               
		    			               </div>
		    			               
		    			               <div class="">
			    						    <div class="form-group">
			    						         <div class="button-demo" align="center">
			    						                <button type="submit" value="Save" id="mySaveBtn"  onclick="" class="btn bg-blue waves-effect"
															style="font-weight: bold;">Save</button>
														
														<button type="button" value="Close" onclick="closetargetconfiguration()" class="btn bg-blue-grey waves-effect"
															style="font-weight: bold;">Close</button>
			    						         </div>
			    						    </div>
			    						</div>
		    			               
		    			         </form>
		    			     </div>
		    			
		    			<!-- End Page Body -->
                       
                  </div>
            </div>
       </div>
       <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
       <script type="text/javascript">
       function warning()
       {
    	   var msg = $("#savemsg").val();
    	   
    	   if(msg == "'successtarget'")
	    	  {
	    	    swal({title: "Done", text: "Record Added Successfully!", icon:"success"}).then(function(){ 
	  			      window.location.href="targetConfiguration";
	    	 		});
	    	  }
    	   
    	   if(msg == "'failtarget'")
  	        {
	    	  swal({title: "Error", text: "Something went Wrong!", icon:"error"}).then(function(){  
			      window.location.href="targetConfiguration";
  	 		      });
	    	  
  	        }
       }
       
       window.onbeforeunload = warning();
       
       function isNumber(evt) {
           evt = (evt) ? evt : window.event;
           var charCode = (evt.which) ? evt.which : evt.keyCode;
           if (charCode > 31 && (charCode < 48 || charCode > 57)) {
               return false;
           }
           return true;
       }
       </script>