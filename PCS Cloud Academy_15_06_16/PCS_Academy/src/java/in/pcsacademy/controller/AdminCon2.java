package in.pcsacademy.controller;

import in.pcsacademy.common.DateTime;
import in.pcsacademy.model.daoimpl.AdminDaoImpl;
import in.pcsacademy.model.dto.BatchDto;
import in.pcsacademy.model.dto.FacultyDto;
import in.pcsacademy.model.dto.StudentPaymentDto;
import in.pcsacademy.model.dto.StudentRegistrationDto;
import in.pcsacademy.model.dto.TrainingCategoryDto;
import in.pcsacademy.model.dto.TrainingCourseDto;
import in.pcsacademy.model.vo.BatchVo;
import in.pcsacademy.model.vo.FacultyVo;
import in.pcsacademy.model.vo.SendMsgVo;
import in.pcsacademy.model.vo.StudentPaymentVO;
import in.pcsacademy.model.vo.StudentRegistrationVo;
import in.pcsacademy.model.vo.TrainingCategoryVo;
import in.pcsacademy.model.vo.TrainingCourseVo;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.ResourceBundle;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;

public class AdminCon2 extends MappingDispatchAction {

    private final static String SUCCESS = "success";
    private final static String ERROR = "error";
    ResourceBundle bundle = ResourceBundle.getBundle("in.pcsacademy.properties.MessageProperty");

    /*---- 
     To add new training type category as an admin
     ----*/
    public ActionForward addTrainingCategory(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        TrainingCategoryDto tcdto = (TrainingCategoryDto) form;
        //System.out.println(tcdto.getTraining_category_name());
        TrainingCategoryVo tcvo = new TrainingCategoryVo();
        tcvo.setTrainingCategoryName(tcdto.getTrainingCategoryName());
        AdminDaoImpl adaoimpl = new AdminDaoImpl();
        int result = adaoimpl.addTrainingCategory(tcvo);
        if (result > 0) {
            List<TrainingCategoryVo> list = adaoimpl.showTrainingCategory();
            request.setAttribute("showcategory", list);
            String addTrainingCategorySuccessMsg = bundle.getString("ADD_TRAINING_CATG_SUCCESS_MSG");
            request.setAttribute("ADD_TRAINING_CATG_SUCCESS_MSG", addTrainingCategorySuccessMsg);
            tcdto.reset(mapping, request);
            return mapping.findForward(SUCCESS);
        } else {
            List<TrainingCategoryVo> list = adaoimpl.showTrainingCategory();
            request.setAttribute("showcategory", list);
            String addTrainingCategoryFailMsg = bundle.getString("ADD_TRAINING_CATG_FAIL_MSG");
            request.setAttribute("ADD_TRAINING_CATG_FAIL_MSG", addTrainingCategoryFailMsg);
            return mapping.findForward(ERROR);
        }

    }

    /*---- 
     To see training category as an admin
     ----*/
    public ActionForward showTrainingCategory(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        AdminDaoImpl adaoimpl = new AdminDaoImpl();
        List<TrainingCategoryVo> list = adaoimpl.showTrainingCategory();

        request.setAttribute("showcategory", list);
        return mapping.findForward(SUCCESS);

    }

