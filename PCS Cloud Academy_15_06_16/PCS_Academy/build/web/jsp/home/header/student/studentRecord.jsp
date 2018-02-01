<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>

<html:html>
    <body bgcolor="">
        <div align="center">
            <h4>Student Record</h4>
            <table border="0" align="center">
                <tr>
                    <td>Student Registration Number :: </td>
                    <td><bean:write name="StudentRecordBean" property="student_regn_id"/></td>
                </tr>
                <tr>
                    <td>salutation :: </td>
                    <td><bean:write name="StudentRecordBean" property="salutation"/></td>
                </tr>
                <tr>
                    <td>First Name :: </td>
                    <td><bean:write name="StudentRecordBean" property="first_name"/></td>
                </tr>
                <tr>
                    <td>Last Name :: </td>
                    <td><bean:write name="StudentRecordBean" property="last_name"/></td>
                </tr>
                <tr>
                    <td>Date of Birth :: </td>
                    <td><bean:write name="StudentRecordBean" property="dob"/></td>
                </tr>
                <tr>
                    <td>State :: </td>
                    <td><bean:write name="StudentRecordBean" property="state"/></td>
                </tr>
                <tr>
                    <td>City :: </td>
                    <td><bean:write name="StudentRecordBean" property="city"/></td>
                </tr>
                <tr>
                    <td>Email Id :: </td>
                    <td><bean:write name="StudentRecordBean" property="email_id"/></td>
                </tr>
                <tr>
                    <td>Mobile Number :: </td>
                    <td><bean:write name="StudentRecordBean" property="mobile"/></td>
                </tr>
                <tr>
                    <td>College Name :: </td>
                    <td><bean:write name="StudentRecordBean" property="college_name"/></td>
                </tr>
                <tr>
                    <td>College State :: </td>
                    <td><bean:write name="StudentRecordBean" property="college_state"/></td>
                </tr>
                <tr>
                    <td>College City :: </td>
                    <td><bean:write name="StudentRecordBean" property="college_city"/></td>
                </tr>
                <tr>
                    <td>University :: </td>
                    <td><bean:write name="StudentRecordBean" property="university"/></td>
                </tr>
                <tr>
                    <td>Stream :: </td>
                    <td><bean:write name="StudentRecordBean" property="stream"/></td>
                </tr>
                <tr>
                    <td>Persuing Qualification :: </td>
                    <td><bean:write name="StudentRecordBean" property="persuing_qualification"/></td>
                </tr>
                <tr>
                    <td>Year of Passing :: </td>
                    <td><bean:write name="StudentRecordBean" property="passing_year"/></td>
                </tr>
                <tr>
                    <td>Semester :: </td>
                    <td><bean:write name="StudentRecordBean" property="semester"/></td>
                </tr>
                <tr>
                    <td>Registration Date :: </td>
                    <td><bean:write name="StudentRecordBean" property="regn_date"/></td>
                </tr>
            </table>
        </div>
    </body>
</html:html>