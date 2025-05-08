<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
     .requireds:before {
       content:" *";
       color: red;
     }
     </style>

	<div class="block-header">
    </div>

	
	
	<!-- Start -->

<!-- Exportable Table -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Territory List
                            </h2>
                             <span style="margin-left:63%">Select  Territory :</span>
                              <div	class="col-sm-3" style="margin-left: 71%;margin-top: -2%;" >
                              <div class="form-group">
                              <div class="form-line">
                               <select class="selectpicker form-control" id="country1" data-container="body" data-live-search="true" title="----Select----" data-hide-disabled="true" onchange="createTerriotrypopup()"> 
<!--                                onchange="createTerriotrypopup()"> -->
									<option value="">Select</option>
                                                         <c:forEach items="${region}" var="region">
                                            			 <option value="${region.countryid.countryid}">${region.countryid.name}</option>
                                            		     </c:forEach>
								</select>
								<button type="button" id="viewclosebtn" name="viewclosebtn" class="btn btn-link waves-effect" data-dismiss="modal"  style="background-color: #2196F3;color:white;font-weight: bold;font-size: 12px;margin-left: 105%;margin-top: -8%";onmouseover="changemyviewbtnclosecolor()" onmouseout="changeviewbtnclosecolormouseOut()" onclick="goBack()" >Back</button>
								</div>
								</div>
							  </div>

                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover dataTable js-exportable" id="myTable">
                                    <thead>
                                        <tr>
                                            <th>Sr.No.</th>
                                            <th>Territory Name</th>
                                            <th>Country Name</th>
                                            <th>Manager Name</th>
                                            <th>Edit</th>
                                            <th>Activate</th>
                                            <th>Last updated date</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                        <%int j = 1;%>
                                        <c:forEach var="territorysetup" items="${territorysetup}">
                                        <tr>
                                        	<td><%=j%></td>
                                        	<td>${territorysetup.territory_name}</td>
                                        	<td>${territorysetup.countryid.name}</td>
                                        	<td>${territorysetup.territoryMangaerid.empfirstname}</td>
                                        	<td><button type="button" class="btn btn-default waves-effect waves-light" title="Edit" data-toggle="modal" data-target="#editevent"
															onclick="setDetailsforEditEvent(${territorysetup.tr_id})">
															<i class="material-icons">edit</i>
														</button>
													<td>
											<c:set var="status" value="${territorysetup.is_activated}"></c:set>
											<%
											String status = (String) pageContext.getAttribute("status");
											if(status.equals("Y"))
											{
											%>
                                        	<div class="demo-switch">
                                        	   <div class="switch">
                                   				 <label>OFF<input type="checkbox" name="pract_status" id="pract_status" checked onClick="location.href='deactiveTerritory?territory_id=${territorysetup.tr_id}'"><span class="lever"></span>ON</label>
                                				</div>
                                        	</div>
                                        	<%
											}
											else if(status.equals("N"))
											{
											%>
											<div class="demo-switch">
                                        	   <div class="switch">
                                   				 <label>OFF<input type="checkbox" name="pract_status" id="pract_status" onClick="location.href='activeTerritory?territory_id=${territorysetup.tr_id}'"><span class="lever"></span>ON</label>
                                			   </div>
                                        	</div>
											<% 
											}
                                        	%>
                                        	</td>
                                        	<td>${territorysetup.updateddate1}</td>			
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
            
        <div class="modal fade" id="createterritory" tabindex="-1" role="dialog" >
		<div class="modal-dialog modal-lg modal-dialog-scrollable" role="document" style="width: 70%;">
			 <div class="modal-content">
			 	<div class="modal-header" style="background-color:#0073b1">
					   <h4 class="modal-title" id="newdealcrm" style="color:white">Create Territory</h4>
				</div>
				<form class="form-horizontal" method="post" action="save_territory" name="save_territory" id="save_territory" autocomplete="off"  enctype="multipart/form-data">
								<input type="hidden" id="msgid" name="msgid" value="${savemsg}">
								<input type="hidden" id="countryname" name="countryname" value="">
				<div class="modal-body">
					<div class="row clearfix">
							<div class="col-sm-2" >
                                               <label for="salesperson"><span class="" style="color:red">*</span>Territory Name:</label>
                           </div>
                          <div class="col-sm-4">
	    								<div class="form-group">
                                        	<div class="form-line">
                                            <input type="text" id="TerritoryName" name="TerritoryName" class="form-control" placeholder="Enter Territory Name" style="margin-left: 3%;" required>
                                        	</div>
                                    	</div>
	    			    </div>   
	    			    
	    			    <div class="col-sm-2">
                                               <label for="Territory"><span class="" style="color:red">*</span>Region :</label>
                           </div>
                          <div class="col-sm-4">
	    								<div class="form-group">
                                        	<div class="form-line">
                                                <select class="form-control show-tick" data-live-search="true" id="countryid" name="countryid" onchange="assignedcountrys()" required>
                                                        
                                             </select>
                                        	</div>
                                    	</div>
	    			    </div>   	
	    			    	             
                               
	                </div>
	                <br>
	                <div class="row clearfix">
							<div class="col-sm-2">
                                               <label for="Terriotry Manager"><span class="" style="color:red">*</span>Territory Manager:</label>
                           </div>
                          <div class="col-sm-4">
	    								<div class="form-group">
                                        	<div class="form-line">
                                               <select class="form-control show-tick" data-live-search="true" id="territoryMangaerid" name="territoryMangaerid" onchange="" required>
                                                         <option value="">Select</option>
                                                         <c:forEach items="${salesmanagers}" var="salesmanagers">
                                            			 <option value="${salesmanagers.employeeresource.empid}">${salesmanagers.employeeresource.empfirstname} ${salesmanagers.employeeresource.emplastname}</option>
                                            		     </c:forEach>
                                             </select>
                                        	</div>
                                    	</div>
	    			    </div>   
                               
	                </div>
	                
				</form>

				<div class="modal-footer" >
					     <button type="button"  class="btn btn-link waves-effect" style="background-color: blue;color:white; font-weight: bold; font-size: 12px;;" onclick="createTerriotry()">Create</button>
				         <button type="button" id="viewclosebtn" name="viewclosebtn" class="btn btn-link waves-effect" data-dismiss="modal"  style="background-color:blue;color:white; font-weight: bold; font-size: 12px;" onmouseover="changemyviewbtnclosecolor()" onmouseout="changeviewbtnclosecolormouseOut()" onclick="goBack()">Close</button>
				</div>
			 </div>
		</div>
		</div>
		</div>
		
				
		<div class="modal fade" id="updateterritory" tabindex="-1" role="dialog" >
		<div class="modal-dialog modal-lg modal-dialog-scrollable" role="document" style="width: 40%;">
			 <div class="modal-content">
			 	<div class="modal-header" style="background-color:#0073b1">
					   <h4 class="modal-title" id="newdealcrm" style="color:white">Edit terriotry</h4>
				</div>
				<form class="form-horizontal" method="post" action="editterritory" name="editterritory" id="editterritory" autocomplete="off"  enctype="multipart/form-data">
				<input type="hidden" name="tr_id" id = "tr_id" value="">
				<input type="hidden" id="msgid" name="msgid" value="${savemsg}">

				<div class="modal-body">
					<div class="row clearfix">
							<div class="col-sm-3 form-control-label">
										<label for="TerritoryName" class="requireds">Territory Name  :</label>
									</div>
									
									<div class="col-sm-6 form-control-label">
										<div class="form-group">
											<div class="form-line">
									             <input type="text" id="territoryname1" name="territoryname1" class="form-control"  style="margin-left: 3%;" required> 

											</div>
										</div>
									</div>
	                        
	                        </div>
	                </div>
				</form>
				<div class="modal-footer" >
					     <button type="button"  class="btn btn-link waves-effect" style="background-color: blue;color:white; font-weight: bold; font-size: 12px;;" onclick="updatesubmitnameDetails()">Update</button>
				         <button type="button" id="viewclosebtn" name="viewclosebtn" class="btn btn-link waves-effect" data-dismiss="modal"  style="background-color:blue;color:white; font-weight: bold; font-size: 12px;" onmouseover="changemyviewbtnclosecolor()" onmouseout="changeviewbtnclosecolormouseOut()">Close</button>
				</div>
			 </div>
		</div>
		</div>
		</div>
		
			
		<div class="modal fade" id="alertpop" tabindex="-1" role="dialog" >
		<div class="modal-dialog modal-lg modal-dialog-scrollable" role="document" style="width: 20%;">
			 <div class="modal-content">

				<div class="modal-body">
				<span style="margin-left: 10%;">Do you want to create territory ?</span>
					</div>
				<div class="modal-footer" >
					     <button type="button"  class="btn btn-link waves-effect" style="background-color: blue;color:white; font-weight: bold; font-size: 12px;;" onclick="createTerriotrypopup()">Create</button>
				         <button type="button" id="viewclosebtn" name="viewclosebtn" class="btn btn-link waves-effect" data-dismiss="modal"  style="background-color:blue;color:white; font-weight: bold; font-size: 12px;" onmouseover="changemyviewbtnclosecolor()" onmouseout="changeviewbtnclosecolormouseOut()" onclick="goBack()">Cancel</button>
				</div>
			 </div>
		</div>
		</div>
            
		
            
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            
      <script type="text/javascript">
      
      function goBack() {
     	  window.history.back();
     	}
      
      function warning()
      {
  	   		var str=$("#msgid").val();
  	   		
     
	     	if(str != "")
	     	{
	     		swal({title: "Done", text: "Territory Saved successfully!", icon:"success"}).then(function(){ 
	  			window.location.href="createterritory";
	  			});
	     	}
	     	
		}
      window.onbeforeunload = warning();
      
      function setDetailsforEditEvent(tr_id)
 	 {
    	  
    	  $("#tr_id").val(tr_id);
    	  
    	  
    		$.ajax({
	      		type: 'GET',
	   	 		dataType: 'json',
	   	 		url :'${pageContext.request.contextPath}/getterritorysetup',
	   	 		data : ({'tr_id':tr_id}),
	   	 		success : function(data){
	   	 			data.forEach(function(item){
	   	 			$("#territoryname1").val(item.territory_name);
	   	 	        });
	   	 	     }
	   	 			
	      	 });
    		
    		
    		var $popup = $('#updateterritory');
    		$popup.modal("show");
 	 }
      
     function updatesubmitnameDetails(){
    	 
    	 
    	 var territoryname1 = $("#territoryname1").val();
    	 
    	 if(territoryname1 == ""){
     		 alert("Please enter territory name!");
     		 return false;
     	 }

    	 $("#editterritory").submit(); 
    	 
     }
     
    function createTerriotry(){
    	
    	 var TerritoryName = $("#TerritoryName").val();
    	 
    	 var countryid = $("#countryid").val();
    	 
    	 var territoryMangaerid = $("#territoryMangaerid").val();
    	 
    	 if(TerritoryName==""){
     		 alert("Please enter territory name!");
     		 return false;
     	 }
    	 
    	 if(countryid==""){
     		 alert("Please select region !");
     		 return false;
     	 }
    	 
    	 
    	 if(territoryMangaerid==""){
     		 alert("Please enter territory manager !");
     		 return false;
     	 }
    	 
     		 $("#save_territory").submit(); 
    	
    }
    
    
    function createTerriotrypopup(){
    	
    	var country=document.getElementById("country1").value;
    	
    	$.ajax({
      		type: 'GET',
   	 		dataType: 'json',
   	 		url :'${pageContext.request.contextPath}/getcountryid',
   	 		data : ({'countryid':country}),
   	 		success : function(data){
   	 			
   	 			if(data.length!=0){
   	 				
   	 			$.ajax({
   	   	 	  		type: 'GET',
   	   	 		 		dataType: 'json',
   	   	 		 		url :'${pageContext.request.contextPath}/getcountrybasedonid',
   	   	 		 	    data : ({'country' : country}),
   	   	 		 		success : function(data){
   	   	 		 		
   	   	 		 	for (var i = 0; i < data.length; i++) {
   	   	 		          $('#countryname').val(data[i].name)  
   	   	 		 		searchTable();

   	   	 		 	}
   	   	 	 			 
   	   	 	 		}
   	   	 	  		 
   	   	 	  	 });
   	 				
   	 			}else{
   	 			var $popup = $('#createterritory');
   	            $popup.modal("show");
   	            
   	            var $popup = $('#alertpop');
	            $popup.modal("hide");
   	 				
   	 			$.ajax({
   	 	  		type: 'GET',
   	 		 		dataType: 'json',
   	 		 		url :'${pageContext.request.contextPath}/getcountrybasedonid',
   	 		 	    data : ({'country' : country}),
   	 		 		success : function(data){
   	 		 		
   	 		 	var country = $('#countryid');
   	 		    country.find('option').remove();
   	 			var options = '';
	   	 		 for (var i = 0; i < data.length; i++) {
	   	 		   $('#countryid').val(data[i].currency);
	   	 		options += '<option value="' + data[i].countryid + '">' + data[i].name +'</option>';
	   	 		 }
   	 		    $("#countryid").append(options);
	 			$("#countryid").selectpicker("refresh");
   	 	 			 
   	 	 		}
   	 	  		 
   	 	  	 });
   	 				
   	 		
   	 			}
   	 	     }
      	 });
    	
    }
    
    function searchTable(){
    	
   	 var input, filter, found, table, tr, td, i, j;
   	  input = document.getElementById("countryname");
   	    
   	    filter = input.value.toUpperCase();
   	    table = document.getElementById("myTable");
   	    tr = table.getElementsByTagName("tr");
   	    for (i = 0; i < tr.length; i++) {
   	        td = tr[i].getElementsByTagName("td");
   	        for (j = 0; j < td.length; j++) {
   	            if (td[j].innerHTML.toUpperCase().indexOf(filter) > -1) {
   	                found = true;
   	            }
   	        }
   	        if (found) {
   	            tr[i].style.display = "";
   	            found = false;
   	        } else {
   	            tr[i].style.display = "none";
   	        }
   	    }
   }
      
    function test() {
    	
        var country=document.getElementById("country1").value;
    	
    	$.ajax({
      		type: 'GET',
   	 		dataType: 'json',
   	 		url :'${pageContext.request.contextPath}/getcountryid',
   	 		data : ({'countryid':country}),
   	 		success : function(data){
   	 			
   	 			if(data.length!=0){
   	 			 alert("Territory already created. Search if you want to create a new one.");
   	 				
   	 			$.ajax({
   	   	 	  		type: 'GET',
   	   	 		 		dataType: 'json',
   	   	 		 		url :'${pageContext.request.contextPath}/getcountrybasedonid',
   	   	 		 	    data : ({'country' : country}),
   	   	 		 		success : function(data){
   	   	 		 		
   	   	 		 	for (var i = 0; i < data.length; i++) {
   	   	 		          $('#countryname').val(data[i].name)  
   	   	 		 		searchTable();

   	   	 		 	}
   	   	 	 			 
   	   	 	 		}
   	   	 	  		 
   	   	 	  	 });
   	 				
   	 			}else{
     	              var $popup = $('#alertpop');
       	               $popup.modal("show");
   	 			}
   	 		}
   	 		});
    	
    }
      
      </script>    
          
       