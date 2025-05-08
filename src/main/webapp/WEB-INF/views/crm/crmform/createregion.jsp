<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

      <!-- CSS -->
<style>

.bootstrap-select{
         margin-left: 359%;
}

.bs-container btn-group bootstrap-select open{
    top: 130px;
    left: 1041px !important;
    width: 223px;
}

     .requireds:before {
       content:" *";
       color: red;
     }
     </style>

	<div class="block-header">
    </div>

<div class="body">
	<!-- Start -->
	
	<!-- Exportable Table -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
                    <div class="card">
                    <div class="header">
                    <span>Region List</span>
                    <span style="margin-left:52%">Select region :</span>
                              <div	class="col-sm-3" style="margin-left: 67%;margin-top: -2%;">
                               <div class="form-group">
                              <div class="form-line">
                               <select class="selectpicker form-control" id="country1" data-container="body" data-live-search="true" title="----Select----" data-hide-disabled="true" onchange="myFunction()">
<!--                                onchange="myFunction()"> -->
									
								</select>
								<button type="button" id="viewclosebtn" name="viewclosebtn" class="btn btn-link waves-effect" data-dismiss="modal"  style="background-color: #2196F3;color:white;font-weight: bold;font-size: 12px;margin-left: 117%;margin-top: -8%"; onmouseover="changemyviewbtnclosecolor()" onmouseout="changeviewbtnclosecolormouseOut()" onclick="goBack()" >Back</button>
							  </div>
							  </div>
							  </div>
							  <br>
							  <input type="hidden" id="msgid" name="msgid" value="${savemsg}">
							  <input type="hidden" name="countryname" id ="countryname" value="">
							  
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover dataTable js-exportable" id="myTable">
                                    <thead>
                                        <tr>
                                            <th>Sr.No.</th>
                                            <th>Region Name</th>
                                            <th>Currency</th>
                                            <th>Updated Date</th>
                                             <th>Update</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                        <%int j = 1;%>
                                        <c:forEach var="region" items="${region}">
                                        <tr>
                                        	<td><%=j%></td>
                                        	<td>${region.countryid.name}</td>
                                        	<td>${region.currency}</td>
                                        	<td>${region.updateddate}</td>
                                        	<td><button type="button" class="btn btn-default waves-effect waves-light" title="Edit" data-toggle="modal" data-target="#editevent"
															onclick="updateRegion(${region.rg_id})">
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
            <div class="row clearfix">
            
            
            <div class="modal fade" id="editregion2" tabindex="-1" role="dialog" >
		<div class="modal-dialog modal-lg modal-dialog-scrollable" role="document" style="width: 70%;">
			 <div class="modal-content">
			 	<div class="modal-header" style="background-color:#0073b1"> 
					   <h4 class="modal-title" id="newdealcrm" style="color:white">Create Region</h4>
				</div>
				<form class="form-horizontal" method="post" action="updateregion" name="save_territory" id="save_territory" autocomplete="off"  enctype="multipart/form-data">
				<input type="hidden" name="regionid" id = "regionid" value="">
				<input type="hidden" id="msgid" name="msgid" value="${savemsg}">
				<div class="modal-body">
					<div class="row clearfix">
							<div class="col-sm-2" >
                                               <label for="salesperson"><span class="" style="color:red">*</span>Region :</label>
                           </div>
                          <div class="col-sm-4">
	    								<div class="form-group">
                                        	<div class="form-line">
                                                <select class="form-control show-tick"  id="country" name="country" required>
                                                         
                                                 </select> 
                                        	</div>
                                    	</div>
	    			    </div>   
	    			    
	    			    <div class="col-sm-2">
                                               <label for="Territory"><span class="" style="color:red">*</span>Currency :</label>
                           </div>
                          <div class="col-sm-4">
	    								<div class="form-group">
                                        	<div class="form-line">
                                                  <input type="text" id="Currency" name="Currency" class="form-control" placeholder="Enter Currency Name" style="margin-left: 3%;"  onkeypress='return ((event.charCode >= 65 && event.charCode <= 90) || (event.charCode >= 97 && event.charCode <= 122) || (event.charCode == 32))' required>

                                        	</div>
                                    	</div>
	    			    </div>   	
                               
	                </div>
	    			    
	                </div>
	                
				</form>

				<div class="modal-footer" >
					     <button type="button"  class="btn btn-link waves-effect" style="background-color: blue;color:white; font-weight: bold; font-size: 12px;;" onclick="updatesubmitnameDetails()">Create</button> 
 				         <button type="button" id="viewclosebtn" name="viewclosebtn" class="btn btn-link waves-effect" data-dismiss="modal"  style="background-color:blue;color:white; font-weight: bold; font-size: 12px;" onmouseover="changemyviewbtnclosecolor()" onmouseout="changeviewbtnclosecolormouseOut()" onclick="goBack()">Close</button>
				</div>
			 </div>
		</div>
		</div>
		</div>
            
            
            
            
