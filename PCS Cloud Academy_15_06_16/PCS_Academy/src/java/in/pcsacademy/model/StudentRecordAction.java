/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.pcsacademy.model;

import in.pcsacademy.vo.StudentRecordVO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author PCS Global
 */
public class StudentRecordAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        StudentRecordBean srb= new StudentRecordBean();
        StudentRecordModel srm= new StudentRecordModel();
        int student_regn_id=0;
        if(null!=request.getParameter("student_regn_id")){
            student_regn_id=Integer.parseInt(request.getParameter("student_regn_id"));
            
        }
        
        if(0!=srb.getStudent_regn_id()){
            student_regn_id=srb.getStudent_regn_id();
        }
        
        if(0!=student_regn_id){
            StudentRecordVO srv=srm.viewStudentRecord(student_regn_id);
            srb.setStudent_regn_id(srv.getStudent_regn_id());
            srb.setSalutation(srv.getSalutation());
            srb.setFirst_name(srv.getFirst_name());
            srb.setLast_name(srv.getLast_name());
            srb.setDob(srv.getDob());
            srb.setState(srv.getState());
            srb.setCity(srv.getCity());
            srb.setEmail_id(srv.getEmail_id());
            srb.setMobile(srv.getMobile());
            srb.setCollege_name(srv.getCollege_name());
            srb.setCollege_state(srv.getCollege_state());
            srb.setCollege_city(srv.getCollege_city());
            srb.setUniversity(srv.getUniversity());
            srb.setStream(srv.getStream());
            srb.setPersuing_qualification(srv.getPersuing_qualification());
            srb.setPassing_year(srv.getPassing_year());
            srb.setSemester(srv.getSemester());
            srb.setHow_find_us(srv.getHow_find_us());
            srb.setRegn_date(srv.getRegn_date());
        }
        return mapping.findForward(SUCCESS);
    }
}
