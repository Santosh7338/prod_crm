<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
a:link {

  color: blue;
  background-color: transparent;
  text-decoration: none;
}
a:visited {
 
  color: blue;
  background-color: transparent;
  text-decoration: none;
}
a:hover {
  
  color: red;
  background-color: transparent;
  text-decoration: underline;
}

.asterisk_input::after {
content:" *"; 
color: #e32;
position: absolute; 
margin: -19px 0px 0px -24px; 
font-size: 126%; 
padding: 0 5px 0 0; }


.asterisk_input1::after {
content:" *"; 
color: #e32;
position: absolute; 
margin: -1% 0px 0px -63%; 
font-size: 126%; 
padding: 0 5px 0 0;}



.asterisk_input2::after {
content:" *"; 
color: #e32;
position: absolute; 
margin: -2% 0% 0% 0%; 
font-size: 126%; 
padding: 0 5px 0 0; }


.asterisk_input3::after {
content:" *"; 
color: #e32;
position: absolute; 
margin: -17px 0px 0px -140px; 
font-size: 126%; 
padding: 0 5px 0 0; }

.asterisk_input4::after {
content:" *"; 
color: #e32;
position: absolute; 
margin: -19px 0px 0px -24px; 
font-size: 126%; 
padding: 0 5px 0 0; }


.asterisk_input5::after {
content:" *"; 
color: #e32;
position: absolute; 
margin: -7px 0px 0px -24px; 
font-size: 126%; 
padding: 0 5px 0 0; }


</style>

     <% 
      String isbdh = (String)request.getAttribute("isbdh");
      
      %>

    <% 
      int profileid = (int)request.getAttribute("profileid");
     
      if(profileid == 6)
      {
    	  
    %>
       <!-- Hover Expand Effect -->
            <div class="block-header">
                <h2></h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box">
                        <div class="icon bg-cyan">
                            <i class="material-icons">contact_phone</i>
                        </div>
                        <div class="content">
                            <div class="text" style="font-size:16px"><a href="enquirieshr">Enquirys</a></div>
                            <div class="number">${enquiriescount}</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box">
                    
                    <div class="icon bg-cyan">
                            <i class="material-icons">playlist_add_check</i>
                        </div>
                       
                        <div class="content">
                            <div class="text" style="font-size:16px"><a href="leadshr">Leads</a></div>
                            <div class="number">${leadscount}</div>
                        </div>
                    </div>
                </div>
                
                
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box">
                        <div class="icon bg-cyan">
                            <i class="material-icons">contacts</i>
                        </div>
                        <div class="content">
                            <div class="text" style="font-size:16px"><a href="customershr">Customers</a></div>
                            <div class="number">${customerscount}</div>
                        </div>
                        
                    </div>
                </div>
                
                
                
                
                
                
            </div>
            
            
            
            
            
            
            
            <!-- #END# Hover Expand Effect -->
    <%	   
      }
      else if(isbdh.equalsIgnoreCase("TRUE"))
      {
     %>
       <!-- Hover Expand Effect -->
            <div class="block-header">
                <h2></h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box">
                        <div class="icon bg-cyan">
                            <i class="material-icons">contact_phone</i>
                        </div>
                        <div class="content">
                            <div class="text" style="font-size:16px"><a href="enquirieshr">Enquiry</a></div>
                            <div class="number">${enquiriescount}</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box">
                        <div class="icon bg-cyan">
                            <i class="material-icons">playlist_add_check</i>
                        </div>
                        <div class="content">
                            <div class="text" style="font-size:16px"><a href="leadshr">Lead</a></div>
                            <div class="number">${leadscount}</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box">
                        <div class="icon bg-cyan">
                            <i class="material-icons">contacts</i>
                        </div>
                        <div class="content">
                            <div class="text" style="font-size:16px"><a href="customershr">Customer</a></div>
                            <div class="number">${customerscount}</div>
                        </div>
                    </div>
                </div>
                
                
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box">
                        <div class="icon bg-cyan">
                            <i class="material-icons">playlist_remove_check</i>
                        </div>
                        <div class="content">
                            <div class="text" style="font-size:16px"><a href="cancelledBDA">Cancelled</a></div>
                            <div class="number">${cancelledRecords}</div>
                        </div>
                    </div>
                </div>
                
            </div>
            <!-- #END# Hover Expand Effect -->
     
     <%	  
      }
      else
      {
    	
    %>
       <!-- Hover Expand Effect -->
            <div class="block-header">
                <h2></h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box">
                        <div class="icon bg-cyan">
                            <i class="material-icons">contact_phone</i>
                        </div>
                        <div class="content">
                            <div class="text" style="font-size:16px"><a href="enquiries">Enquiry</a></div>
                            <div class="number">${enquiriescount}</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box">
                        <div class="icon bg-cyan">
                            <i class="material-icons">playlist_add_check</i>
                        </div>
                        <div class="content">
                            <div class="text" style="font-size:16px"><a href="leads">Lead</a></div>
                            <div class="number">${leadscount}</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box">
                        <div class="icon bg-cyan">
                            <i class="material-icons">contacts</i>
                        </div>
                        <div class="content">
                            <div class="text" style="font-size:16px"><a href="customers">Customer</a></div>
                            <div class="number">${customerscount}</div>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box">
                        <div class="icon bg-cyan">
                            <i class="material-icons">playlist_remove_check</i>
                        </div>
                        <div class="content">
                            <div class="text" style="font-size:16px"><a href="Cancelled">Cancelled</a></div>
                            <div class="number">${cancelledRecords}</div>
                        </div>
                    </div>
                </div>
                
                
            </div>
            <!-- #END# Hover Expand Effect -->   
    <% 	  
      }
    %>
    
    <!-- Line Chart -->
