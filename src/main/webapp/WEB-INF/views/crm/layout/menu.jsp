<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import=" java.util.HashMap" import="java.util.Map"
	import="java.util.List" import="java.util.ArrayList"
	import="com.omfys.crm.model.Crm_Sub_Menu"
	import="com.omfys.crm.model.MainMenu"
	import="com.omfys.crm.model.Crm_Sub_Sub_Menu"
	%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title></title>
</head>
	        <section>
			<aside id="leftsidebar" class="sidebar">
<!--             User Info -->

<div class="menu">
        <% 
	         String usertype = (String) session.getAttribute("usertype");
				
            	
            	if(usertype.equals("CRM Admin") || usertype.equals("BDA") || usertype.equals("Employee") )
            	{
            	%>
            	<ul class="list">
<!--             			<li class="header">MAIN NAVIGATION</li> -->
            			<c:forEach var="menus" items="${menus}">
            				<c:set var="header_menu_id">${menus.mainmenuid}</c:set>
            				<%
            				String id = (String) pageContext.getAttribute("header_menu_id");
    						if(session.getAttribute("submenu" + id)  !=  null)
    						{	
    						%>
    						<li class="">
    							<a href="javascript:void(0);" class="menu-toggle">
                            		<i class="material-icons">${menus.mainmenuicon}</i>
                            	   	<span>${menus.mainmenuname}</span>
                        		</a>
                        		 <ul class="ml-menu">
                        		 	<%
                        		 	ArrayList<Crm_Sub_Menu> mgls = new ArrayList<Crm_Sub_Menu>();
                        		 	mgls = (ArrayList<Crm_Sub_Menu>) session.getAttribute("submenu" + id);
                        		 
                        		 	for (Crm_Sub_Menu mgl : mgls) {
                        		 		
                        		 		String subId = String.valueOf(mgl.getSub_menu_id());
                        		 
                        		 		if(session.getAttribute("subsubmenu" + subId) != null)
										{
											/* out.println("subId not null==>"); */
										%>
											<li>
												<a href="javascript:void(0);" class="menu-toggle">
                        		 					<span><%=mgl.getSub_menu_name() %></span>
                        		 				</a>
                        		 				<ul class="ml-menu">
                        		 					<%
                        		 					ArrayList<Crm_Sub_Sub_Menu> pssmenu = new ArrayList<Crm_Sub_Sub_Menu>();
                        		 					pssmenu = (ArrayList<Crm_Sub_Sub_Menu>) session.getAttribute("subsubmenu" + subId);
                                          			for (Crm_Sub_Sub_Menu mgl1 : pssmenu)
                                          			{
                                          			%>
                                          			<li class="">
                               							<a href="<%=mgl1.getSub_sub_menu_action_name()%>"><%=mgl1.getSub_sub_menu_name()%></a>
                               						</li>
                                          			<%	
                                          			}
                        		 					%>
                        		 				</ul>
											</li>
										<% 
										}else{
                        		 		%>
                        		 		
                        		 	<li>
  								      <a href="<%=mgl.getSub_menu_act_name() %>" class="">
                  		 		      <span><%=mgl.getSub_menu_name() %></span>
                  		 		      </a>
  								     </li>	
                        		 <%
										}
                        		 
                        		 	}
                        		 	
                        		 	%>
                        		 	
                        		 </ul>
    						</li>
    						<%	
    						}
    						else
    						{
    						%>
    						<li class="">
                    			 <a href="${menus.mainmenuactionname}">
                    				<i class="material-icons">${menus.mainmenuicon}</i>
                    				<span>${menus.mainmenuname}</span>
                    			 </a>
                    		</li>
    						<% 	
    						}
            				%>
            			</c:forEach>
            		</ul>
            	<% 
            	}
            	%>
            	</div>
            <!--end of Menu -->
            </aside>
            </section>
            </html>