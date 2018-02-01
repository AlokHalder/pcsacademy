<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>

<%
    response.sendRedirect("http://www.pcscloudacademy.com/download/RegistrationForm-BeforeAdmission.pdf");
    //String filePath = request.getContextPath() + "/jsp/home/download/RegistrationForm-BeforeAdmission.docx";
  //  String filePath = "RegistrationForm-BeforeAdmission.docx";
    //out.println(filePath);
    //java.net.URL file = application.getResource("http://www.pcsacademy.in/download/RegistrationForm-BeforeAdmission.docx");
   /* java.net.URL file = application.getResource(filePath);
    out.println(file);
    InputStream fileToDownload = (InputStream) file.openStream();
    ServletOutputStream output = response.getOutputStream();
    response.setContentType("application/msoffice");
    response.setHeader("Content-Disposition", "attachment; filename=RegistrationForm-BeforeAdmission.docx");
    response.setContentLength(fileToDownload.available());
    int c;
    while ((c = fileToDownload.read()) != -1) {
        output.write(c);
    }
    output.flush();
    output.close();
    fileToDownload.close();
    */       
%>