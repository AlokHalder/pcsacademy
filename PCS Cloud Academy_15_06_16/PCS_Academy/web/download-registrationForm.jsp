<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>

<%
    String filePath = "/jsp/home/download/RegistrationForm-BeforeAdmission.docx";
    //String filePath = "/download/RegistrationForm-BeforeAdmission.pdf";
    java.net.URL file = application.getResource(filePath);
    //out.println(file);
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

//    int len = filePath.length();
//    byte[] rb = new byte[len];
//    InputStream readImg = (InputStream) file.openStream();
//    int index = readImg.read(rb, 0, len);
//    //st1.close();
//    response.reset();
//    response.setContentType("application/msoffice");
//    response.setHeader("Content-Disposition", "attachment; filename=RegistrationForm-BeforeAdmission.docx");
//    response.getOutputStream().write(rb, 0, len);
//    response.getOutputStream().flush();

%>