    /*---- 
     To add new training course as an admin
     ----*/
    public ActionForward addTrainingCourse(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        TrainingCourseDto trainingCourseDto = (TrainingCourseDto) form;
        TrainingCourseVo trainingCourseVo = new TrainingCourseVo();
        trainingCourseVo.setTrainingCourseName(trainingCourseDto.getTrainingCourseName());
        trainingCourseVo.setTrainingCategoryId(trainingCourseDto.getTrainingCategoryId());
        trainingCourseVo.setTrainingCourseContent(trainingCourseDto.getTrainingCourseContent());
        trainingCourseVo.setTrainingCourseDuration(trainingCourseDto.getTrainingCourseDuration());
        trainingCourseVo.setTrainingCourseFees(trainingCourseDto.getTrainingCourseFees());
        System.out.println(trainingCourseDto.getTrainingCategoryId() + " " + trainingCourseDto.getTrainingCourseName() + " " + trainingCourseDto.getTrainingCourseContent() + " " + trainingCourseDto.getTrainingCourseDuration() + " " + trainingCourseDto.getTrainingCourseFees());

        AdminDaoImpl adaoimpl = new AdminDaoImpl();
        int result = adaoimpl.addTrainingCourse(trainingCourseVo);
        if (result > 0) {
            List<TrainingCourseVo> list = adaoimpl.showTrainingCourse();
            List<TrainingCategoryVo> allCategory = adaoimpl.showTrainingCategory();
            request.setAttribute("ALLTRAININGCATEGORY", allCategory);
            request.setAttribute("showcourse", list);
            String addTrainingCourseSuccessMsg = bundle.getString("ADD_TRAINING_COURSE_SUCCESS_MSG");
            request.setAttribute("ADD_TRAINING_COURSE_SUCCESS_MSG", addTrainingCourseSuccessMsg);
            trainingCourseDto.reset(mapping, request);
            return mapping.findForward(SUCCESS);
        } else {
            List<TrainingCourseVo> list = adaoimpl.showTrainingCourse();
            List<TrainingCategoryVo> allCategory = adaoimpl.showTrainingCategory();
            request.setAttribute("ALLTRAININGCATEGORY", allCategory);
            request.setAttribute("showcourse", list);
            String addTrainingCourseFailMsg = bundle.getString("ADD_TRAINING_COURSE_FAIL_MSG");
            request.setAttribute("ADD_TRAINING_COURSE_FAIL_MSG", addTrainingCourseFailMsg);
            return mapping.findForward(ERROR);
        }

    }

    /*---- 
     To see training course as an admin
     ----*/
    public ActionForward showTrainingCourse(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        AdminDaoImpl adaoimpl = new AdminDaoImpl();
        TrainingCourseDto trainingcousedto = (TrainingCourseDto) form;
        //to search training course
        int trainingcategoryId = trainingcousedto.getTrainingCategoryId();
        String trainingcoursename = trainingcousedto.getTrainingCourseName();

        if (trainingcategoryId != 0 || (trainingcoursename != null && trainingcoursename != "")) {
            TrainingCourseVo trainingCourseVo = new TrainingCourseVo();
            trainingCourseVo.setTrainingCategoryId(trainingcategoryId);
            trainingCourseVo.setTrainingCourseName(trainingcoursename);
            List<TrainingCourseVo> list = adaoimpl.searchTrainingCourse(trainingCourseVo);
            List<TrainingCourseVo> allcoursedistinict = adaoimpl.showCourseName();
            List<TrainingCategoryVo> allCategory = adaoimpl.showTrainingCategory();
            Set<TrainingCategoryVo> allcategorydistinict = new HashSet<TrainingCategoryVo>(allCategory);

            request.setAttribute("showcourse", list);
            request.setAttribute("ALLTRAININGCOURSEDIST", allcoursedistinict);
            request.setAttribute("ALLTRAININGCATEGORYDIST", allcategorydistinict);
            return mapping.findForward(SUCCESS);
        }

        //To show all courses...
        List<TrainingCourseVo> list1 = adaoimpl.showTrainingCourse();
        List<TrainingCourseVo> allcoursedistinict = adaoimpl.showCourseName();

        request.setAttribute("ALLTRAININGCOURSEDIST", allcoursedistinict);
        List<TrainingCategoryVo> allCategory = adaoimpl.showTrainingCategory();
        Set<TrainingCategoryVo> allcategorydistinict = new HashSet<TrainingCategoryVo>(allCategory);
        request.setAttribute("ALLTRAININGCATEGORYDIST", allcategorydistinict);
        request.setAttribute("ALLTRAININGCATEGORY", allCategory);
        request.setAttribute("showcourse", list1);

        return mapping.findForward(SUCCESS);
    }