<!--                 <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12"> -->
<!--                     <div class="card"> -->
<!--                         <div class="header"> -->
<%--                             <h2>Sales Trend ${year}</h2> --%>
<!--                             <ul class="header-dropdown m-r--5"> -->
<!--                                 <li class="dropdown"> -->
<!--                                     <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> -->
<!--                                         <i class="material-icons">more_vert</i> -->
<!--                                     </a> -->
<!--                                 </li> -->
<!--                             </ul> -->
<!--                         </div> -->
<!--                         <div class="body"> -->
<%--                             <canvas id="line_chart" height="150"></canvas> --%>
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
                <!-- #END# Line Chart -->
                
                <!-- Bar Chart -->
<!--                 <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12"> -->
<!--                     <div class="card"> -->
<!--                         <div class="header"> -->
<!--                             <h2>BAR CHART</h2> -->
<!--                             <ul class="header-dropdown m-r--5"> -->
<!--                                 <li class="dropdown"> -->
<!--                                     <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> -->
<!--                                         <i class="material-icons">more_vert</i> -->
<!--                                     </a> -->
<!--                                     <ul class="dropdown-menu pull-right"> -->
<!--                                         <li><a href="javascript:void(0);">Action</a></li> -->
<!--                                         <li><a href="javascript:void(0);">Another action</a></li> -->
<!--                                         <li><a href="javascript:void(0);">Something else here</a></li> -->
<!--                                     </ul> -->
<!--                                 </li> -->
<!--                             </ul> -->
<!--                         </div> -->
<!--                         <div class="body"> -->
<!--                             <div id="bar_chart" class="graph"></div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
                <!-- #END# Bar CLead Generation Trendhart -->
                
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" id="t2" Style="margin-left:-1.5%">
                    <div class="card">
                        <div class="header" style="padding-bottom: 7%;">
                            <h2>Sales Event Trend YTD ${year}</h2>
                      <div class="" >
                      <% 
                    if(isbdh.equalsIgnoreCase("TRUE") ||profileid == 6){
                    %>
                    <span class="asterisk_input1">  </span> 
                    <div class="col-sm-6" style="margin-top: 2%;width: 35%;">
	    								<div class="form-group">
                                        	<div class="form-line">
                                                <select class="form-control show-tick"  id="salespersonid" name="salespersonid" required>
                                                	
                                                </select>
                                        	</div>
                                    	</div>
	    			    </div>   
                    
					<div class="col-xs-4">
					<span class="asterisk_input2">  </span> 
						<input type="month" class="form-control" id="startDate"
							name="startDate" value="${startDate}" required="required" style="height: 34px;margin-left: 13%;margin-top: 1%;">
					</div>
					<div class="col-xs-5" style="margin-left: 69%;margin-top: -11%;">
				<button type="button" id="dwldexcel"
								class="btn btn-sm btn-primary" onclick="loaddata()" style="margin-left: 9%;margin-top: -2%;">Submit</button>
					
					<button type="button" id="dwldexcel"
								class="btn bg-blue-grey waves-effect" onclick="loadPage()" style="margin-left: 44%;margin-top: -14%;width: 38%;">Reset</button>			
					</div>
					<% 
					}else{
                    %>
                    
                    <div class="col-xs-4">
                    <span class="asterisk_input5">  </span>  
						<input type="month" class="form-control" id="salespersonstartDate"
							name="salespersonstartDate" value="${startDate}" required="required" style="height: 30px;margin-left: -5%;margin-top: 1%;">
					</div>
					<div class="col-xs-4" style="margin-left: 36%;">
				<button type="button" id="dwldexcel"
								class="btn btn-sm btn-primary" onclick="salespersonloaddata()" style="margin-left: -13%;margin-top: -20%;">Submit</button>
								
				<button type="button" id="dwldexcel"
								class="btn bg-blue-grey waves-effect" onclick="loadPage()" style="margin-left: 32%;margin-top: -19%;width: 44%;">Reset</button>				
					</div>
                    
                    <% 
                    }
                     %>
                            </div>
                        </div>
                        <div class="body" id="chart2" class="chart2">
                            <canvas id="bar_chart2" height="150"></canvas>
                            <br>
                            <div class="row" style="margin-bottom: 0px;" id="childchart1">
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventenquiry" style="background: rgba(255, 207, 161, 0.94);"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel" >Enquiry</div>
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventinterested"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel3">Interested</div>
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventnotinterested"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel2">Not Interested</div>
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventleadqualified"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel2">Lead Qualified</div>
                            </div>
                            
                            <div class="row" style="margin-bottom: 0px;" id="childchart2">
                                 <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventpoc" style="background: rgba(22, 90, 65, 1);"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel">PoC</div>
                                 <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventproposalsubmitted"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel3">Proposal Submitted</div>
                                 <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventwaitingforpo" style="background: rgba(128, 129, 255, 1);"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel2">Waiting for PO</div>
                                 <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventpo"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel">PO</div>
                                 <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlost"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel">Lost</div>
                            </div>
                            
                             
                        </div>
                        
                    </div>
                </div>
    
    <!-- Bar Chart -->
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" Style="margin-left:1%">
                    <div class="card">
                        <div class="header" style="padding-bottom: 5%;">
                            <h2>Sales Status Trend YTD ${year}</h2>
                            
                        <div class="" style="margin-top: 2%;">
                        
                         <% 
                    if(isbdh.equalsIgnoreCase("TRUE") ||profileid == 6){
                    %>
                        <span class="asterisk_input3">  </span> 
                        <div class="col-sm-6" style="margin-top: 0%;width: 35%;">
	    								<div class="form-group">
                                        	<div class="form-line">
                                                <select class="form-control show-tick"  id="salespersonid1" name="salespersonid1" required>
                                                	
                                                </select>
                                        	</div>
                                    	</div>
	    			    </div>   

					<div class="col-xs-4" style ="margin-left: -5rem";>
					<span class="asterisk_input3">  </span> 
						<input type="month" class="form-control" id="startDate1"
							name="startDate1" value="${startDate}" required="required" style="margin-left: 25%;margin-top: -7%;height: 36px;">
					</div>
					
					<div class="col-xs-4" style="margin-left: 36%;">
				<button type="button" id="dwldexcel"
								class="btn btn-sm btn-primary" onclick="loaddata1()" style="margin-left: 100%;margin-top: -38.5%;">Submit</button>
								
					<button type="button" id="dwldexcel"
								class="btn bg-blue-grey waves-effect" onclick="loadPage()" style="margin-left: 147%;margin-top: -38%;width: 40%;">Reset</button>						
					</div>
					
					 <% 
                    }else{
					 %>

					<div class="col-xs-4">
					<span class="asterisk_input4">  </span>   
						<input type="month" class="form-control" id="salespersonstartDate1"
							name="salespersonstartDate1" value="${startDate}" required="required" style="height: 30px;margin-left: -6%;margin-top: -8%;">
					</div>
					
					<div class="col-xs-4" style="margin-left: 36%;">
				<button type="button" id="dwldexcel"
								class="btn btn-sm btn-primary" onclick="salespersonloaddata1()" style="margin-left: -14%;margin-top: -19.5%;">Submit</button>
				<button type="button" id="dwldexcel"
								class="btn bg-blue-grey waves-effect" onclick="loadPage()" style="margin-left: 32%;margin-top: -18%;width: 42%;">Reset</button>	
					
					</div>
					 
					 
					 <% } %>
					 
                            </div>
                        </div>
                        <div class="body" id="chart1" class="chart1">
                            <canvas id="bar_chart1" height="150"></canvas>
                            <br>
                            <div class="row" style="margin-bottom: 0px; padding-left:45px" id="childchart11">
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 mystatusenquiry"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel" >Enquiry</div>
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 mystatuslead"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel">Lead</div>
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 mystatusopportunity" style="background: rgba(255, 207, 161, 0.94);"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel3">Opportunity</div>
                             </div>
                            
                            <div class="row" style="margin-bottom: 0px; padding-left:45px" id="childchart22">
                                 <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 mystatuspipeline"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel">Pipeline</div>
                                 <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 mystatusorder"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel">Order</div>
                                 <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 mystatuscancelled"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel3">Cancelled</div>
                                 
                            </div>
                        </div>
                    </div>
                </div>
                <!-- #END# Bar Chart -->
                
               
                
