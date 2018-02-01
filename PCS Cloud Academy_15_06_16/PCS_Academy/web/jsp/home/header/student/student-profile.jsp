<%@taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@taglib uri="/WEB-INF/struts-bean.tld" prefix= "bean" %>
<%@taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<html>
    <head>
<!--        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />-->
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
                xmlhttp.onreadystatechange = function ()
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
            capimgval = ['atiolon', 'bahsanod', 'perpertuar', 'kingedne', 'unticubr', 'dingerfer', 'sphaleg', 'volablumse', 'mationat', 'hypewsess', 'fusless', 'skunnesse'];

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
              <h2> Profile Page </h2>
            
        </div>
        </div>
        </body>
</html>
