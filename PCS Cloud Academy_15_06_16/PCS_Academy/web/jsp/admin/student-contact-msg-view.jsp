<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %>
<%@taglib prefix="logic" uri="/WEB-INF/struts-logic.tld" %>
<%@taglib prefix="bean" uri="/WEB-INF/struts-bean.tld" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Msg.</title>
    </head>



    <body>
    <center>
        <p><h2>Student Contact Messages:</h2></p>
    <table border="1">
        <tr>
            <td align="center">Msg.Id</td>
            <td align="center">Msg. Sender Name</td>
            <td align="center">Msg. sender Email</td>
            <td align="center">Msg. Sender Phone</td>
            <td align="center">Message Details</td>
        </tr>
        <logic:iterate name="viewcontactmsg" id="vcm">
            <tr>
                <td align="center"><bean:write name='vcm' property='id'/></td>
                <td align="center"><bean:write name='vcm' property='name'/></td>
                <td align="center"><bean:write name='vcm' property='email'/></td>
                <td align="center"><bean:write name='vcm' property='phone'/></td>
                <td align="center"><bean:write name="vcm" property="massage"/></td>
            </tr>
        </logic:iterate>
    </table>
</center>
<br />
</body>
</html>
