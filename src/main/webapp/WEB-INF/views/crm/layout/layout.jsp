<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <title>Project-Management</title> -->
<title><tiles:insertAttribute name="title" /></title>

<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<%--     <title><tiles:insertAttribute name="title" /></title> --%>
    <title>Welcome To Customer Relation Management System</title>
    <!-- Favicon-->
    <link rel="icon" href="favicon.ico" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">
    
    
    
      <!-- Bootstrap Core Css -->
    <link href="plugins/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Waves Effect Css -->
    <link href="plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="plugins/animate-css/animate.css" rel="stylesheet" />
    
     <!-- JQuery DataTable Css -->
    <link href="plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet">
    
    <!-- Colorpicker Css -->
    <link href="plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.css" rel="stylesheet"/>
    
     <!-- Dropzone Css -->
    <link href="plugins/dropzone/dropzone.css" rel="stylesheet">

    <!-- Multi Select Css -->
    <link href="plugins/multi-select/css/multi-select.css" rel="stylesheet">

    <!-- Bootstrap Spinner Css -->
    <link href="plugins/jquery-spinner/css/bootstrap-spinner.css" rel="stylesheet">

    <!-- Bootstrap Tagsinput Css -->
    <link href="plugins/bootstrap-tagsinput/bootstrap-tagsinput.css" rel="stylesheet">
    
    
	 <!-- Bootstrap Select Css -->
    <link href="plugins/bootstrap-select/css/bootstrap-select.css" rel="stylesheet" />

  
    
    <!-- Bootstrap Material Datetime Picker Css -->
    <link href="plugins/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css" rel="stylesheet" />

    <!-- Bootstrap DatePicker Css -->
    <link href="plugins/bootstrap-datepicker/css/bootstrap-datepicker.css" rel="stylesheet" />
    
     <!-- Wait Me Css -->
    <link href="plugins/waitme/waitMe.css" rel="stylesheet" />
    
    
    
    <!-- Custom Css -->
    <link href="css/style.css" rel="stylesheet">
    
    <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
    <link href="css/themes/all-themes.css" rel="stylesheet" />

    <!-- Morris Chart Css-->
    <link href="plugins/morrisjs/morris.css" rel="stylesheet" />

 	 <!-- Sweet Alert Css -->
    <link href="plugins/sweetalert/sweetalert.css" rel="stylesheet" />
    
    <!-- JQuery DataTable Css -->
    <link href="plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet">
    
    <!-- Bootstrap DatePicker Css -->
    <link href="plugins/bootstrap-datepicker/css/bootstrap-datepicker.css" rel="stylesheet" />
    
   <!-- noUISlider Css -->
    <link href="plugins/nouislider/nouislider.min.css" rel="stylesheet" />
    
   <script type="text/javascript">
   
   function preventBack() {
       window.history.forward();
   }

   setTimeout("preventBack()", 0);
   window.onunload = function() {
       null
   };

