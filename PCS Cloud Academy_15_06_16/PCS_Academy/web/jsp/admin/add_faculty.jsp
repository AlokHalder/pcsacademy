<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<%@taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--<script type="text/javascript" src="js/admin.js" />-->
        <script type="text/javascript">
            function checkFaculty()
            {
                var techno = document.getElementById("facultyTechnology").value;
                var name = document.getElementById("facultyName").value;
                var email = document.getElementById("facultyEmail").value;
                var mobile = document.getElementById("facultyMobile").value;
                var address = document.getElementById("facultyAddress").value;
                var password = document.getElementById("facultyPassword").value;
                var conpassword = document.getElementById("facultyConfirmPassword").value;

                if (techno == "" || techno == null) {
                    alert("Choose Faculty Technology!");
                    return false;
                }
                if (name == "" || name == null) {
                    alert("Enter Faculty Name!");
                    return false;
                }

                if (email == "" || email == null) {
                    alert("Enter Faculty Email!");
                    return false;
                }
                if (mobile == "" || mobile == null) {
                    alert("Enter Faculty Mobile!");
                    return false;
                }
                if (address == "" || address == null) {
                    alert("Enter Faculty Address!");
                    return false;
                }
                if (password == "" || password == null) {
                    alert("Enter Password!");
                    return false;
                }
                if (conpassword == "" || conpassword == null) {
                    alert("Enter Confirm Password!");
                    return false;
                }
                if (conpassword != password) {
                    alert("given password doesn't match!");
                    return false;
                }
            }
        </script>
    </head>



    <body>
    <center>
        <p><h2>Register Faculty:</h2></p>
        <html:form action="addfaculty2" onsubmit="return checkFaculty();">
        <table border="1">
            <tr>
                <td>Technology:</td>
                <td>
                    <html:select property="facultyTechnology" styleId="facultyTechnology">
                        <html:option value="">Select</html:option>
                        <logic:iterate name="TRAININGCOURSENAMES" id="TRAININGCOURSENAMES">
                            <html:option value="${TRAININGCOURSENAMES.trainingCourseName}"><bean:write name="TRAININGCOURSENAMES" property="trainingCourseName"/></html:option>
                        </logic:iterate>
                    </html:select>
                </td>
            </tr>
            <tr>
                <td>Faculty Name:</td>
                <td><html:text property="facultyName" styleId="facultyName"/></td>
            </tr>
            <tr>
                <td>Faculty Email:</td>
                <td><html:text property="facultyEmail" styleId="facultyEmail" /></td>
            </tr>
            <tr>
                <td>Faculty Mobile:</td>
                <td><html:text property="facultyMobile" styleId="facultyMobile"/></td>
            </tr>
            <tr>
                <td>Alternate Mobile:</td>
                <td><html:text property="facultyMobileAlt" styleId="facultyMobileAlt"/></td>
            </tr>
            <tr>
                <td>Faculty Address:</td>
                <td><html:textarea property="facultyAddress" styleId="facultyAddress" cols="25" rows="3"/></td>
            </tr>
            <tr>
                <td>Faculty Password:</td>
                <td><html:password property="facultyPassword" styleId="facultyPassword"/></td>
            </tr>
            <tr>
                <td>Confirm Password:</td>       
                <td><input type="password" id="facultyConfirmPassword" /></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <html:submit value="Add Faculty"/>
                </td>
            </tr>
        </table>
    </html:form>
    ${requestScope.ADD_FACULTY_SUCCESS_MSG}
    ${requestScope.ADD_FACULTY_FAIL_MSG}
</center>
</body>
</html>
