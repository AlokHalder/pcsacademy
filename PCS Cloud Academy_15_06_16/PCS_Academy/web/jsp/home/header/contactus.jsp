<%@taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>  

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
            
  
 #map{
     height:500px;
     width:100%;
     margin-top:10px;
 }
 
        </style>


<article>


    <!-- MAIN CONTENT -->

    <div id="system-message-container"> </div>
    <div class="contact">
        <div class="page-header">
            <h2> <span class="contact-name">Contact Name Here</span> </h2>
        </div>
        <h3>Contact Form</h3>
        <div class="contact-form">
            <html:form action="contactus2" styleId="contact-form" styleClass="form-validate form-horizontal" onsubmit="return feedbackFormCheck();">
                <form id="contact-form" action="#" method="post" class="form-validate form-horizontal">
                    <fieldset>
                        <legend>Send an email. All fields with an<span style="color: #EF1C25;"> *</span> are required.</legend>
                        <div class="control-group-header row clearfix">
                            <div class="control-group col-md-12">
                                <div class="row">
                                    <div class="control-contact col-md-6 col-xs-12">
                                        <label id="jform_contact_name-lbl" for="jform_contact_name" class="hasTooltip required" title="<strong>Name</strong><br />Your name">Name<span class="star">&#160;*</span></label>
                                        <html:text property="name" styleId="name" value="Name" onfocus="if(this.value=='Name') this.value='';" onblur="if(this.value=='') this.value='Name';" />
                                        <!--<input type="text" name="jform[contact_name]" id="jform_contact_name" value="" size="30" required aria-required="true" />-->
                                    </div>
                                    <div class="control-contact col-md-6 col-xs-12">
                                        <label id="jform_contact_email-lbl" for="jform_contact_email" class="hasTooltip required" title="<strong>Email</strong><br />Email for contact">Email<span class="star">&#160;*</span></label>
                                        <html:text property="email" styleId="email" value="Email" onfocus="if(this.value=='Email') this.value='';" onblur="if(this.value=='') this.value='Email';" />
                                        <!--<input type="email" name="jform[contact_email]" class="validate-email" id="jform_contact_email" value="" size="30" required aria-required="true" />-->
                                    </div>
                                </div>
                            </div>
                            <div class="control-group col-md-12 col-xs-12">
                                <div class="control-contact">
                                    <label id="jform_contact_emailmsg-lbl" for="jform_contact_emailmsg" class="hasTooltip required" title="<strong>Subject</strong><br />Enter the subject of your message here .">Phone NO<span class="star">&#160;*</span></label>
                                    <html:text property="phone" styleId="phone" value="Phone" onfocus="if(this.value=='Phone') this.value='';" onblur="if(this.value=='') this.value='Phone';" />
                                    <!--<input type="text" name="jform[contact_subject]" id="jform_contact_emailmsg" value="" size="60" required aria-required="true" />-->
                                </div>
                                <div class="control-contact">
                                    <label id="jform_contact_message-lbl" for="jform_contact_message" class="hasTooltip required" title="<strong>Message</strong><br />Enter your message here.">Message<span class="star">&#160;*</span></label>
                                    <html:textarea property="massage" styleClass="jform_contact_message" styleId="massage" value="Message" cols="50" rows="90" onfocus="if(this.value=='Message') this.value='';" onblur="if(this.value=='') this.value='Message';"/>
                                    <!--<textarea name="jform[contact_message]" id="jform_contact_message" cols="50" rows="10" required aria-required="true" ></textarea>-->
                                </div>
                            </div>
                            <div class="re-captcha col-md-12 col-xs-12">
                                <div class="control-group">
                                    <div class="controls"> </div>
                                </div>
                            </div>
                        </div>
                        <div class="control-group-footer row clearfix">
                            <div class="control-group col-md-6 col-sm-6 col-xs-12">
                                <input type="checkbox" name="jform[contact_email_copy]" id="jform_contact_email_copy" value="1" />
                                <label id="jform_contact_email_copy-lbl" for="jform_contact_email_copy" class="hasTooltip" title="<strong>Send copy to yourself</strong><br />Sends a copy of the message to the address you have supplied.">Send copy to yourself</label>
                            </div>
                            <div class="control-group col-md-6 col-sm-6 col-xs-12">
                                <button class="btn btn-primary validate" type="submit">Send Email</button>
                                <input type="hidden" name="option" value="com_contact" />
                                <input type="hidden" name="task" value="contact.submit" />
                                <input type="hidden" name="return" value="" />
                                <input type="hidden" name="id" value="1:name" />
                                <input type="hidden" name="10e288274e7e00dcf76121b9555503da" value="1" />
                            </div>
                        </div>
                    </fieldset>

                </form>
            </html:form> 
            ${requestScope.CONTACT_MSG_SUBMIT_SUCCESS_MSG}
            ${requestScope.CONTACT_MSG_SUBMIT_FAIL_MSG}
        </div>

        <!-- BASIC DETAIL -->

        <h3>Contact</h3>
        <div class="row contact-address dl-horizontal">
            <div class="col-lg-8 col-md-9 col-xs-12">
                <div class="row">
                    <div class="contact-address col-md-4 col-xs-12" style="padding-right: 5px;">
                        <div class="jicons-text" > Email: <span class="jicons-desc">Please feel free to send us an email</span> </div>
                        <div class="contact-emailto"> <i class="fa fa-globe" style="font-size:14px;">&nbsp;pcsacademy@gmail.com </i>
                        </div>
                    </div>
                    <div class="contact-address col-md-4 col-xs-12">
                        <div class="jicons-text">Phone: <span class="jicons-desc">Give us a call</span> </div>
                        <div class="contact-telephone"> <i class="fa fa-phone">&nbsp;</i> 033-40012426 </div>
                    </div>
                    <div class="contact-address col-md-4 col-xs-12">
                        <div class="jicons-text" > Mobile: <span class="jicons-desc">Give us a call</span> </div>
                        <div class="contact-mobile"> <i class="fa fa-mobile">&nbsp;</i> +91 8697741613/15 </div>
                    </div>
                </div>
            </div>
            <div class="contact-address col-lg-4  col-md-3 col-xs-12">
                <div class="address-info"> <span class="jicons-text" > Address: </span>
                    <address>
                        <span class="contact-street"> <i class="fa fa-home">&nbsp;</i> DN-51 Merlin Infinite, Salt Lake, Sec- V, Kol-91</span>
                    </address>
                </div>
            </div>
            </dl>

            <!-- //BASIC DETAIL --> 