</script>
</head>




 
   <!-- Jquery Core Js -->
	<script src="plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap Core Js -->
    <script src="plugins/bootstrap/js/bootstrap.js"></script>
    
     <!-- Select Plugin Js -->
    <script src="plugins/bootstrap-select/js/bootstrap-select.js"></script>

   

    <!-- Slimscroll Plugin Js -->
    <script src="plugins/jquery-slimscroll/jquery.slimscroll.js"></script>
    
    <!-- Bootstrap Colorpicker Js -->
    <script src="plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
    
      <!-- Dropzone Plugin Js -->
    <script src="plugins/dropzone/dropzone.js"></script>

    <!-- Input Mask Plugin Js -->
    <script src="plugins/jquery-inputmask/jquery.inputmask.bundle.js"></script>
    
    <!-- Multi Select Plugin Js -->
    <script src="plugins/multi-select/js/jquery.multi-select.js"></script>
    
    <!-- Jquery Spinner Plugin Js -->
    <script src="plugins/jquery-spinner/js/jquery.spinner.js"></script>
    
    <!-- Bootstrap Tags Input Plugin Js -->
    <script src="plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
    
    

    <!-- Waves Effect Plugin Js -->
    <script src="plugins/node-waves/waves.js"></script>
    
    <!-- Autosize Plugin Js -->
    <script src="plugins/autosize/autosize.js"></script>
    
    <!-- Moment Plugin Js -->
    <script src="plugins/momentjs/moment.js"></script>

    <!-- Bootstrap Material Datetime Picker Plugin Js -->
    <script src="plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
    
     <!-- Bootstrap Datepicker Plugin Js -->
    <script src="plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    
    
    <!-- Jquery DataTable Plugin Js -->
    <script src="plugins/jquery-datatable/jquery.dataTables.js"></script>
    <script src="plugins/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js"></script>
    <script src="plugins/jquery-datatable/extensions/export/dataTables.buttons.min.js"></script>
    <script src="plugins/jquery-datatable/extensions/export/buttons.flash.min.js"></script>
    <script src="plugins/jquery-datatable/extensions/export/jszip.min.js"></script>
    <script src="plugins/jquery-datatable/extensions/export/pdfmake.min.js"></script>
    <script src="plugins/jquery-datatable/extensions/export/vfs_fonts.js"></script>
    <script src="plugins/jquery-datatable/extensions/export/buttons.html5.min.js"></script>
    <script src="plugins/jquery-datatable/extensions/export/buttons.print.min.js"></script>
    
    <script src="js/admin.js"></script>
    
    <script src="js/pages/tables/jquery-datatable.js"></script>
    
    <script src="js/pages/forms/basic-form-elements.js"></script>
    
    <script src="js/pages/forms/advanced-form-elements.js"></script>
    
    <script src="js/pages/ui/modals.js"></script>
    
    <!-- Demo Js -->
    <script src="js/demo.js"></script>

    <!-- Jquery CountTo Plugin Js -->
    <script src="plugins/jquery-countto/jquery.countTo.js"></script>

    <!-- Morris Plugin Js -->
    <script src="plugins/raphael/raphael.min.js"></script>
    <script src="plugins/morrisjs/morris.js"></script>

    <!-- ChartJs -->
    <script src="plugins/chartjs/Chart.bundle.js"></script>
    <script src="plugins/chartjs/Chart.js"></script>
     <script src="plugins/chartjs/Chart.bundle.min.js"></script>
      <script src="plugins/chartjs/Chart.min.js"></script>
        <!-- Validation Plugin Js -->
    <script src="plugins/jquery-validation/jquery.validate.js"></script>
    

    <!-- Flot Charts Plugin Js -->
    <script src="plugins/flot-charts/jquery.flot.js"></script>
    <script src="plugins/flot-charts/jquery.flot.resize.js"></script>
    <script src="plugins/flot-charts/jquery.flot.pie.js"></script>
    <script src="plugins/flot-charts/jquery.flot.categories.js"></script>
    <script src="plugins/flot-charts/jquery.flot.time.js"></script>

    <!-- Sparkline Chart Plugin Js -->
    <script src="plugins/jquery-sparkline/jquery.sparkline.js"></script>
    
    <!-- noUISlider Plugin Js -->
    <script src="plugins/nouislider/nouislider.js"></script>
    
   <!-- Custom Js -->
    
    <script src="js/pages/index.js"></script>
 	 <script src="js/pages/examples/sign-in.js"></script>
 	  <script src="js/pages/forms/form-validation.js"></script>
<!--  	   <script src="js/pages/tables/jquery-datatable.js"></script> -->
 	 
 	  
    
    
     <!-- JQuery Steps Plugin Js -->
    <script src="plugins/jquery-steps/jquery.steps.js"></script>
    
     
    
    <!-- Sweet Alert Plugin Js -->
    <script src="plugins/sweetalert/sweetalert.min.js"></script>
    
    

    
    
      <!-- Jquery DataTable Plugin Js -->
<!--     <script src="plugins/jquery-datatable/jquery.dataTables.js"></script> -->
<!--     <script src="plugins/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js"></script> -->
<!--     <script src="plugins/jquery-datatable/extensions/export/dataTables.buttons.min.js"></script> -->
<!--     <script src="plugins/jquery-datatable/extensions/export/buttons.flash.min.js"></script> -->
<!--     <script src="plugins/jquery-datatable/extensions/export/jszip.min.js"></script> -->
<!--     <script src="plugins/jquery-datatable/extensions/export/pdfmake.min.js"></script> -->
<!--     <script src="plugins/jquery-datatable/extensions/export/vfs_fonts.js"></script> -->
<!--     <script src="plugins/jquery-datatable/extensions/export/buttons.html5.min.js"></script> -->
<!--     <script src="plugins/jquery-datatable/extensions/export/buttons.print.min.js"></script> -->
    
<!-- <body  class="theme-red"> -->
<body class="theme-blue">
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
    <tiles:insertAttribute name="header" />
<section>

<tiles:insertAttribute name="menu" />
</section>
<!-- start: header -->
	    <section class="content">
        <div class="container-fluid">
        <tiles:insertAttribute name="body" />
        </div>
        </section>
		<!-- end: header -->
		
		
		
</body>



<script type="text/javascript">

