package in.pcsacademy.model.dao;

import in.pcsacademy.model.vo.SendMsgVo;
import in.pcsacademy.model.vo.StudentRegistrationVo;
import in.pcsacademy.model.vo.TrainingCategoryVo;
import in.pcsacademy.model.vo.TrainingCourseVo;
import java.util.List;

public interface StudentDao {

    public StudentRegistrationVo doStudentLogin(StudentRegistrationVo srbaVo);

    public boolean getQuickRegisteredBeforeAdmission(StudentRegistrationVo srbaVo);

    public boolean getRegisteredBeforeAdmission(StudentRegistrationVo srbaVo);

    public int showDetails();

    public boolean sendContactMsg(SendMsgVo smvo);

    public List<TrainingCategoryVo> showTrainingCategory();

    public List<TrainingCourseVo> showTrainingCourse();

    public List<TrainingCourseVo> showTrainingCourseWRTCategoryId(int trainingCategoryId);

    public List<StudentRegistrationVo> paymentDetails(int studentregId);

}
