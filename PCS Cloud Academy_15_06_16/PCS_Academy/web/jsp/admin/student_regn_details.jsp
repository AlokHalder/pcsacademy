<%@taglib prefix="bean" uri="/WEB-INF/struts-bean.tld" %>
<%@taglib  uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            function showText() {
                if (document.getElementById("showHide").value == "Show") {
                    document.getElementById("showHide").value = "Hide";
                    document.getElementById("studentRegnPass").setAttribute("type", "text");
                }
                else {
                    document.getElementById("showHide").value = "Show";
                    document.getElementById("studentRegnPass").setAttribute("type", "password");
                }
            }
        </script>
    </head>



    <body>
    <center>
        <h2>Before Admission Registration Informations:</h2>
        <table border="1">
            <tr>
                <td align="center">Student Id</td>
                <td align="center">Name</td>
                <td align="center">Email</td>
                <td align="center">Mobile</td>
            </tr>
            <logic:iterate name="showStudentdetails" id="shwstudtlss">
                <tr>
                    <td align="center"><bean:write name="shwstudtlss" property="studentRegnBeforeAdmisnId"/></td>
                    <td align="center"><bean:write name="shwstudtlss" property="firstName"/>&nbsp;&nbsp;<bean:write name="shwstudtlss" property="lastName"/></td>
                    <td align="center"><bean:write name="shwstudtlss" property="emailId"/></td>
                    <td align="center"><bean:write name="shwstudtlss" property="mobile"/></td>
                    <td align="center"><html:link action="/showStudentRegnDetails?id=${shwstudtlss.studentRegnBeforeAdmisnId}" style="text-decoration: none;">Registration Details</html:link></td>
                    <td align="center"><html:link action="/showStudentLoginDetails?id=${shwstudtlss.studentRegnBeforeAdmisnId}" style="text-decoration: none;">Login Details</html:link></td>
                    </tr>
            </logic:iterate>
        </table>

        <br />

        <%
            if (request.getAttribute("showStudentdetails2") != null) {
        %>
        <h2>Registration Details:</h2>
        <table border="1">
            <tr>
                <td>Student Id:</td>
                <td><input type="text" value="${requestScope.showStudentdetails2.getStudentRegnBeforeAdmisnId()}" readonly="readonly" size="4" style="background-color: palegoldenrod;"/></td>
            </tr>
            <tr>
                <td>Salutation:</td>
                <td><input type="text" value="${requestScope.showStudentdetails2.getSalutation()}" readonly="readonly" size="3" style="background-color: palegoldenrod;"/></td>
            </tr>
            <tr>
                <td>DOB:</td>
                <td><input type="text" value="${requestScope.showStudentdetails2.getDob()}" readonly="readonly" style="background-color: palegoldenrod;"/></td>
            </tr>
            <tr>
                <td>State:</td>
                <td><input type="text" value="${requestScope.showStudentdetails2.getState()}" readonly="readonly" style="background-color: palegoldenrod;"/></td>
            </tr>
            <tr>
                <td>City:</td>
                <td><input type="text" value="${requestScope.showStudentdetails2.getCity()}" readonly="readonly" style="background-color: palegoldenrod;"/></td>
            </tr>
            <tr>
                <td>College State:</td>
                <td><input type="text" value="${requestScope.showStudentdetails2.getCollegeState()}" readonly="readonly" style="background-color: palegoldenrod;"/></td>
            </tr>
            <tr>
                <td>College City:</td>
                <td><input type="text" value="${requestScope.showStudentdetails2.getCollegeCity()}" readonly="readonly" style="background-color: palegoldenrod;"/></td>
            </tr>
            <tr>
                <td>College Name:</td>
                <td><input type="text" value="${requestScope.showStudentdetails2.getCollegeName()}" readonly="readonly" style="background-color: palegoldenrod;"/></td>
            </tr>
            <tr>
                <td>Branch:</td>
                <td><input type="text" value="${requestScope.showStudentdetails2.getBranch()}" readonly="readonly" style="background-color: palegoldenrod;"/></td>
            </tr>
            <tr>
                <td>University:</td>
                <td><input type="text" value="${requestScope.showStudentdetails2.getUniversity()}" readonly="readonly" style="background-color: palegoldenrod;"/></td>
            </tr>
            <tr>
                <td>Persuing Qualification:</td>
                <td><input type="text" value="${requestScope.showStudentdetails2.getPersuingQualification()}" readonly="readonly" style="background-color: palegoldenrod;"/></td>
            </tr>
            <tr>
                <td>Passing Year:</td>
                <td><input type="text" value="${requestScope.showStudentdetails2.getPassingYear()}" readonly="readonly" style="background-color: palegoldenrod;"/></td>
            </tr>
            <tr>
                <td>Semester:</td>
                <td><input type="text" value="${requestScope.showStudentdetails2.getSemester()}" readonly="readonly" style="background-color: palegoldenrod;"/></td>
            </tr>
            <tr>
                <td>How Find Us:</td>
                <td><input type="text" value="${requestScope.showStudentdetails2.getHowfindus()}" readonly="readonly" style="background-color: palegoldenrod;"/></td>
            </tr>
            <tr>
                <td>Regn. Date:</td>
                <td><input type="text" value="${requestScope.showStudentdetails2.getRegnDate()}" readonly="readonly" style="background-color: palegoldenrod;"/></td>
            </tr>
        </table>
        <%}%>


        <%
            if (request.getAttribute("showStudentdetails3") != null) {
        %>
        <h2>Login Details:</h2>
        <table border="1">
            <tr>
                <td>Student Id:</td>
                <td><input type="text" value="${requestScope.showStudentdetails3.getStudentRegnBeforeAdmisnId()}" readonly="readonly" size="4" style="background-color: palegoldenrod;"/></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" id="studentRegnPass" value="${requestScope.showStudentdetails3.getPassword()}" readonly="readonly" style="background-color: palegoldenrod;"/></td>
                <td><input type="button" id="showHide" value="Show" onclick="showText();" style="width: 60px;"/></td>
            </tr>
        </table>
        <%}%>
    </center>
    <br/>
</body>
</html>
