package in.pcsacademy.model.dto;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class SendMsgDto extends org.apache.struts.action.ActionForm {

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
        this.id = 0;
        this.name = "";
        this.email = "";
        this.phone = "";
        this.massage = "";
    }
}