$(window).load(function() {
//   initDonutChart();
//   new Chart(document.getElementById("bar_chart").getContext("2d"), getChartJs('bar'));
  new Chart(document.getElementById("bar_chart1").getContext("2d"), getChartJs('bar'));
  
  new Chart(document.getElementById("bar_chart2").getContext("2d"), getChartMyJs('bar'));
  
//   new Chart(document.getElementById("line_chart").getContext("2d"), getChartJs('line'));
//   initBarChart();
 // new Chart(document.getElementById("bar_chart").getContext("2d"), getChartJs('bar'));
 // getChartJs('bar');
  /* new Chart(document.getElementById("bar_chart").getContext("2d"), getChartJs('bar')); */
});

new Chart(document.getElementById("bar_chart2").getContext("2d"), getChartMyJs('bar'));

new Chart(document.getElementById("bar_chart1").getContext("2d"), getChartJs('bar'));

new Chart(document.getElementById("bar_chart2").getContext("2d"), getChartMyJs1('bar'));

new Chart(document.getElementById("bar_chart1").getContext("2d"), getChartJs1('bar'));

// function initBarChart() 
// {
// 	Morris.Bar({
//         element: 'bar_chart',
//         data: [{
//             x: 'JAN',
//             y: 10,
//             z: 25,
//             a: 65,
//             b: 85,
//             d: 4,
//             e: 46
//         }, {
//                 x: 'FEB',
//                 y: 2,
//                 z: null,
//                 a: 1,
//                 b: 4,
//                 d: 2,
//                 e: 9
//             }, {
//                 x: 'MAR',
//                 y: 0,
//                 z: 2,
//                 a: 4,
//                 b: 14,
//                 d: 5,
//                 e: 2
//             },
//             {
//                 x: 'APR',
//                 y: 0,
//                 z: 2,
//                 a: 4,
//                 b: 14,
//                 d: 5,
//                 e: 2
//             }, {
//                 x: 'MAY',
//                 y: 0,
//                 z: 2,
//                 a: 4,
//                 b: 14,
//                 d: 5,
//                 e: 2
//             },
//             {
//                 x: 'JUN',
//                 y: 0,
//                 z: 2,
//                 a: 4,
//                 b: 14,
//                 d: 5,
//                 e: 2
//             },
//             {
//                 x: 'JUL',
//                 y: 0,
//                 z: 2,
//                 a: 4,
//                 b: 14,
//                 d: 5,
//                 e: 2
//             },
//             {
//                 x: 'AUG',
//                 y: 0,
//                 z: 2,
//                 a: 4,
//                 b: 14,
//                 d: 5,
//                 e: 2
//             },
//             {
//                 x: 'SEP',
//                 y: 0,
//                 z: 2,
//                 a: 4,
//                 b: 14,
//                 d: 5,
//                 e: 2
//             },
//             {
//                 x: 'OCT',
//                 y: 0,
//                 z: 2,
//                 a: 4,
//                 b: 14,
//                 d: 5,
//                 e: 2
//             },
//             {
//                 x: 'NOV',
//                 y: 0,
//                 z: 2,
//                 a: 4,
//                 b: 14,
//                 d: 5,
//                 e: 2
//             },
            
//             {
//                 x: 'DEC',
//                 y: 2,
//                 z: 4,
//                 a: 3,
//                 b: 7,
//                 d: 9,
//                 e: 4
//             }],
//         xkey: 'x',
//         ykeys: ['y', 'z', 'a', 'b', 'd', 'e'],
//         labels: ['Enquiry', 'Lead', 'OPP','Opportunity', 'Pipeline', 'Order' , 'Cancelled'],
//         barColors: ['rgb(233, 30, 99)', 'rgb(0, 188, 212)', 'rgb(0, 150, 136)'],
//     });
// }

// function initDonutChart() {
//     Morris.Donut({
//         element: 'donut_chart',
//         data: [{
//             label: 'Open',
//             value: 37
//         }, {
//             label: 'In-Progress',
//             value: 30
//         }, {
//             label: 'Completed',
//             value: 18

//         }, {
//             label: 'Overdue',
//             value: 12
//         }],
//         colors: ['rgb(233, 30, 99)', 'rgb(0, 188, 212)', 'rgb(255, 152, 0)', 'rgb(0, 150, 136)', 'rgb(96, 125, 139)'],
//         formatter: function (y) {
//             return y + '%'
//         }
//     });
// }

