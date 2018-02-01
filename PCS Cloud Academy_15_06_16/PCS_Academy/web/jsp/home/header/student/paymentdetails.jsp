<%@taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>  
<%@taglib  uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@taglib  uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<style type="text/css">
    .error {
        background-color:#FFCCCC;
        border:1px solid #CC0000;
        width:240px;
        height: 30px;
        color: #CC0000;
        text-align: center;
        padding-top: 3px;
    }
</style>
<style>
    .TFtable{
        width:60%; 
        border-collapse:collapse; 
    }
    .TFtable td{ 
        padding:7px; border:#4e95f4 1px solid;
    }
    /* provide some minimal visual accomodation for IE8 and below */
    .TFtable tr{
        background: #b8d1f3;
    }
    /*  Define the background color for all the ODD background rows  */
    .TFtable tr:nth-child(odd){ 
        background: #b8d1f3;
    }
    /*  Define the background color for all the EVEN background rows  */
    .TFtable tr:nth-child(even){
        background: #dae5f4;
    }
    .TFtable tr:first-child{ font-waight:bold;}
</style>



<article>
    <!-- MAIN CONTENT -->
    <!--    <div id="system-message-container"></div>-->
    <div class="contact">
        <h2 style="margin-top: 1px; margin-left: 0px; margin-bottom: 18px;">Payment Details</h2>
        <div class="contact-form">
            <logic:present name="STUDENTPAYMENTDETAILS">
                <logic:empty name="STUDENTPAYMENTDETAILS">
                    <div class="error">
                        Your Payment is Remaining
                    </div>
                </logic:empty>  
                <logic:notEmpty name="STUDENTPAYMENTDETAILS">
                    <table class="TFtable">
                        <tr>
                            <td>Enrollment-id</td>
                            <td>Payable Amount</td>
                            <td>Paid Amount</td>
                        </tr> 
                        <logic:iterate id="STUDENTPAYMENTDETAILS" name="STUDENTPAYMENTDETAILS"> 
                            <tr>
                                <td>
                                    <bean:write name="STUDENTPAYMENTDETAILS" property="enrollmentno"/>    
                                </td>
                                <td>
                                    <bean:write name="STUDENTPAYMENTDETAILS" property="totalPayableAmount"/>                            
                                </td>
                                <td>
                                    <bean:write name="STUDENTPAYMENTDETAILS" property="paidAmount"/>
                                </td>
                                <td>
                                    <a href="#" >
                                        Details   
                                    </a>                           
                                </td>
                            </tr>
                            <tr>
                                <td>Text</td>
                                <td>Text</td>
                                <td>Text</td>
                                <td>Text</td>
                            </tr>
                            <tr>
                                <td>Text</td>
                                <td>Text</td>
                                <td>Text</td>
                                <td>Text</td>
                            </tr>
                            <tr>
                                <td>Text</td>
                                <td>Text</td>
                                <td>Text</td>
                                <td>Text</td>
                            </tr>
                        </logic:iterate>
                    </table>      
                </logic:notEmpty>           
            </logic:present>                  
        </div>
    </div>
</article>