    public ActionForward viewCourseContent(ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) {
        AdminDaoImpl adaoimpl = new AdminDaoImpl();
        TrainingCourseDto trainingcousedto = (TrainingCourseDto) form;
        int trainingcourseId = Integer.parseInt(request.getParameter("cid"));
        List<TrainingCourseVo> list = adaoimpl.showTrainingCourse();

        request.setAttribute("showcourse", list);

        List<TrainingCourseVo> allcoursedistinict = adaoimpl.showCourseName();

        //System.out.println(allcoursedistinict);
        //Set<TrainingCourseVo> allcoursedistinict = new HashSet<TrainingCourseVo>(list1);
        request.setAttribute("ALLTRAININGCOURSEDIST", allcoursedistinict);

        List<TrainingCategoryVo> allCategory = adaoimpl.showTrainingCategory();
        Set<TrainingCategoryVo> allcategorydistinict = new HashSet<TrainingCategoryVo>(allCategory);
        request.setAttribute("ALLTRAININGCATEGORYDIST", allcategorydistinict);
        //System.out.println("value="+trainingcousedto.getTrainingCategoryId());
        TrainingCourseVo tvo = adaoimpl.showCourseContents(trainingcourseId);

        request.setAttribute("showcontent", tvo);

        return mapping.findForward(SUCCESS);

    }

    public ActionForward deleteTrainingCourse(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        TrainingCourseDto trainingcousedto = (TrainingCourseDto) form;
        AdminDaoImpl adaoimpl = new AdminDaoImpl();
        //for search training course
        //System.out.println("value category ="+trainingcousedto.getTrainingCategoryId());
        //System.out.println("value course="+trainingcousedto.getTrainingCourseId());
        //int trainingcategoryId=trainingcousedto.getTrainingCategoryId();
        int trainingcourseId = Integer.parseInt(request.getParameter("id"));
        System.out.println("value id=" + trainingcourseId);
        //TrainingCourseVo trainingCourseVo = new TrainingCourseVo();
        //trainingCourseVo.setTrainingCategoryId(trainingcategoryId);
        //trainingCourseVo.setTrainingCourseId(trainingcourseId);
        System.out.println("i am here ");
        //System.out.println("value="+trainingcousedto.getTrainingCategoryId());
        int result = adaoimpl.deleteTrainingCourse(trainingcourseId);

        //List<TrainingCategoryVo> allCategory = adaoimpl.searchTrainingCategory(trainingcousedto.getTrainingCategoryId());
        //request.setAttribute("ALLTRAININGCATEGORY", allCategory);
        //request.setAttribute("showcourse", list);
        List<TrainingCourseVo> list = adaoimpl.showTrainingCourse();
        request.setAttribute("showcourse", list);
        return mapping.findForward(SUCCESS);

        //To show all courses...
        //request.setAttribute("ALLTRAININGCATEGORY", allCategory);
        //request.setAttribute("showcourse", list);
    }

