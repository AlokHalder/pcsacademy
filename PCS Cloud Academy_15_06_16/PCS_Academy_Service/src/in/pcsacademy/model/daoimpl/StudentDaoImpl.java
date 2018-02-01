package in.pcsacademy.model.daoimpl;

import in.pcsacademy.model.dao.StudentDao;
import in.pcsacademy.model.vo.SendMsgVo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import in.pcsacademy.databaseconnection.DataBaseConnection;
import in.pcsacademy.model.vo.StudentRegistrationVo;
import in.pcsacademy.model.vo.TrainingCategoryVo;
import in.pcsacademy.model.vo.TrainingCourseVo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class StudentDaoImpl implements StudentDao {

    Connection con = null;
    PreparedStatement ps = null;
    String query = null;
    String query1 = null;
    ResultSet rs = null;

    @Override
    public boolean getRegisteredBeforeAdmission(StudentRegistrationVo srbaVo) {
        System.out.println("i am here");
        boolean result = false;
        int last_id = 0;
        int uid = 0;
        String course_name = null;
        String COURSE_FEES = null;
        if (srbaVo != null) {

            try {
                con = DataBaseConnection.dbConnection();
                con.setAutoCommit(false);
                // code for insert data into student_regn_details
                //query = "insert into student_regn_details values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                query = "insert into student_regn_details(salutation,first_name,last_name,dob,state,city,email_id,mobile,college_name,college_state,college_city,university,stream,persuing_qualification,passing_year,semester,how_find_us,regn_date) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                ps = con.prepareStatement(query);

                ps.setString(1, srbaVo.getSalutation());
                ps.setString(2, srbaVo.getFirstName());
                ps.setString(3, srbaVo.getLastName());
                ps.setString(4, srbaVo.getDob());

                ps.setString(5, srbaVo.getState());
                ps.setString(6, srbaVo.getCity());
                ps.setString(7, srbaVo.getEmailId());
                ps.setString(8, srbaVo.getMobile());

                ps.setString(9, srbaVo.getCollegeName());
                ps.setString(10, srbaVo.getCollegeState());
                ps.setString(11, srbaVo.getCollegeCity());
                ps.setString(12, srbaVo.getUniversity());
                ps.setString(13, srbaVo.getBranch());
                ps.setString(14, srbaVo.getPersuingQualification());
                ps.setString(15, srbaVo.getPassingYear());
                ps.setString(16, srbaVo.getSemester());
                ps.setString(17, srbaVo.getHowfindus());
                ps.setString(18, srbaVo.getRegnDate());

                int i = ps.executeUpdate();
                //int j=ps.get
                //  query="insert into "
                if (i > 0) {
                    //get data of registration id for insert it into student_login_details
                    query1 = "select max(student_regn_id) as last_id from student_regn_details";
                    ps = con.prepareStatement(query1);
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        last_id = rs.getInt("last_id");
                    }
                    //query for insert into student login table
                    query = "insert into student_login_details(student_regn_id,student_password) values(?,?)";
                    ps = con.prepareStatement(query);
                    ps.setInt(1, last_id);
                    ps.setString(2, srbaVo.getPassword());
                    ps.executeUpdate();
                    //select enrollment no if already exist in student_course_details table
                    query1 = "select enrollment_no from student_course_details order by student_regn_id desc limit 1";
                    ps = con.prepareStatement(query1);
                    rs = ps.executeQuery();
                    if (rs.next()) {
                        System.out.println(rs.getString("enrollment_no"));
                        uid = Integer.parseInt(rs.getString("enrollment_no").substring(5));
                        System.out.println("uid=" + uid);
                        uid++;
                        System.out.println(uid);
                    } else {
                        uid = 1;
                    }

                    String CONST_DATA = "PCSR-";
                    //insert data into student_course_details table
                    query = "insert into student_course_details"
                            + "(enrollment_no,student_regn_id,training_category_id,training_course_id,enrollment_status,enrollment_date) "
                            + "values(?,?,?,?,?,?)";
                    ps = con.prepareStatement(query);
                    ps.setString(1, CONST_DATA.concat(String.valueOf(uid)));
                    ps.setInt(2, last_id);
                    ps.setInt(3, srbaVo.getTrainingCategoryId());
                    ps.setInt(4, srbaVo.getTrainingCourseId());

                    ps.setString(5, "Not Enrolled");
                    ps.setString(6, srbaVo.getRegnDate());

                    int status = ps.executeUpdate();
                    System.out.println("query=" + ps);
                    if (status > 0) {
                        result = true;
                    }
                }
                con.commit();

            } catch (Exception e) {
                e.printStackTrace();
                try {
                    con.rollback();
                } catch (SQLException ex) {
                    System.out.println("error=" + ex);
                }
            } finally {
                try {
                    con.close();
                    ps.close();
                } catch (Exception e) {
                    System.out.println(e);
                }
            }
        }
        return result;
    }

    @Override
    public boolean getQuickRegisteredBeforeAdmission(StudentRegistrationVo srbaVo) {
        boolean result = false;
        int last_id = 0;
        int uid = 0;
        int insert_status = 0;
        String course_name = null;
        String COURSE_FEES = null;
        if (srbaVo != null) {

            try {
                con = DataBaseConnection.dbConnection();
                con.setAutoCommit(false);
                // code for insert data into student_regn_details
                query = "insert into student_regn_details(first_name,email_id,mobile,regn_date) values(?,?,?,?)";
                ps = con.prepareStatement(query);

                ps.setString(1, srbaVo.getFirstName());

                ps.setString(2, srbaVo.getEmailId());
                ps.setString(3, srbaVo.getMobile());
                ps.setString(4, srbaVo.getRegnDate());

                int i = ps.executeUpdate();
                System.out.println("query quick=" + ps);

                if (i > 0) {
                    //get data of registration id for insert it into student_login_details
                    query1 = "select max(student_regn_id) as last_id from student_regn_details";
                    ps = con.prepareStatement(query1);
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        last_id = rs.getInt("last_id");
                    }

                    //query for insert into student login table
                    query = "insert into student_login_details(student_regn_id,student_password) values(?,?)";
                    ps = con.prepareStatement(query);
                    ps.setInt(1, last_id);
                    ps.setString(2, srbaVo.getPassword());
                    ps.executeUpdate();
                    //select enrollment no if already exist in student_course_details table
                    query1 = "select enrollment_no from student_course_details order by student_regn_id desc limit 1";
                    ps = con.prepareStatement(query1);
                    rs = ps.executeQuery();
                    if (rs.next()) {
                        System.out.println("string uid = "+rs.getString("enrollment_no").substring(5));
                        uid = Integer.parseInt(rs.getString("enrollment_no").substring(5));
                        System.out.println("uid=" + uid);
                        uid++;
                        System.out.println("final uid=" + uid);
                    } else {
                        uid = 1;
                    }

                   // String CONST_DATA = "PCSR-";
                    //insert data into student_course_details table
                    query = "insert into student_course_details"
                            + "(enrollment_no,student_regn_id,training_category_id,training_course_id,enrollment_status,enrollment_date) "
                            + "values(?,?,?,?,?,?)";
                    ps = con.prepareStatement(query);
                    ps.setString(1, String.valueOf(uid));
                   // ps.setString(1, CONST_DATA.concat(String.valueOf(uid)));
                    ps.setInt(2, last_id);
                    ps.setInt(3, srbaVo.getTrainingCategoryId());
                    ps.setInt(4, srbaVo.getTrainingCourseId());

                    ps.setString(5, "Not Enrolled");
                    ps.setString(6, srbaVo.getRegnDate());
                    insert_status = ps.executeUpdate();
                }
                if (insert_status > 0) {
                    result = true;
                }

                con.commit();

            } catch (Exception e) {
                e.printStackTrace();
                try {
                    con.rollback();
                } catch (SQLException ex) {
                    System.out.println("Error=" + ex);
                }
            } finally {
                try {
                    con.close();
                    ps.close();
                } catch (Exception e) {
                    System.out.println(e);
                }
            }
        }
        return result;
    }

    @Override
    public List<TrainingCourseVo> showTrainingCourseWRTCategoryId(int trainingCategoryId) {
        List<TrainingCourseVo> list = new ArrayList<TrainingCourseVo>();

        try {
            con = DataBaseConnection.dbConnection();
            query = "select * from training_course where training_category_id=?";
            ps = con.prepareStatement(query);
            ps.setInt(1, trainingCategoryId);
            rs = ps.executeQuery();
            while (rs.next()) {
                TrainingCourseVo tvo = new TrainingCourseVo();

                tvo.setTrainingCourseId(rs.getInt("training_course_id"));
                tvo.setTrainingCourseName(rs.getString("training_course_name"));

                list.add(tvo);
            }

        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            try {
                con.close();
                ps.close();
                rs.close();
            } catch (SQLException se) {
                System.out.println(se.toString());
            }
        }
        return list;
    }

    @Override
    public List<TrainingCategoryVo> showTrainingCategory() {

        List<TrainingCategoryVo> list = new ArrayList<>();

        try {
            con = DataBaseConnection.dbConnection();
            query = "select * from training_category order by training_category_id";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                TrainingCategoryVo tcvo = new TrainingCategoryVo();
                tcvo.setTrainingCategoryId(rs.getInt(1));
                tcvo.setTrainingCategoryName(rs.getString(2));
                list.add(tcvo);
            }

        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            try {
                con.close();
                ps.close();
                rs.close();
            } catch (SQLException ex) {
                System.out.println(ex.toString());
            }
        }
        return list;
    }

    @Override
    public List<TrainingCourseVo> showTrainingCourse() {

        List<TrainingCourseVo> courselist = new ArrayList<>();

        try {
            con = DataBaseConnection.dbConnection();
            query = "select training_course_id,training_course_name from training_course group by training_course_name ";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                //StudentRegistrationVo srbvo = new StudentRegistrationVo();
                TrainingCourseVo trainingCourseVo = new TrainingCourseVo();
                trainingCourseVo.setTrainingCourseId(rs.getInt("training_course_id"));
                trainingCourseVo.setTrainingCourseName(rs.getString("training_course_name"));
//                srbvo.setTrainingCourseId(rs.getInt("training_course_id"));
//                srbvo.setTrainingCourseName(rs.getString("training_course_name"));
                courselist.add(trainingCourseVo);
            }

        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            try {
                con.close();
                ps.close();
                rs.close();
            } catch (SQLException ex) {
                System.out.println(ex.toString());
            }
        }

        return courselist;
    }

    @Override
    public int showDetails() {
        int id = 0;

        try {
            con = DataBaseConnection.dbConnection();
            query = "select max(student_regn_id) as reg_id from student_login_details";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("reg_id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
                ps.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        return id;
    }

    @Override
    public StudentRegistrationVo doStudentLogin(StudentRegistrationVo srbaVo) {

        try {
            con = DataBaseConnection.dbConnection();
            query = "select sld.student_login_id,sld.student_regn_id,srd.salutation,srd.first_name,srd.last_name,srd.dob,srd.state,srd.city,srd.email_id,srd.mobile,"
                    + "srd.college_name,srd.college_state,srd.college_city,srd.university,srd.stream,srd.persuing_qualification,"
                    + "srd.passing_year,srd.semester,srd.how_find_us,srd.regn_date,scd.enrollment_no,scd.training_category_id,scd.training_course_id,scd.batchId,scd.enrollment_status"
                    + " from student_course_details scd,student_regn_details srd,student_login_details sld where sld.student_regn_id=? and sld.student_password=? and "
                    + "(scd.student_regn_id=srd.student_regn_id and srd.student_regn_id = sld.student_regn_id)";
            ps = con.prepareStatement(query);
            ps.setInt(1, srbaVo.getStudentRegnBeforeAdmisnId());
            ps.setString(2, srbaVo.getPassword());
            //System.out.println("query for all=" + ps);
            rs = ps.executeQuery();
            if (rs.next()) {
                srbaVo.setStudentRegnBeforeAdmisnId(rs.getInt("student_regn_id"));
                srbaVo.setStudentLogInId(rs.getInt("student_login_id"));
                srbaVo.setSalutation(rs.getString("salutation"));
                srbaVo.setFirstName(rs.getString("first_name"));
                srbaVo.setLastName(rs.getString("last_name"));
                srbaVo.setDob(rs.getString("dob"));
                srbaVo.setState(rs.getString("state"));
                srbaVo.setCity(rs.getString("city"));
                srbaVo.setEmailId(rs.getString("email_id"));
                srbaVo.setMobile(rs.getString("mobile"));
                srbaVo.setCollegeName(rs.getString("college_name"));
                srbaVo.setCollegeState(rs.getString("college_state"));
                srbaVo.setCollegeCity(rs.getString("college_city"));
                srbaVo.setUniversity(rs.getString("university"));
                srbaVo.setBranch(rs.getString("stream"));
                srbaVo.setPersuingQualification(rs.getString("persuing_qualification"));
                srbaVo.setPassingYear(rs.getString("passing_year"));
                srbaVo.setSemester(rs.getString("semester"));
                srbaVo.setHowfindus(rs.getString("how_find_us"));
                srbaVo.setRegnDate(rs.getString("regn_date"));
                srbaVo.setEnrollmentno(rs.getString("enrollment_no"));
                srbaVo.setEnrollmentstatus(rs.getString("enrollment_status"));
                srbaVo.setTrainingCategoryId(rs.getInt("training_category_id"));
                srbaVo.setTrainingCourseId(rs.getInt("training_course_id"));

                //ps = con.prepareStatement(query);
                //ps.setInt(1, srbaVo.getStudentRegnBeforeAdmisnId());
                // srbaVo.setId(rs.getInt("student_login_id"));
                //srbaVo.setTrainingCategoryId(rs.getInt("training_category_id"));
                //srbaVo.setTrainingCourseId(rs.getInt("training_course_id"));
                //still data are to be fetched...
                // srbaVo.setFirstName(rs.getString("firstName"));
                // srbaVo.setLastName(rs.getString("lastName"));
            }
//            query1 = "SELECT cat.training_category_id,cat.training_category_name,cou.training_course_id,cou.training_course_name,cou.training_course_content,cou.training_course_duration,cou.training_course_fees FROM training_category cat,training_course cou WHERE cat.training_category_id= cou.training_category_id "
//                    + "and cou.training_course_id=? and cou.training_category_id=?";
//            ps = con.prepareStatement(query1);
//            ps.setInt(1, srbaVo.getTrainingCourseId());
//            ps.setInt(2, srbaVo.getTrainingCategoryId());
//            System.out.println("quuu=" + ps);
//            //ps.setString(2, srbaVo.getPassword());
//            rs = ps.executeQuery();
//            if (rs.next()) {
////                srbaVo.setTrainingCourseName(rs.getString("training_course_name"));
////                srbaVo.setTrainingCategoryName(rs.getString("training_category_name"));
//
//            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                con.close();
                ps.close();
                rs.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }

        return srbaVo;
    }

    @Override
    public List<StudentRegistrationVo> paymentDetails(int studentregId) {
        List<StudentRegistrationVo> listpaymentVo = new ArrayList<StudentRegistrationVo>();
        int id = 0;

        try {
            con = DataBaseConnection.dbConnection();
            query = "select spd.enrollment_no,spd.total_payable_amount,spd.paid_amount"
                    + " from student_payment_details spd,student_course_details scd "
                    + "where spd.enrollment_no=scd.enrollment_no and scd.student_regn_id=?";
            ps = con.prepareStatement(query);
            ps.setInt(1, studentregId);
            rs = ps.executeQuery();
            while (rs.next()) {
                StudentRegistrationVo result = new StudentRegistrationVo();
                result.setEnrollmentno(rs.getString("enrollment_no"));
                result.setPaidAmount(rs.getString("paid_amount"));
                result.setTotalPayableAmount(rs.getString("total_payable_amount"));
                listpaymentVo.add(result);
                //id = rs.getInt("reg_id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
                ps.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        return listpaymentVo;
    }

    @Override
    public boolean sendContactMsg(SendMsgVo smvo) {
        boolean b = false;
        String name = smvo.getName();
        String email = smvo.getEmail();
        String phone = smvo.getPhone();
        String massage = smvo.getMassage();
        int result = 0;
        if (email != null) {

            try {
                con = DataBaseConnection.dbConnection();
                query = "insert into student_contact_msg values(default,?,?,?,?)";
                ps = con.prepareStatement(query);
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, phone);
                ps.setString(4, massage);
                result = ps.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    con.close();
                    ps.close();
                } catch (Exception e) {
                    System.out.println(e);
                }
            }
            if (result > 0) {
                b = true;

            }
        }
        return b;
    }

    public static void main(String[] args) {
//        SendMsgDaoImpl smdaoimpl = new SendMsgDaoImpl();
//        SendMsgVo smvo = new SendMsgVo();
//        smvo.setName("Rakesh");
//        smvo.setEmail("r@yahoo.co.in");
//        smvo.setPhone("9988776655");
//        smvo.setMassage("I need details about training..");
//        
//        boolean bb = smdaoimpl.storeFeedbackInfo(smvo);
//        System.out.println(bb);

//        StudentDaoImpl studentDaoImpl = new StudentDaoImpl();
//        boolean result = studentDaoImpl.studentLogin("1", "123");
//        System.out.println(result);
    }

}
