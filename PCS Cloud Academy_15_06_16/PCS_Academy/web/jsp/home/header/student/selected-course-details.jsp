<%@taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@taglib uri="/WEB-INF/struts-bean.tld" prefix= "bean" %>
<%@taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>PcsAcademy</title>
        <!--<link href="css/main.css" rel="stylesheet" type="text/css" />-->
        <script language="javaScript" type="text/javascript" src="js/calendar.js"></script>
        <link href="css/calendar.css" rel="stylesheet" type="text/css">

        <style>
            .TFtable{
                width:100%; 
                border-collapse:collapse; 
            }
            .TFtable td{ 
                padding:7px; border:#4e95f4 1px solid;
            }
            /* provide some minimal visual accomodation for IE8 and below */
            .TFtable tr{
                background: #b8d1f3;
            }
            /*  Define the background color for all the ODD background rows  */
            .TFtable tr:nth-child(odd){ 
                background: #b8d1f3;
            }
            /*  Define the background color for all the EVEN background rows  */
            .TFtable tr:nth-child(even){
                background: #dae5f4;
            }
            .TFtable tr:first-child{ font-waight:bold;}
        </style>
    </head>



    <article>
        <!-- MAIN CONTENT -->
        <!--    <div id="system-message-container"></div>-->
        <div class="contact">
            <h2 style="margin-top: 1px; margin-left: 0px; margin-bottom: 18px;">Course Details</h2>
            <div class="contact-form">
                <logic:present name="ALLSTUDENTDATA">
                    <table class="TFtable">
                        <tr align="center">
                            <td align="center"><b>Enrollment Number</b></td> 
                            <td align="center"><b>Registration No</b></td> 
                            <td align="center"><b>Course Category Id</b></td> 
                            <td align="center"><b>Course Id</b></td> 
                            <td align="center"><b>Batch Id</b></td> 
                            <td align="center"><b>Enrollment Status</b></td> 
                            <td align="center"><b>Enrollment Date</b></td> 
                        </tr> 
                        <tr>
                            <td><bean:write name="ALLSTUDENTDATA" property="enrollmentno"/></td>
                            <td><bean:write name="ALLSTUDENTDATA" property="studentRegnBeforeAdmisnId"/></td>
                            <td><bean:write name="ALLSTUDENTDATA" property="trainingCategoryId"/></td>
                            <td><bean:write name="ALLSTUDENTDATA" property="trainingCourseId"/></td>
                            <td><bean:write name="ALLSTUDENTDATA" property="batchId"/></td>
                            <td><bean:write name="ALLSTUDENTDATA" property="enrollmentstatus"/></td>
                            <td><bean:write name="ALLSTUDENTDATA" property="regnDate"/></td>
                            <logic:equal name="ALLSTUDENTDATA" property="enrollmentstatus" value="Not Enrolled">
                                <td><a href="#">Delete</a></td>
                            </logic:equal>
                        </tr>
                        <tr>
                            <td>Text</td>
                            <td>Text</td>
                            <td>Text</td>
                            <td>Text</td>
                            <td>Text</td>
                            <td>Text</td>
                            <td>Text</td>
                            <td>Text</td>
                        </tr>
                        <tr>
                            <td>Text</td>
                            <td>Text</td>
                            <td>Text</td>
                            <td>Text</td>
                            <td>Text</td>
                            <td>Text</td>
                            <td>Text</td>
                            <td>Text</td>
                        </tr>
                        <tr>
                            <td>Text</td>
                            <td>Text</td>
                            <td>Text</td>
                            <td>Text</td>
                            <td>Text</td>
                            <td>Text</td>
                            <td>Text</td>
                            <td>Text</td>
                        </tr>
                    </table>
                </logic:present>                  
            </div>
        </div>
    </article>
</html>