<script type="text/javascript">
function loaddata(){
	var startDate=document.getElementById("startDate").value;
 	var salespersonid=document.getElementById("salespersonid").value;
 	
 	if(salespersonid==""){
 		alert("Please select sales representative !");
 		return false;
 	}
 	
 	
 	if(startDate==""){
 		alert("Please select month !");
 		return false;
 	}
 	
 	
				$.ajax({
		      		type: 'GET',
		   	 		dataType: 'json',
		   	 		url :'${pageContext.request.contextPath}/salesstatustrandsforHR',
		   	 	    data : ({'startDate1' : startDate,'salespersonid1':salespersonid}),
		   	 		success : function(data){
		   	 		
		   	 		 $('#bar_chart2').remove();
		   	 	     $('#chart2').append('<canvas id="bar_chart2" height="150"><canvas>');
		   	 	      $('#childchart1').remove();
		   	 	      $('#childchart2').remove();
		   	 	      $('#chart2').append('<div class="row" style="margin-bottom: 0px;" id="childchart1">'
                      +'<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventenquiry" style="background: rgba(255, 207, 161, 0.94);"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel" >Enquiry</div>'
                      +'<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventinterested"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel3">Interested</div>'
                      +'<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventnotinterested"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel2">Not Interested</div>'
                      +'<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventleadqualified"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel2">Lead Qualified</div>'
                  +'</div>'
                  +'<div class="row" style="margin-bottom: 0px;" id="childchart2">'
                       +'<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventpoc" style="background: rgba(22, 90, 65, 1);"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel">PoC</div>'
                       +'<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventproposalsubmitted"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel3">Proposal Submitted</div>'
                       +'<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventwaitingforpo"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel2">Waiting for PO</div>'
                       +'<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventpo"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel">PO</div>'
                       +'<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlost"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel">Lost</div>'
                  +'</div>');
		   	 	     new Chart(document.getElementById("bar_chart2").getContext("2d"), getChartMyJs1(data));
		   	 			
		   	 	     }
		   	 			
		      	 });
				
}