    // code for update
    public ActionForward updateTrainingCourse(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        AdminDaoImpl adaoimpl = new AdminDaoImpl();
        TrainingCourseDto trainingcousedto = (TrainingCourseDto) form;

        String updetebtclick = request.getParameter("updatecourse");
        System.out.println("click=" + updetebtclick);
        if ((updetebtclick != null) && (updetebtclick.equals("updatetrainingcourse"))) {
            System.out.println("id=" + trainingcousedto.getTrainingCourseId());
            System.out.println("content=" + trainingcousedto.getTrainingCourseContent());
            System.out.println("duration=" + trainingcousedto.getTrainingCourseDuration());
            System.out.println("fees=" + trainingcousedto.getTrainingCourseFees());

            TrainingCourseVo trainingCourseVo = new TrainingCourseVo();

            trainingCourseVo.setTrainingCourseId(trainingcousedto.getTrainingCourseId());

            trainingCourseVo.setTrainingCourseContent(trainingcousedto.getTrainingCourseContent());

            trainingCourseVo.setTrainingCourseDuration(trainingcousedto.getTrainingCourseDuration());

            trainingCourseVo.setTrainingCourseFees(trainingcousedto.getTrainingCourseFees());

            int result = adaoimpl.UpdateTrainingCourse(trainingCourseVo);

            List<TrainingCourseVo> list = adaoimpl.showTrainingCourse();

            List<TrainingCourseVo> allcoursedistinict = adaoimpl.showCourseName();

            //System.out.println(allcoursedistinict);
            //Set<TrainingCourseVo> allcoursedistinict = new HashSet<TrainingCourseVo>(list1);
            request.setAttribute("ALLTRAININGCOURSEDIST", allcoursedistinict);

            List<TrainingCategoryVo> allCategory = adaoimpl.showTrainingCategory();
            Set<TrainingCategoryVo> allcategorydistinict = new HashSet<TrainingCategoryVo>(allCategory);
            request.setAttribute("ALLTRAININGCATEGORYDIST", allcategorydistinict);

            request.setAttribute("showcourse", list);

            return mapping.findForward(SUCCESS);
        }

        int trainingcourseId = Integer.parseInt(request.getParameter("id"));
        List<TrainingCourseVo> list = adaoimpl.showTrainingCourse();

        request.setAttribute("showcourse", list);

        List<TrainingCourseVo> allcoursedistinict = adaoimpl.showCourseName();

        //System.out.println(allcoursedistinict);
        //Set<TrainingCourseVo> allcoursedistinict = new HashSet<TrainingCourseVo>(list1);
        request.setAttribute("ALLTRAININGCOURSEDIST", allcoursedistinict);

        List<TrainingCategoryVo> allCategory = adaoimpl.showTrainingCategory();
        Set<TrainingCategoryVo> allcategorydistinict = new HashSet<TrainingCategoryVo>(allCategory);
        request.setAttribute("ALLTRAININGCATEGORYDIST", allcategorydistinict);
        //System.out.println("value="+trainingcousedto.getTrainingCategoryId());
        TrainingCourseVo tvo = adaoimpl.showForUpdateCourse(trainingcourseId);

        request.setAttribute("showcourseforupdate", tvo);

        return mapping.findForward(SUCCESS);
    }

    //viewSearchEditDelete of Category
    public ActionForward viewSearchEditDeleteCategory(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        AdminDaoImpl adaoimpl = new AdminDaoImpl();
        //code for update show
        String cid = request.getParameter("cid");
        if (cid != null) {
            int categoryid = Integer.parseInt(cid);
            System.out.println("my id=" + categoryid);
            TrainingCategoryVo allCategory = adaoimpl.showTrainingCategoryForUpdate(categoryid);
            List<TrainingCategoryVo> list = adaoimpl.showTrainingCategory();
            System.out.println("size=" + list.size());
            request.setAttribute("showcategory", list);
            request.setAttribute("showcategoryforupate", allCategory);
            return mapping.findForward(SUCCESS);
        }
        //code for update
        String updetebtclick = request.getParameter("updatecategory");
        if ((updetebtclick != null) && (updetebtclick.equals("updatetrainingcategory"))) {

            TrainingCategoryDto tcdto = (TrainingCategoryDto) form;
            //System.out.println(tcdto.getTraining_category_name());
            TrainingCategoryVo tcvo = new TrainingCategoryVo();
            tcvo.setTrainingCategoryId(tcdto.getTrainingCategoryId());
            tcvo.setTrainingCategoryName(tcdto.getTrainingCategoryName());
            int result = adaoimpl.UpdateTrainingCategory(tcvo);
            List<TrainingCategoryVo> list = adaoimpl.showTrainingCategory();
            request.setAttribute("showcategory", list);
            return mapping.findForward(SUCCESS);
        }
        List<TrainingCategoryVo> list = adaoimpl.showTrainingCategory();
        System.out.println("size=" + list.size());
        request.setAttribute("showcategory", list);
        return mapping.findForward(SUCCESS);
    }

