

<%@taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@taglib uri="/WEB-INF/struts-html.tld" prefix="html"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
    <head>
        <title>Admin Profile</title>
        <script type="text/javascript">
            window.history.forward();
        </script>
    </head>


    <body bgcolor="#8ad0ff" onunload="">
        <table  width="100%" border="1"  align="center" cellspacing="0" cellpadding="0">
            <tr>
                <td colspan="2">
                    <tiles:insert attribute="header"/>
                </td>
            </tr>
            <tr>
                <td valign="top" style="width: 285px;">
                    <tiles:insert attribute="leftmenu"/>                      
                </td>
                <td>
                    <tiles:insert attribute="body"/>                       
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 42px;">
                    <tiles:insert attribute="footer"/>
                </td>
            </tr>
        </table> 
    </body>
</html>