function loaddata1(){
	var startDate1=document.getElementById("startDate1").value;

	var salespersonid1=document.getElementById("salespersonid1").value;
	
	if(salespersonid1==""){
 		alert("Please select sales representative !");
 		return false;
 	}
 	
 	
 	if(startDate1==""){
 		alert("Please select month!");
 		return false;
 	}
	
				$.ajax({
		      		type: 'GET',
		   	 		dataType: 'json',
		   	 		url :'${pageContext.request.contextPath}/salesstatustrandsforHR',
		   	 	    data : ({'startDate1' : startDate1,'salespersonid1' : salespersonid1}),
		   	 		success : function(data){
		   	 			
		   	 		$('#bar_chart1').remove();
		   	 	     $('#chart1').append('<canvas id="bar_chart1" height="150"><canvas>');
		   	 	      $('#childchart11').remove();
		   	 	      $('#childchart22').remove();
		   	 	      $('#chart1').append('<div class="row" style="margin-bottom: 0px; padding-left:45px" id="childchart11">'
		   	 	    		+'<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 mystatusenquiry"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel" >Enquiry</div>'
                            +'<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 mystatuslead"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel">Lead</div>'
                            +'<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 mystatusopportunity"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel3">Opportunity</div>'
                    +'</div>'
                 
                 +'<div class="row" style="margin-bottom: 0px; padding-left:45px" id="childchart22">'
                 +'<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 mystatuspipeline"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel">Pipeline</div>'
                 +'<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 mystatusorder"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel">Order</div>'
                 +'<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 mystatuscancelled"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel3">Cancelled</div>'
                 +'</div>');	
		   	 			
		   	 	     new Chart(document.getElementById("bar_chart1").getContext("2d"), getChartJs1(data));
		   	 	     
		   	 		}
		   	 			
		      	 });

}