<!--         <div class="modal fade" id="editregion2" tabindex="-1" role="dialog" > -->
<!-- 		<div class="modal-dialog modal-lg modal-dialog-scrollable" role="document" style="width: 68%;"> -->
<!-- 			 <div class="modal-content"> -->
<!-- 			 	<div class="modal-header" style="background-color:#0073b1"> -->
<!-- 					   <h4 class="modal-title" id="newdealcrm" style="color:white">Region</h4> -->
<!-- 				</div> -->
<!-- 				<form class="form-horizontal" method="post" action="updateregion" name="save_territory" id="save_territory" autocomplete="off"  enctype="multipart/form-data"> -->
<!-- 				<input type="hidden" name="regionid" id = "regionid" value=""> -->
<%-- 				<input type="hidden" id="msgid" name="msgid" value="${savemsg}"> --%>

<!-- 				<div class="modal-body"> -->
<!-- 					<div class="row clearfix"> -->
<!-- 							<div class="col-sm-3 form-control-label"> -->
<!-- 										<label for="TerritoryName" class="requireds">Region   :</label> -->
<!-- 									</div> -->
									
<!-- 									<div class="col-sm-6 form-control-label"> -->
<!-- 										<div class="form-group"> -->
<!-- 											<div class="form-line"> -->
<!-- 												<select class="form-control show-tick"  id="country" name="country" required> -->
                                                         
<!--                                                 </select> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
	                        
<!-- 	                        </div> -->
<!-- 	                        <br> -->
<!-- 	                        <div class="row clearfix"> -->
<!-- 	                               <div class="col-sm-3 form-control-label"> -->
<!-- 										<label for="TerritoryName" class="requireds">Currency :</label> -->
<!-- 								   </div> -->
									
<!-- 									<div class="col-sm-6 form-control-label"> -->
<!-- 										<div class="form-group"> -->
<!-- 											<div class="form-line"> -->
<!-- 												<input type="text" id="Currency" name="Currency" class="form-control" placeholder="Enter Currency Name" style="margin-left: 3%;" required> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
	                       
