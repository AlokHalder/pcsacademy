<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %>
<%@taglib  uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@taglib  uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <script type="text/javascript">
            function checkDelete() {
                var x = confirm("Do You Want To Delete It");
                if (x == true) {
                    return true;
                }
                else {
                    return false;
                }

            }

            function checkCategory() {

                var category = document.getElementById("trainingCategoryName").value;

                if (category == "" || category == null) {
                    alert("Enter Category Name!");
                    document.getElementById("trainingCategoryName").focus();

                    return false;
                }
                return true;

            }
        </script>
    </head>



    <body>
    <center>
        <p><h2>All Available Category:</h2></p>
    <table border="1">
        <thead>
        <td align="center">Category Id</td>
        <td align="center">Category Name</td>
        <td align="center">Action</td>
        </thead>
        <logic:iterate name="showcategory" id="shwCategory">
            <tr>
                <td align="center">
                    <bean:write name="shwCategory" property="trainingCategoryId"/>
                </td>
                <td>
                    <bean:write name="shwCategory" property="trainingCategoryName"/>
                </td>

                <td align="center">
                    <a href="viewSearchEditDelete-category.do?cid=<bean:write name='shwCategory' property='trainingCategoryId'/>" style="text-decoration: none;">
                        &nbsp; Edit &nbsp;&nbsp;||&nbsp;&nbsp;
                    </a>
                    <a href="viewSearchEditDelete-category.do" style="text-decoration: none;" onclick="return checkDelete()">
                        Delete
                    </a>
                </td>

            </tr>
        </logic:iterate>
    </table>

    <br/>

    <!--<div style="height: 10%; width: 100%"></div>-->
    <logic:present name="showcategoryforupate">
        <html:form action="viewSearchEditDelete-category.do"  onsubmit="return checkCategory()">
            <p><h2>Update Training Category:</h2></p>
        <input type="hidden" name="updatecategory" value="updatetrainingcategory"/>

        <table border="1">
            <tr>
                <td>Category Id:</td>
                <td>
                    <html:text property="trainingCategoryId" value="${showcategoryforupate.getTrainingCategoryId()}" readonly="true" style="background-color: palegoldenrod;"/>
                </td>
            </tr>
            <tr>
                <td>Category Name:</td>
                <td>
                    <html:text property="trainingCategoryName" value="${showcategoryforupate.getTrainingCategoryName()}" styleId="trainingCategoryName" />
                </td>
            </tr>

            <tr>
                <td></td>
                <td>
                    <html:submit value="Update Category" />
                </td>
            </tr>
        </table>
    </html:form>
</logic:present>
</center>
</body>
</html>
