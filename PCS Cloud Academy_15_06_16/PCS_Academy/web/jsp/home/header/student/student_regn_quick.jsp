<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<html>
    <head>
        <script type="text/javascript">
            function showCategoryNameId() {
                var xmlhttp;
                // var trainingCategoryId = document.getElementById("tcatid").value;

                //if (trainingCategoryId == "")//Check if a trainingCategoryId is not selected
                //  {
                //    document.getElementById("trainingCourseAjax").innerHTML = "";
                // document.getElementById("batchAjax").innerHTML = "";
                //    return;
                //}
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
                        document.getElementById("trainingCategoryAjax").innerHTML = xmlhttp.responseText;
                        /// document.getElementById("trainingCourseAjaxLoader").innerHTML = "";
                        //document.getElementById("facultyAjax").innerHTML = "";
                    }
                    //else {
                    //   document.getElementById("trainingCourseAjaxLoader").innerHTML = "<img src='images/ajaxl_loader_small.gif' width='17' height='17'>";
                    //}
                }

                xmlhttp.open("GET", "jsp/home/header/student/show-category-ajax.jsp", true);
                xmlhttp.send();
            }

            function showCourseWRTCategoryId1() {
                var xmlhttp;
                var trainingCategoryId = document.getElementById("qcatid").value;

                if (trainingCategoryId == "")//Check if a trainingCategoryId is not selected
                {
                    document.getElementById("trainingCourseAjax").innerHTML = "";
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
                        document.getElementById("trainingCourseAjax").innerHTML = xmlhttp.responseText;
                        document.getElementById("trainingCourseAjaxLoader").innerHTML = "";
                        //document.getElementById("facultyAjax").innerHTML = "";
                    }
                    else {
                        document.getElementById("trainingCourseAjaxLoader").innerHTML = "<img src='images/ajaxl_loader_small.gif' width='17' height='17'>";
                    }
                }

                xmlhttp.open("GET", "jsp/home/header/student/show-course-ajax.jsp?tcid=" + trainingCategoryId, true);
                xmlhttp.send();
            }

            function studentRegnBeforeAdmissionQuick() {
                var category = document.getElementById("qcatid").value;
                var course = document.getElementById("qcouid").value;
                var fname = document.getElementById("qname").value;
                var email = document.getElementById("qmail").value;
                var mob = document.getElementById("qmob").value;
                var pass = document.getElementById("qpass").value;
                var cpass = document.getElementById("qcpass").value;


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
                if (cpass != pass)
                {
                    alert("Pasword Mismatch!");
                    return false;
                }
                return true;

            }
        </script>
    </head>
    
    
    
    
    <body onload="showCategoryNameId();">
        <html:form action="studentRegnBeforeAdmsn2" onsubmit="return studentRegnBeforeAdmissionQuick();">
            <!--<form id="member-registration" action="#" method="post" class="form-validate">-->
            <input type="hidden" name="quick_reg" value="quick registration"/>
            <fieldset>
                <dl>
                    <dt>
                    <label title="" class="required" for="jform_username" id="jform_username-lbl">Category:</label>
                    <em> (*)</em> 
                    </dt>
                    <dd>
                        <html:select property="trainingCategoryId" styleClass="filed_quick21"  styleId="qcatid" onchange="showCourseWRTCategoryId1();">                               
                        <optgroup id="trainingCategoryAjax"></optgroup>
                    </html:select>
                    <!--<input type="text" size="30" class="validate-username required" value="" id="jform_username" name="jform[username]">-->
                    </dd>
                    <dt>
                    <label title="" class="required" for="jform_username" id="jform_username-lbl" style="margin-top: 12px;">Course:</label>
                    <em> (*)</em> 
                    </dt>
                    <dd>
                        <html:select property="trainingCourseId" styleClass="filed_quick21"  styleId="qcouid">                               
                        <optgroup id="trainingCourseAjax"></optgroup>
                    </html:select>
                    <span id="trainingCourseAjaxLoader" style="margin-left: 180px; float: right;"></span>
                    <!--<input type="text" size="30" class="validate-username required" value="" id="jform_username" name="jform[username]">-->
                    </dd>
                    <dt>
                    <label  class="required" for="jform_name" id="jform_name-lbl" style="margin-top: 12px;">Name:</label>
                    <em> (*)</em> 
                    </dt>
                    <dd>
                        <html:text property="firstName" styleId="qname" size="30" />
                        <!--<input type="text" size="30" class="required" value="" id="jform_name" name="jform[name]">-->
                    </dd>
                    <dt>
                    <label title="" class="required" for="jform_email1" id="jform_email1-lbl" >Email:</label>
                    <em> (*)</em> 
                    </dt>
                    <dd>
                        <html:text property="emailId" styleId="qmail" size="30"/>
                        <!--<input type="text" size="30" class="validate-email required" value="" id="jform_email1" name="jform[email1]">-->
                    </dd>
                    <dt>
                    <label title="" class="required" for="jform_email2" id="jform_email2-lbl">Mobile:</label>
                    <em> (*)</em> 
                    </dt>
                    <dd>
                        <html:text property="mobile" styleId="qmob" size="30" />
                        <!--<input type="text" size="30" class="validate-email required" value="" id="jform_email2" name="jform[email2]">-->
                    </dd>
                    <dt>
                    <label title="" class="required" for="jform_password1" id="jform_password1-lbl">Password:</label>
                    <em> (*)</em> 
                    </dt>
                    <dd>
                        <html:password property="password" styleId="qpass" size="30" />
                        <!--<input type="password" size="30" class="validate-password required" autocomplete="off" value="" id="jform_password1" name="jform[password1]">-->
                    </dd>
                    <dt>
                    <label title="" class="required" for="jform_password2" id="jform_password2-lbl">Confirm Password:</label>
                    <em> (*)</em> 
                    </dt>
                    <dd>
                        <input type="password" size="30" class="validate-password required" id="qcpass" name="qconfirmpass">
                    </dd>                                              
                </dl>
            </fieldset>
            <br/>
            <p>Fields marked with an asterisk (*) are required.</p>
            <html:submit value="Create an account" styleClass="validate btn" />
            <!--<button type="submit" class="validate btn">Create an account</button>-->
        </html:form></body>
</html>
<!--</form>-->