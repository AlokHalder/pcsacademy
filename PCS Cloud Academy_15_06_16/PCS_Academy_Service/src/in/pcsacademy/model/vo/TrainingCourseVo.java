package in.pcsacademy.model.vo;

public class TrainingCourseVo implements java.io.Serializable {

    private int trainingCourseId;
    private int trainingCategoryId;
    private String trainingCategoryName;
    private String trainingCourseName;
    private String trainingCourseContent;
    private String trainingCourseDuration;
    private String trainingCourseFees;

    public TrainingCourseVo() {
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

}
