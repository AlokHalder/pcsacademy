<%@page import="in.pcsacademy.model.daoimpl.StudentDaoImpl"%>
<%@page import="in.pcsacademy.model.vo.StudentRegistrationVo"%>
<%@page import="in.pcsacademy.model.vo.TrainingCourseVo"%>
<%@page import="java.util.List"%>
<%@page import="in.pcsacademy.model.daoimpl.AdminDaoImpl"%>
<%@page import="java.sql.*" %>


<option value="">Select</option>
<%
    int trainingCategoryId = Integer.parseInt(request.getParameter("tcid"));
    //out.println(trainingCategoryId);
    StudentDaoImpl studentDaoImpl = new StudentDaoImpl();
    List<TrainingCourseVo> trainingCourseList = studentDaoImpl.showTrainingCourseWRTCategoryId(trainingCategoryId);

    for (TrainingCourseVo trainingCourseVo : trainingCourseList) {
        int trainingCourseId = trainingCourseVo.getTrainingCourseId();
        String trainingCourseName = trainingCourseVo.getTrainingCourseName();
%>
<option value="<%=trainingCourseId%>"><%=trainingCourseName%></option>
<%}%>