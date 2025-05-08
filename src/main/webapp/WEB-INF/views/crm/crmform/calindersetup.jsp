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
		                     Financial Year Setup
		                    </h2>
		    			</div>
		    			<!-- End Page Header -->
		    			     <div class="body">
		    			         <form class="form-horizontal" method="post" action="updatecalindersetup" name="save_calindersetup" id="save_calindersetup" autocomplete="off">
		    			              <input type="hidden" id="savemsg" name="savemsg" value="${savemsg}">
		    			                <div class="row clearfix">
		    			                  <div class="col-sm-2" style="width:12%">
                                               <label for="salesperson"><span class="" style="color:red">*</span>Start Date:</label>
                                          </div>
                                          
                                          <div class="col-sm-4" style="">
                                               <div class="form-group">
                                                   <div class="form-line">
                                                     <input type="month" class="form-control" name="startdate" id="startdate" placeholder="Please choose a month..." >
                                                   </div>
                                               </div>
                                          </div>
                                          
                                          <div class="col-sm-2" style="width:10%">
	                                         <label for="targettype"><span class="" style="color:red">*</span>End Date :</label>
		                                    </div>
			    							
			    							<div class="col-sm-4" style="">
			    								<div class="form-group">
		                                        	<div class="form-line">
		                                                <input type="month" class="form-control" name="enddate" id="enddate" placeholder="Please choose a month..." onchange="monthsdiff()">
		                                        	</div>
		                                    	</div>
			    							</div>
		    			                 </div>
		    			               </form>
		    			               <div class="">
			    						         <div class="button-demo" align="center">
			    						                <button type="submit" value="Save" id="mySaveBtn"  onclick="checkinputs()" class="btn bg-blue waves-effect"
															style="font-weight: bold;">Save</button>
			    						         </div>
			    						</div>
						</div>
					<!--End Page Body -->
				</div>
			</div>
		</div>
		
		<!-- Exportable Table -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Calendar Setup List
                            </h2>
                           
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover dataTable js-exportable">
                                    <thead>
                                        <tr>
                                            <th>Sr.No.</th>
                                            <th>Start Date</th>
                                            <th>End Date</th>
                                            <th>Last Update Date</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                        <%int j = 1;%>
                                        <c:forEach var="finacialyearsetup" items="${finacialyearsetup}">
                                        <tr>
                                        	<td><%=j%></td>
                                        	<td>${finacialyearsetup.startdate}</td>
                                        	<td>${finacialyearsetup.enddate}</td>
                                        	<td>${finacialyearsetup.lastupdateddate}</td>
                                        </tr>
                                        <%j= j + 1;%>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #END# Exportable Table -->
		    			          
       <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
       <script type="text/javascript">
//        window.addEventListener("load", (event) => {
    	  	    	  	  
//       	 	$.ajax({
//     		type: 'GET',
//  	 		dataType: 'json',
//  	 		url :'${pageContext.request.contextPath}/getcountrylist',
//  	 		success : function(data){
//  	 			//alert(JSON.stringify(data));
//  	 			var country = $('#country');
//  	 		    country.find('option').remove();
//  	 			var options = '';
//  	 			options +='<option value=\"\">Select</option>'
//  	 			 for (var i = 0; i < data.length; i++) {
//  	 			      options += '<option value="' + data[i].countryid + '">' + data[i].name +'</option>';
//  	 			}
//  	 		    $("#country").append(options);
//  	 			$("#country").selectpicker("refresh");
//  	 		}
   		 
//     	 });
    	  	  
//    });
       
       function territorymanager(){
    	   var terriotryid = document.getElementById("territoryid").value;

    	   //manager call
    	   $.ajax({
			    type:'GET',
				dataType: 'json',
		 		url :'${pageContext.request.contextPath}/getterritorysetup',
		 		data : ({'tr_id':terriotryid}),
		 		success : function(data)
		 		{
		 			//alert(JSON.stringify(data));
 	 			var country = $('#territorymgid');
 	 		    country.find('option').remove();
 	 			var options = '';
 	 			options +='<option value=\"\">Select</option>'
 	 			 for (var i = 0; i < data.length; i++) {
 	 			      options += '<option value="' + data[i].territoryMangaerid.empid + '">' + data[i].territoryMangaerid.empfirstname +'</option>';
 	 			}
 	 		    $("#territorymgid").append(options);
 	 			$("#territorymgid").selectpicker("refresh");

		 		}
		 		
    	   });
    	   
    	  // calling Region 
    	   $.ajax({
			    type:'GET',
				dataType: 'json',
		 		url :'${pageContext.request.contextPath}/getterritorysetup',
		 		data : ({'tr_id':terriotryid}),
		 		success : function(data)
		 		{
		 			//alert(JSON.stringify(data));
	 			var country = $('#regionid');
	 		    country.find('option').remove();
	 			var options = '';
	 			options +='<option value=\"\">Select</option>'
	 			 for (var i = 0; i < data.length; i++) {
	 			      options += '<option value="' + data[i].countryid.countryid + '">' + data[i].countryid.name +'</option>';
	 			}
	 		    $("#regionid").append(options);
	 			$("#regionid").selectpicker("refresh");

		 		}
		 		
   	   });
    	  
    	  //currency type
    	   $.ajax({
			    type:'GET',
				dataType: 'json',
		 		url :'${pageContext.request.contextPath}/getterritorysetup',
		 		data : ({'tr_id':terriotryid}),
		 		success : function(data)
		 		{
		 			//alert(JSON.stringify(data));
	 			 for (var i = 0; i < data.length; i++) {
	 				 $("#Currency").val(data[i].regionid.currency);
	 			 }
	 		   

		 		}
		 		
  	   });
    	  
    	  
   }
       
       
       function warning()
       {
    	   var msg = $("#savemsg").val();
    	   
    	   if(msg != "")
	    	  {
	    	    swal({title: "Done", text: "Financial Year Updated  Successfully!", icon:"success"}).then(function(){ 
	  			      window.location.href="calindersetup";
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
       
       
    	function checkinputs(){
    		
    		 var startdate = $("#startdate").val();
    		
    		 var enddate = $("#enddate").val();
    		 
    		 if(startdate==""){
    			 alert("Please select start date!");
    			 return false;
    		 }
    		 
    		 if(enddate==""){
    			 alert("Please select end date!");
    			 return false;
    		 }
    		 
    		 var aa = confirm('Do you want to submit ?');
        		
	        	if(aa == true)
	        		{
	        		 $("#save_calindersetup").submit(); 
	        		}
	        	else
	        		{
	        		return false;
	        		}
    		 
    	}   
    	
    	
    function monthsdiff(){
    	
    	var startdate = $("#startdate").val();
		
		 var enddate = $("#enddate").val();
		 
		 var dateFrom = startdate+"-01";
		 
		 var dateTo = enddate+"-01";
		// June 5, 2022
		 const date1 = new Date(dateTo);
		 // March 17, 2021
		 const date2 = new Date(dateFrom);

		 const difference = differenceInMonths(date1, date2);
		 
		 var enddate = $("#enddate").val();
		 
		 if(startdate>enddate){
			 alert("End date must be greater then start date!");
			 var startdate = $("#startdate").val("");
			 var enddate = $("#enddate").val("");
		 }
		 
		 if(difference>11){
			 alert("Please select only one financial year!");
			 var enddate = $("#enddate").val("");
		 }

    }
    	
    function differenceInMonths(date1, date2) {
    	  const monthDiff = date1.getMonth() - date2.getMonth();
    	  const yearDiff = date1.getYear() - date2.getYear();

    	  return monthDiff + yearDiff * 12;
    	}
    
       </script>