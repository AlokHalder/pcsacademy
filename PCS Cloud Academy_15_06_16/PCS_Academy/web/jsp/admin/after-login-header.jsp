<%@page import="in.pcsacademy.model.vo.AdminDetailsVo"%>
<%@taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<table border="0" width="100%" align="center">  
    <tr>
        <td>
            <html:link action="home" style="text-decoration: none;">Home</html:link>
            </td> 
        </tr>
        <tr>
            <td align="center">  
                <h3>PCS Cloud Academy Admin Module</h3>
            </td>
        </tr>
        <tr>
            <td style="text-align:right">            
            <%
                AdminDetailsVo adminDetailsVo = (AdminDetailsVo) session.getAttribute("ADMINDETAILS");
                String username = adminDetailsVo.getUsername();
                out.println("Hi, " + username + "..");
            %>
            <br />
            <div style="margin-right: 13px;"><html:link action="logout" style="text-decoration:none;">Logout</html:link></div> 
        </td>
    </tr>
</tbody>
</table>
