package in.pcsacademy.model.dao;

import in.pcsacademy.model.vo.AdminDetailsVo;
import in.pcsacademy.model.vo.BatchVo;
import in.pcsacademy.model.vo.FacultyVo;
import in.pcsacademy.model.vo.SendMsgVo;
import in.pcsacademy.model.vo.StudentPaymentVO;
import in.pcsacademy.model.vo.StudentRegistrationVo;
import in.pcsacademy.model.vo.TrainingCategoryVo;
import in.pcsacademy.model.vo.TrainingCourseVo;
import java.util.List;

public interface AdminDao {

    public List<AdminDetailsVo> showDesig();

    public boolean adminLogin(AdminDetailsVo adminDetailsVo);

    public int adminChangePassword(AdminDetailsVo adminDetailsVo2);

    public int addTrainingCategory(TrainingCategoryVo tcvo);

    public List<TrainingCategoryVo> showTrainingCategory();

    public int addTrainingCourse(TrainingCourseVo trainingCourseVo);

    public List<TrainingCourseVo> showTrainingCourse();

    public List<TrainingCourseVo> showTrainingCourseWRTCategoryId(int trainingCategoryId);

    public List<TrainingCourseVo> getTrainingCourseName();

    public int addFaculty(FacultyVo fvo);

    public List<FacultyVo> showFacultyWRTCourseId(int trainingCourseId);

    public String getTrainingCourseFees(StudentRegistrationVo sraaVo);

    public int addBatch(BatchVo batchVo);

    public List<BatchVo> showBatch();

    public List<BatchVo> showBatchWRTCourseIdAndYear(int trainingCourseId, String currentYear);

    public int addStudentAfterAdmission(StudentRegistrationVo sraaVo);

    public List<SendMsgVo> showContactMsg();

    public List<StudentRegistrationVo> showStudentDetails();

    public StudentRegistrationVo showStudentRegnLoginDetails(int id);

    //-------------added by suvankar--------------------//
    public List<TrainingCourseVo> searchTrainingCourse(TrainingCourseVo trainingCourseVo);

    public int deleteTrainingCourse(int trainingcourseId);

    public TrainingCourseVo showForUpdateCourse(int trainingcourseId);

    public int UpdateTrainingCourse(TrainingCourseVo trainingcousevo);

    public List<FacultyVo> showSearchFaculty(FacultyVo facultyvo);

    public List<FacultyVo> showFaculty();

    public FacultyVo showfacultydetailsforupdate(int facultyid);

    public int updatefaculty(FacultyVo facultyvo);

    public List<TrainingCourseVo> showCourseName();

    public TrainingCourseVo showCourseContents(int trainingcourseId);

    public TrainingCategoryVo showTrainingCategoryForUpdate(int categoryid);

    public int UpdateTrainingCategory(TrainingCategoryVo tcvo);

    public int addStudentDetails(StudentRegistrationVo sraaVo);
    
    public List<StudentPaymentVO> paymentModeDetails();

    //--------------------finish---------------------------------------------//
}
