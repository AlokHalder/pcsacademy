package in.pcsacademy.controller;

import in.pcsacademy.model.daoimpl.AdminDaoImpl;
import in.pcsacademy.model.dto.AdminDetailsDto;
import in.pcsacademy.model.vo.AdminDetailsVo;
import java.util.List;
import java.util.ResourceBundle;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;

public class AdminCon extends MappingDispatchAction {

    private final static String SUCCESS = "success";
    private final static String FAILURE = "failure";
    private final static String FAILUREPASSWORDCHANGE = "failurepasswordchange";
    ResourceBundle bundle = ResourceBundle.getBundle("in.pcsacademy.properties.MessageProperty");
    HttpSession session = null;

    public ActionForward login(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        AdminDetailsDto aldto = (AdminDetailsDto) form;
        String username = aldto.getUsername();
        String password = aldto.getPassword();
        int desigCode = aldto.getDesigCode();
        AdminDetailsVo adminDetailsVo = new AdminDetailsVo();
        adminDetailsVo.setUsername(username);
        adminDetailsVo.setPassword(password);
        adminDetailsVo.setDesigCode(desigCode);

        AdminDaoImpl adaoimpl = new AdminDaoImpl();
        boolean res = adaoimpl.adminLogin(adminDetailsVo);
        if (res) {
            session = request.getSession(true);
            session.setAttribute("ADMINDETAILS", adminDetailsVo);
            aldto.reset(mapping, request);
            return mapping.findForward(SUCCESS);
        } else {
            List<AdminDetailsVo> showdesig = adaoimpl.showDesig();
            request.setAttribute("SHOWDESIG", showdesig);
            String adminLoginFailMsg = bundle.getString("ADMIN_LOGIN_FAIL_MSG");
            request.setAttribute("ADMIN_LOGIN_FAIL_MSG", adminLoginFailMsg);
            return mapping.findForward(FAILURE);
        }

    }

    public ActionForward logout(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        session = request.getSession(true);
        session.removeAttribute("ADMINDETAILS");
        session.invalidate();

        AdminDaoImpl adaoimpl = new AdminDaoImpl();
        List<AdminDetailsVo> showdesig = adaoimpl.showDesig();
        request.setAttribute("SHOWDESIG", showdesig);
        String adminLogoutSuccessMsg = bundle.getString("ADMIN_LOGOUT_SUCCESS_MSG");
        request.setAttribute("ADMIN_LOGOUT_SUCCESS_MSG", adminLogoutSuccessMsg);
        return mapping.findForward(SUCCESS);

    }

    public ActionForward loginRecheck(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        if ((request.getSession()).getAttribute("ADMINDETAILS") != null) {
            return mapping.findForward(SUCCESS);
        } else {
            AdminDaoImpl adaoimpl = new AdminDaoImpl();
            List<AdminDetailsVo> showdesig = adaoimpl.showDesig();
            request.setAttribute("SHOWDESIG", showdesig);
            return mapping.findForward(FAILURE);
        }

    }

    public ActionForward changePassword(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        AdminDetailsDto aldto = (AdminDetailsDto) form;
        String password = aldto.getPassword();
        String passwordNew = aldto.getPasswordNew();

        AdminDetailsVo adminDetailsVo = (AdminDetailsVo) session.getAttribute("ADMINDETAILS");
        String username = adminDetailsVo.getUsername();
        String passwordOriginal = adminDetailsVo.getPassword();

        if (password.equals(passwordOriginal)) {
            AdminDetailsVo adminDetailsVo2 = new AdminDetailsVo();
            adminDetailsVo2.setUsername(username);
            adminDetailsVo2.setPasswordNew(passwordNew);
            AdminDaoImpl adaoimpl = new AdminDaoImpl();
            int result = adaoimpl.adminChangePassword(adminDetailsVo2);
            if (result > 0) {
                session.removeAttribute("ADMINDETAILS");
                session.invalidate();
                aldto.reset(mapping, request);
                List<AdminDetailsVo> showdesig = adaoimpl.showDesig();
                request.setAttribute("SHOWDESIG", showdesig);
                String adminPassChngMsg = bundle.getString("ADMIN_PASSWORD_CHANGE_SUCCESS_MSG");
                request.setAttribute("ADMIN_PASSWORD_CHANGE_SUCCESS_MSG", adminPassChngMsg);
                return mapping.findForward(SUCCESS);
            } else {
                String adminPassChngFailMsg = bundle.getString("ADMIN_PASSWORD_CHANGE_FAIL_MSG");
                request.setAttribute("ADMIN_PASSWORD_CHANGE_FAIL_MSG", adminPassChngFailMsg);
                return mapping.findForward(FAILUREPASSWORDCHANGE);
            }
        } else {
            aldto.reset(mapping, request);
            String adminWrongCurrentPasswordMsg = bundle.getString("ADMIN_WRONG_CURRENT_PASSWORD_MSG");
            request.setAttribute("ADMIN_WRONG_CURRENT_PASSWORD_MSG", adminWrongCurrentPasswordMsg);
            return mapping.findForward(FAILURE);
        }

    }

}