    public ActionForward viewSearchEditDeletefaculty(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        AdminDaoImpl adminDaoImpl = new AdminDaoImpl();
        String updatefid = request.getParameter("fid");
        String updatefacultystatus = request.getParameter("updatefaculty");

        List<TrainingCourseVo> trainingCourseNames = adminDaoImpl.getTrainingCourseName();
        request.setAttribute("TRAININGCOURSENAMES", trainingCourseNames);

        if (updatefid != null) {
            int fid = Integer.parseInt(updatefid);
            System.out.println("faculty id=" + fid);
            FacultyVo fvo = adminDaoImpl.showfacultydetailsforupdate(fid);
            request.setAttribute("FACULTYUPDATE", fvo);
            List<FacultyVo> facultylist = adminDaoImpl.showFaculty();
            request.setAttribute("FACULTYLIST", facultylist);
            List<TrainingCourseVo> trainingCourseNames2 = adminDaoImpl.getTrainingCourseName();
            request.setAttribute("TRAININGCOURSESHOW", trainingCourseNames2);
            return mapping.findForward(SUCCESS);
        }

        if (updatefacultystatus != null && updatefacultystatus.equals("updatefacultydetails")) {
            FacultyDto fdto = (FacultyDto) form;
            FacultyVo fvo = new FacultyVo();
            fvo.setFacultyId(fdto.getFacultyId());
            fvo.setFacultyTechnology(fdto.getFacultyTechnology());
            fvo.setFacultyName(fdto.getFacultyName());
            fvo.setFacultyEmail(fdto.getFacultyEmail());
            fvo.setFacultyMobile(fdto.getFacultyMobile());
            fvo.setFacultyMobileAlt(fdto.getFacultyMobileAlt());
            fvo.setFacultyAddress(fdto.getFacultyAddress());
            fvo.setFacultyPassword(fdto.getFacultyPassword());
            int result = adminDaoImpl.updatefaculty(fvo);
            List<FacultyVo> facultylist = adminDaoImpl.showFaculty();
            System.out.println("data");
            System.out.println(facultylist);
            request.setAttribute("FACULTYLIST", facultylist);
            return mapping.findForward(SUCCESS);
        }
        String searchbtclick = request.getParameter("searchbtclick");

        if (searchbtclick != null && searchbtclick.equals("searchfacultydetails")) {
            FacultyDto fdto = (FacultyDto) form;
            FacultyVo fvo = new FacultyVo();
            fvo.setFacultyName(fdto.getFacultyName().toLowerCase());
            fvo.setFacultyTechnology(fdto.getFacultyTechnology().toLowerCase());
            List<FacultyVo> facultylist = adminDaoImpl.showSearchFaculty(fvo);
            request.setAttribute("FACULTYLIST", facultylist);
            return mapping.findForward(SUCCESS);
        }
        List<FacultyVo> facultylist = adminDaoImpl.showFaculty();
        System.out.println("data");
        System.out.println(facultylist);
        request.setAttribute("FACULTYLIST", facultylist);
        return mapping.findForward(SUCCESS);

    }

    /*---- 
     To see student contact messages as an admin
     ----*/
    public ActionForward viewContactMsg(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        AdminDaoImpl adminDaoImpl = new AdminDaoImpl();
        List<SendMsgVo> list = adminDaoImpl.showContactMsg();

        request.setAttribute("viewcontactmsg", list);
        return mapping.findForward(SUCCESS);

    }

    /*---- 
     To see brief Student details who haave registered as an admin
     ----*/
    public ActionForward viewStudentDetails(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        AdminDaoImpl adaoimpl = new AdminDaoImpl();
        List<StudentRegistrationVo> list = adaoimpl.showStudentDetails();
        request.setAttribute("showStudentdetails", list);
        return mapping.findForward(SUCCESS);

    }

    /*---- 
     To see Student registration details
     ----*/
    public ActionForward showStudentRegnDetails(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        String id = request.getParameter("id");
        int id2 = Integer.parseInt(id);
        //System.out.println(id2);
        AdminDaoImpl adaoimpl = new AdminDaoImpl();
        List<StudentRegistrationVo> list = adaoimpl.showStudentDetails();
        StudentRegistrationVo srbaVo = adaoimpl.showStudentRegnLoginDetails(id2);

        request.setAttribute("showStudentdetails", list);
        request.setAttribute("showStudentdetails2", srbaVo);
        return mapping.findForward(SUCCESS);

    }

    /*---- 
     To see Student login details
     ----*/
    public ActionForward showStudentLoginDetails(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        String id = request.getParameter("id");
        int id2 = Integer.parseInt(id);
        //System.out.println(id2);
        AdminDaoImpl adaoimpl = new AdminDaoImpl();
        List<StudentRegistrationVo> list = adaoimpl.showStudentDetails();
        StudentRegistrationVo srbaVo = adaoimpl.showStudentRegnLoginDetails(id2);

        request.setAttribute("showStudentdetails", list);
        request.setAttribute("showStudentdetails3", srbaVo);
        return mapping.findForward(SUCCESS);

    }

