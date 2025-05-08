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
    
    <!-- Exportable Table -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                 Sales Representative List
                            </h2>
                             <span style="margin-left: 54%;">Select Sales representative :</span>
                              <div	class="col-sm-3" style="margin-left: 71%;margin-top: -2%;" >
                              <div class="form-group">
                              <div class="form-line">
                               <select class="selectpicker form-control" id="salespersonid1" data-container="body" data-live-search="true" title="----Select----" data-hide-disabled="true" onchange="salesperson()"> 
<!--                                onchange="salesperson()">  -->
									
								</select>
								 <input type="hidden" id="salesperson" name="salesperson" value="">
								<button type="button" id="viewclosebtn" name="viewclosebtn" class="btn btn-link waves-effect" data-dismiss="modal" style="background-color: #2196F3;color:white;font-weight: bold;font-size: 12px;margin-left: 105%;margin-top: -8%"; onmouseover="changemyviewbtnclosecolor()" onmouseout="changeviewbtnclosecolormouseOut()" onclick="goBack()" >Back</button>
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
                                            <th>Sales Person Name</th>
                                             <th>Territory Name</th>
                                             <th>Terriotry Manager Name</th>
                                             <th>Region</th>
                                              <th>Currency</th>
                                              <th>Updated Date</th>
                                             <th>Edit</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                        <%int j = 1;%>
                                        <c:forEach var="getmainterritory" items="${getmainterritory}">
                                        <tr>
                                        	<td><%=j%></td>
                                        	<td>${getmainterritory.salespersonid.empfirstname} ${getmainterritory.salespersonid.emplastname}</td>
                                        	<td>${getmainterritory.territory_id.territory_name}</td>
                                        	<td>${getmainterritory.territorymanagerid.empfirstname} ${getmainterritory.territorymanagerid.emplastname}</td>
                                        	<td>${getmainterritory.regionid.name}</td>
                                        	<td>${getmainterritory.currency}</td>
                                        	<td>${getmainterritory.updateddate}</td>
                                        	<td><button type="button" class="btn btn-default waves-effect waves-light" title="Edit" data-toggle="modal" data-target="#editevent"
															onclick="setDetailsforEditEvent(${getmainterritory.main_tr_id})">
															<i class="material-icons">edit</i>
														</button>
												</td>			
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


            
       <div class="modal fade" id="assingterritory" tabindex="-1" role="dialog" >
		<div class="modal-dialog modal-lg modal-dialog-scrollable" role="document" style="width: 70%;">
			 <div class="modal-content">
			 	<div class="modal-header" style="background-color:#0073b1">
					   <h4 class="modal-title" id="newdealcrm" style="color:white">Assign Territory</h4>
				</div>
				<form class="form-horizontal" method="post" action="assingmainTerritory" name="assignterritory" id="assignterritory" autocomplete="off"  enctype="multipart/form-data">
				<input type="hidden" id="savemsg" name="savemsg" value="${savemsg}">
		        <input type="hidden" id="salesid" name="salesid" value="">
				<div class="modal-body">
					<div class="row clearfix">
							<div class="col-sm-2" >
                                               <label for="salesperson"><span class="" style="color:red">*</span>Sales Person:</label>
                           </div>
                          <div class="col-sm-4">
	    								<div class="form-group">
                                        	<div class="form-line">
                                                <select class="form-control show-tick"  id="salespersonid" name="salespersonid" required>
                                                	
                                                </select>
                                        	</div>
                                    	</div>
	    			    </div>   
	    			    
	    			    <div class="col-sm-2">
                                               <label for="Territory"><span class="" style="color:red">*</span>Territory :</label>
                           </div>
                          <div class="col-sm-4">
	    								<div class="form-group">
                                        	<div class="form-line">
                                                <select class="form-control show-tick"  id="territoryid" name="territoryid" onchange="territorymanager()" required>
                                                	 <option value="">Select</option>
                                                         <c:forEach items="${territorysetup}" var="territorysetup">
                                            			 <option value="${territorysetup.tr_id}">${territorysetup.territory_name}</option>
                                            		     </c:forEach>
                                                </select>
                                        	</div>
                                    	</div>
	    			    </div>   	
	    			    	             
                               
	                </div>
	                <br>
	                <div class="row clearfix">
							<div class="col-sm-2">
                                               <label for="Terriotry Manager"><span class="" style="color:red">*</span>Terriotry Manager:</label>
                           </div>
                          <div class="col-sm-4">
	    								<div class="form-group">
                                        	<div class="form-line">
                                                <select class="form-control show-tick"  id="territorymgid" name="territorymgid"  required>
                                                	
                                                </select>
                                        	</div>
                                    	</div>
	    			    </div>   
	    			    
	    			    <div class="col-sm-2">
                                               <label for="salesperson"><span class="" style="color:red">*</span>Region :</label>
                           </div>
                          <div class="col-sm-4" >
	    								<div class="form-group">
                                        	<div class="form-line">
                                                <select class="form-control show-tick"  id="regionid" name="regionid"  required>
                                                	
                                                </select>
                                        	</div>
                                    	</div>
	    			    </div>   	
	    			    	             
                               
	                </div>
	                <br>
	                 <div class="row clearfix">
							<div class="col-sm-2">
                                               <label for="Terriotry Manager"><span class="" style="color:red">*</span>Currency :</label>
                           </div>
                          <div class="col-sm-4">
	    								<div class="form-group">
                                        	<div class="form-line">
                                                <input type="text" id="Currency" name="Currency" class="form-control" placeholder="Enter Currency Name"  readonly required>
                                        	</div>
                                    	</div>
	    			    </div>   
	    			    
	                </div>
	                
				</form>

				<div class="modal-footer" >
					     <button type="button"  class="btn btn-link waves-effect" style="background-color: blue;color:white; font-weight: bold; font-size: 12px;;" onclick="checkinputs()">Assign</button>
				         <button type="button" id="viewclosebtn" name="viewclosebtn" class="btn btn-link waves-effect" data-dismiss="modal"  style="background-color:blue;color:white; font-weight: bold; font-size: 12px;" onmouseover="changemyviewbtnclosecolor()" onmouseout="changeviewbtnclosecolormouseOut()" onclick="goBack()">Close</button>
				</div>
			 </div>
		</div>
		</div>
		</div>
		
