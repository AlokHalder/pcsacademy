package in.pcsacademy.model.vo;

public class AdminDetailsVo {

    private int userid;
    private String username;
    private String password;
    private String passwordNew;
    //private String designation;
    private int desigCode;
    private String desigName;

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordNew() {
        return passwordNew;
    }

    public void setPasswordNew(String passwordNew) {
        this.passwordNew = passwordNew;
    }

//    public String getDesignation() {
//        return designation;
//    }
//
//    public void setDesignation(String designation) {
//        this.designation = designation;
//    }
    public int getDesigCode() {
        return desigCode;
    }

    public void setDesigCode(int desigCode) {
        this.desigCode = desigCode;
    }

    public String getDesigName() {
        return desigName;
    }

    public void setDesigName(String desigName) {
        this.desigName = desigName;
    }
}
