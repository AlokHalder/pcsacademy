package in.pcsacademy.model.vo;

public class BatchVo {

    private int batchId;
    private int trainingCategoryId;
    private int trainingCourseId;
    private int facultyId;
    private String trainingCategoryName;
    private String trainingCourseName;
    private String facultyName;
    private String[] dateSchedule;
    private String dateSchedule2;
    private String batchStartTime;
    private String batchStartTimeFormat;
    private String batchEndTime;
    private String batchEndTimeFormat;
    private String roomNo;
    private String batchCreationYear;

    public int getBatchId() {
        return batchId;
    }

    public void setBatchId(int batchId) {
        this.batchId = batchId;
    }

    public int getTrainingCategoryId() {
        return trainingCategoryId;
    }

    public void setTrainingCategoryId(int trainingCategoryId) {
        this.trainingCategoryId = trainingCategoryId;
    }

    public int getTrainingCourseId() {
        return trainingCourseId;
    }

    public void setTrainingCourseId(int trainingCourseId) {
        this.trainingCourseId = trainingCourseId;
    }

    public int getFacultyId() {
        return facultyId;
    }

    public void setFacultyId(int facultyId) {
        this.facultyId = facultyId;
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

    public String getFacultyName() {
        return facultyName;
    }

    public void setFacultyName(String facultyName) {
        this.facultyName = facultyName;
    }

    public String[] getDateSchedule() {
        return dateSchedule;
    }

    public void setDateSchedule(String[] dateSchedule) {
        this.dateSchedule = dateSchedule;
    }

    public String getDateSchedule2() {
        return dateSchedule2;
    }

    public void setDateSchedule2(String dateSchedule2) {
        this.dateSchedule2 = dateSchedule2;
    }

    public String getBatchStartTime() {
        return batchStartTime;
    }

    public void setBatchStartTime(String batchStartTime) {
        this.batchStartTime = batchStartTime;
    }

    public String getBatchStartTimeFormat() {
        return batchStartTimeFormat;
    }

    public void setBatchStartTimeFormat(String batchStartTimeFormat) {
        this.batchStartTimeFormat = batchStartTimeFormat;
    }

    public String getBatchEndTime() {
        return batchEndTime;
    }

    public void setBatchEndTime(String batchEndTime) {
        this.batchEndTime = batchEndTime;
    }

    public String getBatchEndTimeFormat() {
        return batchEndTimeFormat;
    }

    public void setBatchEndTimeFormat(String batchEndTimeFormat) {
        this.batchEndTimeFormat = batchEndTimeFormat;
    }

    public String getRoomNo() {
        return roomNo;
    }

    public void setRoomNo(String roomNo) {
        this.roomNo = roomNo;
    }

    public String getBatchCreationYear() {
        return batchCreationYear;
    }

    public void setBatchCreationYear(String batchCreationYear) {
        this.batchCreationYear = batchCreationYear;
    }

}
