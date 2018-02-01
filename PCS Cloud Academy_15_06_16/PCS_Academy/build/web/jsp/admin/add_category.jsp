<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %>
<%@taglib  uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@taglib  uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <script type="text/javascript">
            function checkCategory() {
                var name = document.getElementById("trainingCategoryName").value;

                if (name == "" || name == null) {
                    alert("Enter Category Name!");
                    return false;
                }
            }
        </script>
    </head>



    <body>
    <center>
        <p><h2>Available Category:</h2></p>
    <table border="1">
        <thead>
        <td align="center">Category Id</td>
        <td align="center">Category Name</td>
        </thead>
        <logic:iterate name="showcategory" id="shwCategory">
            <tr>
                <td align="center">
                    <bean:write name="shwCategory" property="trainingCategoryId"/>
                </td>
                <td>
                    <bean:write name="shwCategory" property="trainingCategoryName"/>
                </td>
            </tr>
        </logic:iterate>
    </table>

    <br/>

    <!--<div style="height: 10%; width: 100%"></div>-->
    <p><h2>Add Category:</h2></p>
<div style="height: 45%; width: 100%">
    <html:form action="addtrainingcatg2" onsubmit="return checkCategory();">
        <table border="1">
            <tr>
                <td>Training Category Name:</td>
                <td><html:text property="trainingCategoryName" styleId="trainingCategoryName" /></td>
            </tr>
            <tr>
                <td></td>
                <td><html:submit value="Add Category" /></td>
            </tr>
        </table>
    </html:form>
</div>
${requestScope.ADD_TRAINING_CATG_SUCCESS_MSG}
${requestScope.ADD_TRAINING_CATG_FAIL_MSG}
</center>
</body>
</html>
