/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.pcsacademy.model;

import java.sql.Connection;
import in.pcsacademy.databaseconnection.DataBaseConnection;
import in.pcsacademy.vo.StudentRecordVO;
import java.sql.Statement;
import java.util.List;
import java.util.ArrayList;
import java.sql.ResultSet;

/**
 *
 * @author PCS Global
 */
public class StudentRecordModel {
    
    public StudentRecordVO viewStudentRecord(int student_regn_id) {
        StudentRecordVO studentRecord = new StudentRecordVO();
        try{
            DataBaseConnection dbcon=new DataBaseConnection();
            Connection con=dbcon.dbConnection();
            Statement st=con.createStatement();
            String sqlQuery = "select * from student_regn_details where student_regn_id= " +student_regn_id;
            ResultSet rs=st.executeQuery(sqlQuery);
            StudentRecordVO str=null;
            while(rs.next()){
                str=new StudentRecordVO();
                str.setStudent_regn_id(rs.getInt("student_regn_id"));
                str.setSalutation(rs.getString("salutation"));
                str.setFirst_name(rs.getString("first_name"));
                str.setLast_name(rs.getString("last_name"));
                str.setDob(rs.getString("dob"));
                str.setState(rs.getString("state"));
                str.setCity(rs.getString("city"));
                str.setEmail_id(rs.getString("email_id"));
                str.setMobile(rs.getString("mobile"));
                str.setCollege_name(rs.getString("college_name"));
                str.setCollege_state(rs.getString("college_state"));
                str.setCollege_city(rs.getString("college_city"));
                str.setUniversity(rs.getString("university"));
                str.setStream(rs.getString("stream"));
                str.setPersuing_qualification(rs.getString("persuing_qualification"));
                str.setPassing_year(rs.getString("passing_year"));
                str.setSemester(rs.getString("semester"));
                str.setHow_find_us(rs.getString("how_find_us"));
                str.setRegn_date(rs.getString("regn_date"));
                
            }
        }catch(Exception e){
            e.getMessage();
        }
        return studentRecord;
    }
}
