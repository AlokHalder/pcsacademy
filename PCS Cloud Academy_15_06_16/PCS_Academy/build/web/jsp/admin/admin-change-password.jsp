<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>

<html>
    <head>
        <script type="text/javascript">
            function changeAdminPassword() {
                var password = document.getElementById("password").value;
                var passwordNew = document.getElementById("passwordNew").value;
                var passwordConfirm = document.getElementById("passwordConfirm").value;

                if (password == "" || password == null) {
                    alert("Enter Current Password!");
                    document.getElementById("password").focus();
                    return false;
                }
                if (passwordNew == "" || passwordNew == null) {
                    alert("Enter New Password!");
                    document.getElementById("passwordNew").focus();
                    return false;
                }
                if (passwordNew != passwordConfirm) {
                    alert("New Passwords are not same!");
                    return false;
                }
            }
        </script>
    </head>



    <body>
    <center>
        <p><h2>Change Password:</h2></p>
        <html:form action="changeAdminPassword2" onsubmit="return changeAdminPassword();">
        <table border="1">
            <tr>
                <td>Current Password:</td>
                <td><html:password property="password" styleId="password" /></td>                   
            </tr>
            <tr>
                <td>New Password:</td>
                <td><html:password property="passwordNew" styleId="passwordNew" /></td>
            </tr>
            <tr>
                <td>Confirm Password:</td>
                <td><input type="password" name="passwordConfirm" id="passwordConfirm" /></td>
            </tr>
            <tr>
                <td></td>
                <td><html:submit value="Save" />&nbsp;<html:reset value="Clear" /></td>
            </tr>
        </table>
    </html:form>
    ${requestScope.ADMIN_WRONG_CURRENT_PASSWORD_MSG}
    ${requestScope.ADMIN_PASSWORD_CHANGE_FAIL_MSG}
</center>
</body>
</html>