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
                } else {
                    return false;
                }
            }
            function checkFtech() {
                var x = confirm("Do You Want To Change It");
                if (x == true) {
                    return true;
                } else {
                    return false;
                }
            }
            function checkFaculty() {
                // var ftech = document.getElementById("facultyTechnology").value;
                //alert(ftech);
                var fname = document.getElementById("facultyName").value;
                //alert(fname);
                var fmail = document.getElementById("facultyEmail").value;
                var fmobile = document.getElementById("facultyMobile").value;
                // var faltmobile = document.getElementById("facultyMobileAlt").value;
                var faddress = document.getElementById("facultyAddress").value;

                // if (ftech == "" || ftech == null) {
                //     alert("Enter Faculty Technology!");
                //    document.getElementById("facultyTechnology").focus();
                //   return false;
                // }
                if (fname == "" || fname == null) {
                    alert("Enter Faculty Name!");
                    document.getElementById("facultyName").focus();
                    return false;
                }
                if (fmail == "" || fmail == null) {
                    alert("Enter Faculty Mail-id!");
                    document.getElementById("facultyEmail").focus();
                    return false;
                }
                if (fmobile == "" || fmobile == null) {
                    alert("Enter Faculty Mobile No!");
                    document.getElementById("facultyMobile").focus();
                    return false;
                }


                if (faddress == "" || faddress == null) {
                    alert("Enter Faculty Address!");
                    document.getElementById("facultyAddress").focus();
                    return false;
                }
            }
        </script>
    </head>



    <body>       
    <center>
        <div style=" height: 45%; width: 100%">

            <p><h2>Search All Faculty Members:</h2></p>
            <html:form action="searchfaculty" method="get">
                <input type="hidden" name="searchbtclick" value="searchfacultydetails"/>
                Faculty Name<html:text property="facultyName"/>
                Faculty Technology <html:select property="facultyTechnology">
                    <html:option value="">Select</html:option>
                    <logic:iterate name="TRAININGCOURSENAMES" id="TRAININGCOURSENAMES">
                        <html:option value="${TRAININGCOURSENAMES.trainingCourseName}"><bean:write name="TRAININGCOURSENAMES" property="trainingCourseName"/></html:option>
                    </logic:iterate>
                </html:select>
                <html:submit value="Search" />
            </html:form>


            <logic:empty name="FACULTYLIST">
                <p style="color:red;">No Records Found</p>
            </logic:empty>   
            <logic:notEmpty name="FACULTYLIST">    
                <table border="1">
                    <thead>
                    <td align="center">Faculty Id</td>
                    <td align="center">Technology</td>
                    <td align="center">Name</td>
                    <td align="center">Email-id</td>
                    <td align="center">Mobile No</td>
                    <td align="center">Mobile Alt</td>
                    <td align="center">Address</td>
                    <td align="center">Password</td>

                    <td align="center">Action</td>
                    </thead>
                    <logic:iterate name="FACULTYLIST" id="shwfaculty">
                        <tr>
                            <td align="center">
                                <bean:write name="shwfaculty" property="facultyId"/>
                            </td>
                            <td align="center">
                                <bean:write name="shwfaculty" property="facultyTechnology"/>
                            </td> 
                            <td align="center">
                                <bean:write name="shwfaculty" property="facultyName"/>
                            </td> 
                            <td>
                                <bean:write name="shwfaculty" property="facultyEmail"/>
                            </td>
                            <td>
                                <bean:write name="shwfaculty" property="facultyMobile"/>
                            </td>
                            <td>
                                <bean:write name="shwfaculty" property="facultyMobileAlt"/>
                            </td>
                            <td>
                                <bean:write name="shwfaculty" property="facultyAddress"/>
                            </td> 
                            <td>
                                <bean:write name="shwfaculty" property="facultyPassword"/>
                            </td>

                            <td align="center">
                                <a href="updatefaculty.do?fid=<bean:write name='shwfaculty' property='facultyId'/>" style="text-decoration: none;">
                                    &nbsp; Edit &nbsp;&nbsp;||&nbsp;&nbsp;
                                </a>
                                <!----------------deletecourse.do?id=<//bean:write name='shwCourse' property='trainingCourseId'/>--->
                                <a href="viewSearchEditDelete-faculty.do" style="text-decoration: none;" onclick="return checkDelete()">
                                    Delete
                                </a>
                            </td>
                        </tr>
                    </logic:iterate>
                </table>
            </logic:notEmpty>
        </div>

        <br/>



        <logic:present name="FACULTYUPDATE">
            <html:form action="updatefaculty2" onsubmit="return checkFaculty();">
                <p><h2>Update Faculty Details:</h2></p>
            <input type="hidden" name="updatefaculty" value="updatefacultydetails"/>

            <table border="1">
                <tr>
                    <td>Faculty Id:</td>
                    <td>
                        <html:text property="facultyId" value="${FACULTYUPDATE.getFacultyId()}" readonly="true" style="background-color: palegoldenrod;"/>
                    </td>
                </tr>
                <tr>
                    <td>Faculty Technology:</td>
                    <td>
                        <html:select property="facultyTechnology">
                            <html:option value="">Select</html:option>
                            <logic:iterate name="TRAININGCOURSESHOW" id="TRAININGCOURSESHOW">
                                <html:option value="${TRAININGCOURSESHOW.trainingCourseName}"><bean:write name="TRAININGCOURSESHOW" property="trainingCourseName"/></html:option>
                            </logic:iterate>
                        </html:select>
                    </td>
                </tr>
                <tr>
                    <td>Faculty Name:</td>
                    <td>
                        <html:text property="facultyName" value="${FACULTYUPDATE.getFacultyName()}" styleId="facultyName" />
                    </td>
                </tr>
                <tr>
                    <td>Faculty Emailid:</td>
                    <td>
                        <html:text property="facultyEmail" value="${FACULTYUPDATE.getFacultyEmail()}" styleId="facultyEmail" />

                    </td>
                </tr>
                <tr>
                    <td>
                        Faculty Mobile No:
                    </td>
                    <td>
                        <html:text property="facultyMobile" value="${FACULTYUPDATE.getFacultyMobile()}" styleId="facultyMobile"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Faculty Mobile Alter:
                    </td>
                    <td>
                        <html:text property="facultyMobileAlt" value="${FACULTYUPDATE.getFacultyMobileAlt()}" styleId="facultyMobileAlt"  />
                    </td>
                </tr>
                <tr>
                    <td>
                        Faculty Address:
                    </td>
                    <td>
                        <html:textarea property="facultyAddress" value="${FACULTYUPDATE.getFacultyAddress()}" styleId="facultyAddress" cols="25" rows="5" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Faculty Password:
                    </td>
                    <td>
                        <html:text property="facultyPassword" value="${FACULTYUPDATE.getFacultyPassword()}" styleId="facultyPassword"/>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <html:submit value="Update Details" />
                    </td>
                </tr>
            </table>
        </html:form>
    </logic:present>


</center>
</body>
</html>
