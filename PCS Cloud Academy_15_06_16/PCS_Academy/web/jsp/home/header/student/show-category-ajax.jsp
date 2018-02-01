<%@page import="in.pcsacademy.model.vo.TrainingCategoryVo"%>
<%@page import="in.pcsacademy.model.daoimpl.StudentDaoImpl"%>
<%@page import="in.pcsacademy.model.vo.StudentRegistrationVo"%>
<%@page import="in.pcsacademy.model.vo.TrainingCourseVo"%>
<%@page import="java.util.List"%>
<%@page import="in.pcsacademy.model.daoimpl.AdminDaoImpl"%>
<%@page import="java.sql.*" %>


<option value="">Select</option>
<%
    //int trainingCategoryId = Integer.parseInt(request.getParameter("tcid"));
    //out.println(trainingCategoryId);
    StudentDaoImpl adminDaoImpl = new StudentDaoImpl();
    List<TrainingCategoryVo> trainingCategoryList = adminDaoImpl.showTrainingCategory();

    for (TrainingCategoryVo trainingCategoryVo : trainingCategoryList) {
        int trainingCategoryId = trainingCategoryVo.getTrainingCategoryId();
        String trainingCategoryName = trainingCategoryVo.getTrainingCategoryName();
%>
<option value="<%=trainingCategoryId%>"><%=trainingCategoryName%></option>
<%}%>