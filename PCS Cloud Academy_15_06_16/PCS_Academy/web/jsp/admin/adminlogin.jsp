<%@taglib uri="/WEB-INF/struts-html.tld" prefix= "html" %>
<%@taglib prefix="logic" uri="/WEB-INF/struts-logic.tld" %>

<body bgcolor="lightblue">
<center>
    <table align="center"  >
        <tr>
            <td> 
                <h1 align="center" style="color:#06F">ADMIN PANEL LOGIN</h1>
            </td>
        </tr>
        <tr> 
            <td> 
                <html:form action="admin-login">
                    <table width="400"  align="center">
                        <tr height="5">
                            <td style="color:#06F;font-family: san-serif;" align="right">
                                Username: <font color="red">*</font>
                            </td>
                            <td >
                                <html:text property="username" />
                            </td>
                        </tr>
                        <tr height="1" >
                            <td align="right" style="color:#06F;" >
                                <div>
                                    <html:errors property="username" /> 
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="color:#06F;font-family: san-serif;" align="right">
                                Password: <font color="red">*</font>
                            </td>
                            <td>
                                <html:password property="password"  />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="color:#06F" >
                                <div>
                                    <html:errors property="password" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="color:#06F;font-family: san-serif;" align="right">
                                Designation: <font color="red">*</font>
                            </td>
                            <td>
                                <html:select  property="desigCode" style="color:#06F">
                                    <html:option  value="">select the value</html:option>  
                                    <logic:iterate name="SHOWDESIG" id="showdesig">
                                        <html:option value="${showdesig.desigCode}">${showdesig.desigName}</html:option>
                                    </logic:iterate>
                                </html:select>
                                <%--<html:errors property="designation" />--%>
                            </td>        
                        </tr>         
                        <tr>
                            <td></td>
                            <td> 
                                <html:submit  style="color:#06F" value="Login" />
                                <html:reset  style="color:#06F" value="Reset"/>
                            </td>
                        </tr>
                    </table>
                </html:form>
            </td>
        </tr>
    </table>
    <div style="margin-left: 30px;">
        ${requestScope.ADMIN_LOGIN_FAIL_MSG}
        ${requestScope.ADMIN_LOGOUT_SUCCESS_MSG}
        ${requestScope.ADMIN_PASSWORD_CHANGE_SUCCESS_MSG}
    </div>
</center>
</body>

