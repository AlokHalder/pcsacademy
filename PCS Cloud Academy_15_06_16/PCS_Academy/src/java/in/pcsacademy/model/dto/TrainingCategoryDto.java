package in.pcsacademy.model.dto;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class TrainingCategoryDto extends org.apache.struts.action.ActionForm {

    private int trainingCategoryId;
    private String trainingCategoryName;

    public TrainingCategoryDto() {
        super();
    }

    public int getTrainingCategoryId() {
        return trainingCategoryId;
    }

    public void setTrainingCategoryId(int trainingCategoryId) {
        this.trainingCategoryId = trainingCategoryId;
    }

    public String getTrainingCategoryName() {
        return trainingCategoryName;
    }

    public void setTrainingCategoryName(String trainingCategoryName) {
        this.trainingCategoryName = trainingCategoryName;
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
        this.trainingCategoryName = "";
    }
}
