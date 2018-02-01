<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<%@taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>

<html>
    <head>
        <title>PcsAcademy</title>
        <script language="javaScript" type="text/javascript" src="js/calendar.js"></script>
        <link href="css/calendar-admin.css" rel="stylesheet" type="text/css">

        <script type="text/javascript">
            function showCourseWRTCategoryId() {
                var xmlhttp;
                var trainingCategoryId = document.getElementById("trainingCategoryId").value;

                if (trainingCategoryId == "")//Check if a trainingCategoryId is not selected
                {
                    document.getElementById("trainingCourseAjax").innerHTML = "";
                    document.getElementById("batchAjax").innerHTML = "";
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

                xmlhttp.open("GET", "jsp/admin/show-course-ajax.jsp?tcid=" + trainingCategoryId, true);
                xmlhttp.send();
            }


            function showBatchWRTCourseIdAndYear() {
                var xmlhttp;
                var trainingCourseId = document.getElementById("trainingCourseId").value;

                if (trainingCourseId == "")//Check if a trainingCategoryId is not selected
                {
                    document.getElementById("batchAjax").innerHTML = "";
                    //document.getElementById("facultyAjax").innerHTML = "";
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
                        document.getElementById("batchAjax").innerHTML = xmlhttp.responseText;
                        document.getElementById("batchAjaxLoader").innerHTML = "";
                    }
                    else {
                        document.getElementById("batchAjaxLoader").innerHTML = "<img src='images/ajaxl_loader_small.gif' width='17' height='17'>";
                    }
                }

                xmlhttp.open("GET", "jsp/admin/show-batch-ajax.jsp?trainingCourseId=" + trainingCourseId, true);
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

            function validate() {
                var exp2 = document.getElementById("dob").value;
                if (exd(exp2)) {
                    return false;
                }
                else
                    return true;
            }

            function studentRegnAfterAdmission() {
                var category = document.getElementById("trainingCategoryId").value;
                var course = document.getElementById("trainingCourseId").value;
                var batchId = document.getElementById("batchId").value;
                var dob = document.getElementById("dob").value;
                var fname = document.getElementById("firstName").value;
                var lname = document.getElementById("lastName").value;
                var state = document.getElementById("state").value;
                var city = document.getElementById("city").value;
                var email = document.getElementById("emailId").value;
                var mob = document.getElementById("mobile").value;
                var collegeName = document.getElementById("collegeName").value;
                var branch = document.getElementById("branch").value;
                var university = document.getElementById("university").value;
                var persuingQualification = document.getElementById("persuingQualification").value;
                var semester = document.getElementById("semester").value;
                var pass = document.getElementById("pass").value;
                var cpass = document.getElementById("cpass").value;
                if (category == "" || category == null) {
                    alert("Select Training Category!");
                    return false;
                }
                if (course == "" || course == null) {
                    alert("Select Course!");
                    return false;
                }
                if (batchId == "" || batchId == null) {
                    alert("Select Batch!");
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
                if (dob == "" || dob == null) {
                    alert("Enter Date of Birth!");
                    return false;
                }
                if (state == "" || state == null) {
                    alert("Select State!");
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
                if (collegeName == "" || collegeName == null) {
                    alert("Enter College Name!");
                    return false;
                }
                 if (branch == "" || branch == null) {
                    alert("Enter Branch Name!");
                    return false;
                }
                if (university == "" || university == null) {
                    alert("Enter University!");
                    return false;
                }
                if (persuingQualification == "" || persuingQualification == null) {
                    alert("Enter Quallification!");
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
            }
        </script>
    </head>



    <body>
    <center>
        <p><h2>Register Student after admission:</h2></p>
        <html:form action="addstudentdetails2" onsubmit="return studentRegnAfterAdmission();">
        <table border="1">
            <tr>
                <td>Training Category:</td>
                <td>
                    <html:select property="trainingCategoryId" styleId="trainingCategoryId" onchange="showCourseWRTCategoryId();" style="margin-left:3px;">
                        <html:option value="" styleClass="filed1">Select</html:option>
                        <logic:iterate name="ALLTRAININGCATEGORY" id="ALLTRAININGCATEGORY">
                            <html:option value="${ALLTRAININGCATEGORY.trainingCategoryId}"><bean:write name="ALLTRAININGCATEGORY" property="trainingCategoryName" /></html:option>
                        </logic:iterate>
                    </html:select> 
                </td>
            </tr>
            <tr>
                <td>Training Course:</td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <html:select property="trainingCourseId" styleId="trainingCourseId" onchange="showBatchWRTCourseIdAndYear();">                               
                            <optgroup id="trainingCourseAjax"></optgroup>
                        </html:select> 
                </td>
                <td>
                    <div id="trainingCourseAjaxLoader"></div>
                </td>
            </tr>
        </table>     
    </td>
</tr>
<tr>
    <td>Batch Id:</td>
    <td>
        <table>
            <tr>
                <td>
                    <html:select property="batchId" styleId="batchId">                               
                <optgroup id="batchAjax"></optgroup>
            </html:select> 
    </td>
    <td>
        <div id="batchAjaxLoader"></div>
    </td>
</tr>
</table>     
</td>
</tr>
<tr>
    <td>Salutation:</td>
    <td>
        <html:select property="salutation" styleClass="filed1" style="margin-left:3px;">
            <html:option value="Mr.">Mr.</html:option>
            <html:option value="Mrs.">Mrs.</html:option>
            <html:option value="Miss">Miss</html:option>
        </html:select>
    </td>
</tr>
<tr>
    <td>First Name:</td>
    <td>
        <html:text property="firstName" styleClass="filed1" styleId="firstName" style="margin-left:3px;" />
    </td>
</tr>
<tr>
    <td>Last Name:</td>
    <td>
        <html:text property="lastName" styleId="lastName" styleClass="filed1" style="margin-left:3px;" />
    </td>
</tr>
<tr>
    <td>Date of Birth:</td>
    <td>
        <html:text property="dob" styleId="dob" styleClass="filed1" onkeypress="return validate();" style="margin-left:3px;" />
    </td>
    <td>
        <!--<div>-->
        <a href="javascript:void(0);" onClick="setYears(1947, 2020);
                showCalender(this, 'dob');"><img src="calender.png"></a>
        <!-- Calender Script  -->
        <table id="calenderTable">
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
                    <td align="center">
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
        <!--</div>-->
    </td>
</tr>
<tr>
    <td>State:</td>
    <td>
        <%--<html:text property="state"  styleClass="filed1" styleId="state" />--%>
        <html:select property="state" styleClass="filed1" styleId="state" style="margin-left:3px;">
            <html:option value="">Select</html:option>
            <html:option value="Andhra Pradesh">Andhra Pradesh</html:option>
            <html:option value="Arunachal Pradesh">Arunachal Pradesh</html:option>
            <html:option value="Assam">Assam</html:option>
            <html:option value="Bihar">Bihar</html:option>
            <html:option value="Chandigarh">Chandigarh</html:option>
            <html:option value="Chhattisgarh">Chhattisgarh</html:option>
            <html:option value="Goa">Goa</html:option>
            <html:option value="Gujarat">Gujarat</html:option>
            <html:option value="Haryana">Haryana</html:option>
            <html:option value="West Bengal">West Bengal</html:option>
        </html:select>
    </td>
</tr>
<tr>
    <td>City:</td>
    <td> <html:text property="city" styleId="city" styleClass="filed1" style="margin-left:3px;" /></td>
</tr>
<tr>
    <td>Email Id:</td>
    <td>
        <html:text property="emailId" styleClass="filed1" styleId="emailId" style="margin-left:3px;" />
    </td>
</tr>
<tr>
    <td>Mobile:</td>
    <td>
        <html:text property="mobile" styleId="mobile" styleClass="filed1" style="margin-left:3px;" />
    </td>
</tr>
<tr>
    <td>College Name:</td>
    <td>
        <html:text property="collegeName" styleId="collegeName" styleClass="filed1" style="margin-left:3px;" />
    </td>
</tr>
<tr>
    <td>Branch:</td>
    <td>
        <html:text property="branch" styleId="branch" styleClass="filed1" style="margin-left:3px;" />
    </td>
</tr>
<tr>
    <td>University:</td>
    <td>
        <html:text property="university" styleId="university" styleClass="filed1" style="margin-left:3px;" />
    </td>
</tr>
<tr>
    <td>Pursuing Qualification:</td>
    <td>
        <html:text property="persuingQualification" styleId="persuingQualification" styleClass="filed1" style="margin-left:3px;" />
    </td>
</tr>
<tr>
    <td>Passing Year:</td>
    <td>
        <html:select property="passingYear" styleClass="filed1" style="margin-left:3px;">
            <html:option value="2015">2015</html:option>
            <html:option value="2014">2014</html:option>
            <html:option value="2013">2013</html:option>
            <html:option value="2012">2012</html:option>
            <html:option value="2011">2011</html:option>
        </html:select>
    </td>
</tr>
<tr>
    <td>Semester:</td>
    <td>
        <%--<html:text property="semester" styleId="semester" styleClass="filed1" />--%>
        <html:select property="semester" styleId="semester" styleClass="filed1" style="margin-left:3px;">
            <html:option value="8th">8th</html:option>
            <html:option value="7th">7th</html:option>
            <html:option value="6th">6th</html:option>
            <html:option value="5th">5th</html:option>
            <html:option value="4th">4th</html:option>
            <html:option value="3rd">3rd</html:option>
            <html:option value="2nd">2nd</html:option>
            <html:option value="1st">1st</html:option>
        </html:select>
    </td>
</tr>
<tr>
    <td>Password:</td>
    <td> 
        <html:password property="password" styleClass="filed1" styleId="pass" style="margin-left:3px;" />
    </td>
</tr>
<tr>
    <td>Confirm Password:</td>
    <td> 
        <html:password property="password" styleClass="filed1" styleId="cpass" style="margin-left:3px;" />
    </td>
</tr>
<tr>
    <td></td>
    <td>
        <html:submit value="Proceed" style="margin-left:3px;" />
    </td>
</tr>
</table>
</html:form>
</center>
<!--<br />-->
</body>
</html>
