<%@page import="in.pcsacademy.model.vo.StudentRegistrationVo"%>
<%
    StudentRegistrationVo strvo = (StudentRegistrationVo) session.getAttribute("ALLSTUDENTDATA");

%>
<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>

<script type="text/javascript">
    function studentRegnBeforeAdmission() {
        var category = document.getElementById("trainingCategoryId").value;
        var course = document.getElementById("trainingCourseId").value;
        var fname = document.getElementById("firstName").value;
        var email = document.getElementById("emailId").value;
        var mob = document.getElementById("mobile").value;
        var pass = document.getElementById("password").value;
        var cpass = document.getElementById("confirmpass").value;

        if (category == "" || category == null) {
            alert("Please select Training Category");
            return false;
        }
        if (course == "" || course == null) {
            alert("Please Select Course");
            return false;
        }
        if (fname == "" || fname == null) {
            alert("Enter First Name!");
            return false;
        }
        if (email == "" || email == null) {
            alert("Enter Email!");
            return false;
        }
        if (mob == "" || mob == null) {
            alert("Enter Mobile No!");
            return false;
        }
        if (pass == "" || pass == null) {
            alert("Enter Password!");
            return false;
        }
        if (cpass == "" || cpass == null) {
            alert("Enter Confirm Password!");

            return false;
        }
        if (cpass != pass) {
            alert("Pasword Mismatch!");
            return false;
        }
        var studentRegnAfterAdmissionConfirm = confirm("Sure to register?");
        if (studentRegnAfterAdmissionConfirm) {
            return true;
        }
        else {
            return false;
        }
    }

</script>

<!-- HEADER -->
<div id="top-header" class=" t3-top-header">
    <div class="container">
        <div class="main-container1">
            <div class="row">
                <div class="pull-right clearfix"> 
                    <!-- HEAD SOCIAL -->
                    <div class="head-social  hidden-sm hidden-xs">
                        
                        <div class="custom"> 
                            <!-- AddThis Follow BEGIN -->
<!--                            <div class="addthis_toolbox">-->
                                <div class="addthis_toolbox">
                               
                                
                                <a href="https://www.facebook.com/pcscloudacademy" style="background-color: #5babfc;" target="_blank"><i style="color: #fff;" class="fa fa-facebook"></i></a> 
                                <a href="https://www.twitter.com/" style="background-color: #5babfc;" target="_blank"><i style="color: #fff;" class="fa fa-twitter"></i></a> 
                                <a href="#" style="background-color: #5babfc;"><i style="color: #fff;" class="fa fa-rss"></i></a> 
                            </div>
                            <script type="text/javascript" src="js/addthis_widget.js"></script> 
                            <!-- AddThis Follow END -->
                        </div>
                    </div>
                    <!-- //HEAD SOCIAL --> 
                </div>

                <div class="col-xs-6 col-sm-6 pull-right"> 
                    <!-- HEAD LOGIN -->
                    <div class="head-login clearfix " style="padding-top: 7px;">
                        <ul class="ja-login">
                            <li> 
                                <%                                    if (session.getAttribute("ALLSTUDENTDATA") != null) {
                                %>
                                <a class="logout-switch" href="student-logout.do" title="Logout">
                                    <span>Log Out</span>
                                </a>
                                <a class="register-switch" href="javascript:void(0)" data-target="#">
                                    Hi..<%=strvo.getFirstName()%>
                                </a>
                                <%
                                    }
                                    if (session.getAttribute("ALLSTUDENTDATA") == null) {
                                %>
                                <a class="login-switch" href="javascript:void(0);" title="Login">
                                    <span>Login</span>
                                </a> 
                                <%
                                    }
                                %>
                                <!--LOFIN FORM content-->
                                <div id="ja-user-login">
                                    <html:form action="student-login" styleId="login-form">
                                        <!--                                    <form action="" method="post" name="form-login" id="login-form" >-->
                                        <div class="pretext"></div>
                                        <fieldset class="userdata">
                                            <p id="form-login-username">
                                                <label for="modlgn-username"> Registration Id</label>
                                                <!--                                                <i id="modlgn-username" type="text" name="username" class="inputbox"  size="18" />-->
                                                <html:text property="studentRegnBeforeAdmisnId" styleClass="inputbox" size="18" styleId="uregid" value="" />
                                            </p>
                                            <p id="form-login-password">
                                                <label for="modlgn-passwd">Password</label>
                                                <!--                                                <input id="modlgn-passwd" type="password" name="password" class="inputbox" size="18"  />-->
                                                <html:password property="password" styleId="upass" styleClass="inputbox" size="18" />
                                            </p>
                                            <p id="form-login-remember">
                                                <label for="modlgn-remember">Remember Me</label>
                                                <input id="modlgn-remember" type="checkbox" name="remember" class="inputbox" value="yes"/>
                                            </p>
                                            <!--                                            <input type="submit" name="Submit" class="button btn" value="Login" />-->
                                            <html:submit value="Login" styleClass="button btn" />
                                        </fieldset>
                                            
                                        <ul>
                                            <li><a href="">Forgot your password ?</a></li>
                                            <!--<li><a href="">Forgot your username ?</a></li>-->
                                            <li><a href="">Create an account</a></li>
                                        </ul>
                                    </html:form>
                                </div>
                            </li>
                            <li>
                                <%
                                    if (session.getAttribute("ALLSTUDENTDATA") == null) {
                                %>
                                <a class="register-switch" href="javascript:void(0);">
                                    <span>Quick Register</span> 
                                </a> 
                                <%
                                    }
                                %>
                                <!--Register FORM content-->
                                <div id="ja-user-register">
                                    <jsp:include page="header/student/student_regn_quick.jsp" />
                                </div>                               
                            </li>
                            
                            <li type="button" class="register-switch" style="color: #FFF">Contact No:033-40012426</li>
                           
                            
                            <!--LOFIN FORM content-->
                        </ul>
                    </div>
                    <!-- //HEAD LOGIN --> 
                </div>
            </div>
        </div>
    </div>
