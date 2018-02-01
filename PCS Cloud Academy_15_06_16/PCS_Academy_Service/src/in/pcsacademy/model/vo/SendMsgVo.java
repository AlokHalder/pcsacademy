package in.pcsacademy.model.vo;

public class SendMsgVo {

    private int id;
    private String name;
    private String email;
    private String phone;
    private String massage;
    //private List<FeedbackVo> list2;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMassage() {
        return massage;
    }

    public void setMassage(String massage) {
        this.massage = massage;
    }

//    public List<FeedbackVo> getList2() {
//        return list2;
//    }
//
//    public void setList2(List<FeedbackVo> list2) {
//        this.list2 = list2;
//    }
}