function getChartMyJs(type)
{
	
	 var config = null;
	 
	 var enquirygen = <%= (ArrayList)session.getAttribute("enquirygen") %>
	 
	 var interestedgen = <%= (ArrayList)session.getAttribute("interestedgen") %>
	 
	 var notinterestedgen = <%= (ArrayList)session.getAttribute("notinterestedgen") %>
	 
	 var leadqualifiedgen = <%= (ArrayList)session.getAttribute("leadqualifiedgen") %>
	 
	 var pocgen = <%= (ArrayList)session.getAttribute("pocgen") %>
	 
	 var proposalsubmittedgen = <%= (ArrayList)session.getAttribute("proposalsubmittedgen") %>
	 
	 var waitingforpogen = <%= (ArrayList)session.getAttribute("waitingforpogen") %>
	 
	 var pogen = <%= (ArrayList)session.getAttribute("pogen") %>
	 
	 var lostgen = <%= (ArrayList)session.getAttribute("lostgen") %>
	 
	 var monthname = <%= (ArrayList)session.getAttribute("monthname") %>
	 
	 
	if (type === 'bar') {
        config = {
            type: 'bar',
            data: {
                labels: monthname,
                datasets: [{
                    label: "Enquiry",
                    data: [ enquirygen[0], enquirygen[1], enquirygen[2], enquirygen[3] , enquirygen[4], enquirygen[5], enquirygen[6], enquirygen[7], enquirygen[8],enquirygen[9], enquirygen[10], enquirygen[11]],
                    backgroundColor: 'rgba(255, 207, 161, 0.94)'
                }, {
                        label: "Interested",
                        data: [ interestedgen[0], interestedgen[1], interestedgen[2], interestedgen[3] , interestedgen[4], interestedgen[5], interestedgen[6], interestedgen[7], interestedgen[8],interestedgen[9], interestedgen[10], interestedgen[11]],
                        backgroundColor: 'rgba(103, 125, 8, 1)'
                    },
                    {
                        label: "Not Interested",
                        data: [ notinterestedgen[0], notinterestedgen[1], notinterestedgen[2], notinterestedgen[3] , notinterestedgen[4], notinterestedgen[5], notinterestedgen[6], notinterestedgen[7], notinterestedgen[8],notinterestedgen[9], notinterestedgen[10], notinterestedgen[11]],
                        backgroundColor: 'rgba(0 ,255 ,255 , 0.9)'
                    },
                    {
                        label: "Lead Qualified",
                        data: [ leadqualifiedgen[0], leadqualifiedgen[1], leadqualifiedgen[2], leadqualifiedgen[3] , leadqualifiedgen[4], leadqualifiedgen[5], leadqualifiedgen[6], leadqualifiedgen[7], leadqualifiedgen[8],leadqualifiedgen[9], leadqualifiedgen[10], leadqualifiedgen[11]],
                        backgroundColor: 'rgba(255 ,255 , 0, 1)'
                    },
                    {
                        label: "PoC",
                        data: [ pocgen[0], pocgen[1], pocgen[2], pocgen[3] , pocgen[4], pocgen[5], pocgen[6], pocgen[7], pocgen[8],pocgen[9], pocgen[10], pocgen[11]],
                        backgroundColor: 'rgba(22, 90, 65, 1)'
                    },
                    {
                        label: "Proposal Submitted",
                        data: [ proposalsubmittedgen[0], proposalsubmittedgen[1], proposalsubmittedgen[2], proposalsubmittedgen[3] , proposalsubmittedgen[4], proposalsubmittedgen[5], proposalsubmittedgen[6], proposalsubmittedgen[7], proposalsubmittedgen[8],proposalsubmittedgen[9], proposalsubmittedgen[10], proposalsubmittedgen[11]],
                        backgroundColor: 'rgba(171, 43, 171, 1)'
                    },
                    {
                        label: "Waiting for PO",
                        data: [ waitingforpogen[0], waitingforpogen[1], waitingforpogen[2], waitingforpogen[3] , waitingforpogen[4], waitingforpogen[5], waitingforpogen[6], waitingforpogen[7], waitingforpogen[8],waitingforpogen[9], waitingforpogen[10], waitingforpogen[11]],
                        backgroundColor: 'rgba(128, 129, 255, 1)'
                    },
                    {
                        label: "PO",
                        data: [ pogen[0], pogen[1], pogen[2], pogen[3] , pogen[4], pogen[5], pogen[6], pogen[7], pogen[8],pogen[9], pogen[10], pogen[11]],
                        backgroundColor: 'rgba(192 ,192 ,192 , 1)'
                    },
                    {
                        label: "Lost",
                        data: [ lostgen[0], lostgen[1], lostgen[2], lostgen[3] , lostgen[4], lostgen[5], lostgen[6], lostgen[7], lostgen[8],lostgen[9], lostgen[10], lostgen[11]],
                        backgroundColor: 'rgba(353, 69, 22, 1)'
                    }
                    ]
            },
            options: {
                responsive: true,
                legend: false
            }
        }
    }
	
	return config;
}

