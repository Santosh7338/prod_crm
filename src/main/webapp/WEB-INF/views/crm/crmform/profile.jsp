<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

       

       <div class="row clearfix" style="padding-top: 15px;">
                <div class="col-xs-12 col-sm-3">
                    <div class="card profile-card">
                        <div class="profile-header">&nbsp;</div>
                        <div class="profile-body">
                            <div class="image-area">
                                <img src="../../images/user-lg.jpg" alt="AdminBSB - Profile Image" />
                            </div>
                            <div class="content-area">
                                <h3>Marc K. Hammond</h3>
                                <p>Web Software Developer</p>
                                <p>Administrator</p>
                            </div>
                        </div>
                        
                    </div>

                    
                </div>
                <div class="col-xs-12 col-sm-9">
                    <div class="card">
                        <div class="body">
                            <div>
                                <ul class="nav nav-tabs" role="tablist">
                                    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Personal Details</a></li>
                                    <li role="presentation" ><a href="#profile_settings" aria-controls="settings" role="tab" data-toggle="tab">Bank Details</a></li>
                                    <li role="presentation"><a href="#change_password_settings" aria-controls="settings" role="tab" data-toggle="tab">Change Password</a></li>
                                </ul>

                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane fade in active" id="home">
                                    
                                         <form class="form-horizontal">
                                            <div class="form-group">
                                                <label for="NameSurname" class="col-sm-2 control-label">Name </label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="NameSurname" name="NameSurname" placeholder="Name Surname" value="${per_det.firstname} ${per_det.lastname}" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label for="empcode" class="col-sm-2 control-label">Employee Code </label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="empcode" name="empcode" placeholder="Name Surname" value="${emp.empcode}" readonly/>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label for="Email" class="col-sm-2 control-label">Email</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="Email" name="Email" placeholder="Email" value="${emp.email}" readonly/>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label for="gender" class="col-sm-2 control-label">Gender</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="gender" name="gender" placeholder="Email" value="${per_det.gender}" readonly/>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label for="contactno" class="col-sm-2 control-label">Contact No.</label>

                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="contactno" name="contactno"  placeholder="Experience" value="${per_det.contactnumber}" readonly/>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label for="dob" class="col-sm-2 control-label">Date Of Birth.</label>

                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="dob" name="dob"  placeholder="Date Of Birth" value="${per_det.dob}" readonly/>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label for="dob" class="col-sm-2 control-label">Designation</label>

                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="designation" name="designation"  placeholder="Designation" value="${jdl.designationid.designationname}" readonly/>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            
                                            
                                            
                                            <div class="form-group">
                                                <label for="InputSkills" class="col-sm-2 control-label">Skills</label>

                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="InputSkills" name="InputSkills" placeholder="Skills" value="HTML5 & CSS3,Javascript/jQuery,HTML5 & CSS3,PHP & MySQL">
                                                    </div>
                                                </div>
                                            </div>

                                            
                                            
                                        </form>

                                        
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade in" id="profile_settings">
                                        <form class="form-horizontal">
                                            <div class="form-group">
                                                <label for="bankname" class="col-sm-2 control-label">Bank Name</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="bankname" name="bankname" placeholder="" value="${jdl.bankname}" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label for="banKacnum" class="col-sm-2 control-label">Bank Account Number</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="banKacnum" name="banKacnum" placeholder="" value="${jdl.bankacnumber}" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label for="ifsccode" class="col-sm-2 control-label">IFSC Code</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="ifsccode" name="ifsccode" placeholder="" value="${jdl.ifsc}" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label for="ctc" class="col-sm-2 control-label">CTC</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="ctc" name="ctc" placeholder="" value="${jdl.ctc}" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label for="uanno" class="col-sm-2 control-label">UAN Number</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="uanno" name="uanno"  value="${jdl.uannumber}" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                              <div class="form-group">
                                                <label for="aadharno" class="col-sm-2 control-label">Aadhar Card Number</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="aadharno" name="aadharno"  value="${jdl.aadhar_card}" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                              <div class="form-group">
                                                <label for="panno" class="col-sm-2 control-label">PAN Number</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="panno" name="panno"  value="${jdl.panno}" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                              <div class="form-group">
                                                <label for="pfno" class="col-sm-2 control-label">PF Number</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="pfno" name="pfno"  value="${jdl.pfnumber}" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            
                                        </form>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade in" id="change_password_settings">
                                        <form class="form-horizontal">
                                            <div class="form-group">
                                                <label for="OldPassword" class="col-sm-3 control-label">Old Password</label>
                                                <div class="col-sm-9">
                                                    <div class="form-line">
                                                        <input type="password" class="form-control" id="OldPassword" name="OldPassword" placeholder="Old Password" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="NewPassword" class="col-sm-3 control-label">New Password</label>
                                                <div class="col-sm-9">
                                                    <div class="form-line">
                                                        <input type="password" class="form-control" id="NewPassword" name="NewPassword" placeholder="New Password" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="NewPasswordConfirm" class="col-sm-3 control-label">New Password (Confirm)</label>
                                                <div class="col-sm-9">
                                                    <div class="form-line">
                                                        <input type="password" class="form-control" id="NewPasswordConfirm" name="NewPasswordConfirm" placeholder="New Password (Confirm)" required>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-sm-offset-3 col-sm-9">
                                                    <button type="submit" class="btn btn-danger">SUBMIT</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>