    /*---- 
     To Register Student After Admission as an admin
     ----*/
    public ActionForward addStudentDetails(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        AdminDaoImpl adaoimpl = new AdminDaoImpl();
        List<TrainingCategoryVo> allCategory = adaoimpl.showTrainingCategory();
        request.setAttribute("ALLTRAININGCATEGORY", allCategory);
        return mapping.findForward(SUCCESS);

    }

    /*---- 
     To Register Student After Admission as an admin2
     ----*/
    public ActionForward addStudentDetails2(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        StudentRegistrationDto sraaDto = (StudentRegistrationDto) form;
        //System.out.println(sraaDto.getTrainingCategoryId() + " " + sraaDto.getTrainingCourseId() + " " + sraaDto.getBatchId() + "" + sraaDto.getSalutation());
        StudentRegistrationVo sraaVo = new StudentRegistrationVo();
        sraaVo.setTrainingCategoryId(sraaDto.getTrainingCategoryId());
        sraaVo.setTrainingCourseId(sraaDto.getTrainingCourseId());

        AdminDaoImpl adaoimpl = new AdminDaoImpl();
        String trainingCourseFees = adaoimpl.getTrainingCourseFees(sraaVo);
        System.out.println(trainingCourseFees);
        request.setAttribute("TRAININGCOURSEFEES", trainingCourseFees);
        // HttpSession session = request.getSession();
        //  session.setAttribute("SRAADTO", sraaDto);

        return mapping.findForward(SUCCESS);

    }

    /*---- 
     To Register Student After Admission as an admin3
     ----*/
    public ActionForward addStudentDetails3(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        //HttpSession session = request.getSession();
        //StudentRegistrationAfterAdmissionDto sraaDtoFromSession = (StudentRegistrationAfterAdmissionDto) session.getAttribute("SRAADTO");
        StudentRegistrationDto sraaDto = (StudentRegistrationDto) form;
        //System.out.println(sraaDtoFromSession.getTrainingCategoryId() + " " + sraaDtoFromSession.getTrainingCourseId() + " " + sraaDtoFromSession.getBatchId() + "" + sraaDtoFromSession.getSalutation() + "" + sraaDto.getTotalPayableAmount() + "" + sraaDto.getPaidAmount());
        System.out.println("name=" + sraaDto.getFirstName());
        System.out.println("category id=" + sraaDto.getTrainingCategoryId());
        System.out.println("course id=" + sraaDto.getTrainingCourseId());
        System.out.println("batch id=" + sraaDto.getBatchId());
        System.out.println("salutation=" + sraaDto.getSalutation());
        System.out.println("last name=" + sraaDto.getLastName());
        System.out.println("state=" + sraaDto.getState());
        System.out.println("city=" + sraaDto.getCity());
        System.out.println("email=" + sraaDto.getEmailId());
        System.out.println("mobile=" + sraaDto.getMobile());
        System.out.println("collegeName=" + sraaDto.getCollegeName());
        System.out.println("branch=" + sraaDto.getBranch());
        System.out.println("university=" + sraaDto.getUniversity());
        System.out.println("persuingQualification=" + sraaDto.getPersuingQualification());
        System.out.println("passingYear=" + sraaDto.getPassingYear());
        System.out.println("semester=" + sraaDto.getSemester());
        System.out.println("dob=" + sraaDto.getDob());
        System.out.println("pass=" + sraaDto.getPassword());
        System.out.println("total pay=" + sraaDto.getTotalPayableAmount());
        System.out.println("paid amount=" + sraaDto.getPaidAmount());
        System.out.println("check no=" + sraaDto.getCheckNo());
        System.out.println("card no=" + sraaDto.getCardNo());
        System.out.println("card type=" + sraaDto.getCardType());
        System.out.println("expiry date=" + sraaDto.getExpirydt());
        System.out.println("cvv=" + sraaDto.getCvv());

        StudentRegistrationVo sraaVo = new StudentRegistrationVo();
        sraaVo.setFirstName(sraaDto.getFirstName());
        sraaVo.setLastName(sraaDto.getLastName());
        sraaVo.setEmailId(sraaDto.getEmailId());
        sraaVo.setMobile(sraaDto.getMobile());
        sraaVo.setDob(sraaDto.getDob());
        sraaVo.setPassword(sraaDto.getPassword());
        sraaVo.setTrainingCategoryId(sraaDto.getTrainingCategoryId());
        sraaVo.setTrainingCourseId(sraaDto.getTrainingCourseId());
        sraaVo.setBatchId(sraaDto.getBatchId());
        sraaVo.setSalutation(sraaDto.getSalutation());
        sraaVo.setState(sraaDto.getState());
        sraaVo.setCity(sraaDto.getCity());
        sraaVo.setCollegeName(sraaDto.getCollegeName());
        sraaVo.setCollegeCity(sraaDto.getCollegeCity());
        sraaVo.setCollegeState(sraaDto.getCollegeState());
        sraaVo.setBranch(sraaDto.getBranch());
        sraaVo.setPersuingQualification(sraaDto.getPersuingQualification());
        sraaVo.setUniversity(sraaDto.getUniversity());
        sraaVo.setSemester(sraaDto.getSemester());
        sraaVo.setPassingYear(sraaDto.getPassingYear());
        sraaVo.setTotalPayableAmount(sraaDto.getTotalPayableAmount());
        sraaVo.setPaidAmount(sraaDto.getPaidAmount());
        sraaVo.setCheckNo(sraaDto.getCheckNo());
        sraaVo.setCardNo(sraaDto.getCardNo());
        sraaVo.setCardType(sraaDto.getCardType());
        sraaVo.setExpirydt(sraaDto.getExpirydt());
        sraaVo.setCvv(sraaDto.getCvv());
        sraaVo.setRegnDate(DateTime.getTodayDate());
        sraaVo.setPayDate(DateTime.getTodayDate());
        //required business logic...
        AdminDaoImpl adaoimpl = new AdminDaoImpl();
        int result = adaoimpl.addStudentDetails(sraaVo);
        //if (result > 0) {
        List<TrainingCategoryVo> allCategory = adaoimpl.showTrainingCategory();
        request.setAttribute("ALLTRAININGCATEGORY", allCategory);
        //session.removeAttribute("SRAADTO");
        sraaDto.reset(mapping, request);
        return mapping.findForward(SUCCESS);
        //}

    }

