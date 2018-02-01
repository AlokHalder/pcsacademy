package in.pcsacademy.controller;

import in.pcsacademy.model.daoimpl.StudentDaoImpl;
import in.pcsacademy.model.dto.SendMsgDto;
import in.pcsacademy.model.dto.StudentRegistrationDto;
import in.pcsacademy.model.vo.SendMsgVo;
import in.pcsacademy.model.vo.StudentRegistrationVo;
import java.util.ResourceBundle;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;
import in.pcsacademy.common.DateTime;
import in.pcsacademy.model.vo.TrainingCategoryVo;
import in.pcsacademy.model.vo.TrainingCourseVo;
import java.util.List;
import javax.servlet.http.HttpSession;

public class StudentCon extends MappingDispatchAction {

    private static final String SUCCESS = "success";
    private static final String ERROR = "error";

    ResourceBundle bundle = ResourceBundle.getBundle("in.pcsacademy.properties.MessageProperty");

    HttpSession session;

    /*---- 
     To make registration of students by him/her self, before getting admission
     ----*/
    public ActionForward trainneregBeforeAdmisn(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response
    ) throws Exception {

        String regis_status = request.getParameter("quick_reg");

        StudentRegistrationDto srbaDto = (StudentRegistrationDto) form;
        StudentRegistrationVo srbaVo = new StudentRegistrationVo();

        srbaVo.setTrainingCategoryId(srbaDto.getTrainingCategoryId());
        srbaVo.setTrainingCourseId(srbaDto.getTrainingCourseId());
        srbaVo.setSalutation(srbaDto.getSalutation());
        srbaVo.setDob(srbaDto.getDob());
        srbaVo.setFirstName(srbaDto.getFirstName());
        srbaVo.setLastName(srbaDto.getLastName());
        srbaVo.setState(srbaDto.getState());
        srbaVo.setCity(srbaDto.getCity());
        srbaVo.setEmailId(srbaDto.getEmailId());
        srbaVo.setMobile(srbaDto.getMobile());
        srbaVo.setPassword(srbaDto.getPassword());
        srbaVo.setCollegeState(srbaDto.getCollegeState());
        srbaVo.setCollegeCity(srbaDto.getCollegeCity());
        srbaVo.setCollegeName(srbaDto.getCollegeName());
        srbaVo.setBranch(srbaDto.getBranch());
        srbaVo.setUniversity(srbaDto.getUniversity());
        srbaVo.setPersuingQualification(srbaDto.getPersuingQualification());
        srbaVo.setPassingYear(srbaDto.getPassingYear());
        srbaVo.setSemester(srbaDto.getSemester());
        srbaVo.setHowfindus(srbaDto.getHowfindus());
        srbaVo.setRegnDate(DateTime.getTodayDate());

        StudentDaoImpl sdaoimpl = new StudentDaoImpl();

        if ((regis_status != null) && (regis_status.equals("quick registration"))) {

            if (sdaoimpl.getQuickRegisteredBeforeAdmission(srbaVo)) {

                int id = sdaoimpl.showDetails();
                String pwd = srbaDto.getPassword();
                request.setAttribute("uid", id);
                request.setAttribute("pass", pwd);
                srbaDto.reset(mapping, request);
                return mapping.findForward(SUCCESS);

            }
        }

        if (sdaoimpl.getRegisteredBeforeAdmission(srbaVo)) {
            int id = sdaoimpl.showDetails();
            String pwd = srbaDto.getPassword();
            request.setAttribute("uid", id);
            request.setAttribute("pass", pwd);
            srbaDto.reset(mapping, request);
            return mapping.findForward(SUCCESS);
        } else {
            return mapping.findForward(ERROR);
        }

        //srbaDto.reset(mapping, request);
        //return mapping.findForward(SUCCESS);
    }

    public ActionForward studentRegnBeforeAdmsn(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response
    ) throws Exception {

        StudentRegistrationDto srbaDto = (StudentRegistrationDto) form;
        StudentDaoImpl sdaoimpl = new StudentDaoImpl();
        List<TrainingCategoryVo> allCategory = sdaoimpl.showTrainingCategory();
        request.setAttribute("ALLTRAININGCATEGORY", allCategory);
        List<TrainingCourseVo> allCourse = sdaoimpl.showTrainingCourse();
        request.setAttribute("ALLTRAININGCOURSE", allCourse);

        return mapping.findForward(SUCCESS);
    }
    /*---- 
     Student Login
     ----*/

    public ActionForward doStudentLogin(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response
    ) throws Exception {

        StudentRegistrationDto srbaDto = (StudentRegistrationDto) form;
        StudentRegistrationVo srbaVo = new StudentRegistrationVo();
        srbaVo.setStudentRegnBeforeAdmisnId(srbaDto.getStudentRegnBeforeAdmisnId());
        srbaVo.setPassword(srbaDto.getPassword());
        //System.out.println(srbaDto.getStudentRegnBeforeAdmisnId() + "" + srbaDto.getPassword());

        StudentDaoImpl sdaoimpl = new StudentDaoImpl();
        srbaVo = sdaoimpl.doStudentLogin(srbaVo);
        if (srbaVo.getStudentLogInId() != 0) {
            session = request.getSession(true);
            session.setAttribute("ALLSTUDENTDATA", srbaVo);

            form.reset(mapping, request);
            return mapping.findForward(SUCCESS);
        } else {
            String studentLogoutFailMsg = bundle.getString("STUDENT_LOGIN_FAIL_MSG");
            request.setAttribute("STUDENT_LOGIN_FAIL_MSG", studentLogoutFailMsg);
            form.reset(mapping, request);
            return mapping.findForward(ERROR);
        }
    }
    /*---- 
     Student Logout
     ----*/

