<%@page import="in.pcsacademy.model.vo.AdminDetailsVo"%>
<%@taglib uri="/WEB-INF/struts-html.tld" prefix= "html" %>
<%@taglib uri="/WEB-INF/struts-bean.tld" prefix= "bean" %>


<%
    AdminDetailsVo adminDetailsVo = (AdminDetailsVo) session.getAttribute("ADMINDETAILS");
    int desigCode = adminDetailsVo.getDesigCode();
%>
<% if (desigCode == 1) {%>
<!--HR permissions...-->
<table>
    <tr>
            <td>
            <html:link action="viewSearchEditDelete-Student" style="text-decoration:none;">View/Search/Edit-Student</html:link>
            </td>
        </tr>
        <tr>
            <td>
            <html:link action="viewSearchEditDelete-course" style="text-decoration:none;">View/Search/Edit/Delete-TrainingCourse</html:link>
            </td>
        </tr>
        <tr>
            <td>
            <html:link action="addtrainingcatg" style="text-decoration:none;">Add-Training Category</html:link>
            </td>
        </tr>
        <tr>
            <td>
            <html:link action="viewSearchEditDelete-category" style="text-decoration:none">View/Edit/Delete-TrainingCategory</html:link>
            </td>
        </tr>
         <tr>
            <td>
            <html:link action="addtrainingcourse" style="text-decoration:none;">Add-Training Course</html:link>
            </td>
        </tr>
    
        
        
        <tr>
            <td>
            <html:link action="viewSearchEditDelete-batch" style="text-decoration:none;">View/Search/Edit/Delete-TrainingBatch</html:link>
            </td>
        </tr>
        
        
        <tr>
            <td>
            <html:link action="payViewSearch-StudentDuePayment" style="text-decoration:none;">Pay/View/Search-StudentDuePayment</html:link>
            </td>
        </tr>
        
        <tr>
            <td>
            <html:link action="viewcontactmsg" style="text-decoration:none;">View-Contact Message</html:link>
            </td>
        </tr>

        <tr>
            <td>
            <html:link action="viewSearch-StudentFeedBack" style="text-decoration:none;">View/Search-Student FeedBack</html:link>
            </td>
        </tr>
 
        <tr>
            <td>
            <html:link action="studentFeedBackInsertion" style="text-decoration:none;">Student FeedBack Insertion</html:link>
            </td>
        </tr>

        <tr>
            <td>
            <html:link action="addfaculty" style="text-decoration:none;">Add-Faculty</html:link>
            </td>
        </tr>

        <tr>
            <td>
            <html:link action="addTrainingBatch" style="text-decoration:none;">Add-Training Batch</html:link>
            </td>
        </tr>

        <tr>
            <td>
            <html:link action="addstudentdetails" style="text-decoration:none;">Add-Student</html:link>
            </td>
        </tr>

        <tr>
            <td>
            <html:link action="viewSearchEditDelete-faculty" style="text-decoration:none;">View/Search/Edit/Delete-Faculty</html:link>
            </td>
        </tr>

        <tr>
        <td>
            <html:link action="changeAdminPassword" style="text-decoration:none;">Change-Password</html:link>
            </td>
        </tr>

        
    </table>
<%}%>
<%if (desigCode == 2) {%>
<!--Help Desk permissions...-->
<a href="" style="text-decoration: none">Help Desk menu</a>
<%}%>