<!--        </div>
         map 
        <div class="row contact-address dl-horizontal">
            <div class="control-group col-md-12 col-xs-12">

                <div class="map">
                    <iframe width="100%" height="210" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.google.co.in/maps/place/PCS+Global+Pvt.+Ltd./@22.5769978,88.4319679,17.26z/data=!4m5!3m4!1s0x3a0275a5f47096b3:0xae1dd15e0cb02595!8m2!3d22.5772028!4d88.433032?hl=en"></iframe><br><small><a href="https://www.google.co.in/maps/place/PCS+Global+Pvt.+Ltd./@22.5769978,88.4319679,17.26z/data=!4m5!3m4!1s0x3a0275a5f47096b3:0xae1dd15e0cb02595!8m2!3d22.5772028!4d88.433032?hl=en" style="color:#777777;text-align:left;font-size:13px;font-family: 'Source Sans Pro', sans-serif;" target="parent">View Full Map</a></small>
                </div>
            </div>

              

        </div>-->
         <!--map--> 

        <!-- //MAIN CONTENT -->
        
<div  class="col-md-12">    
                 <div id="map">
     <script>
                        function initMap() {
                            var pcs = {lat: 22.5771, lng: 88.4329};
                            var map = new google.maps.Map(document.getElementById('map'), {
                             zoom:15,
                             center: pcs
                                                });
                            var marker = new google.maps.Marker({
                             position: pcs,
                             map: map
                                });
                         }
                    </script>
                    <script async defer
                        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAfvspz6Zxz7NBm58SRfIpXHEuYB4Y1pMA&callback=initMap">
                    </script>
       
</div>
     


</article>
