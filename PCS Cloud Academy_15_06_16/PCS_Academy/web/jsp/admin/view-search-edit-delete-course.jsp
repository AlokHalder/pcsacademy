
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
            function checkCourse() {


                var content = document.getElementById("trainingCourseContent").value;
                var duration = document.getElementById("trainingCourseDuration").value;
                var fees = document.getElementById("trainingCourseFees").value;


                if (content == "" || content == null) {
                    alert("Enter Course Content!");
                    document.getElementById("trainingCourseContent").focus();

                    return false;
                }
                if (duration == "" || duration == null) {
                    alert("Enter Course Duration!");
                    document.getElementById("trainingCourseDuration").focus();
                    return false;
                }
                if (fees == "" || fees == null) {
                    alert("Enter Course Fees!");
                    document.getElementById("trainingCourseFees").focus();
                    return false;
                }
            }
        </script>
    </head>



    <body>       
    <center>
        <div style=" height: 45%; width: 100%">
            <p><h2>Search All Available Course:</h2></p>
            <html:form action="searchContent" method="get">

                Training Category<html:select property="trainingCategoryId"> 
                    <html:option value="">-----Select Any value----</html:option>
                    <logic:iterate  name="ALLTRAININGCATEGORYDIST" id="shwCourse1">          
                        <html:option value="${shwCourse1.trainingCategoryId}">
                            <bean:write name="shwCourse1" property="trainingCategoryName"/>
                        </html:option>
                    </logic:iterate>
                </html:select> 

                Training Course<html:select property="trainingCourseName"> 
                    <html:option value="">-----Select Any value----</html:option>
                    <logic:iterate  name="ALLTRAININGCOURSEDIST" id="shwCourse2">          
                        <html:option value="${shwCourse2.trainingCourseName}">
                            <bean:write name="shwCourse2" property="trainingCourseName"/>
                        </html:option>
                    </logic:iterate>
                </html:select> 
                    
                <html:submit value="Search" />
            </html:form>

                    
                    
            <logic:empty name="showcourse">
                <p style="color:red;">No Records Found</p>
            </logic:empty>         
            <logic:notEmpty  name="showcourse">      
                <table border="1">
                    <thead>
                    <td align="center">Course Id</td>
                    <td align="center">Category Id</td>
                    <td align="center">Category Name</td>
                    <td align="center">Course Name</td>
                    <td align="center">Course Content</td>
                    <td align="center">Course Duration</td>
                    <td align="center">Course Fees</td>
                    <td align="center">Action</td>
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
                                <bean:write name="shwCourse" property="trainingCourseContent"/>.....
                                <a href="viewcoursecontent.do?cid=<bean:write name='shwCourse' property='trainingCourseId'/>">
                                Details
                                </a>
                            </td>
                            <td>
                                <bean:write name="shwCourse" property="trainingCourseDuration"/>
                            </td>                       
                            <td align="center">
                                <bean:write name="shwCourse" property="trainingCourseFees"/>
                            </td>
                            <td align="center">
                                <a href="updatecourse.do?id=<bean:write name='shwCourse' property='trainingCourseId'/>" style="text-decoration: none;">
                                    &nbsp; Edit &nbsp;&nbsp;||&nbsp;&nbsp;
                                </a>
                                <!----------------deletecourse.do?id=<//bean:write name='shwCourse' property='trainingCourseId'/>--->
                                <a href="viewSearchEditDelete-course.do" style="text-decoration: none;" onclick="return checkDelete();">
                                    Delete
                                </a>
                            </td>
                        </tr>
                    </logic:iterate>
                </table>
            </logic:notEmpty> 
        </div>

        <br/>

<logic:present name="showcontent">
           
                <p><h2>Course Content Details:</h2></p>
 
            <table border="1">
                <tr>
                    <td>Course Id:</td>
                    <td>
                        <html:text property="trainingCourseId" value="${showcontent.getTrainingCourseId()}" readonly="true" style="background-color: palegoldenrod;"/>
                    </td>
                </tr>
                 <tr>
                    <td>Course Name:</td>
                    <td>
                        <html:text property="trainingCourseName" value="${showcontent.getTrainingCourseName()}" styleId="trainingCourseName" readonly="true" style="background-color: palegoldenrod;" />
                    </td>
                </tr>
                <tr>
                    <td>Course Category:</td>
                    <td>
                        <html:text property="trainingCategoryName" value="${showcontent.getTrainingCategoryName()}" readonly="true" style="background-color: palegoldenrod;" />

                    </td>
                </tr>             
                <tr>
                    <td>
                        Course Content:
                    </td>
                    <td>
                        <html:textarea property="trainingCourseContent" value="${showcontent.trainingCourseContent}" styleId="trainingCourseContent" cols="25" rows="5" readonly="true" style="background-color: palegoldenrod;"/>
                    </td>
                </tr>
                <tr><td></td></tr>
            </table>
       
    </logic:present>

        <logic:present name="showcourseforupdate">
            <html:form action="updatecourse2"  onsubmit="return checkCourse()">
                <p><h2>Update Training Course:</h2></p>
            <input type="hidden" name="updatecourse" value="updatetrainingcourse"/>

            <table border="1">
                <tr>
                    <td>Course Id:</td>
                    <td>
                        <html:text property="trainingCourseId" value="${showcourseforupdate.getTrainingCourseId()}" readonly="true" style="background-color: palegoldenrod;"/>
                    </td>
                </tr>
                <tr>
                    <td>Course Name:</td>
                    <td>
                        <html:text property="trainingCourseName" value="${showcourseforupdate.getTrainingCourseName()}" styleId="trainingCourseName" readonly="true" style="background-color: palegoldenrod;" />
                    </td>
                </tr>
                <tr>
                    <td>Course Category:</td>
                    <td>
                        <html:text property="trainingCategoryName" value="${showcourseforupdate.getTrainingCategoryName()}" styleId="trainingCourseName" readonly="true" style="background-color: palegoldenrod;" />

                    </td>
                </tr>
                <tr>
                    <td>
                        Course Content:
                    </td>
                    <td>
                        <html:textarea property="trainingCourseContent" value="${showcourseforupdate.trainingCourseContent}" styleId="trainingCourseContent" cols="25" rows="5"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Course Duration:
                    </td>
                    <td>
                        <html:text property="trainingCourseDuration" value="${showcourseforupdate.trainingCourseDuration}" styleId="trainingCourseDuration"  />
                    </td>
                </tr>
                <tr>
                    <td>
                        Course Fees(Rs.):
                    </td>
                    <td>
                        <html:text property="trainingCourseFees" value="${showcourseforupdate.trainingCourseFees}" styleId="trainingCourseFees" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <html:submit value="Update Course" />
                    </td>
                </tr>
            </table>
        </html:form>
    </logic:present>

</center>
</body>
</html>