<!-- 		t -->

<div class="modal fade" id="editAssingterritory" tabindex="-1" role="dialog" >
		<div class="modal-dialog modal-lg modal-dialog-scrollable" role="document" style="width: 70%;">
			 <div class="modal-content">
			 	<div class="modal-header" style="background-color:#0073b1">
					   <h4 class="modal-title" id="newdealcrm" style="color:white">Edit Territory</h4>
				</div>
				<form class="form-horizontal" method="post" action="updategmainterritory" name="updategmainterritory" id="updategmainterritory" autocomplete="off"  enctype="multipart/form-data">
				<input type="hidden" id="savemsg" name="savemsg" value="${savemsg}">
		        <input type="hidden" id="mainterritoryid" name="mainterritoryid" value="">
				<div class="modal-body">
					<div class="row clearfix">
							<div class="col-sm-2" >
                                               <label for="salesperson"><span class="" style="color:red">*</span>Sales Person:</label>
                           </div>
                          <div class="col-sm-4">
	    								<div class="form-group">
                                        	<div class="form-line">
                                                <select class="form-control show-tick"  id="editsalespersonid" name="editsalespersonid" required>
                                                	
                                                </select>
                                        	</div>
                                    	</div>
	    			    </div>   
	    			    
	    			    <div class="col-sm-2">
                                               <label for="Territory"><span class="" style="color:red">*</span>Territory :</label>
                           </div>
                          <div class="col-sm-4">
	    								<div class="form-group">
                                        	<div class="form-line">
                                                <select class="form-control show-tick" data-live-search="true" id="editterritoryid" name="editterritoryid" onchange="editterritorymanager()" required>
                                                	 <option value="">Select</option>
                                                         <c:forEach items="${territorysetup}" var="territorysetup">
                                            			 <option value="${territorysetup.tr_id}">${territorysetup.territory_name}</option>
                                            		     </c:forEach>
                                                </select>
                                        	</div>
                                    	</div>
	    			    </div>   	
                               
	                </div>
	                <br>
	                <div class="row clearfix">
							<div class="col-sm-2">
                                               <label for="Terriotry Manager"><span class="" style="color:red">*</span>Terriotry Manager:</label>
                           </div>
                          <div class="col-sm-4">
	    								<div class="form-group">
                                        	<div class="form-line">
                                                <select class="form-control show-tick"  id="editterritorymgid" name="editterritorymgid"  required>
                                                	
                                                </select>
                                        	</div>
                                    	</div>
	    			    </div>   
	    			    
	    			    <div class="col-sm-2">
                                               <label for="salesperson"><span class="" style="color:red">*</span>Region :</label>
                           </div>
                          <div class="col-sm-4" >
	    								<div class="form-group">
                                        	<div class="form-line">
                                                <select class="form-control show-tick"  id="editregionid" name="editregionid"  required>
                                                	
                                                </select>
                                        	</div>
                                    	</div>
	    			    </div>   	
	    			    	             
                               
	                </div>
	                <br>
	                 <div class="row clearfix">
							<div class="col-sm-2">
                                               <label for="Terriotry Manager"><span class="" style="color:red">*</span>Currency :</label>
                           </div>
                          <div class="col-sm-4">
	    								<div class="form-group">
                                        	<div class="form-line">
                                                <input type="text" id="editCurrency" name="editCurrency" class="form-control" placeholder="Enter Currency Name"  readonly required>
                                        	</div>
                                    	</div>
	    			    </div>   
	    			    
	                </div>
	                
				</form>

				<div class="modal-footer" >
					     <button type="button"  class="btn btn-link waves-effect" style="background-color: blue;color:white; font-weight: bold; font-size: 12px;;" onclick="checkinputs1()">Update</button>
				         <button type="button" id="viewclosebtn" name="viewclosebtn" class="btn btn-link waves-effect" data-dismiss="modal"  style="background-color:blue;color:white; font-weight: bold; font-size: 12px;" onmouseover="changemyviewbtnclosecolor()" onmouseout="changeviewbtnclosecolormouseOut()">Close</button>
				</div>
			 </div>
		</div>
		</div>
		</div>

