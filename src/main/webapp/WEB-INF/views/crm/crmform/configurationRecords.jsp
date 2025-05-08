<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

   <% 
      String configtype = (String)request.getAttribute("configtype");
   %>

   <div class="row clearfix">
     <div class="col-md-12">
          <div class="card">
               <div class="header">
               <input type="hidden" id="savemsg" name="savemsg" value="${savemsg}">
                     <h2>
                           <% 
						      if(configtype.equalsIgnoreCase("targetconfiguration"))
						      {
						   %>
						      Target Configuration
						   <%	  
						      }
                           %>
                          </h2>
                          
                           <h2>
                          <% 
						      if(configtype.equalsIgnoreCase("incentiveconfiguration"))
						      {
						   %>
						      Incentive Configuration
						   <%	  
						      }
                           %>
                          </h2>
                          
                           <div class="body">
                                <% 
							      if(configtype.equalsIgnoreCase("targetconfiguration"))
								  {
							   %>
								  <div class="row clearfix">
									 <div class="col-sm-12" align="right" style="padding-right: 30px;">
									   <button type="button" class="btn bg-blue waves-effect waves-light" title="Set Target" 
									    onclick="addtargetconfig()">Set Target</button>
									  </div>
								  </div>
									       
								<%	  
									}
							      else if(configtype.equalsIgnoreCase("incentiveconfiguration"))
							      {
							    %>
							      <div class="row clearfix">
									 <div class="col-sm-12" align="right" style="padding-right: 30px;">
									   <button type="button" class="btn bg-blue waves-effect waves-light" title="Set Incentive" 
									    onclick="addincentiveconfig()">Set Incentive</button>
									  </div>
								  </div>
							    <%		  
							      }
						        %>
						        
						        
						        <% 
							      if(configtype.equalsIgnoreCase("targetconfiguration"))
								  {
							   %>
								  <div class="table-responsive">
								         <table class="table table-bordered table-striped table-hover dataTable js-exportable">
								              <thead>
		                                        <tr>
		                                            <th>Sr No.</th>
		                                            <th>Sales Person</th>
		                                            <th>Target Type</th>
		                                            <th>Target Frequency</th>
		                                            <th>Target</th>
		                                            <th>Remark</th>
		                                         </tr>
		                                    </thead>
		                                    
		                                    
		                                    <tbody>
		                                         <%int j = 1;%>
		                                         <c:forEach items="${targetconfigurations}" var="targetconfigurations">
		                                                <tr>
		                                                    <td><%=j%></td>
		                                                    <td>${targetconfigurations.salesperson.empfirstname} ${enquiries.salesperson.emplastname}</td>
		                                                    <td>${targetconfigurations.targettype}</td>
		                                                    <td>${targetconfigurations.targetfrequency}</td>
		                                                    <td>${targetconfigurations.target}</td>
		                                                    <td>${targetconfigurations.remark}</td>
		                                                </tr>
		                                                <%j= j + 1;%>    
		                                         </c:forEach>
		                                    </tbody>
								         </table>
								  </div>
									       
								<%	  
									}
							      else if(configtype.equalsIgnoreCase("incentiveconfiguration"))
							      {
							    %>
							      <div class="table-responsive">
								         <table class="table table-bordered table-striped table-hover dataTable js-exportable">
								              <thead>
		                                        <tr>
		                                            <th>Sr No.</th>
		                                            <th>Incentive Role</th>
		                                            <th>Incentive Eligibility</th>
		                                            <th>Incentive Type</th>
		                                            <th>Remark</th>
		                                         </tr>
		                                    </thead>
		                                    
		                                    
		                                    <tbody>
		                                         <%int j = 1;%>
		                                         <c:forEach items="${incentiveconfiguration}" var="incentiveconfiguration">
		                                                <tr>
		                                                    <td><%=j%></td>
		                                                    <td>${incentiveconfiguration.incentiverole} </td>
		                                                    <td>${incentiveconfiguration.incentiveeligibility}</td>
		                                                    <td>${incentiveconfiguration.incentivetype} ${incentiveconfiguration.incentivetype1}</td>
		                                                    <td>${incentiveconfiguration.remark}</td>
		                                                </tr>
		                                                <%j= j + 1;%>    
		                                         </c:forEach>
		                                    </tbody>
								         </table>
								  </div>
							    <%		  
							      }
						        %>
						        
						        
						        
                           </div>
               </div>
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
	   
	   if(msg == "'successincentive'")
 	  {
 	    swal({title: "Done", text: "Record Added Successfully!", icon:"success"}).then(function(){ 
			      window.location.href="incentiveConfiguration";
 	 		});
 	  }
	   
	   if(msg == "'failincentive'")
       {
 	  swal({title: "Error", text: "Something went Wrong!", icon:"error"}).then(function(){  
		      window.location.href="incentiveConfiguration";
		      });
 	  
       }
  }
  
  window.onbeforeunload = warning();
  
       function addtargetconfig()
       {
    	   window.location.href =  "addtargetconfig";
       }
       
       function addincentiveconfig()
       {
    	   window.location.href =  "addincentiveconfig";
       }
  
  </script>