</div>


<!-- MAIN NAVIGATION -->
<header id="t3-mainnav" class="t3-mainnav navbar navbar-default">
    <div class="container clearfix">
        <div class="main-container1"> 

            <!-- NAVBAR HEADER -->
            <div class="navbar-header"> 

                <!-- LOGO -->
                <div class="logo logo-image"><html:link action="home"><img class="logo-img" src="images/cloudacademy.PNG" alt="logo"  /><span>Rohit!</span></html:link><small class="site-slogan hidden-xs"></small></div>
                    <!-- //LOGO -->
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".t3-navbar-collapse"> <i class="fa fa-bars"></i> </button>
                </div>
                <!-- //NAVBAR HEADER --> 

                <!-- HEAD SEARCH -->
                <div class="head-search ">
                    <form class="form-search" action="#" method="post">
                        <div class="search">
                            <label for="mod-search-searchword">Search...</label>
                            <i class="fa fa-search"></i>
                            <input name="searchword" id="mod-search-searchword" maxlength="20"  class="form-control" type="text" size="20" />
                        </div>
                    </form>
                </div>
                <!-- //HEAD SEARCH --> 

                <!-- NAVBAR MAIN -->
                <nav class="t3-navbar-collapse navbar-collapse collapse "></nav>
                <nav class="t3-navbar navbar-collapse collapse ">
                    <div class="t3-megamenu animate fading" data-duration="400" data-responsive="true" id="header-menubar-div">
                        <ul class="nav navbar-nav level0">
                            <li class="current active" data-id="435" data-level="1"><html:link action="home" styleClass="">Home</html:link></li>
                            <li class="dropdown mega" data-id="558" data-level="1"><a class="dropdown-toggle" href="aboutus.do" data-target="#" data-toggle="dropdown">About Us<b class="caret"></b></a>
                                <div class="nav-child dropdown-menu mega-dropdown-menu">
                                    <div class="mega-dropdown-inner">
                                        <div class="row">
                                            <div class="col-xs-12 mega-col-nav" data-width="12">
                                                <div class="mega-inner">
                                                    <ul class="mega-nav level1">
                                                        <li  data-id="544" data-level="2"><a class="" href="companyprofile.do" data-target="#">Company Profile</a> </li>
                                                        <li  data-id="543" data-level="2"><a class="" href="why-intern-at-pcs.do" data-target="#">Why PCS Cloud Academy?</a> </li>
                                                        <li  data-id="588" data-level="2"><a class="" href="missionvission.do" data-target="#">Our Vision & Mission</a> </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="dropdown mega mega-align-justify" data-id="486" data-level="1" data-alignsub="justify"><a class="dropdown-toggle" href="trainning.do" data-target="#" data-toggle="dropdown">Training<b class="caret"></b></a>
                                <div class="nav-child dropdown-menu mega-dropdown-menu full-menu col-xs-12"   data-class="full-menu">
                                    <div class="mega-dropdown-inner">
                                        <div class="row">
                                            <div class="col-xs-3 mega-col-module left-menu" data-width="3" data-position="119" data-class="left-menu">
                                                <div class="mega-inner">
                                                    <div class="t3-module module " id="Mod119">
                                                        <div class="module-inner">
                                                            <h3 class="module-title "><span>Training..</span></h3>
                                                            <div class="module-ct">
                                                                <div class="custom"  >
                                                                    <p style="color: #fff;">We are proud to lead the way in Training sector - by offering stringent "Service Level Agreements", tailored to your requirement, as part of our Training Process Outsourcing offering.</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-3 mega-col-nav" data-width="3">
                                                <div class="mega-inner">
                                                    <ul class="mega-nav level1">
                                                        <li class="mega mega-group" data-id="584" data-level="2" data-group="1"><a class=" dropdown-header mega-group-title" href="#" data-target="#">Training</a>
                                                            <div class="nav-child mega-group-ct"  >
                                                                <div class="mega-dropdown-inner">
                                                                    <div class="row">
                                                                        <div class="col-xs-12 mega-col-nav" data-width="12">
                                                                            <div class="mega-inner">
                                                                                <ul class="mega-nav level2">
                                                                                    <li  data-id="487" data-level="3" data-xicon="fa fa-user"><a class="" href="corporatetrainning.do" data-target="#"><i class="fa fa-user"></i>Corporate Training</a></li>
                                                                                    <li  data-id="488" data-level="3" data-xicon="fa fa-user-md"><a class="" href="indurstrytrainning.do" data-target="#"><i class="fa fa-user-md"></i>Indurstry Oriented Training</a></li>
                                                                                    <li  data-id="489" data-level="3" data-xicon="fa fa-file-text"><a class="" href="summertrainning.do" data-target="#"><i class="fa fa-file-text"></i>Summer Training 2014</a></li>
                                                                                    <li  data-id="491" data-level="3" data-xicon="fa fa-list-alt"><a class="" href="wintertrainning.do" data-target="#"><i class="fa fa-list-alt"></i>Winter Training 2014-2015</a></li>
                                                                                    <li  data-id="490" data-level="3" data-xicon="fa fa-link"><a class="" href="internship.do" data-target="#"><i class="fa fa-link"></i>Internship</a></li>
                                                                                </ul>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-xs-3 mega-col-nav" data-width="3">
                                                <div class="mega-inner">
                                                    <ul class="mega-nav level1">
                                                        <li class="mega mega-group" data-id="585" data-level="2" data-group="1"> <a class=" dropdown-header mega-group-title" href="#" data-target="#">Training</a>
                                                            <div class="nav-child mega-group-ct"  >
                                                                <div class="mega-dropdown-inner">
                                                                    <div class="row">
                                                                        <div class="col-xs-12 mega-col-nav" data-width="12">
                                                                            <div class="mega-inner">
                                                                                <ul class="mega-nav level2">
                                                                                    <li  data-id="495" data-level="3" data-xicon="fa fa-users"><a class="" href="onjob-javaj2ee.do"   data-target="#"><i class="fa fa-users"></i>On-Job Training</a></li>
                                                                                    <li  data-id="494" data-level="3" data-xicon="fa fa-search"><a class="" href="projectguide.do"   data-target="#"><i class="fa fa-search"></i>Guidance on project</a></li>
                                                                                    <li  data-id="493" data-level="3" data xicon="fa fa-search"><a class="" href="corporatehrtraining.do" data-target="#"><i class="fa fa-search"></i>corporate hr training</a></li>
                                                                                </ul>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-xs-3 mega-col-module no-padding" data-width="3" data-position="138" data-class="no-padding">
                                                <div class="mega-inner">
                                                    <div class="t3-module module " id="Mod138">
                                                        <div class="module-inner">
                                                            <div class="module-ct">
                                                                <div class="bannergroup">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="dropdown mega mega-align-justify" data-id="627" data-level="1" data-alignsub="justify"> <a class="dropdown-toggle" href="#" data-target="#" data-toggle="dropdown">Courses<b class="caret"></b></a>
                                <div class="nav-child dropdown-menu mega-dropdown-menu full-menu col-xs-12" data-class="full-menu">
                                    <div class="mega-dropdown-inner">
                                        <div class="row">
                                            <div class="col-xs-3 mega-col-module left-menu" data-width="3" data-position="120" data-class="left-menu">
                                                <div class="mega-inner">
                                                    <div class="t3-module module " id="Mod120">
                                                        <div class="module-inner">
                                                            <h3 class="module-title "><span>Courses</span></h3>
                                                            <div class="module-ct">
                                                                <div class="custom"  >
                                                                    <p style="color: #fff;">PCS Academy provides several useful courses..</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-3 mega-col-nav" data-width="3">
                                                <div class="mega-inner">
                                                    <ul class="mega-nav level1">
                                                        <li class="mega mega-group" data-id="579" data-level="2" data-group="1"><a class=" dropdown-header mega-group-title" href="" data-target="#">Courses</a>
                                                            <div class="nav-child mega-group-ct"  >
                                                                <div class="mega-dropdown-inner">
                                                                    <div class="row">
                                                                        <div class="col-xs-12 mega-col-nav" data-width="12">
                                                                            <div class="mega-inner">
                                                                                <ul class="mega-nav level2">
                                                                                    <li  data-id="559" data-level="3"><a class="" href="crystalreport.do" data-target="#">Crystal Report Business Object</a></li>
                                                                                    <li  data-id="581" data-level="3"><a class="" href="windowsmobileapp.do" data-target="#">Wnidows Mobile Application</a></li>
                                                                                    <li  data-id="628" data-level="3"><a class="" href="mvcarchitecture.do" data-target="#">MVC Architecture</a></li>
                                                                                    <li  data-id="629" data-level="3"><a class="" href="javaj2ee.do" data-target="#">Java/J2EE</a></li>
                                                                                    <li  data-id="630" data-level="3"><a class="" href="aspnet.do" data-target="#">ASP.Net using C#</a></li>
                                                                                </ul>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-xs-3 mega-col-nav" data-width="3">
                                                <div class="mega-inner">
                                                    <ul class="mega-nav level1">
                                                        <li class="mega mega-group" data-id="622" data-level="2" data-group="1"> <a class=" dropdown-header mega-group-title" href="#" data-target="#">Courses</a>
                                                            <div class="nav-child mega-group-ct"  >
                                                                <div class="mega-dropdown-inner">
                                                                    <div class="row">
                                                                        <div class="col-xs-12 mega-col-nav" data-width="12">
                                                                            <div class="mega-inner">
                                                                                <ul class="mega-nav level2">
                                                                                    <li data-id="631" data-level="3"><a class="" href="php.do" data-target="#">PHP/MySQL</a></li>
                                                                                    <li data-id="623" data-level="3"><a class="" href="android.do" data-target="#">Android</a></li>
                                                                                    <li data-id="623" data-level="3"><a class="" href="cloudcomputing.do" data-target="#">Cloud Computing</a></li>
                                                                                    <li data-id="623" data-level="3"><a class="" href="ethicalhacking.do" data-target="#">Ethical Hacking</a></li>
                                                                                    <li data-id="623" data-level="3"><a class="" href="bigdata.do" data-target="#">BigData</a></li>
                                                                                </ul>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-xs-3 mega-col-nav" data-width="3">
                                                <div class="mega-inner">
                                                    <ul class="mega-nav level1">
                                                        <li class="mega mega-group" data-id="621" data-level="2" data-group="1"> <a class=" dropdown-header mega-group-title" href="#" data-target="#">Courses</a>
                                                            <div class="nav-child mega-group-ct"  >
                                                                <div class="mega-dropdown-inner">
                                                                    <div class="row">
                                                                        <div class="col-xs-12 mega-col-nav" data-width="12">
                                                                            <div class="mega-inner">
                                                                                <ul class="mega-nav level2">                                                                                 
                                                                                    <li data-id="624" data-level="3"><a class="" href="webdesign.do" data-target="#">Web Designing</a></li>
                                                                                    <li data-id="625" data-level="3"><a class="" href="testing.do" data-target="#">Testing</a></li>
                                                                                    <li data-id="626" data-level="3"><a class="" href="dba.do" data-target="#">DBA</a></li>
                                                                                    <li data-id="496" data-level="3"><a class="" href="softskils.do" data-target="#">Soft Skills</a></li>
                                                                                </ul>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li data-id="512" data-level="1">
                            <%
                                if (session.getAttribute("ALLSTUDENTDATA") != null) {
                            %>
                            <a class="" href="student-profile.do" data-target="#">Profile</a>

                            <%
                            } else {
                            %>
                            <a class="" href="studentRegnBeforeAdmsn.do" data-target="#">Registration</a>
                            <%
                                }
                            %>
                        </li>
                        <li data-id="512" data-level="1"><a class="" href="contactus.do" data-target="#">Contact Us</a></li>
                        <li data-id="512" data-level="1"><a class="" href="faq.do" data-target="#">FAQ</a></li>
                    </ul>
                </div>
            </nav>
            <!-- //NAVBAR MAIN --> 
        </div>
    </div>
