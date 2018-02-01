package in.pcsacademy.model.vo;

public class TrainingCategoryVo implements java.io.Serializable {

    private int trainingCategoryId;
    private String trainingCategoryName;

    public TrainingCategoryVo() {
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

}