function getChartJs(type) {
	
	 var config = null;
	 
	 var newenquirygen = <%= (ArrayList)session.getAttribute("newenquirygen") %>
	 
	 var leadgen = <%= (ArrayList)session.getAttribute("leadgen") %>
	 
	 var ordergen = <%= (ArrayList)session.getAttribute("ordergen") %>
	 
	 var opportunitygen = <%= (ArrayList)session.getAttribute("opportunitygen") %>
	 
	 var pipelinegen = <%= (ArrayList)session.getAttribute("pipelinegen") %>
	 
	 var cancelledgen = <%= (ArrayList)session.getAttribute("cancelledgen") %>
	 
     var enquirygen = <%= (ArrayList)session.getAttribute("enquirygen") %>
	 
	 var interestedgen = <%= (ArrayList)session.getAttribute("interestedgen") %>
	 
	 var notinterestedgen = <%= (ArrayList)session.getAttribute("notinterestedgen") %>
	 
	 var leadqualifiedgen = <%= (ArrayList)session.getAttribute("leadqualifiedgen") %>
	 
	 var pocgen = <%= (ArrayList)session.getAttribute("pocgen") %>
	 
	 var proposalsubmittedgen = <%= (ArrayList)session.getAttribute("proposalsubmittedgen") %>
	 
	 var waitingforpogen = <%= (ArrayList)session.getAttribute("waitingforpogen") %>
	 
	 var pogen = <%= (ArrayList)session.getAttribute("pogen") %>
	 
	 var lostgen = <%= (ArrayList)session.getAttribute("lostgen") %>
	 
	 var monthname = <%= (ArrayList)session.getAttribute("monthname") %>
	 
	 console.log("newenquirygen==> ."+JSON.stringify(newenquirygen));
	 
	 console.log("leadgen==> ."+JSON.stringify(leadgen));
	 
	 console.log("ordergen==> ."+JSON.stringify(ordergen));
	 
	 console.log("opportunitygen==> ."+JSON.stringify(opportunitygen));
	 
	 console.log("pipelinegen==> ."+JSON.stringify(pipelinegen));
	 
     console.log("enquirygen==> ."+JSON.stringify(enquirygen));
	 
	 console.log("interestedgen==> ."+JSON.stringify(interestedgen));
	 
	 console.log("notinterestedgen==> ."+JSON.stringify(notinterestedgen));
	 
	 console.log("leadqualifiedgen==> ."+JSON.stringify(leadqualifiedgen));
	 
	 console.log("pocgen==> ."+JSON.stringify(pocgen));
	 
	 console.log("proposalsubmittedgen==> ."+JSON.stringify(proposalsubmittedgen));
	 
	 console.log("waitingforpogen==> ."+JSON.stringify(waitingforpogen));
	 
	 console.log("pogen==> ."+JSON.stringify(pogen));
	 
	 console.log("lostgen==> ."+JSON.stringify(lostgen));
	 
	 
	 if (type === 'line') {
	        config = {
	            type: 'line',
	            data: {
	            	labels: monthname,
	                datasets: [{
	                    label: "Enquiry",
	                    data: [enquirygen[0], enquirygen[1], enquirygen[2], enquirygen[3], enquirygen[4], enquirygen[5], enquirygen[6] , enquirygen[7], enquirygen[8], enquirygen[9], enquirygen[10], enquirygen[11]],
	                    borderColor: 'rgba(0, 188, 212, 0.75)',
	                    backgroundColor: 'rgba(0, 188, 212, 0.3)',
	                    pointBorderColor: 'rgba(0, 188, 212, 0)',
	                    pointBackgroundColor: 'rgba(0, 188, 212, 0.9)',
	                    pointBorderWidth: 1
	                }, {
	                        label: "Interested",
	                        data: [interestedgen[0], interestedgen[1], interestedgen[2], interestedgen[3], interestedgen[4], interestedgen[5], interestedgen[6] , interestedgen[7], interestedgen[8], interestedgen[9], interestedgen[10], interestedgen[11]],
	                        borderColor: 'rgba(233, 30, 99, 0.75)',
	                        backgroundColor: 'rgba(233, 30, 99, 0.3)',
	                        pointBorderColor: 'rgba(233, 30, 99, 0)',
	                        pointBackgroundColor: 'rgba(233, 30, 99, 0.9)',
	                        pointBorderWidth: 1
	                    },
	                    {
	                        label: "Not Interested",
	                        data: [notinterestedgen[0], notinterestedgen[1], notinterestedgen[2], notinterestedgen[3], notinterestedgen[4], notinterestedgen[5], notinterestedgen[6] , notinterestedgen[7], notinterestedgen[8], notinterestedgen[9], notinterestedgen[10], notinterestedgen[11]],
	                        borderColor: 'rgba(348, 93, 55, 0.75)',
	                        backgroundColor: 'rgba(348, 93, 55, 0.3)',
	                        pointBorderColor: 'rgba(348, 93, 55, 0)',
	                        pointBackgroundColor: 'rgba(348, 93, 55, 0.9)',
	                        pointBorderWidth: 1
	                    },
	                    {
	                        label: "Lead Qualified",
	                        data: [leadqualifiedgen[0], leadqualifiedgen[1], leadqualifiedgen[2], leadqualifiedgen[3], leadqualifiedgen[4], leadqualifiedgen[5], leadqualifiedgen[6] , leadqualifiedgen[7], leadqualifiedgen[8], leadqualifiedgen[9], leadqualifiedgen[10], leadqualifiedgen[11]],
	                        borderColor: 'rgba(165, 75, 45, 0.75)',
	                        backgroundColor: 'rgba(165, 75, 45, 0.3)',
	                        pointBorderColor: 'rgba(165, 75, 45, 0)',
	                        pointBackgroundColor: 'rgba(165, 75, 45, 0.9)',
	                        pointBorderWidth: 1
	                    },
	                    {
	                        label: "PoC",
	                        data: [pocgen[0], pocgen[1], pocgen[2], pocgen[3], pocgen[4], pocgen[5], pocgen[6] , pocgen[7], pocgen[8], pocgen[9], pocgen[10], pocgen[11]],
	                        borderColor: 'rgba(184, 93, 52, 0.75)',
	                        backgroundColor: 'rgba(184, 93, 52, 0.3)',
	                        pointBorderColor: 'rgba(184, 93, 52, 0)',
	                        pointBackgroundColor: 'rgba(184, 93, 52, 0.9)',
	                        pointBorderWidth: 1
	                    },
	                    {
	                        label: "Proposal Submitted",
	                        data: [proposalsubmittedgen[0], proposalsubmittedgen[1], proposalsubmittedgen[2], proposalsubmittedgen[3], proposalsubmittedgen[4], proposalsubmittedgen[5], proposalsubmittedgen[6] , proposalsubmittedgen[7], proposalsubmittedgen[8], proposalsubmittedgen[9], proposalsubmittedgen[10], proposalsubmittedgen[11]],
	                        borderColor: 'rgba(38, 96, 48, 0.75)',
	                        backgroundColor: 'rgba(38, 96, 48, 0.3)',
	                        pointBorderColor: 'rgba(38, 96, 48, 0)',
	                        pointBackgroundColor: 'rgba(38, 96, 48, 0.9)',
	                        pointBorderWidth: 1
	                    },
	                    {
	                        label: "Waiting for PO",
	                        data: [waitingforpogen[0], waitingforpogen[1], waitingforpogen[2], waitingforpogen[3], waitingforpogen[4], waitingforpogen[5], waitingforpogen[6] , waitingforpogen[7], waitingforpogen[8], waitingforpogen[9], waitingforpogen[10], waitingforpogen[11]],
	                        borderColor: 'rgba(171, 21, 33, 0.75)',
	                        backgroundColor: 'rgba(171, 21, 33, 0.3)',
	                        pointBorderColor: 'rgba(171, 21, 33, 0)',
	                        pointBackgroundColor: 'rgba(171, 21, 33, 0.9)',
	                        pointBorderWidth: 1
	                    },
	                    {
	                        label: "PO",
	                        data: [pogen[0], pogen[1], pogen[2], pogen[3], pogen[4], pogen[5], pogen[6] , pogen[7], pogen[8], pogen[9], pogen[10], pogen[11]],
	                        borderColor: 'rgba(171, 21, 33, 0.75)',
	                        backgroundColor: 'rgba(171, 21, 33, 0.3)',
	                        pointBorderColor: 'rgba(171, 21, 33, 0)',
	                        pointBackgroundColor: 'rgba(171, 21, 33, 0.9)',
	                        pointBorderWidth: 1
	                    },
	                    {
	                        label: "Lost",
	                        data: [lostgen[0], lostgen[1], lostgen[2], lostgen[3], lostgen[4], lostgen[5], lostgen[6] , lostgen[7], lostgen[8], lostgen[9], lostgen[10], lostgen[11]],
	                        borderColor: 'rgba(272, 66, 42, 0.75)',
	                        backgroundColor: 'rgba(272, 66, 42, 0.3)',
	                        pointBorderColor: 'rgba(272, 66, 42, 0)',
	                        pointBackgroundColor: 'rgba(272, 66, 42, 0.9)',
	                        pointBorderWidth: 1
	                    }
	                    ]
	            },
	            options: {
	                responsive: true,
	                legend: false
	            }
	        }
	    }
	    else if (type === 'bar') {
	        config = {
	            type: 'bar',
	            data: {
	                labels: monthname,
	                datasets: [{
	                    label: "Enquiry",
	                    data: [newenquirygen[0], newenquirygen[1], newenquirygen[2], newenquirygen[3] , newenquirygen[4], newenquirygen[5], newenquirygen[6], newenquirygen[7], newenquirygen[8],newenquirygen[9], newenquirygen[10], newenquirygen[11]],
	                    backgroundColor: 'rgba(0, 188, 212, 0.8)'
	                }, {
	                        label: "Lead",
	                        data: [leadgen[0], leadgen[1], leadgen[2], leadgen[3] , leadgen[4], leadgen[5], leadgen[6], leadgen[7], leadgen[8],leadgen[9], leadgen[10], leadgen[11]],
	                        backgroundColor: 'rgba(233, 30, 99, 0.8)'
	                    },
	                    {
	                        label: "Opportunity",
	                        data: [opportunitygen[0], opportunitygen[1], opportunitygen[2], opportunitygen[3] , opportunitygen[4], opportunitygen[5], opportunitygen[6], opportunitygen[7], opportunitygen[8],opportunitygen[9], opportunitygen[10], opportunitygen[11]],
	                        backgroundColor: 'rgba(255, 207, 161, 0.94)'
	                    },
	                    {
	                        label: "Pipeline",
	                        data: [pipelinegen[0], pipelinegen[1], pipelinegen[2], pipelinegen[3] , pipelinegen[4], pipelinegen[5], pipelinegen[6], pipelinegen[7], pipelinegen[8],pipelinegen[9], pipelinegen[10], pipelinegen[11]],
	                        backgroundColor: 'rgba(22, 90, 65, 0.9)'
	                    },
	                    {
	                        label: "Order",
	                        data: [ordergen[0], ordergen[1], ordergen[2], ordergen[3] , ordergen[4], ordergen[5], ordergen[6], ordergen[7], ordergen[8],ordergen[9], ordergen[10], ordergen[11]],
	                        backgroundColor: 'rgba(184, 93, 52, 0.9)'
	                    },
	                    {
	                        label: "Cancelled",
	                        data: [cancelledgen[0], cancelledgen[1], cancelledgen[2], cancelledgen[3] , cancelledgen[4], cancelledgen[5], cancelledgen[6], cancelledgen[7], cancelledgen[8],cancelledgen[9], cancelledgen[10], cancelledgen[11]],
	                        backgroundColor: 'rgba(192,192,192, 1)'
	                    }
	                    ]
	            },
	            options: {
	                responsive: true,
	                legend: false
	            }
	        }
	    }
	    else if (type === 'radar') {
	        config = {
	            type: 'radar',
	            data: {
	                labels: ["January", "February", "March", "April", "May", "June", "July"],
	                datasets: [{
	                    label: "My First dataset",
	                    data: [65, 25, 90, 81, 56, 55, 40],
	                    borderColor: 'rgba(0, 188, 212, 0.8)',
	                    backgroundColor: 'rgba(0, 188, 212, 0.5)',
	                    pointBorderColor: 'rgba(0, 188, 212, 0)',
	                    pointBackgroundColor: 'rgba(0, 188, 212, 0.8)',
	                    pointBorderWidth: 1
	                }, {
	                        label: "My Second dataset",
	                        data: [72, 48, 40, 19, 96, 27, 100],
	                        borderColor: 'rgba(233, 30, 99, 0.8)',
	                        backgroundColor: 'rgba(233, 30, 99, 0.5)',
	                        pointBorderColor: 'rgba(233, 30, 99, 0)',
	                        pointBackgroundColor: 'rgba(233, 30, 99, 0.8)',
	                        pointBorderWidth: 1
	                    }]
	            },
	            options: {
	                responsive: true,
	                legend: false
	            }
	        }
	    }
	    else if (type === 'pie') {
	        config = {
	            type: 'pie',
	            data: {
	                datasets: [{
	                    data: [225, 50, 100, 40],
	                    backgroundColor: [
	                        "rgb(233, 30, 99)",
	                        "rgb(255, 193, 7)",
	                        "rgb(0, 188, 212)",
	                        "rgb(139, 195, 74)"
	                    ],
	                }],
	                labels: [
	                    "Pink",
	                    "Amber",
	                    "Cyan",
	                    "Light Green"
	                ]
	            },
	            options: {
	                responsive: true,
	                legend: false
	            }
	        }
	    }
	    return config;
}

