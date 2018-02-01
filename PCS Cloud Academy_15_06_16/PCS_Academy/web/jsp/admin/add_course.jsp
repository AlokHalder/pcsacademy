<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %>
<%@taglib  uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@taglib  uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <script type="text/javascript">
            function checkCourse() {
                var name = document.getElementById("trainingCourseName").value;
                var category = document.getElementById("trainingCategoryId").value;
                var content = document.getElementById("trainingCourseContent").value;
                var duration = document.getElementById("trainingCourseDuration").value;
                var fees = document.getElementById("trainingCourseFees").value;

                if (name == "" || name == null) {
                    alert("Enter Course Name!");
                    return false;
                }
                if (category == "" || category == null) {
                    alert("Enter Course category!");
                    return false;
                }
                if (content == "" || content == null) {
                    alert("Enter Course Content!");
                    return false;
                }
                if (duration == "" || duration == null) {
                    alert("Enter Course Duration!");
                    return false;
                }
                if (fees == "" || fees == null) {
                    alert("Enter Course Fees!");
                    return false;
                }
            }
        </script>
    </head>



    <body>       
    <center>
        <div style=" height: 45%; width: 100%">
            <p><h2>Available Course:</h2></p>
            <table border="1">
                <thead>
                <td align="center">Course Id</td>
                <td align="center">Category Id</td>
                <td align="center">Category Name</td>
                <td align="center">Course Name</td>
                <td align="center">Course Content</td>
                <td align="center">Course Duration</td>
                <td align="center">Course Fees</td>
                </thead>
                <logic:iterate name="showcourse" id="shwCourse">
                    <tr>
                        <td align="center">
                            <bean:write name="shwCourse" property="trainingCourseId"/>
                        </td>
                        <td align="center">
                            <bean:write name="shwCourse" property="trainingCategoryId"/>
                        </td> 
                        <td>
                            <bean:write name="shwCourse" property="trainingCategoryName"/>
                        </td>
                        <td>
                            <bean:write name="shwCourse" property="trainingCourseName"/>
                        </td>
                        <td>
                            <bean:write name="shwCourse" property="trainingCourseContent"/>
                        </td>
                        <td>
                            <bean:write name="shwCourse" property="trainingCourseDuration"/>
                        </td>                       
                        <td align="center">
                            <bean:write name="shwCourse" property="trainingCourseFees"/>
                        </td>
                    </tr>
                </logic:iterate>
            </table>
        </div>

        <br/>

        <p><h2>Add Course:</h2></p>
        <html:form action="addtrainingcourse2" onsubmit="return checkCourse();">
        <table border="1">
            <tr>
                <td>Course Name:</td>
                <td>
                    <html:text property="trainingCourseName" styleId="trainingCourseName" />
                </td>
            </tr>
            <tr>
                <td>Course Category:</td>
                <td>
                    <html:select property="trainingCategoryId" styleId="trainingCategoryId">
                        <html:option value="">Select</html:option>
                        <logic:iterate name="ALLTRAININGCATEGORY" id="ALLTRAININGCATEGORY">
                            <html:option value="${ALLTRAININGCATEGORY.trainingCategoryId}"><bean:write name="ALLTRAININGCATEGORY" property="trainingCategoryName"/></html:option>
                        </logic:iterate>
                    </html:select>
                </td>
            </tr>
            <tr>
                <td>
                    Course Content:
                </td>
                <td>
                    <html:textarea property="trainingCourseContent" styleId="trainingCourseContent" cols="25" rows="5"/>
                </td>
            </tr>
            <tr>
                <td>
                    Course Duration:
                </td>
                <td>
                    <html:text property="trainingCourseDuration" styleId="trainingCourseDuration"  />
                </td>
            </tr>
            <tr>
                <td>
                    Course Fees(Rs.):
                </td>
                <td>
                    <html:text property="trainingCourseFees" styleId="trainingCourseFees" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <html:submit value="Add Course" />
                </td>
            </tr>
        </table>
    </html:form>
    ${requestScope.ADD_TRAINING_COURSE_SUCCESS_MSG}
    ${requestScope.ADD_TRAINING_COURSE_FAIL_MSG}
</center>
</body>
</html>
