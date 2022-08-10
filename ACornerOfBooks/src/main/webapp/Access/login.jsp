<%-- 
    Document   : login
    Created on : Mar 4, 2022, 10:38:12 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/font-awesome.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Log In</title>

        <!-- Font Icon -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Access/fonts/material-icon/css/material-design-iconic-font.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Access/css/style.css">


    </head>
    <body>
        <%@taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
        <div class="main">
            <!-- Sing in  Form -->
            <section class="sign-in">
                <div class="container">
                    <div class="signin-content">
                        <div class="signin-image">
                            <figure><img src="${pageContext.request.contextPath}/Access/images/signin-image.jpg" alt="sing up image"></figure>
                            <a href="${pageContext.request.contextPath}/register" class="signup-image-link">Create an account &nbsp;<i class="fa fa-arrow-right" aria-hidden="true"></i></a>
                            <h5 style="text-align: center">OR</h5>
                             <a href="${pageContext.request.contextPath}/home" class="signup-image-link"><i class="fa fa-arrow-left" aria-hidden="true"></i>&nbsp; Return to home page</a>
                        </div>
                        <div class="signup-form">
                            <h2 class="form-title">Sign in</h2>
                            <c:if test="${not empty requestScope.ERROR_MSG}">
                                <span class="text-danger">${requestScope.ERROR_MSG}</span>
                            </c:if>
                            <form action="${pageContext.request.contextPath}/login" method="POST" class="register-form" id="login-form">
                                <div class="form-group">
                                    <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="email" id="your_name" placeholder="Your Name"/>
                                </div>
                                <div class="form-group">
                                    <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="password" id="your_pass" placeholder="Password"/>
                                </div>
                                <div class="form-group form-button">
                                    <input type="submit" name="action" id="signin" class="form-submit" value="Login"/>
                                </div>
                            </form>
                            <div class="social-login">
                                <span class="social-label">Or login with</span>
                                <ul class="socials">
                                    <li><a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:8080/ACornerOfBooks/LoginGoogleHandler&response_type=code&client_id=312274839783-ikrqeojtbm6kq3r83i6hgkbee8uib7co.apps.googleusercontent.com&approval_prompt=force"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <!-- JS -->
        <script src="${pageContext.request.contextPath}/Access/vendor/jquery/jquery.min.js"></script>
        <script src="js/main.js"></script>
    </body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