<!-- 	                </div> -->
<!-- 				</form> -->
<!-- 				<div class="modal-footer" > -->
<!-- 					     <button type="button"  class="btn btn-link waves-effect" style="background-color: blue;color:white; font-weight: bold; font-size: 12px;;" onclick="updatesubmitnameDetails()">Create</button> -->
<!-- 				         <button type="button" id="viewclosebtn" name="viewclosebtn" class="btn btn-link waves-effect" data-dismiss="modal"  style="background-color:blue;color:white; font-weight: bold; font-size: 12px;" onmouseover="changemyviewbtnclosecolor()" onmouseout="changeviewbtnclosecolormouseOut()" onclick="Closefunction()">Close</button> -->
<!-- 				</div> -->
<!-- 			 </div> -->
<!-- 		</div> -->
<!-- 		</div> -->
<!-- 		</div> -->
		
		
		<div class="modal fade" id="editregion1" tabindex="-1" role="dialog" >
		<div class="modal-dialog modal-lg modal-dialog-scrollable" role="document" style="width: 40%;">
			 <div class="modal-content">
			 	<div class="modal-header" style="background-color:#0073b1">
					   <h4 class="modal-title" id="newdealcrm" style="color:white">Region</h4>
				</div>
				<form class="form-horizontal" method="post" action="updateregion" name="editregion" id="editregion" autocomplete="off"  enctype="multipart/form-data">
				<input type="hidden" name="rg_id" id = "rg_id" value="">
				<input type="hidden" id="msgid" name="msgid" value="${savemsg}">

				<div class="modal-body">
					<div class="row clearfix">
							<div class="col-sm-3 form-control-label">
										<label for="TerritoryName" class="requireds">Region   :</label>
									</div>
									<div class="col-sm-6 form-control-label">
										<div class="form-group">
											<div class="form-line">
												<select class="form-control show-tick"  id="editcountry" name="editcountry" required> 
                                                         
                                                 </select> 
											</div>
										</div>
									</div>
	                        
	                        </div>
	                        <br>
	                        <div class="row clearfix">
	                               <div class="col-sm-3 form-control-label">
										<label for="TerritoryName" class="requireds">Currency :</label>
								   </div>
									
									<div class="col-sm-6 form-control-label">
										<div class="form-group">
											<div class="form-line">
												<input type="text" id="editcurrency" name="editcurrency" class="form-control" placeholder="Enter Currency Name" style="margin-left: 3%;" onkeypress='return ((event.charCode >= 65 && event.charCode <= 90) || (event.charCode >= 97 && event.charCode <= 122) || (event.charCode == 32))' required>
											</div>
										</div>
									</div>
	                       
	                </div>
				</form>
				<div class="modal-footer" >
					     <button type="button"  class="btn btn-link waves-effect" style="background-color: blue;color:white; font-weight: bold; font-size: 12px;;" onclick="updateeditDetails()">Update</button>
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
					     <button type="button"  class="btn btn-link waves-effect" style="background-color: blue;color:white; font-weight: bold; font-size: 12px;;" onclick="myFunction()">Create</button>
				         <button type="button" id="viewclosebtn" name="viewclosebtn" class="btn btn-link waves-effect" data-dismiss="modal"  style="background-color:blue;color:white; font-weight: bold; font-size: 12px;" onmouseover="changemyviewbtnclosecolor()" onmouseout="changeviewbtnclosecolormouseOut()" onclick="goBack()">Cancel</button>
				</div>
			 </div>
		</div>
		</div>
            

      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
      
      <link href="https://cdn.jsdelivr.net/gh/xxjapp/xdialog@3/xdialog.min.css" rel="stylesheet"/>
      <script src="https://cdn.jsdelivr.net/gh/xxjapp/xdialog@3/xdialog.min.js"></script>
      
            
      <script type="text/javascript">
      
      function createOptions(number) {

    	  $.ajax({
	      		type: 'GET',
	   	 		dataType: 'json',
	   	 		url :'${pageContext.request.contextPath}/getcountrylist',
	   	 		success : function(data){
	   	 			//alert(JSON.stringify(data));
	   	 			var country = $('#country1');
	   	 		    country.find('option').remove();
	   	 			var options = '';
	   	 			 for (var i = 0; i < data.length; i++) {
	   	 			      options += '<option value="' + data[i].countryid + '">' + data[i].name +'</option>';
	   	 			}
	   	 		    $("#country1").append(options);
	   	 			$("#country1").selectpicker("refresh");
	   	 		}
	      		 
	      	 });
    	  

    	}

    	createOptions();
      
      
      function goBack() {
     	  window.history.back();
     	}
      
      function warning()
      {
  	   		var str=$("#msgid").val();
     
	     	if(str != "")
	     	{
	     		swal({title: "Done", text: "Region Saved successfully!", icon:"success"}).then(function(){ 
	  			window.location.href="createregion";
	  			});
	     	}
	     	
		}
      window.onbeforeunload = warning();
      
      
     function updatesubmitnameDetails(){
    	 
    	 var regionname = $("#country").val();
    	 
    	 var currency = $("#Currency").val();
    	 
    	 if(regionname==""){
    		 alert("Please select region name!");
    		 return false;
    	 }
    	 
    	 if(currency==""){
    		 alert("Please select currency name");
    		 return false;
    	 }
    	 
    	  		 $("#save_territory").submit(); 
    	 
     }
     
    function updateRegion(rg_id){
    	$('#rg_id').val(rg_id);
    	
    	const countryid=0;
    	

    	var $popup1 = $('#editregion1');
		$popup1.modal("show");
    	
    	 $.ajax({
	      		type: 'GET',
	   	 		dataType: 'json',
	   	 		url :'${pageContext.request.contextPath}/getregiondetails',
	   	 	    data : ({'rg_id':rg_id}),
	   	 		success : function(data){
	   	 		var country = $('#editcountry');
   	 		    country.find('option').remove();
   	 			var options = '';
	   	 		 for (var i = 0; i < data.length; i++) {
	   	 		   $('#editcurrency').val(data[i].currency);
	   	 		options += '<option value="' + data[i].countryid.countryid + '">' + data[i].countryid.name +'</option>';
	   	 		 }
   	 		    $("#editcountry").append(options);
	 			$("#editcountry").selectpicker("refresh");
	   	 		}
	      		 
	      	 });
    	
    } 
     
  function updateeditDetails(){
 	 
 	 var currency = $("#editcurrency").val();
 	 
 	 if(currency==""){
 		 alert("Please enter currency!");
 		 return false;
 	 }
	  
  		 $("#editregion").submit(); 
  }
    

