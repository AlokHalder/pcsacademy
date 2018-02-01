package in.pcsacademy.model.dto;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class StudentRegistrationDto extends org.apache.struts.action.ActionForm {

    private int studentRegnBeforeAdmisnId;
    private int studentLogInId;
    private int trainingCategoryId;
    private int trainingCourseId;
    private int batchId;
    private String salutation;
    private String dob;
    private String firstName;
    private String lastName;
    private String state;
    private String city;
    private String emailId;
    private String mobile;
    private String password;
    private String collegeState;
    private String collegeCity;
    private String collegeName;
    private String branch;
    private String university;
    private String persuingQualification;
    private String passingYear;
    private String semester;
    private String howfindus;
    //private int studentRegnAfterAdmisnId;
    private int paymentId;
    private String totalPayableAmount;
    private String paidAmount;
    private String checkNo;
    private String cardNo;
    private String cardType;
    private String expirydt;
    private String cvv;
    private String payDate;

//    public int getStudentRegnAfterAdmisnId() {
//        return studentRegnAfterAdmisnId;
//    }
//
//    public void setStudentRegnAfterAdmisnId(int studentRegnAfterAdmisnId) {
//        this.studentRegnAfterAdmisnId = studentRegnAfterAdmisnId;
//    }

    public int getStudentLogInId() {
        return studentLogInId;
    }

    public void setStudentLogInId(int studentLogInId) {
        this.studentLogInId = studentLogInId;
    }

    public int getBatchId() {
        return batchId;
    }

    public void setBatchId(int batchId) {
        this.batchId = batchId;
    }

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public String getTotalPayableAmount() {
        return totalPayableAmount;
    }

    public void setTotalPayableAmount(String totalPayableAmount) {
        this.totalPayableAmount = totalPayableAmount;
    }

    public String getPaidAmount() {
        return paidAmount;
    }

    public void setPaidAmount(String paidAmount) {
        this.paidAmount = paidAmount;
    }

    public String getCheckNo() {
        return checkNo;
    }

    public void setCheckNo(String checkNo) {
        this.checkNo = checkNo;
    }

    public String getCardNo() {
        return cardNo;
    }

    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    public String getCardType() {
        return cardType;
    }

    public void setCardType(String cardType) {
        this.cardType = cardType;
    }

    public String getExpirydt() {
        return expirydt;
    }

    public void setExpirydt(String expirydt) {
        this.expirydt = expirydt;
    }

    public String getCvv() {
        return cvv;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }

    public String getPayDate() {
        return payDate;
    }

    public void setPayDate(String payDate) {
        this.payDate = payDate;
    }

    public int getStudentRegnBeforeAdmisnId() {
        return studentRegnBeforeAdmisnId;
    }

    public void setStudentRegnBeforeAdmisnId(int studentRegnBeforeAdmisnId) {
        this.studentRegnBeforeAdmisnId = studentRegnBeforeAdmisnId;
    }

    public StudentRegistrationDto() {
        super();
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

    public String getSalutation() {
        return salutation;
    }

    public void setSalutation(String salutation) {
        this.salutation = salutation;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getEmailId() {
        return emailId;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCollegeState() {
        return collegeState;
    }

    public void setCollegeState(String collegeState) {
        this.collegeState = collegeState;
    }

    public String getCollegeCity() {
        return collegeCity;
    }

    public void setCollegeCity(String collegeCity) {
        this.collegeCity = collegeCity;
    }

    public String getCollegeName() {
        return collegeName;
    }

    public void setCollegeName(String collegeName) {
        this.collegeName = collegeName;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getUniversity() {
        return university;
    }

    public void setUniversity(String university) {
        this.university = university;
    }

    public String getPersuingQualification() {
        return persuingQualification;
    }

    public void setPersuingQualification(String persuingQualification) {
        this.persuingQualification = persuingQualification;
    }

    public String getPassingYear() {
        return passingYear;
    }

    public void setPassingYear(String passingYear) {
        this.passingYear = passingYear;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public String getHowfindus() {
        return howfindus;
    }

    public void setHowfindus(String howfindus) {
        this.howfindus = howfindus;
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
        this.trainingCategoryId = 0;
        this.trainingCourseId = 0;
        this.salutation = "";
        this.dob = "";
        this.firstName = "";
        this.lastName = "";
        this.state = "";
        this.city = "";
        this.emailId = "";
        this.mobile = "";
        this.password = "";
        this.collegeState = "";
        this.collegeCity = "";
        this.collegeName = "";
        this.branch = "";
        this.university = "";
        this.persuingQualification = "";
        this.passingYear = "";
        this.semester = "";
        this.howfindus = "";
    }
}