window.onload = (event) =>{
	
	 $.ajax({
		    type:'GET',
			dataType: 'json',
	 		url :'${pageContext.request.contextPath}/issalesPerson',
	 		success : function(data)
	 		{
	 			//alert(JSON.stringify(data));
			var country = $('#salespersonid');
		    country.find('option').remove();
			var options = '';
			options +='<option value=\"\">Select</option>'
			options +='<option value=\"0\">All</option>'
			 for (var i = 0; i < data.length; i++) {
			      options += '<option value="' + data[i].employee_resource + '">' + data[i].firstname +' '+data[i].lastname+'</option>';
			}
		    $("#salespersonid").append(options);
			$("#salespersonid").selectpicker("refresh");

	 		}
	 		
});
	 
	 
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
			options +='<option value=\"\">Select</option>'
			options +='<option value=\"0\">All</option>'
			 for (var i = 0; i < data.length; i++) {
			      options += '<option value="' + data[i].employee_resource + '">' + data[i].firstname +' '+data[i].lastname+'</option>';
			}
		    $("#salespersonid1").append(options);
			$("#salespersonid1").selectpicker("refresh");

	 		}
	 		
});
	 
	
};
function salespersonloaddata(){
	var salespersonstartDate=document.getElementById("salespersonstartDate").value;
	
	if(salespersonstartDate==""){
	
		alert("Please select month !");
		return false;
	}
		 
				$.ajax({
		      		type: 'GET',
		   	 		dataType: 'json',
		   	 		url :'${pageContext.request.contextPath}/forsalesepersoneventtrands2',
		   	 	    data : ({'startdate' : salespersonstartDate}),
		   	 		success : function(data){
		   	 		//alert(data);
		   	 		console.log(data);
		   	 		 $('#bar_chart2').remove();
		   	 	     $('#chart2').append('<canvas id="bar_chart2" height="150"><canvas>');
		   	 	      $('#childchart1').remove();
		   	 	      $('#childchart2').remove();
		   	 	      $('#chart2').append('<div class="row" style="margin-bottom: 0px;" id="childchart1">'
                      +'<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventenquiry"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel" >Enquiry</div>'
                      +'<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventinterested"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel3">Interested</div>'
                      +'<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventnotinterested"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel2">Not Interested</div>'
                      +'<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventleadqualified"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel2">Lead Qualified</div>'
                  +'</div>'
                  +'<div class="row" style="margin-bottom: 0px;" id="childchart2">'
                       +'<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventpoc"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel">PoC</div>'
                       +'<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventproposalsubmitted"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel3">Proposal Submitted</div>'
                       +'<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventwaitingforpo"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel2">Waiting for PO</div>'
                       +'<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventpo"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel">PO</div>'
                       +'<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlost"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel">Lost</div>'
                  +'</div>');
		   	 	     new Chart(document.getElementById("bar_chart2").getContext("2d"), getChartMyJs1(data));
		   	 			
		   	 	     }
		   	 			
		      	 });
}



function salespersonloaddata1(){
	var a = $('#salespersonstartDate1').val();
	if(a == ''){
		alert("Please select month !");
	}
	
	
	var startDate1=document.getElementById("salespersonstartDate1").value;

				$.ajax({
		      		type: 'GET',
		   	 		dataType: 'json',
		   	 		url :'${pageContext.request.contextPath}/forsalesepersoneventtrands2',
		   	 	    data : ({'startdate' : startDate1}),
		   	 		success : function(data){
		   	 			
		   	 		$('#bar_chart1').remove();
		   	 	     $('#chart1').append('<canvas id="bar_chart1" height="150"><canvas>');
		   	 	      $('#childchart11').remove();
		   	 	      $('#childchart22').remove();
		   	 	      $('#chart1').append('<div class="row" style="margin-bottom: 0px; padding-left:45px" id="childchart11">'
		   	 	    		+'<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 mystatusenquiry"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel" >Enquiry</div>'
                            +'<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 mystatuslead"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel">Lead</div>'
                            +'<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 mystatusopportunity"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel3">Opportunity</div>'
                    +'</div>'
                 
                 +'<div class="row" style="margin-bottom: 0px; padding-left:45px" id="childchart22">'
                 +'<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 mystatuspipeline"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel">Pipeline</div>'
                 +'<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 mystatusorder"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel">Order</div>'
                 +'<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 mystatuscancelled"></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 myeventlabel3">Cancelled</div>'
                 +'</div>');	
		   	 			
		   	 	     new Chart(document.getElementById("bar_chart1").getContext("2d"), getChartJs1(data));
		   	 	     
		   	 		}
		   	 			
		      	 });
	
	
}

// function loaddata1(){
	
// 	alert("load data====================>");
// }



function loadPage(){
window.location.reload(true);
}

</script>
   
   
   

     