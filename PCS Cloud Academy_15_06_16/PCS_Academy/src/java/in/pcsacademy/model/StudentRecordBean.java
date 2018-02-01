/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.pcsacademy.model;

import in.pcsacademy.vo.StudentRecordVO;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author PCS Global
 */
public class StudentRecordBean extends org.apache.struts.action.ActionForm {
    
    private int student_regn_id;
    private String salutation;
    private String first_name;
    private String last_name;
    private String dob;
    private String state;
    private String city;
    private String email_id;
    private String mobile;
    private String college_name;
    private String college_state;
    private String college_city;
    private String university;
    private String stream;
    private String persuing_qualification;
    private String passing_year;
    private String semester;
    private String how_find_us;
    private String regn_date;
    private List<StudentRecordVO> listOfStudentRecord;

    /**
     * @return the student_regn_id
     */
    public int getStudent_regn_id() {
        return student_regn_id;
    }

    /**
     * @param student_regn_id the student_regn_id to set
     */
    public void setStudent_regn_id(int student_regn_id) {
        this.student_regn_id = student_regn_id;
    }

    /**
     * @return the salutation
     */
    public String getSalutation() {
        return salutation;
    }

    /**
     * @param salutation the salutation to set
     */
    public void setSalutation(String salutation) {
        this.salutation = salutation;
    }

    /**
     * @return the first_name
     */
    public String getFirst_name() {
        return first_name;
    }

    /**
     * @param first_name the first_name to set
     */
    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    /**
     * @return the last_name
     */
    public String getLast_name() {
        return last_name;
    }

    /**
     * @param last_name the last_name to set
     */
    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    /**
     * @return the dob
     */
    public String getDob() {
        return dob;
    }

    /**
     * @param dob the dob to set
     */
    public void setDob(String dob) {
        this.dob = dob;
    }

    /**
     * @return the state
     */
    public String getState() {
        return state;
    }

    /**
     * @param state the state to set
     */
    public void setState(String state) {
        this.state = state;
    }

    /**
     * @return the city
     */
    public String getCity() {
        return city;
    }

    /**
     * @param city the city to set
     */
    public void setCity(String city) {
        this.city = city;
    }

    /**
     * @return the email_id
     */
    public String getEmail_id() {
        return email_id;
    }

    /**
     * @param email_id the email_id to set
     */
    public void setEmail_id(String email_id) {
        this.email_id = email_id;
    }

    /**
     * @return the mobile
     */
    public String getMobile() {
        return mobile;
    }

    /**
     * @param mobile the mobile to set
     */
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    /**
     * @return the college_name
     */
    public String getCollege_name() {
        return college_name;
    }

    /**
     * @param college_name the college_name to set
     */
    public void setCollege_name(String college_name) {
        this.college_name = college_name;
    }

    /**
     * @return the college_state
     */
    public String getCollege_state() {
        return college_state;
    }

    /**
     * @param college_state the college_state to set
     */
    public void setCollege_state(String college_state) {
        this.college_state = college_state;
    }

    /**
     * @return the college_city
     */
    public String getCollege_city() {
        return college_city;
    }

    /**
     * @param college_city the college_city to set
     */
    public void setCollege_city(String college_city) {
        this.college_city = college_city;
    }

    /**
     * @return the university
     */
    public String getUniversity() {
        return university;
    }

    /**
     * @param university the university to set
     */
    public void setUniversity(String university) {
        this.university = university;
    }

    /**
     * @return the stream
     */
    public String getStream() {
        return stream;
    }

    /**
     * @param stream the stream to set
     */
    public void setStream(String stream) {
        this.stream = stream;
    }

    /**
     * @return the persuing_qualification
     */
    public String getPersuing_qualification() {
        return persuing_qualification;
    }

    /**
     * @param persuing_qualification the persuing_qualification to set
     */
    public void setPersuing_qualification(String persuing_qualification) {
        this.persuing_qualification = persuing_qualification;
    }

    /**
     * @return the passing_year
     */
    public String getPassing_year() {
        return passing_year;
    }

    /**
     * @param passing_year the passing_year to set
     */
    public void setPassing_year(String passing_year) {
        this.passing_year = passing_year;
    }

    /**
     * @return the semester
     */
    public String getSemester() {
        return semester;
    }

    /**
     * @param semester the semester to set
     */
    public void setSemester(String semester) {
        this.semester = semester;
    }

    /**
     * @return the how_find_us
     */
    public String getHow_find_us() {
        return how_find_us;
    }

    /**
     * @param how_find_us the how_find_us to set
     */
    public void setHow_find_us(String how_find_us) {
        this.how_find_us = how_find_us;
    }

    /**
     * @return the regn_date
     */
    public String getRegn_date() {
        return regn_date;
    }

    /**
     * @param regn_date the regn_date to set
     */
    public void setRegn_date(String regn_date) {
        this.regn_date = regn_date;
    }

    /**
     * @return the listOfStudentRecord
     */
    public List<StudentRecordVO> getListOfStudentRecord() {
        return listOfStudentRecord;
    }

    /**
     * @param listOfStudentRecord the listOfStudentRecord to set
     */
    public void setListOfStudentRecord(List<StudentRecordVO> listOfStudentRecord) {
        this.listOfStudentRecord = listOfStudentRecord;
    }
}