    public ActionForward doStudentlogout(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        session = request.getSession();
        session.removeAttribute("ALLSTUDENTDATA");
        session.invalidate();

        String studentLogoutSuccessMsg = bundle.getString("STUDENT_LOGOUT_SUCCESS_MSG");
        request.setAttribute("STUDENT_LOGOUT_SUCCESS_MSG", studentLogoutSuccessMsg);
        return mapping.findForward(SUCCESS);

    }

    public ActionForward studentSelectedCourseDetails(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response
    ) throws Exception {

        session = request.getSession(true);
        if (session.getAttribute("ALLSTUDENTDATA") != null) {
            StudentRegistrationVo ALLSTUDENTDATA = (StudentRegistrationVo) session.getAttribute("ALLSTUDENTDATA");

            request.setAttribute("ALLSTUDENTDATA", ALLSTUDENTDATA);
            return mapping.findForward(SUCCESS);
        } else {
            String studentLogoutFailMsg = bundle.getString("STUDENT_LOGIN_FAIL_MSG");
            request.setAttribute("studentLogoutFailMsg", studentLogoutFailMsg);
            return mapping.findForward(ERROR);
        }

    }

//need to 
    public ActionForward registrationDetails(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response
    ) throws Exception {

        session = request.getSession(true);
        if (session.getAttribute("ALLSTUDENTDATA") != null) {
            StudentRegistrationVo ALLSTUDENTDATA = (StudentRegistrationVo) session.getAttribute("ALLSTUDENTDATA");

            request.setAttribute("ALLSTUDENTDATA", ALLSTUDENTDATA);
            return mapping.findForward(SUCCESS);
        } else {
            String studentLogoutFailMsg = bundle.getString("STUDENT_LOGIN_FAIL_MSG");
            request.setAttribute("studentLogoutFailMsg", studentLogoutFailMsg);
            return mapping.findForward(ERROR);
        }

    }

    public ActionForward paymentDetails(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response
    ) throws Exception {

        session = request.getSession(true);
        if (session.getAttribute("ALLSTUDENTDATA") != null) {
            StudentRegistrationVo ALLSTUDENTDATA = (StudentRegistrationVo) session.getAttribute("ALLSTUDENTDATA");
            StudentDaoImpl sdaoimpl = new StudentDaoImpl();

            List<StudentRegistrationVo> paymentlist = sdaoimpl.paymentDetails(ALLSTUDENTDATA.getStudentRegnBeforeAdmisnId());
            request.setAttribute("STUDENTPAYMENTDETAILS", paymentlist);
            return mapping.findForward(SUCCESS);
        } else {
            String studentLogoutFailMsg = bundle.getString("STUDENT_LOGIN_FAIL_MSG");
            request.setAttribute("studentLogoutFailMsg", studentLogoutFailMsg);
            return mapping.findForward(ERROR);
        }

    }

//    public ActionForward logout(
//            ActionMapping mapping,
//            ActionForm form,
//            HttpServletRequest request,
//            HttpServletResponse response) throws Exception {
//
//        session = request.getSession(true);
//        session.removeAttribute("ALLSTUDENTDATA");
//        session.invalidate();
//
//        String studentLogoutSuccessMsg = bundle.getString("STUDENT_LOGOUT_SUCCESS_MSG");
//        request.setAttribute("STUDENT_LOGOUT_SUCCESS_MSG", studentLogoutSuccessMsg);
//        return mapping.findForward(SUCCESS);
//
//    }
    /*---- 
     To check whether student is already beed logged-in or not
     ----*/
    public ActionForward doLoggedinCheck(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        if ((request.getSession()).getAttribute("ALLSTUDENTDATA") != null) {
            return mapping.findForward(SUCCESS);
        } else {
            return mapping.findForward(ERROR);
        }
    }

    /*---- 
     To send message by students, for collecting informations before getting admission
     ----*/
    public ActionForward sendContactMsg(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response
    ) throws Exception {

        SendMsgDto smdto = (SendMsgDto) form;
        StudentDaoImpl smdaoimpl = new StudentDaoImpl();
        SendMsgVo smvo = new SendMsgVo();

        String name = smdto.getName();
        String email = smdto.getEmail();
        String phone = smdto.getPhone();
        String massage = smdto.getMassage();

        smvo.setName(name);
        smvo.setEmail(email);
        smvo.setPhone(phone);
        smvo.setMassage(massage);
        boolean bb = smdaoimpl.sendContactMsg(smvo);
        System.out.println(bb);

        if (bb) {
            String feedbackSubmitSuccessMessage = bundle.getString("CONTACT_MSG_SUBMIT_SUCCESS_MSG");
            request.setAttribute("CONTACT_MSG_SUBMIT_SUCCESS_MSG", feedbackSubmitSuccessMessage);
            return mapping.findForward(SUCCESS);
        } else {
            String feedbackSubmitFailMessage = bundle.getString("CONTACT_MSG_SUBMIT_FAIL_MSG");
            request.setAttribute("CONTACT_MSG_SUBMIT_FAIL_MSG", feedbackSubmitFailMessage);
            return mapping.findForward(ERROR);
        }

    }

}
