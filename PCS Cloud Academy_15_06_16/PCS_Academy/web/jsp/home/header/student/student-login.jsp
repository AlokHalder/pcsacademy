<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %>
<html>
    <head>
        <title></title>
    </head>



    <body>
        <!-- Article -->
        <article>
            <div class="row">
                <div class="item-text col-md-6" style="padding-bottom:20px; width:100%;">
                    <header class="article-header clearfix" style="width:100%;">
                        <h2 class="article-title" itemprop="name"><a href="" itemprop="url" title="">Student Login</a></h2>
                    </header>

                    <div style="margin-left: 0px;">
                        ${requestScope.STUDENT_LOGOUT_SUCCESS_MSG}
                        ${requestScope.STUDENT_LOGIN_FAIL_MSG}
                    </div>
                    
                    <div id="ja-user-login">
                        <html:form action="student-login" styleId="login-form">
                            <div class="pretext"></div>
                            <fieldset class="userdata" style="border:1px solid #ccc; padding: 10px; width: 400px; border-radius: 5px; margin-top: 10px;">
                                <p id="form-login-username">
                                    <label for="modlgn-username"> Registration Id</label>
                                    <html:text property="studentRegnBeforeAdmisnId" styleClass="inputbox" style="width:220px;" size="18" styleId="uregid" value="" />
                                </p>
                                <p id="form-login-password">
                                    <label for="modlgn-passwd">Password</label>
                                    <html:password property="password" styleId="upass" styleClass="inputbox" style="width:220px;" size="18" />
                                </p>
                                <div id="form-login-remember" style="width:200px; float:left;">
                                    <span style="width:90px; float:left; margin-top: 10px;"><label for="modlgn-remember">Remember Me</label></span>
                                    <span style="width:20px; float:left;"><input id="modlgn-remember" type="checkbox" name="remember" class="inputbox" value="yes"/></span>
                                </div><div style="clear: both;">
                                    <html:submit value="Login" styleClass="" style="width:70px; height:30px; padding:0px 8px; background-color:#4899EB; color:#fff; border:1px solid #4899EB; border-radius:2px; line-height:20px;" />
                            </fieldset>
                            <ul>
                                <li><a href="">Forgot your password ?</a></li>
                                <li><a href="">Create an account</a></li>
                            </ul>
                        </html:form>
                    </div>
                </div>
            </div>
        </article>
        <!-- //Article --> 
    </body>
</html>
