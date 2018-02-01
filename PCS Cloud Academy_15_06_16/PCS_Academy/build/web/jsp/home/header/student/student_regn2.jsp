<%@taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<!DOCTYPE html>
<html>
    <head>
        <title>z-layout-master-2</title>
        <!--<link href="css/main.css" rel="stylesheet" type="text/css" />-->
    </head>



    <body>
    <center>
        <!-- Article -->
        <article>
            <div class="row">
                <div class="item-text col-md-6" style="padding-bottom:20px; width:100%;">
                    <section class="article-intro clearfix">
                        <!--<p />-->
                        <h2 class="article-title" itemprop="name">Congratulation!</h2>
                        <h4>You have Successfully Registered..</h4><br/>
                        Your Login-Id: ${requestScope['uid']}<br/>
                        Your password: ${requestScope['pass']}<br/><br/>
                    </section>
                </div>
            </div>
        </article>
        <!-- //Article --> 
    </center>
    </body>
</html>