function myFunction(){
	
	var regionid=document.getElementById("country1").value;
	
	$.ajax({
  		type: 'GET',
	 		dataType: 'json',
	 		url :'${pageContext.request.contextPath}/getCurrecydetails',
	 	    data : ({'countryid':regionid}),
	 		success : function(data){
	 		
	 		var p=data.length;
	 		
	 		if(p==0){
	 		
	 		     var x = document.getElementById("rcid");
	 		     
	 		     $('#regionid').val(regionid);
	 		     
	 		     
	 			var $popup = $('#editregion2');
	 			$popup.modal("show");
	 			
	 			
	 			countrytest1(regionid);
    	
	 	         var y = document.getElementById("createbutton");
	 		
    		if (x.style.display === "none")
	  		   {
	  			    x.style.display = "block";
		  		   }
    		
    		if (y.style.display === "none")
	  		   {
	  			    y.style.display = "block";
	  		   }
    		
	 		}else{

	 			countrytest(regionid);
	 			
	 		   var x = document.getElementById("rcid");
	    	
	 	       var y = document.getElementById("createbutton");
	 		
    		if (x.style.display === "block")
	  		   {
	  			    x.style.display = "none";
	  		   }
    		
    		if (y.style.display === "block")
	  		   {
	  			    y.style.display = "none";
	  		   }
	 			
	 		}
	 		
	 		}
  		 
  	 });
	
}


function countrytest(countryid){
	
	$.ajax({
  		type: 'GET',
	 		dataType: 'json',
	 		url :'${pageContext.request.contextPath}/getcountrybasedonid',
	 	    data : ({'country' : countryid}),
	 		success : function(data){
 			 for (var i = 0; i < data.length; i++) {
 				$('#countryname').val(data[i].name);
 				searchTable();
 			}
 		   
 		}
  		 
  	 });
	
}


function countrytest1(countryid){
	
	$.ajax({
  		type: 'GET',
	 		dataType: 'json',
	 		url :'${pageContext.request.contextPath}/getcountrybasedonid',
	 	    data : ({'country' : countryid}),
	 		success : function(data){
 			
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



function closediv(){
	 var x = document.getElementById("rcid");
 	
      var y = document.getElementById("createbutton");
	
if (x.style.display === "block")
	   {
		    x.style.display = "none";
	   }

if (y.style.display === "block")
	   {
		    y.style.display = "none";
	   }
	
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

window.onload= functionName();


function test() {

var regionid=document.getElementById("country1").value;
	
	$.ajax({
  		type: 'GET',
	 		dataType: 'json',
	 		url :'${pageContext.request.contextPath}/getCurrecydetails',
	 	    data : ({'countryid':regionid}),
	 		success : function(data){
	 		
	 		var p=data.length;
	 		if(p==0){
	
           	var $popup = $('#alertpop');
	       	$popup.modal("show");
	 		}else{
				countrytest(regionid);
	 		}
	 			
	 		
	 		}
	});
}
      
      </script>    
          
       
       