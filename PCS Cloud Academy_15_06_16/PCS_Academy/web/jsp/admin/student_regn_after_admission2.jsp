<%@taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script language="javaScript" type="text/javascript" src="js/calendar.js"></script>
        <link href="css/calendar-admin.css" rel="stylesheet" type="text/css">
        <script type="text/javascript">
            function doPayDueCalculation() {
                var totalPayableAmount = document.getElementById("totalPayableAmount").value;
                var paidAmount = document.getElementById("paidAmount").value;
                document.getElementById("dueAmount").value = (totalPayableAmount - paidAmount);
            }

            function doCheckInvalidInput() {
                var invalidInput = /^([0-9])+([a-z ! @ # $ % ^ & * ( ) _ - + = { ? ; : < , > . } [\] |])+$/;
                var invalidInput2 = /^[a-z ! @ # $ % ^ & * ( ) _ - + = { ? ; : < , > . } [\] |]+$/;

                var paidAmount = document.getElementById("paidAmount").value;
                if (paidAmount.match(invalidInput) || paidAmount.match(invalidInput2)) {
                    alert("Enter valid input");
                    document.getElementById("paidAmount").value = "";
                    document.getElementById("paidAmount").focus();
                    document.getElementById("dueAmount").value = "0";
                }
            }

            function exd(str) {
                var exp1 = /^[A-Z a-z 0-9]+$/;
                if (str.match(exp1)) {
                    return false;
                }
                else
                    return true;
            }

            function validate() {
                var exp2 = document.getElementById("expirydt").value;
                if (exd(exp2)) {
                    return false;
                }
                else
                    return true;
            }

            function studentRegnAfterAdmission2() {
                var totalPayableAmount = document.getElementById("totalPayableAmount").value;
                var paidAmount = document.getElementById("paidAmount").value;
                var dueAmount = document.getElementById("dueAmount").value;
                var checkNo = document.getElementById("checkNo").value;
                var cardNo = document.getElementById("cardNo").value;
                var cardType = document.getElementById("cardType").value;
                var d1 = document.getElementById("expirydt").value;
                var cvv = document.getElementById("cvv").value;

                var d = Date.parse(d1);
                var d2 = new Date();

                if (paidAmount == "" || paidAmount == null) {
                    alert("Enter amount to be paid!");
                    document.getElementById("paidAmount").focus();
                    return false;
                }
                if (paidAmount > totalPayableAmount) {
                    alert("Amount not more than Course fees!");
                    document.getElementById("paidAmount").value = totalPayableAmount;
                    document.getElementById("dueAmount").value = 0;
                    return false;
                }
                if (paidAmount < 500) {
                    alert("Amount not lass than 500!");
                    document.getElementById("paidAmount").focus();
                    return false;
                }
                if (dueAmount == "" || dueAmount == null) {
                    alert("Enter due amount!");
                    document.getElementById("dueAmount").focus();
                    return false;
                }
                if (document.getElementById("paymentModeCheckk").checked && (checkNo == "" || checkNo == null)) {
                    alert("Enter Check no.!");
                    document.getElementById("checkNo").focus();
                    return false;
                }
                if (document.getElementById("paymentModeCard").checked && (cardNo == "" || cardNo == null)) {
                    alert("Enter card no.!");
                    document.getElementById("cardNo").focus();
                    return false;
                }
                if (document.getElementById("paymentModeCard").checked && cardNo.length < 15) {
                    alert("Enter valid card no.!");
                    document.getElementById("cardNo").select();
                    return false;
                }
                if (document.getElementById("paymentModeCard").checked && (cardType == "" || cardType == null)) {
                    alert("Choose card type!");
                    return false;
                }
                if (document.getElementById("paymentModeCard").checked && (d1 == "" || d1 == null)) {
                    alert("Enter Expiry Date");
                    document.getElementById("expirydt").focus();
                    return false;
                }
                if ((d - d2) < 0) {
                    alert("Card Expired!");
                    document.getElementById("expirydt").value = "";
                    document.getElementById("expirydt").focus();
                    return false;
                }
                if (document.getElementById("paymentModeCard").checked && (cvv == "" || cvv == null)) {
                    alert("Enter cvv!");
                    document.getElementById("cvv").focus();
                    return false;
                }
                if (document.getElementById("paymentModeCard").checked && cvv.length < 3) {
                    alert("Enter valid cvv!");
                    document.getElementById("cvv").focus();
                    return false;
                }
                var studentRegnAfterAdmissionConfirm = confirm("Sure to register?");
                if (studentRegnAfterAdmissionConfirm) {
                    return true;
                }
                else {
                    return false;
                }
            }

            function paymentModeCheck() {
                if (document.getElementById("paymentModeCash").checked) {
                    document.getElementById("checkNo").value = "";
                    document.getElementById("cardNo").value = "";
                    document.getElementById("cardType").value = "";
                    document.getElementById("expirydt").value = "";
                    document.getElementById("cvv").value = "";
                    document.getElementById("paymentDetails-check").style.display = "none";
                    document.getElementById("paymentDetails").style.display = "none";
                }
                if (document.getElementById("paymentModeCheckk").checked) {
                    document.getElementById("cardNo").value = "";
                    document.getElementById("cardType").value = "";
                    document.getElementById("expirydt").value = "";
                    document.getElementById("cvv").value = "";
                    document.getElementById("paymentDetails").style.display = "none";
                    document.getElementById("paymentDetails-check").style.display = "block";
                    document.getElementById("checkNo").focus();
                }
                if (document.getElementById("paymentModeCard").checked) {
                    document.getElementById("checkNo").value = "";
                    document.getElementById("paymentDetails-check").style.display = "none";
                    document.getElementById("paymentDetails").style.display = "block";
                    document.getElementById("cardNo").focus();
                }
            }
        </script>
    </head>




    <body>
    <center>
        <p><h2>Register Student after admission- Payment Details:</h2></p>
        <html:form action="addstudentdetails3" onsubmit="return studentRegnAfterAdmission2();">

        <input type="hidden" name="trainingCategoryId" value="<bean:write property='trainingCategoryId' name='StudentRegistrationDto'/>"/>
        <input type="hidden" name="trainingCourseId" value="<bean:write property='trainingCourseId' name='StudentRegistrationDto'/>"/>
        <input type="hidden" name="batchId" value="<bean:write property='batchId' name='StudentRegistrationDto'/>"/>
        <input type="hidden" name="salutation" value="<bean:write property='salutation' name='StudentRegistrationDto'/>"/>
        <input type="hidden" name="firstName" value="<bean:write property='firstName' name='StudentRegistrationDto'/>"/>
        <input type="hidden" name="lastName" value="<bean:write property='lastName' name='StudentRegistrationDto'/>"/>
        <input type="hidden" name="dob" value="<bean:write property='dob' name='StudentRegistrationDto'/>"/>
        <input type="hidden" name="state" value="<bean:write property='state' name='StudentRegistrationDto'/>"/>
        <input type="hidden" name="city" value="<bean:write property='city' name='StudentRegistrationDto'/>"/>
        <input type="hidden" name="emailId" value="<bean:write property='emailId' name='StudentRegistrationDto'/>"/>
        <input type="hidden" name="mobile" value="<bean:write property='mobile' name='StudentRegistrationDto'/>"/>
        <input type="hidden" name="collegeName" value="<bean:write property='collegeName' name='StudentRegistrationDto'/>"/>
        <input type="hidden" name="branch" value="<bean:write property='branch' name='StudentRegistrationDto'/>"/>
        <input type="hidden" name="university" value="<bean:write property='university' name='StudentRegistrationDto'/>"/>
        <input type="hidden" name="persuingQualification" value="<bean:write property='persuingQualification' name='StudentRegistrationDto'/>"/>
        <input type="hidden" name="passingYear" value="<bean:write property='passingYear' name='StudentRegistrationDto'/>"/>
        <input type="hidden" name="semester" value="<bean:write property='semester' name='StudentRegistrationDto'/>"/>
        <input type="hidden" name="password" value="<bean:write property='password' name='StudentRegistrationDto'/>"/>


        <table>
            <tr>
                <td>Course Fees:</td>
                <td><html:text property="totalPayableAmount" styleId="totalPayableAmount" readonly="true" value="${requestScope.TRAININGCOURSEFEES}" style="background-color: palegoldenrod;" /></td>
            </tr>
            <tr>
                <td>Amount Paid:</td>
                <td><html:text property="paidAmount" styleId="paidAmount" value="${requestScope.TRAININGCOURSEFEES}" onkeyup="doPayDueCalculation();" onblur="doCheckInvalidInput();"/></td>
            </tr>
            <tr>
                <td>Amount Due:</td>
                <td><html:text property="dueAmount" styleId="dueAmount" value="0" readonly="true" style="background-color: palegoldenrod;" /></td>
            </tr>
            <tr>
                <td>Payment Mode:</td>
                <td><input type="radio" name="paymentMode" id="paymentModeCash" checked="checked" onclick="paymentModeCheck();"/>Cash <input type="radio" name="paymentMode" id="paymentModeCheckk" onclick="paymentModeCheck();"/>Cheque <input type="radio" name="paymentMode" id="paymentModeCard" onclick="paymentModeCheck();"/>Card</td>
            </tr>
        </table>
        <div id="paymentDetails-check" style="display: none;padding-left: 0px;">
            <table>
                <tr>
                    <td>Cheque No.:</td>
                    <td><html:text property="checkNo" styleId="checkNo" maxlength=""/></td>
                </tr> 
            </table>
        </div>
        <div id="paymentDetails" style="display: none;padding-left: 16px;">
            <table>
                <tr>
                    <td>Card No.:</td>
                    <td><html:text property="cardNo" styleId="cardNo" maxlength="16"/></td>
                </tr>
                <tr>
                    <td>Card Type:</td>
                    <td>
                        <html:select property="cardType" styleId="cardType">
                            <html:option value="">Select</html:option>
                            <html:option value="Master Card">Master Card</html:option>
                            <html:option value="Visa">Visa</html:option>
                            <html:option value="American Express">American Express</html:option>
                        </html:select>
                    </td>
                </tr>
                <tr>
                    <td>Expiry Date:</td>
                    <td>
                        <!--<input type="text" name="datum1" value="" id="datum1" onkeypress="return validate();"/>-->
                        <html:text property="expirydt" styleId="expirydt" onkeypress="return validate();" />
                    </td>
                    <td>
                        <!--<div>-->
                        <a href="javascript:void(0);" onClick="setYears(1947, 2020);
                                showCalender(this, 'expirydt');"><img src="calender.png"></a>
                        <!-- Calender Script  -->
                        <table id="calenderTable">
                            <tbody id="calenderTableHead">
                                <tr>
                                    <td colspan="4" align="center">
                                        <select onChange="showCalenderBody(createCalender(document.getElementById('selectYear').value, this.selectedIndex, false));" id="selectMonth">
                                            <option value="0">Jan</option>
                                            <option value="1">Feb</option>
                                            <option value="2">Mar</option>
                                            <option value="3">Apr</option>
                                            <option value="4">May</option>
                                            <option value="5">Jun</option>
                                            <option value="6">Jul</option>
                                            <option value="7">Aug</option>
                                            <option value="8">Sep</option>
                                            <option value="9">Oct</option>
                                            <option value="10">Nov</option>
                                            <option value="11">Dec</option>
                                        </select>
                                    </td>
                                    <td colspan="2" align="center">
                                        <select onChange="showCalenderBody(createCalender(this.value, document.getElementById('selectMonth').selectedIndex, false));" id="selectYear">
                                        </select>
                                    </td>
                                    <td align="center">
                                        <a href="#" onClick="closeCalender();"><font color="#003333" size="+1">X</font></a>
                                    </td>
                                </tr>
                            </tbody>
                            <tbody id="calenderTableDays">
                                <tr style="">
                                    <td>Sun</td><td>Mon</td><td>Tue</td><td>Wed</td><td>Thu</td><td>Fri</td><td>Sat</td>
                                </tr>
                            </tbody>
                            <tbody id="calender"></tbody>
                        </table>
                        <!--</div>-->
                    </td>
                </tr>
                <tr>
                    <td>CVV:</td>
                    <td><html:password property="cvv" styleId="cvv" value="" size="4" maxlength="4"/></td>
                </tr>
            </table>
        </div>
        <table style="padding-left: 70px;">
            <tr>
                <td></td>
                <td><html:submit value="Register" />&nbsp;<html:reset value="Reset" /></td>
            </tr>
        </table>
    </html:form>
</center>
</body>
</html>
