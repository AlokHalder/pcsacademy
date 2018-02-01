<%@taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>  
<%@taglib  uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@taglib  uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<script type="text/javascript">
    function feedbackFormCheck() {
        var name = document.getElementById("name").value;
        var email = document.getElementById("email").value;
        var phno = document.getElementById("phone").value;
        var msg = document.getElementById("massage").value;


        if (name == "" || name == null || name == "Name") {
            alert("Enter Valid Name");
            return false;
        }
        if (email == "" || email == null || email == "Email") {
            alert("Enter Valid Email");
            return false;
        }
        if (phno == "" || phno == null || phno == "Phone") {
            alert("Enter Valid Phone Number");
            return false;
        }
        if (msg == "" || msg == null || msg == "Message") {
            alert("Enter Some Message");
            return false;
        }
    }
</script>

<style>
    .TFtable{
        width:100%; 
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
        <h2 style="margin-top: 1px; margin-left: 0px; margin-bottom: 18px;">Registration Details</h2>
        <div class="contact-form">
            <logic:present name="ALLSTUDENTDATA">
                <table class="TFtable">
                    <tr align="center">
                        <td align="center"><b>Registration Id</b></td> 
                        <td align="center"><b>Name</b></td> 
                        <td align="center"><b>Email-id</b></td> 
                        <td align="center"><b>Phone No</b></td> 
                    </tr> 
                    <tr>
                        <td>
                            <bean:write name="ALLSTUDENTDATA" property="studentRegnBeforeAdmisnId"/>   
                        </td>
                        <td>
                            <bean:write name="ALLSTUDENTDATA" property="salutation"/>
                            <bean:write name="ALLSTUDENTDATA" property="firstName"/>&nbsp;
                            <bean:write name="ALLSTUDENTDATA" property="lastName"/>
                        </td>
                        <td>
                            <bean:write name="ALLSTUDENTDATA" property="emailId"/>                            
                        </td>
                        <td>
                            <bean:write name="ALLSTUDENTDATA" property="mobile"/>                            
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
                        <td>Text</td>
                    </tr>
                    <tr>
                        <td>Text</td>
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
                        <td>Text</td>
                    </tr>
                </table>
            </logic:present>                  
        </div>
    </div>
</article>
