<%@taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@taglib uri="/WEB-INF/struts-bean.tld" prefix= "bean" %>
<%@taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<html>
    <head>
      
        <title>PcsAcademy</title>
        <!--<link href="css/main.css" rel="stylesheet" type="text/css" />-->
        <script language="javaScript" type="text/javascript" src="js/calendar.js"></script>
        <link href="css/calendar.css" rel="stylesheet" type="text/css">

        <script type="text/javascript">
            function showCourseWRTCategoryId() {
                var xmlhttp;
                var trainingCategoryId = document.getElementById("fcatid").value;


                if (trainingCategoryId == "")//Check if a trainingCategoryId is not selected
                {
                    document.getElementById("trainingCourseAjax1").innerHTML = "";
                    // document.getElementById("batchAjax").innerHTML = "";
                    return;
                }
                if (window.XMLHttpRequest)//Create an XMLHttpRequest object for IE7+, Firefox, Chrome, Opera, Safari
                {
                    xmlhttp = new XMLHttpRequest();
                }
                else//Create an XMLHttpRequest object for IE6, IE5
                {
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        document.getElementById("trainingCourseAjax1").innerHTML = xmlhttp.responseText;
                        document.getElementById("trainingCourseAjaxLoader1").innerHTML = "";
                        //document.getElementById("facultyAjax").innerHTML = "";
                    }
                    else {
                        document.getElementById("trainingCourseAjaxLoader1").innerHTML = "<img src='images/ajaxl_loader_small.gif' width='17' height='17'>";
                    }
                }

                xmlhttp.open("GET", "jsp/home/header/student/show-course-ajax.jsp?tcid=" + trainingCategoryId, true);
                xmlhttp.send();
            }

            function exd(str) {
                var exp1 = /^[A-Z a-z 0-9]+$/;
                if (str.match(exp1)) {
                    return false;
                }
                else
                    return true;
            }

            function validateDob() {
                var exp2 = document.getElementById("dob").value;
                if (exd(exp2)) {
                    return false;
                }
                else
                    return true;
            }
        </script>
        <script type="text/javascript">
            function showPaymentBank() {
                document.getElementById("pay_bank").style.display = 'block';
                document.getElementById("pay_cash").style.display = 'none';
                document.getElementById("pay_netbank").style.display = 'none';
            }
            function showPaymentNetBank() {
                document.getElementById("pay_bank").style.display = 'none';
                document.getElementById("pay_netbank").style.display = 'block';
                document.getElementById("pay_cash").style.display = 'none';
            }
            function showPaymentCash() {
                document.getElementById("pay_bank").style.display = 'none';
                document.getElementById("pay_netbank").style.display = 'none';
                document.getElementById("pay_cash").style.display = 'block';
            }
        </script>
        <script type="text/javascript">
            capimg = ['image/1.bmp', 'image/2.bmp', 'image/3.bmp', 'image/4.bmp', 'image/5.bmp', 'image/6.bmp', 'image/7.bmp', 'image/8.bmp', 'image/9.bmp', 'image/10.bmp', 'image/11.bmp', 'image/12.bmp'];
            capimgval = ['614176', '676309', '508964', '48L7M6', '42R417', '010BYB', '7XW75R', '462820','NT15HD' ,'RE4SIC',  'fusless', 'rearki'];

            function studentRegnBeforeAdmission() {
                var category = document.getElementById("fcatid").value;
                var course = document.getElementById("fcouid").value;

                var dob = document.getElementById("dob").value;
                var fname = document.getElementById("ffname").value;

                var lname = document.getElementById("flastName").value;
                var state = document.getElementById("fstate").value;
                var city = document.getElementById("fcity").value;
                var email = document.getElementById("ffmail").value;
                var mob = document.getElementById("fmob").value;
                var pass = document.getElementById("fpass").value;
                var cpass = document.getElementById("fcpass").value;

                var collegeState = document.getElementById("fcollegeState").value;
                var collegeCity = document.getElementById("fcollegeCity").value;
                var collegeName = document.getElementById("fcollegeName").value;
                var branch = document.getElementById("fbranch").value;
                var university = document.getElementById("funiversity").value;
                var persuingQualification = document.getElementById("fpersuingQualification").value;
                var semester = document.getElementById("fsemester").value;
                var howfindus = document.getElementById("fhowfindus").value;

                if (category == "" || category == null) {
                    alert("Please select Training Category");

                    return false;
                }
                if (course == "" || course == null) {
                    alert("Please Select Course");
                    return false;
                }


                if (dob == "" || dob == null) {
                    alert("Enter Date of Birth");
                    return false;
                }
                if (fname == "" || fname == null) {
                    alert("Enter First Name!");
                    return false;
                }
                if (lname == "" || lname == null) {
                    alert("Enter Last Name!");
                    return false;
                }
                if (state == "" || state == null) {
                    alert("Enter State!");
                    return false;
                }
                if (city == "" || city == null) {
                    alert("Enter City!");
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
                if (cpass != pass)
                {
                    alert("Pasword Mismatch!");
                    return false;
                }


                if (collegeState == "" || collegeState == null) {
                    alert("Enter College State!");
                    return false;
                }
                if (collegeCity == "" || collegeCity == null) {
                    alert("Enter Cololege City!");
                    return false;
                }
                if (collegeName == "" || collegeName == null) {
                    alert("Enter College Name!");
                    return false;
                }
                if (university == "" || university == null) {
                    alert("Enter University!");
                    return false;
                }
                if (branch == "" || branch == null) {
                    alert("Enter Your Stream!");
                    return false;
                }
                if (persuingQualification == "" || persuingQualification == null) {
                    alert("Enter Quallification!");
                    return false;
                }
                if (semester == "" || semester == null) {
                    alert("Enter Your Semester!");
                    return false;
                }
                if (howfindus == "" || howfindus == null) {
                    alert("Enter How you found us!");
                    return false;
                }

                var capimg2 = document.getElementById("capimg2").getAttribute("src");//retreive absolute path of image
                //alert(capimg2);
                var cc = capimg.indexOf(capimg2);
                //alert(cc);
                var civ = capimgval[cc];//original value of captcha 
                //alert(civ);
                var civ2 = document.getElementById("recaptcha").value;//value of captcha entered by user
                if (civ != civ2) {
                    alert('Wrong verification code!');
                    document.getElementById("recaptcha").value = "";
                    return false;
                }

                if (document.getElementById("termsAndConditions").checked == false) {
                    alert("Agree with all Terms & Conditions!");
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

            function refreshCaptcha() {
                var r = Math.round(Math.random() * 11);//as no. of images are 12, hence we multiplied by 11 
                //alert(r);
                var civ3 = capimg[r];
                document.getElementById("capimg2").setAttribute("src", civ3);
            }
        </script>
        <style type="text/css">
            #pay_bank, #pay_cash, #pay_netbank{
                display: none;
            }
            fieldset{ margin: 0px; padding: 0px; border: none;}
        </style>
    </head>





    <body>
        <div class="wrapper">
            <div class="clearfix"></div>
            <div class="company_profile">
                <h1 style="margin-top: 0px;">Registration</h1>
                <div class="para">
                    Fields marked with <span class="required_star">*</span> are mandatory<p />
                    <html:form action="studentRegnBeforeAdmsn2" onsubmit="return studentRegnBeforeAdmission();">
                        <div class="Program_Details">
                            <h1><span>Program Details</span></h1> 
                            <div class="clearfix"></div>
                            <div class="Training1">
                                <div class="Training_in2 ">
                                    <div class="Training_text12"> Training Category<span class="required_star">*</span></div>
                                    <div class="filed1">

                                        <html:select property="trainingCategoryId" styleClass="filed21" styleId="fcatid" onchange="showCourseWRTCategoryId();">
                                            <html:option value="">------------Select Any One--------</html:option>
                                            <logic:present name="ALLTRAININGCATEGORY">
                                                <logic:iterate name="ALLTRAININGCATEGORY" id="ALLTRAININGCATEGORY">
                                                    <html:option value="${ALLTRAININGCATEGORY.trainingCategoryId}"><bean:write name="ALLTRAININGCATEGORY" property="trainingCategoryName" /></html:option>
                                                </logic:iterate>
                                            </logic:present>
                                        </html:select> 
                                    </div>
                                </div>
                            </div>
                            <div class="Training1">
                                <div class="Training_in2 ">
                                    <div class="Training_text12">Course<span class="required_star">*</span></div>
                                    
                                   
                                    <div class="filed1">

                                        <html:select property="trainingCourseId" styleClass="filed21"  styleId="fcouid">                               
                                            <optgroup id="trainingCourseAjax1"></optgroup>
                                        </html:select>
                                        <span id="trainingCourseAjaxLoader1" style="margin-left: 430px; margin-top:-45px;"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>


                        <div class="Program_Details" style="margin-top: 15px;">
                            <h1><span>Personal Details</span></h1> 
                            <div>
                                <div class="Personal_Details_left ">
                                    <div class="Training_in1 clearfix ">
                                        <div class="Training_text1">Salutation<span class="required_star">*</span></div>
                                        <div class="filed1">
                                            <html:select property="salutation" styleId="fsalut" >
                                                <html:option value="Mr.">Mr.</html:option>
                                                <html:option value="Mrs.">Mrs.</html:option>
                                                <html:option value="Miss">Miss</html:option>
                                            </html:select>
                                        </div>
                                    </div>
                                    <div class="Training_in1 ">
                                        <div class="Training_text1">First Name<span class="required_star">*</span></div>
                                        <div class="filed1">
                                            <html:text property="firstName"  styleId="ffname" />
                                        </div>
                                    </div>

                                    <div class="Training_in1 ">
                                        <div class="Training_text1">State<span class="required_star">*</span></div>
                                        <div class="filed1">
                                            <html:text property="state"  styleClass="filed21" styleId="fstate" />
                                        </div>
                                    </div>
                                    <div class="Training_in1 ">
                                        <div class="Training_text1">Email Id<span class="required_star">*</span></div>
                                        <div class="filed1">
                                            <html:text property="emailId" styleClass="filed21" styleId="ffmail" />
                                        </div>
                                    </div>
                                    <div class="Training_in1 ">
                                        <div class="Training_text1">Password<span class="required_star">*</span></div>
                                        <div class="filed1">
                                            <html:password property="password" styleId="fpass" styleClass="filed21" />
                                        </div>
                                    </div>
                                </div>

                                <div class="Personal_Details_right">
                                    <div class="Training_in1">
                                        <div class="Training_text1">Date of Birth<span class="required_star">*</span></div>
                                        <div class="sv" style="" >
                                            <html:text property="dob" styleId="dob" style="float: left;" onkeypress="return validateDob();" />

                                            <a href="javascript:void(0);" style="float: left;" onClick="setYears(1947, 2020);
                                                    showCalender(this, 'dob');"><img src="calender.png"></a>
                                            <!-- Calender Script  -->
                                            <table id="calenderTable" class="calt">
                                                <tbody id="calenderTableHead">
                                                    <tr>
                                                        <td colspan="4" align="center">
                                                            <select onChange="showCalenderBody(createCalender(document.getElementById('selectYear').value, this.selectedIndex, false));" id="selectMonth">
                                                                <option value="0">Jan</option>
                                                                <option value="1">Feb</option>
                                                                <option value="2">Mar</option>
                                                                <option value="3">Apr</option>
                                                                <option value="4">May</option>
                                                                <option value="5">Jun</option>
                                                                <option value="6">Jul</option>
                                                                <option value="7">Aug</option>
                                                                <option value="8">Sep</option>
                                                                <option value="9">Oct</option>
                                                                <option value="10">Nov</option>
                                                                <option value="11">Dec</option>
                                                            </select>
                                                        </td>
                                                        <td colspan="2" align="center">
                                                            <select onChange="showCalenderBody(createCalender(this.value, document.getElementById('selectMonth').selectedIndex, false));" id="selectYear">
                                                            </select>
                                                        </td>
                                                        <td style="text-align: center; padding-top: 5px;" align="center">
                                                            <a href="#" onClick="closeCalender();"><font color="#003333" size="+1">X</font></a>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                                <tbody id="calenderTableDays">
                                                    <tr style="">
                                                        <td>Sun</td><td>Mon</td><td>Tue</td><td>Wed</td><td>Thu</td><td>Fri</td><td>Sat</td>
                                                    </tr>
                                                </tbody>
                                                <tbody id="calender"></tbody>
                                            </table>
                                            <!-- End Calender Script  -->
                                        </div>
                                    </div>
                                    <div class="Training_in1 ">
                                        <div class="Training_text1">Last Name</div>
                                        <div>
                                            <html:text property="lastName" styleId="flastName" styleClass="filed1" />
                                        </div>
                                    </div>
                                    <div class="Training_in1 ">
                                        <div class="Training_text1">City<span class="required_star">*</span></div>
                                        <div class="filed12">
                                            <html:text property="city" styleId="fcity" styleClass="filed1" />
                                        </div>
                                    </div>
                                    <div class="Training_in1 ">
                                        <div class="Training_text1">Mobile No.<span class="required_star">*</span></div>
                                        <div class="filed12">
                                            <html:text property="mobile" styleId="fmob" styleClass="filed1" />
                                        </div>
                                    </div>
                                    <div class="Training_in1 ">
                                        <div class="Training_text1">Confirm Password<span class="required_star">*</span></div>
                                        <div class="filed12">
                                            <input type="password" name="confirmpass" id="fcpass" Class="filed1" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>


                        <div class="Program_Details" style="margin-top: 15px;">
                            <h1><span>Academic Details</span></h1> 
                            <div class="Personal_Details_left">
                                <div class="Training_in1 ">
                                    <div class="Training_text1">State<span class="required_star">*</span></div>
                                    <div class="filed12">
                                        <html:text property="collegeState" styleId="fcollegeState" styleClass="filed1" />
                                    </div>
                                </div>
                                <div class="Training_in1 ">
                                    <div class="Training_text1">College<span class="required_star">*</span></div>
                                    <div class="filed12">
                                        <html:text property="collegeName" styleId="fcollegeName" styleClass="filed1" />
                                    </div>
                                </div>
                                <div class="Training_in1  ">
                                    <div class="Training_text1">University<span class="required_star">*</span></div>
                                    <div class="filed12">
                                        <html:text property="university" styleId="funiversity" styleClass="filed1" />
                                    </div>
                                </div>
                                <div class="Training_in1 ">
                                    <div class="Training_text1">Persuing Qualification<span class="required_star">*</span></div>
                                    <div class="filed12">
                                        <html:text property="persuingQualification" styleId="fpersuingQualification" styleClass="filed1" />
                                    </div>
                                </div>
                                <div class="Training_in1 ">
                                    <div class="Training_text1">Current Semester<span class="required_star">*</span></div>
                                    <div class="filed12">
                                        <html:text property="semester" styleId="fsemester" styleClass="filed1" />
                                    </div>
                                </div>
                            </div>

                            <div class="Personal_Details_right">

                                <div class="Training_in1 ">
                                    <div class="Training_text1">City<span class="required_star">*</span></div>
                                    <div class="filed12">
                                        <html:text property="collegeCity" styleId="fcollegeCity" styleClass="filed1" />
                                    </div>
                                </div>

                                <div class="Training_in1 ">
                                    <div class="Training_text1">Branch<span class="required_star">*</span></div>
                                    <div class="filed12">
                                        <html:text property="branch" styleId="fbranch" styleClass="filed1" />
                                    </div>
                                </div>
                                <div class="Training_in1 ">
                                    <div class="Training_text1">Passing Year<span class="required_star">*</span></div>
                                    <div class="filed1">
                                        <html:select property="passingYear" style="">
                                            
                                            <html:option value="-1">Select</html:option>
                                             <html:option value="2018">2019</html:option>
                                            <html:option value="2018">2018</html:option>
                                            <html:option value="2017">2017</html:option>
                                            <html:option value="2016">2016</html:option>
                                            <html:option value="2015">2015</html:option>
                                            <html:option value="2014">2014</html:option>
                                            <html:option value="2013">2013</html:option>
                                            <html:option value="2012">2012</html:option>
                                            <html:option value="2011">2011</html:option>
                                        </html:select>
                                    </div>
                                </div>


                                <div class="Training_in1 ">
                                    <div class="Training_text1">
                                        How did you find us?</div>
                                    <div><html:text property="howfindus" styleId="fhowfindus" styleClass="filed1" /></div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="Program_Details" style="margin-top: 15px;">
                            <h1><span>Payment Options</span></h1> 
                            <div class="clearfix"></div>
                            <div  style=" font-size: 13px; color: #666; width: 98%; margin:11px 10px 0px 9px; border-radius:10px; border: 1px solid #D3D3D3; line-height: 20px; font-style: italic;  text-align: justify;">
                                <P style=" margin: 10px 10px;">
                                    You can pay Rs.1000 in advance as registration charge(non refundable).To pay choose either of one Payment Options and complete your profile registration.
                                </p>
                            </div>

                            <div id="paid_payment_body" style=" margin-top: 10px;">
                                <div class="cpart">
                                    <table style=" float: left; background-color: #F0F0F0; height: 30px; width: 99%; margin-left: 5px; margin-top: 15px;">
                                        <tr style=" background-color: #F0F0F0; height: 30px; width: 100%;">
                                            <td style="width: 20px;" ><input type="radio" id="paymentMode1" name="paymentMode" value="directpay"  onclick="showPaymentBank();"/></td>
                                            <td style="color: #EF1C25; font-style: italic; font-weight: 500; ">Bank Payment</td>
                                            <td style="width: 20px;" ><input type="radio" id="paymentMode2" name="paymentMode" value="netbanking" style=" margin: 0px 0px 0px 0px" onclick="showPaymentNetBank();"/></td>
                                            <td style="color: #EF1C25; font-style: italic; font-weight: 500; ">Net Banking</td>
                                            <td style="width: 20px;" ><input type="radio" id="paymentMode3" name="paymentMode" value="cash" style=" margin: 0px 0px 0px 0px" onclick="showPaymentCash();"/></td>
                                            <td style="color: #EF1C25; font-style: italic; font-weight: 500; ">Cash Payment</td>
                                        </tr>
                                    </table>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="clearfix"></div>
                            </div>

                            <div id="pay_bank">
                                <div class="ourToutorWrapper" style="margin-top: 10px;">
                                    <div class="left_green_small">
                                        <h2> Direct Pay To Our Bank</h2>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="cpart">
                                        <div class="fieldNameWrapper" style="margin:10px 10px 0px 10px;">           
                                            <table>
                                                <tr>
                                                    <td vAlign="top">
                                                        <div class="welcomeText">
                                                            <div style="text-align:left; line-height:20px; width:100%;color:#606060;">
                                                                <div style="width:100%; ">

                                                                    <div style=" color: #606060;  font-style:italic;">
                                                                        <p>Deposit chq/cash in any of the following bank branches. Cheque should be drawn on the name of <font>Perennation Compu Solns Global Pvt.Ltd</font></p>
                                                                    </div>
                                                                    <table border="0" style="width: 100%">
                                                                        <tr>
                                                                            <td vAlign="top">

                                                                                <p class="style7" style="margin-top: 5px;"><font color="#800000">Account Name:</font><font color="#0099FF"> Perennation Compu Solns Global Pvt.Ltd</font>
                                                                                <p class="style9" style="margin-top: 0px; margin-bottom: 5px"><font color="#800000">Account Number:</font><font color="#0099FF">50200004856591</font></p>
                                                                                <p class="style9" style="margin-top: 0px; margin-bottom: 5px"><font color="#800000">Bank Name:</font><font color="#0099FF">HDFC Bank</font></p>
                                                                                <p style="text-align: justify; margin-top: 0px; margin-bottom: 5px;"><font color="#800000">IFSC Code:</font><font color="#0099FF">HDFC0001923</font></p>

                                                                                <p style="text-align: justify; margin-top:5px; margin-bottom:5px; ">


<!--                                                                                <p class="style7" style="margin-top: 12px;"><font color="#800000">Account Name:</font><font color="#0099FF">Perennation Compu Solns Global Pvt.Ltd </font>
                                                                                <p class="style9" style="margin-top: 5px; margin-bottom: 5px"><font color="#800000">Account Number:</font><font color="#0099FF">10161131000691</font></p>
                                                                                <p style="text-align: justify; margin-top: 5px; margin-bottom: 5px;"><font color="#800000">IFSC Code:</font><font color="#0099FF">ORBC0101016</font></p>-->

                                                                                <p style="text-align: justify; margin-top:5px; font-style:italic; ">
                                                                                <p style="font-style:italic;  color:#606060; font-style:italic;">Once you have made the payment please send us an email at
                                                                                    <a href="mailto:careers@pcsglobal.co">careers@pcsglobal.co</a> with bank payment details and contact <font color="#0099FF">+91-8697741613 </font> for further details.
                                                                                </p>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>

                                        </div>
                                        <div class=" clearfix"></div>
                                    </div>
                                </div>
                            </div>


                            <div id="pay_netbank">
                                <div class="ourToutorWrapper" style="margin-top: 10px;">
                                    <div class="left_green_small">
                                        <h2>Net Banking</h2>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="cpart">
                                        <div class="fieldNameWrapper" style="margin:10px 10px 0px 10px;">           
                                            <table>
                                                <tr>
                                                    <td vAlign="top">
                                                        <div class="welcomeText">
                                                            <div style="text-align:left; line-height:20px; width:100%;color:#606060;">
                                                                <div style="width:100%; ">

                                                                    <div style=" color: #606060;  font-style:italic;">
                                                                        <p>For Net Banking, please LOGIN to your own bank account and add The PCS Cloud Academy any of these following account number as beneficiary and transfer amount through RTGS/NEFT/IFSC<font> Perennation Compu Solns Global Pvt. Ltd</font></p>
                                                                    </div>
                                                                    <table border="0" style="width: 100%">
                                                                        <tr>
                                                                            <td vAlign="top">
                                                                                <p class="style7" style="margin-top: 5px;"><font color="#800000">Bank Name:</font><font color="#0099FF">HDFC Bank</font>
                                                                                <p class="style7" style="margin-top: 5px;"><font color="#800000">Account Name:</font> <font color="#0099FF">Perennation Compu Solns Global Pvt. Ltd</font>
                                                                                <p class="style9" style="margin-top: 0px; margin-bottom: 5px"><font color="#800000">Account Number:</font><font color="#0099FF">50200004856591</font></p>
                                                                                <p style="text-align: justify; margin-top: 0px; margin-bottom: 5px;"><font color="#800000">IFSC Code:</font><font color="#0099FF">HDFC0001923</font></p>

                                                                                <p style="text-align: justify; margin-top:5px; margin-bottom:5px; ">


<!--                                                                                <p class="style7" style="margin-top: 5px;"><font color="#800000">Bank Name:</font><font color="#0099FF">Oriental Bank Of Commerce</font>
                                                                                <p class="style7" style="margin-top: 12px;"><font color="#800000">Account Name:</font><font color="#0099FF">The Professional Tutors</font>
                                                                                <p class="style9" style="margin-top: 5px; margin-bottom: 5px"><font color="#800000">Account Number:</font><font color="#0099FF">10161131000691</font></p>
                                                                                <p style="text-align: justify; margin-top: 5px; margin-bottom: 5px;"><font color="#800000">IFSC Code:</font></strong><font color="#0099FF">ORBC0101016</font></p>-->

                                                                                <p style="text-align: justify; margin-top:5px;   font-style:italic; ">
                                                                                    Once you have transferred the amount please send us an email at <a href="mailto:careers@pcsglobal.co ">careers@pcsglobal.co</a> with your transaction details and contact <font color="#0099FF">+91-8697741613 </font>for further details.
                                                                                </p>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>

                                        </div>
                                        <div class=" clearfix"></div>
                                    </div>
                                </div>
                            </div>


                            <div id="pay_cash">
                                <div class="ourToutorWrapper" style=" margin-top:10px;">
                                    <div class="left_green_small">
                                        <h2>Pay By Cash</h2>
                                        <div class=" clearfix"></div>
                                    </div>
                                    <div class="cpart">
                                        <table>
                                            <tr>
                                                <td vAlign="top">
                                                    <div class="welcomeText">
                                                        <div style="text-align:left; line-height:20px;  width:100%;color:#606060;">
                                                            <div style="margin-left: 10px;">

                                                                <div>
                                                                    <p class="style7" style="margin-top: 0px; width:100%;  font-style:italic;">For Cash Payment you need to deposit directly to following office locations. At present payment by cash option only available for Kolkata location only.
                                                                </div>
                                                                <table border="0">
                                                                    <tr>
                                                                        <td vAlign="top">
                                                                            <p style="text-align: justify; margin-top:5px;  color: #1268c9;font-weight: bold;  font-style:italic;">
                                                                                The PCS Cloud Academy<br/>
                                                                                DN-51,Merlin Infinite, Salt Lake, Sec- V,Kol-91
                                                                            </p>                        
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>

                        <!-- Start Captcha-->
                        <div style="margin-top:10px;"><img src="image/1.bmp" id="capimg2" width="122" height="45" />
                            <img src="images/ref.jpg" onClick="return refreshCaptcha();" /></div>
                        <div style="margin:10px 0px;"><input type="text" name="recaptcha" id="recaptcha"/></div>
                        <!-- End Captcha-->

                        <p>
                            <input type="checkbox" name="termsAndConditions" id="termsAndConditions"><span class="required_star">*</span>I have accepted the terms and conditions
                        </p>
                        <html:submit value="Proceed" style="width:70px; height:30px; padding:0px 8px; background-color:#4899EB; color:#fff; border:1px solid #4899EB; border-radius:2px; line-height:20px;" />
                    </html:form>
                    <div class="clearfix"></div>
                </div>
            </div>
            <p />
        </div>
    </body>
</html>
