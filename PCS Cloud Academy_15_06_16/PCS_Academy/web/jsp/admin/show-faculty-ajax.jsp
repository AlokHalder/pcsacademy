<%@page import="in.pcsacademy.model.vo.FacultyVo"%>
<%@page import="java.util.List"%>
<%@page import="in.pcsacademy.model.daoimpl.AdminDaoImpl"%>



<option value="">Select</option>
<%
    //int trainingCourseId = 1;
    int trainingCourseId = Integer.parseInt(request.getParameter("tcoid"));
    //out.println(trainingCategoryId);
    AdminDaoImpl adminDaoImpl = new AdminDaoImpl();
    List<FacultyVo> facultyList = adminDaoImpl.showFacultyWRTCourseId(trainingCourseId);

    for (FacultyVo facultyVo : facultyList) {
        int facultyId = facultyVo.getFacultyId();
        String facultyName = facultyVo.getFacultyName();
%>
<option value="<%=facultyId%>"><%=facultyName%></option>
<%}%>
