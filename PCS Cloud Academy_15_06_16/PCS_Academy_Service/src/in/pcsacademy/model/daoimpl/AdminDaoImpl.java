package in.pcsacademy.model.daoimpl;

import in.pcsacademy.model.dao.AdminDao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import in.pcsacademy.databaseconnection.DataBaseConnection;
import in.pcsacademy.model.vo.AdminDetailsVo;
import in.pcsacademy.model.vo.BatchVo;
import in.pcsacademy.model.vo.FacultyVo;
import in.pcsacademy.model.vo.SendMsgVo;
import in.pcsacademy.model.vo.StudentPaymentVO;
import in.pcsacademy.model.vo.StudentRegistrationVo;
import in.pcsacademy.model.vo.StudentRegistrationVo;
import in.pcsacademy.model.vo.TrainingCategoryVo;
import in.pcsacademy.model.vo.TrainingCourseVo;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class AdminDaoImpl implements AdminDao {

    Connection con = null;
    PreparedStatement ps = null;
    String sql = null;
    ResultSet rs = null;

    @Override
    public List<AdminDetailsVo> showDesig() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<AdminDetailsVo> result = new ArrayList<AdminDetailsVo>();

        try {
            con = DataBaseConnection.dbConnection();
            ps = con.prepareStatement("select * from designation");
            rs = ps.executeQuery();

            while (rs.next()) {
                AdminDetailsVo adminDetailsVo = new AdminDetailsVo();
                adminDetailsVo.setDesigCode(rs.getInt("desig_code"));
                adminDetailsVo.setDesigName(rs.getString("desig_name"));
                result.add(adminDetailsVo);
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                con.close();
                ps.close();
                rs.close();
            } catch (SQLException ex) {
                System.out.println(ex);
            }
        }
        return result;
    }

    @Override
    public boolean adminLogin(AdminDetailsVo adminDetailsVo) {
        boolean b = false;

        try {
            con = DataBaseConnection.dbConnection();
            sql = "SELECT * FROM admindetails WHERE admin_login_id=? AND admin_password=? AND desig_code=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, adminDetailsVo.getUsername());
            ps.setString(2, adminDetailsVo.getPassword());
            ps.setInt(3, adminDetailsVo.getDesigCode());
            rs = ps.executeQuery();
            if (rs.next()) {
                b = true;
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                con.close();
                ps.close();
                rs.close();
            } catch (SQLException se) {
                System.out.println(se);
            }
        }

        return b;
    }

    @Override
    public int adminChangePassword(AdminDetailsVo adminDetailsVo2) {
        int result = 0;
        try {
            con = DataBaseConnection.dbConnection();
            sql = "update admindetails set admin_password=? where admin_login_id=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, adminDetailsVo2.getPasswordNew());
            ps.setString(2, adminDetailsVo2.getUsername());
            result = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                con.close();
                ps.close();
            } catch (SQLException se) {
                System.out.println(se);
            }
        }
        return result;
    }

    @Override
    public int addTrainingCategory(TrainingCategoryVo tcvo) {
        int res = 0;

        try {
            con = DataBaseConnection.dbConnection();
            sql = "insert into training_category values(default,?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, tcvo.getTrainingCategoryName());
            res = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            try {
                con.close();
                ps.close();
            } catch (SQLException se) {
                System.out.println(se);
            }
        }

        return res;
    }

    @Override
    public List<TrainingCategoryVo> showTrainingCategory() {

        List<TrainingCategoryVo> list = new ArrayList<TrainingCategoryVo>();

        try {
            con = DataBaseConnection.dbConnection();
            sql = "select * from training_category order by training_category_id";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                TrainingCategoryVo tvo = new TrainingCategoryVo();
                tvo.setTrainingCategoryId(rs.getInt(1));
                tvo.setTrainingCategoryName(rs.getString(2));
                list.add(tvo);
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
    public int addTrainingCourse(TrainingCourseVo trainingCourseVo) {
        int result = 0;

        try {
            con = DataBaseConnection.dbConnection();
            sql = "insert into training_course values(default,?,?,?,?,?)";
            ps = con.prepareStatement(sql);
            ps.setInt(1, trainingCourseVo.getTrainingCategoryId());
            ps.setString(2, trainingCourseVo.getTrainingCourseName());
            ps.setString(3, trainingCourseVo.getTrainingCourseContent());
            ps.setString(4, trainingCourseVo.getTrainingCourseDuration());
            ps.setString(5, trainingCourseVo.getTrainingCourseFees());
            result = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            try {
                con.close();
                ps.close();
            } catch (SQLException se) {
                System.out.println(se);
            }
        }

        return result;
    }

    @Override
    public List<TrainingCourseVo> showTrainingCourse() {

        List<TrainingCourseVo> list = new ArrayList<TrainingCourseVo>();

        try {
            con = DataBaseConnection.dbConnection();
            //sql = "select * from training_course";
            sql = "SELECT cat.training_category_id,cat.training_category_name,cou.training_course_id,cou.training_course_name,cou.training_course_content,cou.training_course_duration,cou.training_course_fees FROM training_category cat,training_course cou "
                    + "WHERE cat.`training_category_id`= cou.`training_category_id` order by cou.training_course_id";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                TrainingCourseVo tvo = new TrainingCourseVo();

                tvo.setTrainingCourseId(rs.getInt("training_course_id"));
                tvo.setTrainingCategoryId(rs.getInt("training_category_id"));
                tvo.setTrainingCategoryName(rs.getString("training_category_name"));
                tvo.setTrainingCourseName(rs.getString("training_course_name"));
                tvo.setTrainingCourseContent(rs.getString("training_course_content").substring(0, 15));
                tvo.setTrainingCourseDuration(rs.getString("training_course_duration"));
                tvo.setTrainingCourseFees(rs.getString("training_course_fees"));

                list.add(tvo);
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

//   ------------------------- added by suvankar----------------------------//
    @Override
    public List<TrainingCourseVo> searchTrainingCourse(TrainingCourseVo trainingCourseVo) {

        List<TrainingCourseVo> list = new ArrayList<TrainingCourseVo>();

        try {
            con = DataBaseConnection.dbConnection();

            if ((trainingCourseVo.getTrainingCategoryId() != 0) && (trainingCourseVo.getTrainingCourseName().equals(""))) {
                sql = "SELECT cat.training_category_id,cat.training_category_name,cou.training_course_id,cou.training_course_name,cou.training_course_content,cou.training_course_duration,cou.training_course_fees FROM training_category cat,training_course cou WHERE cat.`training_category_id`= cou.`training_category_id` "
                        + "and cat.training_category_id=?";
                ps = con.prepareStatement(sql);
                ps.setInt(1, trainingCourseVo.getTrainingCategoryId());
                //System.out.println("query2=" + ps);
            }
            if ((trainingCourseVo.getTrainingCategoryId() == 0) && (!trainingCourseVo.getTrainingCourseName().equals(""))) {
                sql = "SELECT cat.training_category_id,cat.training_category_name,cou.training_course_id,cou.training_course_name,cou.training_course_content,cou.training_course_duration,cou.training_course_fees FROM training_category cat,training_course cou WHERE cat.`training_category_id`= cou.`training_category_id` "
                        + "and cou.training_course_name=?";
                ps = con.prepareStatement(sql);
                ps.setString(1, trainingCourseVo.getTrainingCourseName());
                //System.out.println("query1=" + ps);
            }

            if ((trainingCourseVo.getTrainingCategoryId() != 0) && (!trainingCourseVo.getTrainingCourseName().equals(""))) {
                sql = "SELECT cat.training_category_id,cat.training_category_name,cou.training_course_id,cou.training_course_name,cou.training_course_content,cou.training_course_duration,cou.training_course_fees FROM training_category cat,training_course cou WHERE cat.`training_category_id`= cou.`training_category_id` "
                        + "and (cou.training_course_name=? and cat.training_category_id=?)";
                ps = con.prepareStatement(sql);
                ps.setString(1, trainingCourseVo.getTrainingCourseName());
                ps.setInt(2, trainingCourseVo.getTrainingCategoryId());
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                TrainingCourseVo tvo = new TrainingCourseVo();

                tvo.setTrainingCourseId(rs.getInt("training_course_id"));
                tvo.setTrainingCategoryId(rs.getInt("training_category_id"));
                tvo.setTrainingCategoryName(rs.getString("training_category_name"));
                tvo.setTrainingCourseName(rs.getString("training_course_name"));
                tvo.setTrainingCourseContent(rs.getString("training_course_content"));
                tvo.setTrainingCourseDuration(rs.getString("training_course_duration"));
                tvo.setTrainingCourseFees(rs.getString("training_course_fees"));

                list.add(tvo);
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
    public List<TrainingCourseVo> showCourseName() {

        List<TrainingCourseVo> list = new ArrayList<TrainingCourseVo>();

        try {
            con = DataBaseConnection.dbConnection();
            sql = "select training_course_name from training_course group by training_course_name ";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                TrainingCourseVo tvo = new TrainingCourseVo();

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
            } catch (SQLException ex) {
                System.out.println(ex.toString());
            }
        }
        return list;
    }

    @Override
    public int deleteTrainingCourse(int trainingcourseId) {
        int result = 0;
        //System.out.println("id=" + trainingcourseId);

        try {
            con = DataBaseConnection.dbConnection();
            sql = "delete from training_course where training_course_id=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, trainingcourseId);
            //System.out.println("query=" + ps);
            result = ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            try {
                con.close();
                ps.close();
            } catch (SQLException se) {
                System.out.println(se.toString());
            }
        }
        return result;
    }

    @Override
    public TrainingCourseVo showForUpdateCourse(int trainingcourseId) {
        TrainingCourseVo tvo = new TrainingCourseVo();

        try {
            con = DataBaseConnection.dbConnection();
            sql = "SELECT cat.training_category_id,cat.training_category_name,cou.training_course_id,cou.training_course_name,cou.training_course_content,cou.training_course_duration,cou.training_course_fees FROM training_category cat,training_course cou WHERE cat.`training_category_id`= cou.`training_category_id` "
                    + "and cou.training_course_id=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, trainingcourseId);

            rs = ps.executeQuery();
            while (rs.next()) {
                tvo.setTrainingCourseId(rs.getInt("training_course_id"));
                tvo.setTrainingCategoryId(rs.getInt("training_category_id"));
                tvo.setTrainingCategoryName(rs.getString("training_category_name"));
                tvo.setTrainingCourseName(rs.getString("training_course_name"));
                tvo.setTrainingCourseContent(rs.getString("training_course_content"));
                tvo.setTrainingCourseDuration(rs.getString("training_course_duration"));
                tvo.setTrainingCourseFees(rs.getString("training_course_fees"));
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
        return tvo;
    }

    @Override
    public TrainingCourseVo showCourseContents(int trainingcourseId) {
        TrainingCourseVo tvo = new TrainingCourseVo();

        try {
            con = DataBaseConnection.dbConnection();
            sql = "SELECT cat.training_category_name,cou.training_course_id,cou.training_course_name,cou.training_course_content FROM training_category cat,training_course cou WHERE cat.`training_category_id`= cou.`training_category_id` "
                    + "and cou.training_course_id=?";

            ps = con.prepareStatement(sql);
            ps.setInt(1, trainingcourseId);

            rs = ps.executeQuery();
            while (rs.next()) {
                tvo.setTrainingCourseId(rs.getInt("training_course_id"));
                tvo.setTrainingCourseName(rs.getString("training_course_name"));
                tvo.setTrainingCategoryName(rs.getString("training_category_name"));
                tvo.setTrainingCourseContent(rs.getString("training_course_content"));
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
        return tvo;
    }

    @Override
    public int UpdateTrainingCourse(TrainingCourseVo trainingcousevo) {
        int result = 0;

        try {
            con = DataBaseConnection.dbConnection();
            sql = "update training_course set training_course_content=?,"
                    + "training_course_duration=?,"
                    + "training_course_fees=?  where training_course_id=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, trainingcousevo.getTrainingCourseContent());
            ps.setString(2, trainingcousevo.getTrainingCourseDuration());
            ps.setString(3, trainingcousevo.getTrainingCourseFees());
            ps.setInt(4, trainingcousevo.getTrainingCourseId());
            result = ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            try {
                con.close();
                ps.close();
            } catch (SQLException se) {
                System.out.println(se.toString());
            }
        }
        return result;
    }

    //code for show TrainingCategory For Update
    @Override
    public TrainingCategoryVo showTrainingCategoryForUpdate(int categoryid) {
        TrainingCategoryVo tvo = new TrainingCategoryVo();

        try {
            con = DataBaseConnection.dbConnection();
            sql = "SELECT training_category_id,training_category_name FROM training_category WHERE training_category_id=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, categoryid);
            rs = ps.executeQuery();
            while (rs.next()) {
                tvo.setTrainingCategoryId(rs.getInt("training_category_id"));
                tvo.setTrainingCategoryName(rs.getString("training_category_name"));
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
        return tvo;
    }

    @Override
    public int UpdateTrainingCategory(TrainingCategoryVo tcvo) {
        int result = 0;

        try {
            con = DataBaseConnection.dbConnection();
            sql = "update training_category set training_category_name=? where training_category_id=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, tcvo.getTrainingCategoryName());
            ps.setInt(2, tcvo.getTrainingCategoryId());
            //System.out.println("query=" + ps);
            result = ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            try {
                con.close();
                ps.close();
            } catch (SQLException se) {
                System.out.println(se.toString());
            }
        }
        return result;
    }

    @Override
    public List<FacultyVo> showSearchFaculty(FacultyVo facultyvo) {

        List<FacultyVo> list = new ArrayList<FacultyVo>();
        String facultyName = facultyvo.getFacultyName();

        try {
            con = DataBaseConnection.dbConnection();
            sql = "select facultyId,facultyTechnology,facultyName,facultyEmail,"
                    + "facultyMobile,facultyMobileAlt,facultyAddress,facultyPassword from facultydetails"
                    + " where " + (!facultyvo.getFacultyName().equals("") ? (!facultyvo.getFacultyTechnology().equals("") ? (" facultyName like '%" + facultyName + "%' and facultyTechnology='" + facultyvo.getFacultyTechnology() + "'") : (" facultyName like '%" + facultyName + "%'")) : ("facultyTechnology='" + facultyvo.getFacultyTechnology() + "'"));

            ps = con.prepareStatement(sql);

//            if ((!facultyvo.getFacultyName().equals("")) && (facultyvo.getFacultyTechnology().equals(""))) {
//                sql = "SELECT facultyId,facultyTechnology,facultyName,facultyEmail,facultyMobile,facultyMobileAlt,facultyAddress from facultydetails"
//                        + " WHERE facultyName like '%" + facultyName + "%'";
//                ps = con.prepareStatement(sql);
//            }
//            if ((facultyvo.getFacultyName().equals("")) && (!facultyvo.getFacultyTechnology().equals(""))) {
//                sql = "SELECT facultyId,facultyTechnology,facultyName,facultyEmail,facultyMobile,facultyMobileAlt,facultyAddress from facultydetails"
//                        + " WHERE facultyTechnology=?";
//                ps = con.prepareStatement(sql);
//                ps.setString(1, facultyvo.getFacultyTechnology());
//            }
//
//            if ((!facultyvo.getFacultyName().equals("")) && (!facultyvo.getFacultyTechnology().equals(""))) {
//                sql = "SELECT facultyId,facultyTechnology,facultyName,facultyEmail,facultyMobile,facultyMobileAlt,facultyAddress from facultydetails"
//                        + " WHERE facultyName like '%" + facultyName + "%' and facultyTechnology=?";
//                ps = con.prepareStatement(sql);
//                ps.setString(1, facultyvo.getFacultyTechnology());
//            }
//            if ((facultyvo.getFacultyName().equals("")) && (facultyvo.getFacultyTechnology().equals(""))) {
//                sql = "SELECT facultyId,facultyTechnology,facultyName,facultyEmail,facultyMobile,facultyMobileAlt,facultyAddress from facultydetails";
//                ps = con.prepareStatement(sql);
//            }
            System.out.println("query=" + ps);
            rs = ps.executeQuery();
            while (rs.next()) {
                FacultyVo fvo = new FacultyVo();

                fvo.setFacultyId(rs.getInt("facultyId"));
                fvo.setFacultyTechnology(rs.getString("facultyTechnology"));
                fvo.setFacultyName(rs.getString("facultyName"));
                fvo.setFacultyEmail(rs.getString("facultyEmail"));
                fvo.setFacultyMobile(rs.getString("facultyMobile"));
                fvo.setFacultyMobileAlt(rs.getString("facultyMobileAlt"));
                fvo.setFacultyAddress(rs.getString("facultyAddress"));
                fvo.setFacultyPassword(rs.getString("facultyPassword"));

                list.add(fvo);
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
    public List<FacultyVo> showFaculty() {

        List<FacultyVo> list = new ArrayList<FacultyVo>();

        try {
            con = DataBaseConnection.dbConnection();
            sql = "select *from facultydetails";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                FacultyVo fvo = new FacultyVo();

                fvo.setFacultyId(rs.getInt("facultyId"));
                fvo.setFacultyTechnology(rs.getString("facultyTechnology"));
                fvo.setFacultyName(rs.getString("facultyName"));
                fvo.setFacultyEmail(rs.getString("facultyEmail"));
                fvo.setFacultyMobile(rs.getString("facultyMobile"));
                fvo.setFacultyMobileAlt(rs.getString("facultyMobileAlt"));
                fvo.setFacultyAddress(rs.getString("facultyAddress"));
                fvo.setFacultyPassword(rs.getString("facultyPassword"));

                list.add(fvo);
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
    public FacultyVo showfacultydetailsforupdate(int facultyid) {
        FacultyVo fvo = new FacultyVo();

        try {
            con = DataBaseConnection.dbConnection();
            sql = "SELECT facultyId,facultyTechnology,facultyName,facultyEmail,facultyMobile,facultyMobileAlt,facultyAddress,facultyPassword from facultydetails"
                    + " WHERE facultyId=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, facultyid);
            rs = ps.executeQuery();
            while (rs.next()) {
                fvo.setFacultyId(rs.getInt("facultyId"));
                fvo.setFacultyTechnology(rs.getString("facultyTechnology"));
                fvo.setFacultyName(rs.getString("facultyName"));
                fvo.setFacultyEmail(rs.getString("facultyEmail"));
                fvo.setFacultyMobile(rs.getString("facultyMobile"));
                fvo.setFacultyMobileAlt(rs.getString("facultyMobileAlt"));
                fvo.setFacultyAddress(rs.getString("facultyAddress"));
                fvo.setFacultyPassword(rs.getString("facultyPassword"));
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
        return fvo;
    }

    @Override
    public int updatefaculty(FacultyVo facultyvo) {
        int result = 0;

        try {
            con = DataBaseConnection.dbConnection();
            sql = "update facultydetails set facultyTechnology=?,"
                    + "facultyName=?,"
                    + "facultyEmail=?,"
                    + "facultyMobile=?,facultyMobileAlt=?,facultyAddress=?,facultyPassword=?  where facultyId=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, facultyvo.getFacultyTechnology());
            ps.setString(2, facultyvo.getFacultyName());
            ps.setString(3, facultyvo.getFacultyEmail());
            ps.setString(4, facultyvo.getFacultyMobile());
            ps.setString(5, facultyvo.getFacultyMobileAlt());
            ps.setString(6, facultyvo.getFacultyAddress());
            ps.setString(7, facultyvo.getFacultyPassword());
            ps.setInt(8, facultyvo.getFacultyId());
            System.out.println("query=" + ps);
            result = ps.executeUpdate();

        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            try {
                con.close();
                ps.close();
            } catch (SQLException se) {
                System.out.println(se.toString());
            }
        }
        return result;
    }

    @Override
    public int addStudentDetails(StudentRegistrationVo sraaVo) {
        System.out.println("i am here");
        int result = 0;
        int last_id = 0;
        int uid = 0;
        String query = null;
        String query1 = null;
        String course_name = null;
        String COURSE_FEES = null;
        if (sraaVo != null) {

            try {
                con = DataBaseConnection.dbConnection();
                con.setAutoCommit(false);
                // code for insert data into student_regn_details
                query = "insert into student_regn_details values(default,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                ps = con.prepareStatement(query);

                ps.setString(1, sraaVo.getSalutation());
                ps.setString(2, sraaVo.getFirstName());
                ps.setString(3, sraaVo.getLastName());
                ps.setString(4, sraaVo.getDob());

                ps.setString(5, sraaVo.getState());
                ps.setString(6, sraaVo.getCity());
                ps.setString(7, sraaVo.getEmailId());
                ps.setString(8, sraaVo.getMobile());

                ps.setString(9, sraaVo.getCollegeName());
                ps.setString(10, sraaVo.getCollegeState());
                ps.setString(11, sraaVo.getCollegeCity());
                ps.setString(12, sraaVo.getUniversity());
                ps.setString(13, sraaVo.getBranch());
                ps.setString(14, sraaVo.getPersuingQualification());
                ps.setString(15, sraaVo.getPassingYear());
                ps.setString(16, sraaVo.getSemester());
                ps.setString(17, null);
                ps.setString(18, sraaVo.getRegnDate());

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
                    ps.setString(2, sraaVo.getPassword());
                    ps.executeUpdate();
                    //select enrollment no if already exist in student_course_details table
                    query1 = "select enrollment_no from student_course_details order by enrollment_no desc limit 1";
                    ps = con.prepareStatement(query1);
                    rs = ps.executeQuery();
                    if (rs.next()) {
                        uid = Integer.parseInt(rs.getString("enrollment_no").substring(5));
                        System.out.println("uid=" + uid);
                        uid++;
                    } else {
                        uid = 1;
                    }

                    String CONST_DATA = "PCSR-";
                    //insert data into student_course_details table
                    query = "insert into student_course_details"
                            + "(enrollment_no,student_regn_id,training_category_id,training_course_id,batchId,enrollment_status,enrollment_date) "
                            + "values(?,?,?,?,?,?,?)";
                    ps = con.prepareStatement(query);
                   
                    ps.setString(1, CONST_DATA.concat(String.valueOf(uid)));
                    ps.setInt(2, last_id);
                    ps.setInt(3, sraaVo.getTrainingCategoryId());
                    ps.setInt(4, sraaVo.getTrainingCourseId());
                    ps.setInt(5, sraaVo.getBatchId());

                    ps.setString(6, "Enrolled");
                    ps.setString(7, sraaVo.getRegnDate());

                    int status = ps.executeUpdate();
                    ///
                    query1 = "select training_course_fees from training_course "
                            + "where training_course_id=? and training_category_id=? limit 1";
                    ps = con.prepareStatement(query1);
                    ps.setInt(1, sraaVo.getTrainingCourseId());
                    ps.setInt(2, sraaVo.getTrainingCategoryId());

                    rs = ps.executeQuery();
                    if (rs.next()) {
                        COURSE_FEES = rs.getString("training_course_fees");
                    }

                    query = "insert into student_payment_details(enrollment_no,total_payable_amount,paid_amount,check_no,card_no,card_type,expiry_date,cvv,pay_date) values(?,?,?,?,?,?,?,?,?)";
                    ps = con.prepareStatement(query);
                    ps.setString(1, CONST_DATA.concat(String.valueOf(uid)));
                    ps.setString(2, COURSE_FEES);
                    ps.setString(3, sraaVo.getPaidAmount());
                    ps.setString(4, sraaVo.getCheckNo());
                    ps.setString(5, sraaVo.getCardNo());
                    ps.setString(6, sraaVo.getCardType());
                    ps.setString(7, sraaVo.getExpirydt());
                    ps.setString(8, sraaVo.getCvv());
                    ps.setString(9, sraaVo.getPayDate());
                    result = ps.executeUpdate();

                }
                con.commit();

                ///
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

    //-------------------------finish----------------------------//
    @Override
    public List<TrainingCourseVo> showTrainingCourseWRTCategoryId(int trainingCategoryId) {
        List<TrainingCourseVo> list = new ArrayList<TrainingCourseVo>();

        try {
            con = DataBaseConnection.dbConnection();
            sql = "select * from training_course where training_category_id=?";
            ps = con.prepareStatement(sql);
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
    public List<TrainingCourseVo> getTrainingCourseName() {

        List<TrainingCourseVo> list = new ArrayList<TrainingCourseVo>();

        try {
            con = DataBaseConnection.dbConnection();
            sql = "select distinct training_course_name from training_course";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                TrainingCourseVo tvo = new TrainingCourseVo();

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
            } catch (SQLException ex) {
                System.out.println(ex.toString());
            }
        }
        return list;
    }

    @Override
    public List<SendMsgVo> showContactMsg() {

        List<SendMsgVo> list = new ArrayList<SendMsgVo>();

        try {
            con = DataBaseConnection.dbConnection();
            sql = "select * from student_contact_msg";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                SendMsgVo smvo = new SendMsgVo();
                smvo.setId(rs.getInt("scm_id"));
                smvo.setName(rs.getString("scm_name"));
                smvo.setEmail(rs.getString("scm_email"));
                smvo.setPhone(rs.getString("scm_phone"));
                smvo.setMassage(rs.getString("scm_message"));
                list.add(smvo);
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
    public List<StudentRegistrationVo> showStudentDetails() {
        List<StudentRegistrationVo> list = new ArrayList<StudentRegistrationVo>();

        try {
            con = DataBaseConnection.dbConnection();
            sql = "select * from student_regn_details";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                StudentRegistrationVo srbaVo = new StudentRegistrationVo();

                srbaVo.setStudentRegnBeforeAdmisnId(rs.getInt("student_regn_id"));
                srbaVo.setFirstName(rs.getString("first_name"));
                srbaVo.setLastName(rs.getString("last_name"));
                srbaVo.setEmailId(rs.getString("email_id"));
                srbaVo.setMobile(rs.getString("mobile"));
                list.add(srbaVo);
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
    public StudentRegistrationVo showStudentRegnLoginDetails(int id) {
        StudentRegistrationVo srbaVo = new StudentRegistrationVo();

        try {
            con = DataBaseConnection.dbConnection();
            sql = "select * from student_regn_details srd,student_login_details sld where srd.student_regn_id=sld.student_regn_id and srd.student_regn_id=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                srbaVo.setStudentRegnBeforeAdmisnId(rs.getInt("student_regn_id"));
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
                srbaVo.setPassword(rs.getString("student_password"));
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

        return srbaVo;
    }

    //Add Faculty
    @Override
    public int addFaculty(FacultyVo fvo) {
        int result = 0;

        try {
            con = DataBaseConnection.dbConnection();
            sql = "insert into facultyDetails values(default,?,?,?,?,?,?,?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, fvo.getFacultyTechnology());
            ps.setString(2, fvo.getFacultyName());
            ps.setString(3, fvo.getFacultyEmail());
            ps.setString(4, fvo.getFacultyMobile());
            ps.setString(5, fvo.getFacultyMobileAlt());
            ps.setString(6, fvo.getFacultyAddress());
            ps.setString(7, fvo.getFacultyPassword());
            result = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            try {
                con.close();
                ps.close();
            } catch (SQLException se) {
                System.out.println(se);
            }
        }

        return result;
    }

    @Override
    public List<FacultyVo> showFacultyWRTCourseId(int trainingCourseId) {
        List<FacultyVo> list = new ArrayList<FacultyVo>();

        try {
            con = DataBaseConnection.dbConnection();
            sql = "select * from facultydetails where facultyTechnology=(select training_course_name from training_course where training_course_id=?)";
            ps = con.prepareStatement(sql);
            ps.setInt(1, trainingCourseId);
            rs = ps.executeQuery();
            while (rs.next()) {
                FacultyVo fvo = new FacultyVo();

                fvo.setFacultyId(rs.getInt("facultyId"));
                fvo.setFacultyName(rs.getString("facultyName"));

                list.add(fvo);
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
    public String getTrainingCourseFees(StudentRegistrationVo sraaVo) {
        String trainingCourseFees = null;
        try {
            con = DataBaseConnection.dbConnection();
            sql = "select * from training_course where training_course_id=? and training_category_id=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, sraaVo.getTrainingCategoryId());
            ps.setInt(2, sraaVo.getTrainingCourseId());
            rs = ps.executeQuery();
            while (rs.next()) {
                trainingCourseFees = rs.getString("training_course_fees");
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
        return trainingCourseFees;
    }

    @Override
    public int addBatch(BatchVo batchVo) {
        int result = 0;

        try {
            con = DataBaseConnection.dbConnection();
            sql = "insert into batchdetails values(default,?,?,?,?,?,?,?,?,?,?)";
            ps = con.prepareStatement(sql);
            ps.setInt(1, batchVo.getTrainingCategoryId());
            ps.setInt(2, batchVo.getTrainingCourseId());
            ps.setInt(3, batchVo.getFacultyId());
            ps.setString(4, batchVo.getDateSchedule2());
            ps.setString(5, batchVo.getBatchStartTime());
            ps.setString(6, batchVo.getBatchStartTimeFormat());
            ps.setString(7, batchVo.getBatchEndTime());
            ps.setString(8, batchVo.getBatchEndTimeFormat());
            ps.setString(9, batchVo.getRoomNo());
            ps.setString(10, batchVo.getBatchCreationYear());
            result = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            try {
                con.close();
                ps.close();
            } catch (SQLException se) {
                System.out.println(se);
            }
        }

        return result;
    }

    @Override
    public List<BatchVo> showBatch() {

        List<BatchVo> list = new ArrayList<BatchVo>();

        try {
            con = DataBaseConnection.dbConnection();
            sql = "SELECT bat.batchId,cat.training_category_name,cou.training_course_name,fac.facultyName,bat.dateSchedule,bat.batchStartTime,bat.batchStartTimeFormat,bat.batchEndTime,bat.batchEndTimeFormat,bat.roomNo,bat.batchCreationYear FROM batchdetails bat JOIN training_category cat JOIN facultydetails fac JOIN training_course cou ON bat.training_category_id=cat.training_category_id AND bat.training_course_id=cou.training_course_id AND bat.facultyId=fac.facultyId";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                BatchVo bvo = new BatchVo();
                bvo.setBatchId(rs.getInt("batchId"));
                bvo.setTrainingCategoryName(rs.getString("training_category_name"));
                bvo.setTrainingCourseName(rs.getString("training_course_name"));
                bvo.setFacultyName(rs.getString("facultyName"));
                bvo.setDateSchedule2(rs.getString("dateSchedule"));
                bvo.setBatchStartTime(rs.getString("batchStartTime"));
                bvo.setBatchStartTimeFormat(rs.getString("batchStartTimeFormat"));
                bvo.setBatchEndTime(rs.getString("batchEndTime"));
                bvo.setBatchEndTimeFormat(rs.getString("batchEndTimeFormat"));
                bvo.setRoomNo(rs.getString("roomNo"));
                bvo.setBatchCreationYear(rs.getString("batchCreationYear"));
                list.add(bvo);
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
    public List<BatchVo> showBatchWRTCourseIdAndYear(int trainingCourseId, String currentYear) {
        List<BatchVo> batchList = new ArrayList<BatchVo>();

        try {
            con = DataBaseConnection.dbConnection();
            sql = "select * from batchdetails where training_course_id=? and batchCreationYear=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, trainingCourseId);
            ps.setString(2, currentYear);
            rs = ps.executeQuery();
            while (rs.next()) {
                BatchVo bvo = new BatchVo();
                bvo.setBatchId(rs.getInt("batchId"));
                //bvo.setTrainingCategoryId(rs.getInt("training_category_id"));
                //bvo.setTrainingCourseId(rs.getInt("training_course_id"));
                batchList.add(bvo);
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

        return batchList;
    }

    @Override
    public int addStudentAfterAdmission(StudentRegistrationVo sraaVo) {
        int result = 0;

        try {
            con = DataBaseConnection.dbConnection();
            sql = "insert into student_regn_after_admsn values(default,?,?,?,?,?,?,?,?,?,?)";
            ps = con.prepareStatement(sql);

            result = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            try {
                con.close();
                ps.close();
            } catch (SQLException se) {
                System.out.println(se);
            }
        }

        return result;
    }
    
    public List<StudentPaymentVO> paymentModeDetails() {
        
        List<StudentPaymentVO> listOfStudentPayment=new ArrayList<StudentPaymentVO>();
        try{
            DataBaseConnection dbcon=new DataBaseConnection();
            Connection con=dbcon.dbConnection();
            StudentPaymentVO stpvo=null;
            ps=con.prepareStatement("select * from student_payment_details");
            rs=ps.executeQuery();
            while(rs.next()){
                stpvo=new StudentPaymentVO();
                stpvo.setPayment_id(rs.getInt("payment_id"));
                stpvo.setEnrollment_no(rs.getString("enrollment_no"));
                stpvo.setTotal_payable_amount(rs.getString("total_payable_amount"));
                stpvo.setPaid_amount(rs.getString("paid_amount"));
                stpvo.setCheck_no(rs.getString("check_no"));
                stpvo.setCard_no(rs.getString("card_no"));
                stpvo.setCard_type(rs.getString("card_type"));
                stpvo.setExpiry_date(rs.getString("expiry_date"));
                stpvo.setCvv(rs.getString("cvv"));
                stpvo.setPay_date(rs.getString("pay_date"));
                listOfStudentPayment.add(stpvo);
            }
        }catch(Exception e){
            e.getMessage();
        }
        return listOfStudentPayment;
    }
    

    public static void main(String[] args) {
        AdminDaoImpl ad = new AdminDaoImpl();
//        StudentRegistrationVo srbaVo = ad.showStudentRegnLoginDetails(4);
//        System.out.println(srbaVo.getFirstName());
//
//        List<TrainingCourseVo> list = ad.getTrainingCourseName();
//        Iterator<TrainingCourseVo> itr = list.iterator();
//        while (itr.hasNext()) {
//            TrainingCourseVo trainingCourseName = itr.next();
//            System.out.println(trainingCourseName.getTrainingCourseName());
//        }
//        
//        FacultyVo fvo = new FacultyVo();
//        fvo.setFacultyTechnology("Java/J2EE");
//        fvo.setFacultyName("Anirban Saha");
//        fvo.setFacultyEmail("as@gmail.com");
//        fvo.setFacultyMobile("9900778831");
//        fvo.setFacultyAddress("50H,Bose Pukur..");
//        int result = ad.addFaculty(fvo);
//        System.out.println(result);
//
//        List<FacultyVo> list = ad.showFacultyWRTCourseId(1);
//        Iterator<FacultyVo> itr = list.iterator();
//        while (itr.hasNext()) {
//            FacultyVo fvo = itr.next();
//            System.out.println(fvo.getFacultyId() + " " + fvo.getFacultyName());
//        }

//        List<BatchVo> list = ad.showBatch();
//        Iterator<BatchVo> itr = list.iterator();
//        while (itr.hasNext()) {
//            BatchVo bvo = itr.next();
//            System.out.println(bvo.getBatchId() + " " + bvo.getBatchStartTime());
//        }
//        AdminDetailsVo adminDetailsVo2 = new AdminDetailsVo();
//        adminDetailsVo2.setUsername("palash");
//        adminDetailsVo2.setPasswordNew("12345");
//        int result = ad.adminChangePassword(adminDetailsVo2);
//        System.out.println(result);
//        StudentRegistrationAfterAdmissionVo sraaVo = new StudentRegistrationAfterAdmissionVo();
//        sraaVo.setTrainingCategoryId(1);
//        sraaVo.setTrainingCourseId(3);
//        
//        AdminDaoImpl adaoimpl = new AdminDaoImpl();
//        String trainingCourseFees = adaoimpl.getTrainingCourseFees(sraaVo);
//        System.out.println(trainingCourseFees);
    }
}