</header>
<!-- //MAIN NAVIGATION --> 


<!-- SLIDESHOW --> 
<!-- .rs-wrapper start -->
<div class="rs-wrapper">
    <div class="fullwidthbanner-container">
        <div class="fullwidthbanner tp-simpleresponsive" style="height:420px;" >
            <ul style="display: block;">
                <li data-transition=" slotzoom-horizontal" data-slotamount="10" style="visibility: visible; left: 0px; top: 0px; z-index: 20; opacity: 1;">
                    <div class="slotholder"><img src="images/slide11.jpg" alt="background" class="defaultimg" style="width: 90%; height: 413px; position: absolute; left: -327.5px; top: 0px; opacity: 1;"></div>
                    <div class="caption lfl regular_title tp-caption start" data-x="335" data-y="90" data-speed="700" data-start="2000" data-easing="easeOutBack" style="font-size: 30px; padding: 3px 5px; margin: 0px; border: 0px; line-height: 32px; white-space: nowrap; opacity: 1; left: 497.5px; top: 90px; -webkit-transform: scale(1, 1) rotate(0deg); visibility: visible;">PCS Cloud Academy</div>
                    <div class="caption lfr regular_subtitle tp-caption start" data-x="390" data-y="160" data-speed="700" data-start="2400" data-easing="easeOutBack" style="font-size: 18px; padding: 7px 15px 7px 25px; margin: 0px; border: 0px; line-height: 15px; white-space: nowrap; opacity: 1; left: 540.7067749521684px; top: 160px; -webkit-transform: scale(1, 1) rotate(0deg); visibility: visible;">Total Quality Education</div>
                    <div class="caption lfr regular_subtitle tp-caption start" data-x="390" data-y="202" data-speed="700" data-start="2900" data-easing="easeOutBack" style="font-size: 18px; padding: 7px 15px 7px 25px; margin: 0px; border: 0px; line-height: 15px; white-space: nowrap; opacity: 1; left: 605.6708861773541px; top: 202px; -webkit-transform: scale(1, 1) rotate(0deg); visibility: visible;">Student Centric Approach</div>
                    <div class="caption lfr regular_subtitle tp-caption start" data-x="390" data-y="242" data-speed="700" data-start="3200" data-easing="easeOutBack" style="font-size: 18px; padding: 7px 15px 7px 25px; margin: 0px; border: 0px; line-height: 15px; white-space: nowrap; opacity: 1; left: 1280px; top: 242px; -webkit-transform: scale(1, 1) rotate(0deg); visibility: visible;">Collaborative Platform</div>
                </li>
                <li data-transition="3dcurtain-horizontal " data-slotamount="10" style="visibility: visible; left: 0px; top: 0px; z-index: 20; opacity: 1;">
                    <div class="slotholder"><img src="images/slide14.jpg" alt="background" class="defaultimg" style="width: 90%; height: 413px; position: absolute; left: -327.5px; top: 0px; opacity: 1;"></div>
                    <div class="caption lfl regular_title tp-caption start" data-x="335" data-y="90" data-speed="700" data-start="2000" data-easing="easeOutBack" style="font-size: 30px; padding: 3px 5px; margin: 0px; border: 0px; line-height: 32px; white-space: nowrap; opacity: 1; left: 497.5px; top: 90px; -webkit-transform: scale(1, 1) rotate(0deg); visibility: visible;">PCS Cloud Academy</div>
                    <div class="caption lfr regular_subtitle tp-caption start" data-x="390" data-y="160" data-speed="700" data-start="2400" data-easing="easeOutBack" style="font-size: 18px; padding: 7px 15px 7px 25px; margin: 0px; border: 0px; line-height: 15px; white-space: nowrap; opacity: 1; left: 540.7067749521684px; top: 160px; -webkit-transform: scale(1, 1) rotate(0deg); visibility: visible;">Industry Oriented Training</div>
                    <div class="caption lfr regular_subtitle tp-caption start" data-x="390" data-y="202" data-speed="700" data-start="2900" data-easing="easeOutBack" style="font-size: 18px; padding: 7px 15px 7px 25px; margin: 0px; border: 0px; line-height: 15px; white-space: nowrap; opacity: 1; left: 605.6708861773541px; top: 202px; -webkit-transform: scale(1, 1) rotate(0deg); visibility: visible;">Faculty Interaction</div>
                    <div class="caption lfr regular_subtitle tp-caption start" data-x="390" data-y="242" data-speed="700" data-start="3200" data-easing="easeOutBack" style="font-size: 18px; padding: 7px 15px 7px 25px; margin: 0px; border: 0px; line-height: 15px; white-space: nowrap; opacity: 1; left: 1280px; top: 242px; -webkit-transform: scale(1, 1) rotate(0deg); visibility: visible;">Flexibility and Affordability</div>
                </li>
                <li data-transition="  3dcurverticaltain-vertical" data-slotamount="10" style="visibility: visible; left: 0px; top: 0px; z-index: 18; opacity: 1;">
                    <div class="slotholder"><img src="images/slide12.jpg" alt="background" class="defaultimg" style="width: 90%; height: 413px; position: absolute; left: -327.5px; top: 0px; opacity: 0;"></div>
                    <div class="caption lfl regular_title3 tp-caption start" data-x="0" data-y="90" data-speed="700" data-start="2000" data-easing="easeOutBack" style="left: -457px; font-size: 30px; padding: 3px 5px; margin: 0px; border: 0px; line-height: 32px; white-space: nowrap; opacity: 1; top: 90px; -webkit-transform: scale(1, 1) rotate(0deg); visibility: visible;">PCS Cloud Academy</div>
                    <div class="caption lfr regular_subtitle tp-caption start" data-x="48" data-y="160" data-speed="700" data-start="2400" data-easing="easeOutBack" style="left: 1285px; font-size: 18px; padding: 7px 15px 7px 25px; margin: 0px; border: 0px; line-height: 15px; white-space: nowrap; opacity: 1; top: 160px; -webkit-transform: scale(1, 1) rotate(0deg); visibility: visible;">Dedicated Academic Support</div>
                    <div class="caption lfr regular_subtitle tp-caption start" data-x="48" data-y="202" data-speed="700" data-start="2900" data-easing="easeOutBack" style="left: 1285px; font-size: 18px; padding: 7px 15px 7px 25px; margin: 0px; border: 0px; line-height: 15px; white-space: nowrap; opacity: 1; top: 202px; -webkit-transform: scale(1, 1) rotate(0deg); visibility: visible;">IT Solutions</div>
                    <div class="caption lfr regular_subtitle tp-caption start" data-x="48" data-y="242" data-speed="700" data-start="3200" data-easing="easeOutBack" style="left: 1285px; font-size: 18px; padding: 7px 15px 7px 25px; margin: 0px; border: 0px; line-height: 15px; white-space: nowrap; opacity: 1; top: 242px; -webkit-transform: scale(1, 1) rotate(0deg); visibility: visible;">Experienced Faculty</div>
                </li>
                 <li data-transition="3dcurtain-horizontal " data-slotamount="10" style="visibility: visible; left: 0px; top: 0px; z-index: 20; opacity: 1;">
                    <div class="slotholder"><img src="images/slide15.jpg" alt="background" class="defaultimg" style="width: 90%; height: 413px; position: absolute; left: -327.5px; top: 0px; opacity: 1;"></div>
                    <div class="caption lfl regular_title tp-caption start" data-x="335" data-y="90" data-speed="700" data-start="2000" data-easing="easeOutBack" style="font-size: 30px; padding: 3px 5px; margin: 0px; border: 0px; line-height: 32px; white-space: nowrap; opacity: 1; left: 497.5px; top: 90px; -webkit-transform: scale(1, 1) rotate(0deg); visibility: visible;">Course Offered</div>
                    <div class="caption lfr regular_subtitle tp-caption start" data-x="390" data-y="160" data-speed="700" data-start="2400" data-easing="easeOutBack" style="font-size: 18px; padding: 7px 15px 7px 25px; margin: 0px; border: 0px; line-height: 15px; white-space: nowrap; opacity: 1; left: 540.7067749521684px; top: 160px; -webkit-transform: scale(1, 1) rotate(0deg); visibility: visible;">Java/J2EE</div>
                    <div class="caption lfr regular_subtitle tp-caption start" data-x="390" data-y="202" data-speed="700" data-start="2900" data-easing="easeOutBack" style="font-size: 18px; padding: 7px 15px 7px 25px; margin: 0px; border: 0px; line-height: 15px; white-space: nowrap; opacity: 1; left: 605.6708861773541px; top: 202px; -webkit-transform: scale(1, 1) rotate(0deg); visibility: visible;">Big Data & Hadoop</div>
                    <div class="caption lfr regular_subtitle tp-caption start" data-x="390" data-y="242" data-speed="700" data-start="3200" data-easing="easeOutBack" style="font-size: 18px; padding: 7px 15px 7px 25px; margin: 0px; border: 0px; line-height: 15px; white-space: nowrap; opacity: 1; left: 1280px; top: 242px; -webkit-transform: scale(1, 1) rotate(0deg); visibility: visible;">Android</div>
                  
                </li>
                
            </ul>
            <div class="tp-loader" style="display: none;"></div>
            <div class="tp-bannertimer" style="visibility: hidden; width: 47.37612107623318%; overflow: hidden;"></div>
        </div>
        <div style="visibility: visible; position: absolute; left: 0px; top: 231px; opacity: 0;" class="tp-leftarrow tparrows round large"></div>
        <div style="visibility: visible; position: absolute; left: 1216px; top: 231px; opacity: 0;" class="tp-rightarrow tparrows round large"></div>
    </div>
</div>
<!-- .rs-wrapper end --> 
<!-- //SLIDESHOW -->
