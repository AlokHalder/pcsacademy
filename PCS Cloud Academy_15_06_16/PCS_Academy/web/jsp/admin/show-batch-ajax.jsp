<%@page import="in.pcsacademy.model.vo.BatchVo"%>
<%@page import="java.util.List"%>
<%@page import="in.pcsacademy.common.DateTime"%>
<%@page import="in.pcsacademy.model.daoimpl.AdminDaoImpl"%>



<option value="">Select</option>
<%
    int trainingCourseId = Integer.parseInt(request.getParameter("trainingCourseId"));
    String currentYear = DateTime.getCurrentYear();
    //out.println(trainingCourseId + " " + currentYear);

    AdminDaoImpl adminDaoImpl = new AdminDaoImpl();
    List<BatchVo> batchList = adminDaoImpl.showBatchWRTCourseIdAndYear(trainingCourseId, currentYear);
    for (BatchVo batchVo : batchList) {
        int batchId = batchVo.getBatchId();
        //String batchName = batchId;
%>
<option value="<%=batchId%>"><%=batchId%></option>
<%}%>