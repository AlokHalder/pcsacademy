
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<%@taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>

<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <script type="text/javascript">
            function showCourseWRTCategoryId() {
                var xmlhttp;
                var trainingCategoryId = document.getElementById("trainingCategoryId").value;

                if (trainingCategoryId == "")//Check if a trainingCategoryId is not selected
                {
                    document.getElementById("trainingCourseAjax").innerHTML = "";
                    document.getElementById("facultyAjax").innerHTML = "";
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
                        document.getElementById("facultyAjax").innerHTML = "";
                    }
                    else {
                        document.getElementById("trainingCourseAjaxLoader").innerHTML = "<img src='images/ajaxl_loader_small.gif' width='17' height='17'>";
                    }
                }

                xmlhttp.open("GET", "jsp/admin/show-course-ajax.jsp?tcid=" + trainingCategoryId, true);
                xmlhttp.send();
            }


            function showFacultyWRTCourseId() {
                var xmlhttp;
                var trainingCourseId = document.getElementById("trainingCourseId").value;

                if (trainingCourseId == "")//Check if a trainingCategoryId is not selected
                {
                    document.getElementById("facultyAjax").innerHTML = "";
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
                        document.getElementById("facultyAjax").innerHTML = xmlhttp.responseText;
                        document.getElementById("facultyAjaxLoader").innerHTML = "";
                    }
                    else {
                        document.getElementById("facultyAjaxLoader").innerHTML = "<img src='images/ajaxl_loader_small.gif' width='17' height='17'>";
                    }
                }

                xmlhttp.open("GET", "jsp/admin/show-faculty-ajax.jsp?tcoid=" + trainingCourseId, true);
                xmlhttp.send();

            }


            function clearDefaultStartTime(bt) {
                if (document.getElementById(bt).value == "00:00") {
                    document.getElementById(bt).value = "";
                }
            }
            function showDefaultStartTime(bt) {
                if (document.getElementById(bt).value == "") {
                    document.getElementById(bt).value = "00:00";
                }
            }


            function checkBatch() {
                var trainingCategoryId = document.getElementById("trainingCategoryId").value;
                var trainingCourseId = document.getElementById("trainingCourseId").value;
                var facultyId = document.getElementById("facultyId").value;
                var batchStartTime = document.getElementById("batchStartTime").value;
                var batchEndTime = document.getElementById("batchEndTime").value;
                var roomNo = document.getElementById("roomNo").value;

                if (trainingCategoryId == "" || trainingCategoryId == null) {
                    alert("Select Category!");
                    return false;
                }
                if (trainingCourseId == "" || trainingCourseId == null) {
                    alert("Select Course!");
                    return false;
                }
                if (facultyId == "" || facultyId == null) {
                    alert("Select Faculty!");
                    return false;
                }
                if (batchStartTime == "" || batchStartTime == null || batchStartTime == "00:00") {
                    alert("Enter batch start time!");
                    return false;
                }
                if (batchEndTime == "" || batchEndTime == null || batchEndTime == "00:00") {
                    alert("Enter batch end time!");
                    return false;
                }
                if (roomNo == "" || roomNo == null) {
                    alert("Select room!");
                    return false;
                }
            }
        </script>
    </head>



    <body>
    <center>
        <p><h2>Available Batch:</h2></p>
    <table border="1">
        <tr>
            <td align="center">Batch Id</td>
            <td align="center">Category</td>
            <td align="center">Course</td>
            <td align="center">Faculty</td>
            <td align="center">Date Schedule</td>
            <td align="center">Start Time</td>
            <td align="center">End Time</td>
            <td align="center">Room No.</td>
            <td align="center">Creation Year</td>
        </tr>
        <logic:iterate name="ALLBATCH" id="ALLBATCH">
            <tr>
                <td align="center">
                    <bean:write name="ALLBATCH" property="batchId"/>
                </td>
                <td align="center">
                    <bean:write name="ALLBATCH" property="trainingCategoryName"/>
                </td>  
                <td align="center">
                    <bean:write name="ALLBATCH" property="trainingCourseName"/>
                </td>  
                <td>
                    <bean:write name="ALLBATCH" property="facultyName"/>
                </td>
                <td>
                    <bean:write name="ALLBATCH" property="dateSchedule2"/>
                </td>
                <td>
                    <bean:write name="ALLBATCH" property="batchStartTime"/><bean:write name="ALLBATCH" property="batchStartTimeFormat"/>
                </td>
                <td>
                    <bean:write name="ALLBATCH" property="batchEndTime"/><bean:write name="ALLBATCH" property="batchEndTimeFormat"/>
                </td>                       
                <td align="center">
                    <bean:write name="ALLBATCH" property="roomNo"/>
                </td>
                <td align="center">
                    <bean:write name="ALLBATCH" property="batchCreationYear"/>
                </td>
            </tr>
        </logic:iterate>
    </table>

    <br />

    <p><h2>Add Batch:</h2></p>
    <html:form action="addTrainingBatch2" onsubmit="return checkBatch();">
    <table border="1">
        <tr>
            <td>Category:</td>
            <td>
                <html:select property="trainingCategoryId" styleId="trainingCategoryId" onchange="showCourseWRTCategoryId();" style="margin-left:3px;">
                    <html:option value="">Select</html:option>
                    <logic:iterate name="ALLTRAININGCATEGORY" id="ALLTRAININGCATEGORY">
                        <html:option value="${ALLTRAININGCATEGORY.trainingCategoryId}"><bean:write name="ALLTRAININGCATEGORY" property="trainingCategoryName" /></html:option>
                    </logic:iterate>
                </html:select>
            </td>
        </tr>
        <tr>
            <td>Course:</td>
            <td>
                <table>
                    <tr>
                        <td>
                            <html:select property="trainingCourseId" styleId="trainingCourseId" onchange="showFacultyWRTCourseId();">                               
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
    <td>Faculty:</td>
    <td>
        <table>
            <tr>
                <td>
                    <html:select property="facultyId" styleId="facultyId">
                <optgroup id="facultyAjax"></optgroup>
            </html:select> 
    </td>
    <td>
        <div id="facultyAjaxLoader"></div>
    </td>
