<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<body bgcolor="#8ad0ff">
    <div align="center">
        <h4>All students payment details</h4>
        <table border="4" cellpadding="2" cellspacing="2" width="100%">
            <thead>
                <tr>
                    <th>Payment Id</th>
                    <th>Enrollment Id</th>
                    <th>Total Payment Amount</th>
                    <th>Paid Amount</th>
                    <th>Check No</th>
                    <th>Card No</th>
                    <th>Card Type</th>
                    <th>Expiry Date</th>
                    <th>CVV</th>
                    <th>Pay Date</th>
                </tr>
            </thead>
            <logic:iterate id="StudentPaymentDto" name="StudentPaymentDto" property="listOfStudentPayment">
                <tr>
                    <td align="center">
                        <bean:write name="StudentPaymentDto" property="payment_id"/>
                    </td>
                    <td align="center">
                        <bean:write name="StudentPaymentDto" property="enrollment_no"/>
                    </td>
                    <td align="center">
                        <bean:write name="StudentPaymentDto" property="total_payable_amount"/>
                    </td>
                    <td align="center">
                        <bean:write name="StudentPaymentDto" property="paid_amount"/>
                    </td>
                    <td align="center">
                        <bean:write name="StudentPaymentDto" property="check_no"/>
                    </td>
                    <td align="center">
                        <bean:write name="StudentPaymentDto" property="card_no"/>
                    </td>
                    <td align="center">
                        <bean:write name="StudentPaymentDto" property="card_type"/>
                    </td>
                    <td align="center">
                        <bean:write name="StudentPaymentDto" property="expiry_date"/>
                    </td>
                    <td align="center">
                        <bean:write name="StudentPaymentDto" property="cvv"/>
                    </td>
                    <td align="center">
                        <bean:write name="StudentPaymentDto" property="pay_date"/>
                    </td>
                </tr>
            </logic:iterate>
            
        </table>
    </div>    
</body>