function getChartMyJs1(data)
{
	
	var config = null;
	
	 var enquirygen =data.map.enquirygen.myArrayList;
	 
	 var interestedgen = data.map.interestedgen.myArrayList;

	 var notinterestedgen = data.map.notinterestedgen.myArrayList;
	 
	 var leadqualifiedgen = data.map.leadqualifiedgen.myArrayList;
	 
	 var pocgen = data.map.pocgen.myArrayList;
	 
	 var proposalsubmittedgen = data.map.proposalsubmittedgen.myArrayList;
	 
	 var waitingforpogen = data.map.waitingforpogen.myArrayList;
		
	 var pogen = data.map.pogen.myArrayList;
	
	 var lostgen = data.map.lostgen.myArrayList;

	var month=data.map.monthname;

	 config = {
	            type: 'bar',
	            data: {
	                labels: [month],
	                datasets: [{
	                    label: "Enquiry",
	                    data: [enquirygen[0]],
	                    backgroundColor: 'rgba(255, 207, 161, 0.94)'
	                }
	                ,{
                        label: "Interested",
                        data: [interestedgen[0]],
                        backgroundColor: 'rgba(103, 125, 8, 1)'
                    }
	                ,{
                        label: "Not Interested",
                        data: [notinterestedgen[0]],
                        backgroundColor: 'rgba(0 ,255 ,255 , 0.9)'
                    }
	                ,{
                        label: "Lead Qualified",
                        data: [leadqualifiedgen[0]],
                        backgroundColor: 'rgba(255 ,255 , 0, 1)'
                    }
	                ,{
                        label: "PoC",
                        data: [pocgen[0]],
                        backgroundColor: 'rgba(22, 90, 65, 1)'
                    }
	                ,{
                        label: "Proposal Submitted",
                        data: [proposalsubmittedgen[0]],
                        backgroundColor: 'rgba(171, 43, 171, 1)'
                    }
	                ,{
                        label: "Waiting for PO",
                        data: [waitingforpogen[0]],
                        backgroundColor: 'rgba(159, 171, 43, 1)'
                    }
	                ,{
                        label: "PO",
                        data: [pogen[0]],
                        backgroundColor: 'rgba(192 ,192 ,192 , 1)'
                    },{
                         label: "Lost",
                         data:[lostgen[0]],
                         backgroundColor: 'rgba(353, 69, 22, 1)'
                     }
                    
	                    ]
	            },
	            options: {
	                responsive: true,
	                legend: false,
	                scales: {
	                    y: {
	                        beginAtZero: true
	                    }
	                }
// 	                scales:{yAxes: [{display:true,ticks: {min:0}} ]}
	            }
	        }
	return config;
}


