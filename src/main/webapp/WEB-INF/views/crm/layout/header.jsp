<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Relationship Management</title>
</head>
    <!-- Page Loader -->
    <div class="page-loader-wrapper">
        <div class="loader">
            <div class="preloader">
                <div class="spinner-layer pl-red">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                        <div class="circle"></div>
                    </div>
                </div>
            </div>
            <p>Please wait...</p>
        </div>
    </div>
    <!-- #END# Page Loader -->
    <!-- Overlay For Sidebars -->
    <div class="overlay"></div>
    <!-- #END# Overlay For Sidebars -->
    <!-- Search Bar -->
    <div class="search-bar">
        <div class="search-icon">
            <i class="material-icons">search</i>
        </div>
        <input type="text" placeholder="START TYPING...">
        <div class="close-search">
            <i class="material-icons">close</i>
        </div>
    </div>
<nav class="navbar">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="javascript:void(0);" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false"></a>
                <a href="javascript:void(0);" class="bars"></a>
                
                <a class="navbar-brand" href="index.html">
                <img src="images/logo.png" style="width: 142px !important;height: 27px !important;"></img>
                </a>
                
<!--                 <a class="navbar-brand" href="index.html"> -->
                
                
                <!-- <img src="" style="width: 142px !important;height: 27px !important;"></img> -->
                </a>
<!--                 <a class="navbar-brand" href="index.html"> -->
<!--                 Project-Management -->
<!--                 </a> -->
                
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    
                    <!-- Notifications -->
                    <li class="dropdown">
                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button">
                            <i class="material-icons">notifications</i>
                            <span class="label-count"></span>
                        </a>
                        
                        <ul class="dropdown-menu">
                            <li class="header">NOTIFICATIONS</li>
                            <li class="body">
                                
                            </li>
                            <li class="footer">
                                <a href="javascript:void(0);">View All Notifications</a>
                            </li>
                        </ul>
                    </li>
                    <!-- #END# Notifications -->
                    <!-- Tasks -->
                   
                    
                    <!-- #END# Tasks -->
                   
                    
                	
                	<li class="mydiv" style="padding-top: 20px; ">
                    
                    <div class="btn-group user-helper-dropdown">
                    	<i class="material-icons" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><img src="images/user.png" width="30" height="30" alt="User" /></i>
<!--                     	<br> -->
<%--                     	<p style="color:white"> Hi ${emp.empfirstname} </p> --%>
                    	<ul class="dropdown-menu pull-right">
                            <li><a href="profile"><i class="material-icons">person</i>Profile</a></li>
                            <li role="separator" class="divider"></li>
                           
                            <li role="separator" class="divider"></li>
                            <li><a href="logout"><i class="material-icons">input</i>Sign Out</a></li>
                        </ul>
                    </div>
                    
                    
                	</li>
                	
                	<li class="mydiv2" style="padding-top: 20px; padding-left: 10px;" >
                	<p style="color:white;font-size:12px;"> Hi <br> ${emp.empfirstname} </p>
                	</li>
                	
                </ul>
            </div>
        </div>
    </nav>
    
    
	
    
   
</html>

