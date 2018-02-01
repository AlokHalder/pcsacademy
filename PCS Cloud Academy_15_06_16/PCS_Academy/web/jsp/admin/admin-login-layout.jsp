
<%@taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@taglib uri="/WEB-INF/struts-html.tld" prefix="html"%> 

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="#8ad0ff">
        <table  width="100%" border="1"  align="center" cellspacing="0" cellpadding="0">
            <tr>
                <td colspan="2">
                    <tiles:insert attribute="header"/>
                </td>
            </tr>
            <tr>

                <td colspan="2">
                    <tiles:insert attribute="body"/>                       
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <tiles:insert attribute="footer"/>
                </td>
            </tr>
        </table> 
    </body>
</html>
