/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package in.pcsacademy.model.dto;

import in.pcsacademy.model.vo.StudentPaymentVO;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author Rintu
 */
public class StudentPaymentDto extends org.apache.struts.action.ActionForm {
    
    private int payment_id;
    private String enrollment_no;
    private String total_payable_amount;
    private String paid_amount;
    private String check_no;
    private String card_no;
    private String card_type;
    private String expiry_date;
    private String cvv;
    private String pay_date;
    private List<StudentPaymentVO> listOfStudentPayment;

    /**
     * @return the payment_id
     */
    public int getPayment_id() {
        return payment_id;
    }

    /**
     * @param payment_id the payment_id to set
     */
    public void setPayment_id(int payment_id) {
        this.payment_id = payment_id;
    }

    /**
     * @return the enrollment_no
     */
    public String getEnrollment_no() {
        return enrollment_no;
    }

    /**
     * @param enrollment_no the enrollment_no to set
     */
    public void setEnrollment_no(String enrollment_no) {
        this.enrollment_no = enrollment_no;
    }

    /**
     * @return the total_payable_amount
     */
    public String getTotal_payable_amount() {
        return total_payable_amount;
    }

    /**
     * @param total_payable_amount the total_payable_amount to set
     */
    public void setTotal_payable_amount(String total_payable_amount) {
        this.total_payable_amount = total_payable_amount;
    }

    /**
     * @return the paid_amount
     */
    public String getPaid_amount() {
        return paid_amount;
    }

    /**
     * @param paid_amount the paid_amount to set
     */
    public void setPaid_amount(String paid_amount) {
        this.paid_amount = paid_amount;
    }

    /**
     * @return the check_no
     */
    public String getCheck_no() {
        return check_no;
    }

    /**
     * @param check_no the check_no to set
     */
    public void setCheck_no(String check_no) {
        this.check_no = check_no;
    }

    /**
     * @return the card_no
     */
    public String getCard_no() {
        return card_no;
    }

    /**
     * @param card_no the card_no to set
     */
    public void setCard_no(String card_no) {
        this.card_no = card_no;
    }

    /**
     * @return the card_type
     */
    public String getCard_type() {
        return card_type;
    }

    /**
     * @param card_type the card_type to set
     */
    public void setCard_type(String card_type) {
        this.card_type = card_type;
    }

    /**
     * @return the expiry_date
     */
    public String getExpiry_date() {
        return expiry_date;
    }

    /**
     * @param expiry_date the expiry_date to set
     */
    public void setExpiry_date(String expiry_date) {
        this.expiry_date = expiry_date;
    }

    /**
     * @return the cvv
     */
    public String getCvv() {
        return cvv;
    }

    /**
     * @param cvv the cvv to set
     */
    public void setCvv(String cvv) {
        this.cvv = cvv;
    }

    /**
     * @return the pay_date
     */
    public String getPay_date() {
        return pay_date;
    }

    /**
     * @param pay_date the pay_date to set
     */
    public void setPay_date(String pay_date) {
        this.pay_date = pay_date;
    }

    /**
     * @return the listOfStudentPayment
     */
    public List<StudentPaymentVO> getListOfStudentPayment() {
        return listOfStudentPayment;
    }

    /**
     * @param listOfStudentPayment the listOfStudentPayment to set
     */
    public void setListOfStudentPayment(List<StudentPaymentVO> listOfStudentPayment) {
        this.listOfStudentPayment = listOfStudentPayment;
    }
}
