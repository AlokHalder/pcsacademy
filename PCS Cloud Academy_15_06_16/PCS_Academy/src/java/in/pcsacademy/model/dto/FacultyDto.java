package in.pcsacademy.model.dto;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class FacultyDto extends org.apache.struts.action.ActionForm {

    private int facultyId;
    private String facultyTechnology;
    private String facultyName;
    private String facultyEmail;
    private String facultyMobile;
    private String facultyMobileAlt;
    private String facultyAddress;
    private String facultyPassword;

    public int getFacultyId() {
        return facultyId;
    }

    public void setFacultyId(int facultyId) {
        this.facultyId = facultyId;
    }

    public String getFacultyTechnology() {
        return facultyTechnology;
    }

    public void setFacultyTechnology(String facultyTechnology) {
        this.facultyTechnology = facultyTechnology;
    }

    public String getFacultyName() {
        return facultyName;
    }

    public void setFacultyName(String facultyName) {
        this.facultyName = facultyName;
    }

    public String getFacultyEmail() {
        return facultyEmail;
    }

    public void setFacultyEmail(String facultyEmail) {
        this.facultyEmail = facultyEmail;
    }

    public String getFacultyMobile() {
        return facultyMobile;
    }

    public void setFacultyMobile(String facultyMobile) {
        this.facultyMobile = facultyMobile;
    }

    public String getFacultyMobileAlt() {
        return facultyMobileAlt;
    }

    public void setFacultyMobileAlt(String facultyMobileAlt) {
        this.facultyMobileAlt = facultyMobileAlt;
    }

    public String getFacultyAddress() {
        return facultyAddress;
    }

    public void setFacultyAddress(String facultyAddress) {
        this.facultyAddress = facultyAddress;
    }

    public String getFacultyPassword() {
        return facultyPassword;
    }

    public void setFacultyPassword(String facultyPassword) {
        this.facultyPassword = facultyPassword;
    }

    @Override
    public void reset(ActionMapping mapping, HttpServletRequest request) {
        this.facultyId = 0;
        this.facultyTechnology = "";
        this.facultyName = "";
        this.facultyEmail = "";
        this.facultyMobile = "";
        this.facultyMobileAlt = "";
        this.facultyAddress = "";
        this.facultyPassword = "";
    }

}