    public ActionForward addFaculty(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        AdminDaoImpl adaoimpl = new AdminDaoImpl();
        List<TrainingCourseVo> trainingCourseNames = adaoimpl.getTrainingCourseName();
        request.setAttribute("TRAININGCOURSENAMES", trainingCourseNames);

        return mapping.findForward(SUCCESS);
    }

    public ActionForward addFaculty2(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        FacultyDto fdto = (FacultyDto) form;
        FacultyVo fvo = new FacultyVo();

        fvo.setFacultyTechnology(fdto.getFacultyTechnology());
        fvo.setFacultyName(fdto.getFacultyName());
        fvo.setFacultyEmail(fdto.getFacultyEmail());
        fvo.setFacultyMobile(fdto.getFacultyMobile());
        fvo.setFacultyMobileAlt(fdto.getFacultyMobileAlt());
        fvo.setFacultyAddress(fdto.getFacultyAddress());
        fvo.setFacultyPassword(fdto.getFacultyPassword());
        //System.out.println(fvo.getFacultyTechnology() + " " + fvo.getFacultyName() + " " + fvo.getFacultyEmail());
        AdminDaoImpl adaoimpl = new AdminDaoImpl();
        int result = adaoimpl.addFaculty(fvo);
        //System.out.println(result);
        List<TrainingCourseVo> trainingCourseNames = adaoimpl.getTrainingCourseName();
        if (result > 0) {
//            String FACULTY_REGN_EMAIL_SUBJECT = "Registration Confirmation";
//            String FACULTY_REGN_EMAIL_TEXT = "Congratulation! You have successfully registered";
//            MyEmail myEmail = new MyEmail(fdto.getFacultyEmail(), FACULTY_REGN_EMAIL_SUBJECT, FACULTY_REGN_EMAIL_TEXT);
//            myEmail.sendMyEmail();
            request.setAttribute("TRAININGCOURSENAMES", trainingCourseNames);
            String addFacultySuccessMsg = bundle.getString("ADD_FACULTY_SUCCESS_MSG");
            request.setAttribute("ADD_FACULTY_SUCCESS_MSG", addFacultySuccessMsg);
            fdto.reset(mapping, request);
            return mapping.findForward(SUCCESS);
        } else {
            request.setAttribute("TRAININGCOURSENAMES", trainingCourseNames);
            String addFacultyFailMsg = bundle.getString("ADD_FACULTY_FAIL_MSG");
            request.setAttribute("ADD_FACULTY_FAIL_MSG", addFacultyFailMsg);
            return mapping.findForward(ERROR);
        }
    }

