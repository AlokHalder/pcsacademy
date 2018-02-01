package in.pcsacademy.model.dto;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionMapping;

public class TrainingCourseDto extends org.apache.struts.action.ActionForm {

    private int trainingCourseId;
    private int trainingCategoryId;
    private String trainingCategoryName;
    private String trainingCourseName;
    private String trainingCourseContent;
    private String trainingCourseDuration;
    private String trainingCourseFees;

    public TrainingCourseDto() {
        super();
    }

    public int getTrainingCourseId() {
        return trainingCourseId;
    }

    public void setTrainingCourseId(int trainingCourseId) {
        this.trainingCourseId = trainingCourseId;
    }

    public int getTrainingCategoryId() {
        return trainingCategoryId;
    }

    public void setTrainingCategoryId(int trainingCategoryId) {
        this.trainingCategoryId = trainingCategoryId;
    }

    public String getTrainingCategoryName() {
        return trainingCategoryName;
    }

    public void setTrainingCategoryName(String trainingCategoryName) {
        this.trainingCategoryName = trainingCategoryName;
    }

    public String getTrainingCourseName() {
        return trainingCourseName;
    }

    public void setTrainingCourseName(String trainingCourseName) {
        this.trainingCourseName = trainingCourseName;
    }

    public String getTrainingCourseContent() {
        return trainingCourseContent;
    }

    public void setTrainingCourseContent(String trainingCourseContent) {
        this.trainingCourseContent = trainingCourseContent;
    }

    public String getTrainingCourseDuration() {
        return trainingCourseDuration;
    }

    public void setTrainingCourseDuration(String trainingCourseDuration) {
        this.trainingCourseDuration = trainingCourseDuration;
    }

    public String getTrainingCourseFees() {
        return trainingCourseFees;
    }

    public void setTrainingCourseFees(String trainingCourseFees) {
        this.trainingCourseFees = trainingCourseFees;
    }
//    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
//        ActionErrors errors = new ActionErrors();
//        if (getName() == null || getName().length() < 1) {
//            errors.add("name", new ActionMessage("error.name.required"));
//            // TODO: add 'error.name.required' key to your resources
//        }
//        return errors;
//    }

    @Override
    public void reset(ActionMapping mapping, HttpServletRequest request) {
        this.trainingCourseId = 0;
        this.trainingCategoryId = 0;
        this.trainingCourseName = "";
        this.trainingCourseContent = "";
        this.trainingCourseDuration = "";
        this.trainingCourseFees = "";
    }

}