</tr>
</table>
</td>
</tr>
<tr>
    <td>Date Schedule</td>
    <td>
        <html:multibox property="dateSchedule" value="Monday" />Monday
        <html:multibox property="dateSchedule" value="Tuesday" />Tuesday
        <html:multibox property="dateSchedule" value="Wednesday" />Wednesday
        <html:multibox property="dateSchedule" value="Thursday" />Thursday
        <html:multibox property="dateSchedule" value="Friday" />Friday
        <html:multibox property="dateSchedule" value="Saturday" />Saturday
        <html:multibox property="dateSchedule" value="Sunday" />Sunday
    </td>
</tr>
<tr>
    <td>Start Time</td>
    <td>
        <html:text property="batchStartTime" styleId="batchStartTime" value="00:00" style="margin-left:3px;" onfocus="clearDefaultStartTime('batchStartTime');" onblur="showDefaultStartTime('batchStartTime');"/>
        <html:select property="batchStartTimeFormat" styleId="batchStartTimeFormat">
            <html:option value="AM">AM</html:option>
            <html:option value="PM">PM</html:option>
        </html:select>
    </td>
</tr>
<tr>
    <td>End Time</td>
    <td>
        <html:text property="batchEndTime" styleId="batchEndTime" value="00:00" style="margin-left:3px;" onfocus="clearDefaultStartTime('batchEndTime');" onblur="showDefaultStartTime('batchEndTime');"/>
        <html:select property="batchEndTimeFormat" styleId="batchEndTimeFormat">
            <html:option value="AM">AM</html:option>
            <html:option value="PM">PM</html:option>
        </html:select>
    </td>
</tr>
<tr>
    <td>Room No.:</td>
    <td>
        <html:select property="roomNo" styleId="roomNo" style="margin-left:3px;">
            <html:option value="">Select</html:option>
            <html:option value="1">1</html:option>
            <html:option value="2">2</html:option>
            <html:option value="3">3</html:option>
            <html:option value="4">4</html:option>
            <html:option value="5">5</html:option>
            <html:option value="6">6</html:option>
            <html:option value="7">7</html:option>
            <html:option value="8">8</html:option>
        </html:select>
    </td>
</tr>
<tr>
    <td></td>
    <td><html:submit value="Create Batch" style="margin-left:2px;" /></td>
</tr>
</table>
</html:form>
${requestScope.ADD_BATCH_SUCCESS_MSG}
${requestScope.ADD_BATCH_FAIL_MSG}
</center>
</body>
</html>
