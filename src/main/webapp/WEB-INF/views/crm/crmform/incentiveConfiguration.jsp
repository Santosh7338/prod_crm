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
		                     Incentive Configuration
		                    </h2>
		    			</div>
		    			<!-- End Page Header -->
		    			
		    			<div class="body">
		    			    <form class="form-horizontal" method="post" action="saveincentiveconfiguration" name="incentiveconfig" id="incentiveconfig" autocomplete="off">
		    			    <input type="hidden" id="savemsg" name="savemsg" value="${savemsg}">
		    			          <div class="row clearfix">
		    			                   <div class="col-sm-2" style="">
	                                         <label for="incentiverole"><span class="" style="color:red">*</span>Role in Incentive :</label>
		                                    </div>
			    							
			    							<div class="col-sm-3" style="">
			    								<div class="form-group">
		                                        	<div class="form-line">
		                                                <select class="form-control show-tick" data-live-search="true" id="incentiverole" name="incentiverole" onchange=""  required>
		                                                	<option value="Primary Sales Person">Primary Sales Person</option>
		                                                	<option value="Secondary Sales Person">Secondary Sales Person </option>
		                                                	<option value="Presales Person">Presales Person </option>
		                                                	<option value="BD Head">BD Head </option>
		                                                </select>
		                                        	</div>
		                                    	</div>
			    							</div>
			    							
			    							<div class="col-sm-2" style="">
	                                         <label for="incentiveeligibility"><span class="" style="color:red">*</span>Incentive Eligibility  :</label>
		                                    </div>
			    							
			    							<div class="col-sm-3" style="">
			    								<div class="form-group">
		                                        	<div class="form-line">
		                                                <select class="form-control show-tick" data-live-search="true" id="incentiveeligibility" name="incentiveeligibility" onchange=""  required>
		                                                	<option value="No of Account">No of Account</option>
		                                                	<option value="Revenue">Revenue</option>
		                                                </select>
		                                        	</div>
		                                    	</div>
			    							</div>
			    							
			    							
		    			          </div>
		    			          
		    			          
		    			          
		    			           <div class="row clearfix">
		    			                <div class="col-sm-2" style="">
	                                         <label for="incentivetype"><span class="" style="color:red">*</span>Incentive Type:</label>
		                                    </div>
			    							
			    							<div class="col-sm-3" style="">
			    								<div class="form-group">
		                                        	<div class="form-line">
		                                                <select class="form-control show-tick" data-live-search="true" id="incentivetype" name="incentivetype" onchange=""  required>
		                                                	<option value="Percentage">Percentage</option>
		                                                	<option value="Amount">Amount</option>
		                                                </select>
		                                        	</div>
		                                    	</div>
			    							</div>
			    							
			    							<div class="col-sm-3" style="">
			    								<div class="form-group">
		                                        	<div class="form-line">
		                                                <select class="form-control show-tick" data-live-search="true" id="incentivetype1" name="incentivetype1" onchange=""  required>
		                                                	<option value="Per Account">Per Account</option>
		                                                	<option value="Cumulative">Cumulative</option>
		                                                </select>
		                                        	</div>
		                                    	</div>
			    							</div>
		    			           </div>
		    			           
		    			           <div class="row clearfix">
		    			                    <div class="col-sm-6" style="width:40%">
	                                         <label for="inctobecal"><span class="" style="color:red">*</span>Incentive to be calculated based on (Targeted Revenue /No.of Accounts ):</label>
		                                    </div>
			    							
			    							<div class="col-sm-4" style="width:20%">
			    								<div class="form-group">
		                                        	<div class="form-line">
		                                                <input type="text" id="inctobecal" name="inctobecal" class="form-control" onchange="" onkeypress="return isNumber(event)"  placeholder="Incentive to be calculated" required>
		                                            </div>
		                                    	</div>
			    							</div>
		    			           </div>
		    			           
		    			           <div class="row clearfix">
		    			                    <div class="col-sm-2" style="width:10%">
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
                </div>
          </div>
    </div>
       <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
       <script type="text/javascript">
       function warning()
       {
    	   var msg = $("#savemsg").val();
    	   
    	   if(msg == "'success'")
	    	  {
	    	    swal({title: "Done", text: "Record Added Successfully!", icon:"success"}).then(function(){ 
	  			      window.location.href="incentiveConfiguration";
	    	 		});
	    	  }
    	   
    	   if(msg == "'fail'")
  	        {
	    	  swal({title: "Error", text: "Something went Wrong!", icon:"error"}).then(function(){  
			      window.location.href="incentiveConfiguration";
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