<!-- t -->
<div class="modal fade" id="alertpop" tabindex="-1" role="dialog" >
		<div class="modal-dialog modal-lg modal-dialog-scrollable" role="document" style="width: 20%;">
			 <div class="modal-content">

				<div class="modal-body">
				<span style="margin-left: 10%;">Do you want to create territory ?</span>
					</div>
				<div class="modal-footer" >
					     <button type="button"  class="btn btn-link waves-effect" style="background-color: blue;color:white; font-weight: bold; font-size: 12px;;" onclick="salesperson()">Create</button>
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
   	   var msg = $("#savemsg").val();
   	   
   	   if(msg == "'doneAssingMainTerriotry'")
	    	  {
	    	    swal({title: "Done", text: "Territory Assigned Successfully!", icon:"success"}).then(function(){ 
	  			      window.location.href="assignmainterritory";
	    	 		});
	    	  }
   	   
   	   if(msg == "'errorAssingMainTerriotry'")
 	        {
	    	  swal({title: "Error", text: "Something went Wrong!", icon:"error"}).then(function(){  
			      window.location.href="assignmainterritory";
 	 		      });
	    	  
 	        }
      }
      
      window.onbeforeunload = warning();
      
      function createOptions(number) {
     	  var options = [], _options;
     	  
     	 $.ajax({
			    type:'GET',
				dataType: 'json',
		 		url :'${pageContext.request.contextPath}/issalesPerson',
		 		success : function(data)
		 		{
		 			//alert(JSON.stringify(data));
	 			var country = $('#salespersonid1');
	 		    country.find('option').remove();
	 			var options = '';
	 			 for (var i = 0; i < data.length; i++) {
	 			      options += '<option value="' + data[i].employee_resource + '">' + data[i].firstname +' '+data[i].lastname+'</option>';
	 			}
	 		    $("#salespersonid1").append(options);
	 			$("#salespersonid1").selectpicker("refresh");

		 		}
		 		
	   });
     	 
     	  _options = options.join('');
     	  
     	 $('#salespersonid1')[0].innerHTML = _options;


     	}

     	createOptions();
     	
     	
     	function test(salespersonid1){
     		$.ajax({
   				type: 'GET',
   			 		dataType: 'json',
   			 		url :'${pageContext.request.contextPath}/getEmployees',
   			 		data : ({'empid' : salespersonid1}),
   			 		success : function(data){
   			 	var country = $('#salespersonid');
	 		    country.find('option').remove();
	 			var options = '';
	 			options += '<option value="' + data.empid + '">' + data.empfirstname +' '+data.emplastname+'</option>';
	 		    $("#salespersonid").append(options);
	 			$("#salespersonid").selectpicker("refresh");
	 			
	 			$('#salesid').val(data.empid);

		 		}
   			 			
	 			});
     		
     	}
     	
     	
     	function salesperson(){
    		
    		var salespersonid1 = document.getElementById("salespersonid1").value;
    		
    		$.ajax({
   				type: 'GET',
   			 		dataType: 'json',
   			 		url :'${pageContext.request.contextPath}/getAssignedterritory',
   			 		data : ({'assigned_id' : salespersonid1}),
   			 		success : function(data){
   			 			
   			 			var d=data.length;
   			 			
   			 			
   			 		if(d==0){
			 					  // Save it!
			 				
			 					  var $popup = $('#assingterritory');
    		                      $popup.modal("show");
    		                      
    		                      var $popup = $('#alertpop');
    		                      $popup.modal("hide");
			 					  
    		                      test(salespersonid1);
   			 			
   			 	}else{
   			 		//alerady present in list
   			 	$.ajax({
    				type: 'GET',
    			 		dataType: 'json',
    			 		url :'${pageContext.request.contextPath}/getEmployees',
    			 		data : ({'empid' : salespersonid1}),
    			 		success : function(data){
    			 			
    			 			$('#salesperson').val(data.empfirstname+' '+data.emplastname);
    			 		searchTable();
    			 			
    			 		}
	 			});
   			 		
   			 	}
   			  }
    		});
   			 			
   		
   	}
     	
     	function searchTable(){
    		
   		 var input, filter, found, table, tr, td, i, j;
   		  input = document.getElementById("salesperson");
   		
   		
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
  	 			 for (var i = 0; i < data.length; i++) {
  	 			      options += '<option value="' + data[i].territoryMangaerid.empid + '">' + data[i].territoryMangaerid.empfirstname +' '+data[i].territoryMangaerid.emplastname+'</option>';
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
   	
     	
     	function checkinputs(){
   		 var teritory1 = $("#territoryid").val();
   		territoryid
   		 var territorymgid = $("#territorymgid").val();
   		 
   		 if(teritory1==""){
   			 alert("Please select territory !");
   		 }else{
	           $("#assignterritory").submit(); 
   		 }
   		 
   	}  
     	
     	
    function setDetailsforEditEvent(mainidterritory){
    	
    	var salesperson,territoryManager,regionid;
    	
    	$('#mainterritoryid').val(mainterritoryid)
    	
    	
    	 $.ajax({
			    type:'GET',
				dataType: 'json',
		 		url :'${pageContext.request.contextPath}/getmainterritory',
		 		data : ({'main_tr_id':mainidterritory}),
		 		success : function(data)
		 		{
		 			data.forEach(function(item){
		 				//Sales Person 
		 				salesperson=item.salespersonid.empid;
		 				
		 		     	 $.ajax({
		 				type: 'GET',
		 			 		dataType: 'json',
		 			 		url :'${pageContext.request.contextPath}/getEmployees',
		 			 		data : ({'empid' : salesperson}),
		 			 		success : function(data){
					 			
		 			 	var country = $('#editsalespersonid');
		 	 		    country.find('option').remove();
		 	 			var options = '';
		 	 			options += '<option value="' + data.empid + '">' + data.empfirstname +' '+data.emplastname+'</option>';
		 	 		    $("#editsalespersonid").append(options);
		 	 			$("#editsalespersonid").selectpicker("refresh");
			 			
		 		 		}
					 			
		 	 		});
		 				
		 				//Territory Manager
		 				territoryManager=item.territorymanagerid.empid;
		 				
		 				 $.ajax({
				 				type: 'GET',
				 			 		dataType: 'json',
				 			 		url :'${pageContext.request.contextPath}/getEmployees',
				 			 		data : ({'empid' : territoryManager}),
				 			 		success : function(data){
							 			
				 			 	var country = $('#editterritorymgid');
				 	 		    country.find('option').remove();
				 	 			var options = '';
				 	 			options += '<option value="' + data.empid + '">' + data.empfirstname +' '+data.emplastname+'</option>';
				 	 		    $("#editterritorymgid").append(options);
				 	 			$("#editterritorymgid").selectpicker("refresh");
					 			
				 		 		}
							 			
				 	 		});
		 				
		 				$("#editterritoryid option[value='"+item.territorymanagerid.empid+"']").prop("selected",true);
		 	 			$("#editterritoryid").selectpicker("refresh");
		 				
		 				//regin id
		 				regionid=item.territory_id.tr_id;
		 				
		 				 $.ajax({
		 	 			    type:'GET',
		 	 				dataType: 'json',
		 	 		 		url :'${pageContext.request.contextPath}/getterritorysetup',
		 	 		 		data : ({'tr_id':regionid}),
		 	 		 		success : function(data)
		 	 		 		{
		 	 		 			//alert(JSON.stringify(data));
		 	 	 			var country = $('#editregionid');
		 	 	 		    country.find('option').remove();
		 	 	 			var options = '';
		 	 	 			 for (var i = 0; i < data.length; i++) {
		 	 	 			      options += '<option value="' + data[i].countryid.countryid + '">' + data[i].countryid.name +'</option>';
		 	 	 			}
		 	 	 		    $("#editregionid").append(options);
		 	 	 			$("#editregionid").selectpicker("refresh");

		 	 		 		}
		 	 		 		
		 	    	   });
		 				
		 				$('#editCurrency').val(item.currency);
		 			});
		 			
		 		}
	   });
    	
    	 var $popup = $('#editAssingterritory');
         $popup.modal("show");
    }	
    	
      
    
    function editterritorymanager(){
    	
    	 var terriotryid = document.getElementById("editterritoryid").value;

   	   //manager call
   	   $.ajax({
			    type:'GET',
				dataType: 'json',
		 		url :'${pageContext.request.contextPath}/getterritorysetup',
		 		data : ({'tr_id':terriotryid}),
		 		success : function(data)
		 		{
		 			//alert(JSON.stringify(data));
	 			var country = $('#editterritorymgid');
	 		    country.find('option').remove();
	 			var options = '';
	 			 for (var i = 0; i < data.length; i++) {
	 			      options += '<option value="' + data[i].territoryMangaerid.empid + '">' + data[i].territoryMangaerid.empfirstname +' '+data[i].territoryMangaerid.emplastname+'</option>';
	 			}
	 		    $("#editterritorymgid").append(options);
	 			$("#editterritorymgid").selectpicker("refresh");

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
	 			var country = $('#editregionid');
	 		    country.find('option').remove();
	 			var options = '';
	 			 for (var i = 0; i < data.length; i++) {
	 			      options += '<option value="' + data[i].countryid.countryid + '">' + data[i].countryid.name +'</option>';
	 			}
	 		    $("#editregionid").append(options);
	 			$("#editregionid").selectpicker("refresh");

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
	 				 $("#editCurrency").val(data[i].regionid.currency);
	 			 }
	 		   

		 		}
		 		
 	   });
    	
    }  
    
    
    
    function checkinputs1(){
    	
         var teritory1 = $("#editterritoryid").val();
   		 
   		 var territorymgid = $("#editterritorymgid").val();
   		 
   		 if(teritory1==""){
   			 alert("Please select territory !");
   			 return false;
   		 }else{
	        		 $("#updategmainterritory").submit(); 
   		 }	
    }
    
    
 function test1() {
    	
	 var salespersonid1 = document.getElementById("salespersonid1").value;
		
		$.ajax({
			type: 'GET',
		 		dataType: 'json',
		 		url :'${pageContext.request.contextPath}/getAssignedterritory',
		 		data : ({'assigned_id' : salespersonid1}),
		 		success : function(data){
		 			
		 			var d=data.length;
		 		if(d!=0){
		 			 alert("Territory already assigned. Do you want to assign a different territory? Please search.");
		 			
		 			$.ajax({
	    				type: 'GET',
	    			 		dataType: 'json',
	    			 		url :'${pageContext.request.contextPath}/getEmployees',
	    			 		data : ({'empid' : salespersonid1}),
	    			 		success : function(data){
	    			 			
	    			 			$('#salesperson').val(data.empfirstname+' '+data.emplastname);
	    			 		searchTable();
	    			 			
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
          
       