    public ActionForward addBatch(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        AdminDaoImpl adaoimpl = new AdminDaoImpl();
        List<BatchVo> allBatch = adaoimpl.showBatch();
        List<TrainingCategoryVo> allCategory = adaoimpl.showTrainingCategory();

        request.setAttribute("ALLBATCH", allBatch);
        request.setAttribute("ALLTRAININGCATEGORY", allCategory);
        return mapping.findForward(SUCCESS);
    }

    public ActionForward addBatch2(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        BatchDto batchDto = (BatchDto) form;
        BatchVo batchVo = new BatchVo();
        batchVo.setTrainingCategoryId(batchDto.getTrainingCategoryId());
        batchVo.setTrainingCourseId(batchDto.getTrainingCourseId());
        batchVo.setFacultyId(batchDto.getFacultyId());

        String[] dateSchedule = batchDto.getDateSchedule();
        String dateSchedule2 = null;
        for (int i = 0; i < dateSchedule.length; i++) {
            dateSchedule2 = dateSchedule2 + dateSchedule[i] + ",";
        }
        String dateSchedule3 = dateSchedule2.substring(4);

        int i = dateSchedule3.lastIndexOf(",");
        String dateSchedule4 = dateSchedule3.substring(0, i);

        batchVo.setDateSchedule2(dateSchedule4);
        batchVo.setBatchStartTime(batchDto.getBatchStartTime());
        batchVo.setBatchStartTimeFormat(batchDto.getBatchStartTimeFormat());
        batchVo.setBatchEndTime(batchDto.getBatchEndTime());
        batchVo.setBatchEndTimeFormat(batchDto.getBatchEndTimeFormat());
        batchVo.setRoomNo(batchDto.getRoomNo());
        batchVo.setBatchCreationYear(DateTime.getTodayDate().substring(6));

        AdminDaoImpl adaoimpl = new AdminDaoImpl();
        int result = adaoimpl.addBatch(batchVo);
        List<BatchVo> allBatch = adaoimpl.showBatch();
        List<TrainingCategoryVo> allCategory = adaoimpl.showTrainingCategory();
        if (result > 0) {
            request.setAttribute("ALLBATCH", allBatch);
            request.setAttribute("ALLTRAININGCATEGORY", allCategory);
            String addBatchSuccessMsg = bundle.getString("ADD_BATCH_SUCCESS_MSG");
            request.setAttribute("ADD_BATCH_SUCCESS_MSG", addBatchSuccessMsg);
            batchDto.reset(mapping, request);
            return mapping.findForward(SUCCESS);
        } else {
            request.setAttribute("ALLBATCH", allBatch);
            request.setAttribute("ALLTRAININGCATEGORY", allCategory);
            String addBatchFailMsg = bundle.getString("ADD_BATCH_FAIL_MSG");
            request.setAttribute("ADD_BATCH_FAIL_MSG", addBatchFailMsg);
            return mapping.findForward(ERROR);
        }
    }
    
    public ActionForward studentPayment(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        AdminDaoImpl adi=new AdminDaoImpl();
        List<StudentPaymentVO> listOfStudentPayment=adi.paymentModeDetails();
        StudentPaymentDto spd=(StudentPaymentDto)form;
        spd.setListOfStudentPayment(listOfStudentPayment);
        return mapping.findForward(SUCCESS);
    } 
    
}