function getChartJs1(data) {
	
	       var config = null;
	       
     	 var newenquirygen = data.map.newenquirygen.myArrayList;
	 
     	 var leadgen = data.map.leadgen.myArrayList; 
	 
     	 var ordergen = data.map.ordergen.myArrayList;
	 
     	 var opportunitygen = data.map.leadgen.myArrayList;
	 
     	 var pipelinegen = data.map.pipelinegen.myArrayList;
	 
    	   var cancelledgen = data.map.cancelledgen.myArrayList;
	    
	     var month=data.map.monthname;
	 
	        config = {
	            type: 'bar',
	            data: {
	                labels: [month],
	                datasets: [
	                	{
	                    label: "Enquiry",
	                    data: [newenquirygen[0]],
	                    backgroundColor: 'rgba(0, 188, 212, 0.8)'
  	                },{
	                        label: "Lead",
	                        data: [leadgen[0]],
	                        backgroundColor: 'rgba(233, 30, 99, 0.8)'
	                    },{
	                        label: "Opportunity",
	                        data: [opportunitygen[0]],
	                        backgroundColor: 'rgba(255, 207, 161, 0.94)'
	                    },{
	                        label: "Pipeline",
	                        data: [pipelinegen[0]],
	                        backgroundColor: 'rgba(22, 90, 65, 0.9)'
	                    },{
	                        label: "Order",
	                        data: [ordergen[0]],
	                        backgroundColor: 'rgba(184, 93, 52, 0.9)'
	                    },
	                    {
	                        label: "Cancelled",
	                        data: [cancelledgen[0]],
	                        backgroundColor: 'rgba(192,192,192, 1)'
	                    }
	                    ]
	            },
	            options: {
	                responsive: true,
	                legend: false,
	                scales: {
	                    y: {
	                        beginAtZero: true
	                    }
	                }
	                //scales:{ yAxes: [{display:true,ticks:{min: 0}}]}
	            }
	        }
	return config;
}


</script>


</html>