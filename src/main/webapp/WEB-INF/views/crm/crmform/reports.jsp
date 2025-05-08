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
	
	<div class="modal fade" id="alertpop" tabindex="-1" role="dialog" >
		<div class="modal-dialog modal-lg modal-dialog-scrollable" role="document" style="width: 28%;height: -120%;margin-top: 16%;">
			 <div class="modal-content">

				<div class="modal-body">
				<span><h3 style="margin-left: -6%;">This page under development ?</h3></span>
					</div>
				<div class="modal-footer" >
					     <button type="button"  class="btn btn-link waves-effect" style="background-color: blue;color:white; font-weight: bold; font-size: 21px;;" onclick="myFunction()">Back</button>
				</div>
			 </div>
		</div>
		</div>
	

</div>

      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
      
      <link href="https://cdn.jsdelivr.net/gh/xxjapp/xdialog@3/xdialog.min.css" rel="stylesheet"/>
      <script src="https://cdn.jsdelivr.net/gh/xxjapp/xdialog@3/xdialog.min.js"></script>
            
      <script type="text/javascript">
      
   	window.addEventListener('load', (event) =>{

   		var $popup = $('#alertpop');
   	   	$popup.modal("show");
   	   	
   	});
   	
  function myFunction(){
	  window.location.href = "dashboard";
  }
      
      </script>    
          
       
       