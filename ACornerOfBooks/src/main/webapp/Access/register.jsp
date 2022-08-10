<%-- 
    Document   : register
    Created on : Mar 10, 2022, 2:24:22 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags-->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Title Page-->
        <title>Register</title>

        <!-- Icons font CSS-->



        <link href="${pageContext.request.contextPath}/Access/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
        <link href="${pageContext.request.contextPath}/Access/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
        <!-- Font special for pages-->
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Vendor CSS-->
        <link href="${pageContext.request.contextPath}/Access/vendor/select2/select2.min.css" rel="stylesheet" media="all">
        <link href="${pageContext.request.contextPath}/Access/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

        <!-- Main CSS-->
        <link href="${pageContext.request.contextPath}/Access/css/main.css" rel="stylesheet" media="all">
    </head>

    <body>
        <%@taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
        <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
            <div class="wrapper wrapper--w680">
                <div class="card card-4">
                    <div class="card-body">
                        <h2 class="title">Registration Form</h2>
                        <form action="./register" method="POST">
                            <div class="row row-space">
                                <div class="col-4">
                                    <div class="input-group">
                                        <label class="label"> name</label>
                                        <input class="input--style-4" type="text" name="name" required="">
                                        <c:if test="${not empty ERROR_REGISTER['name']}">
                                            <span>${ERROR_REGISTER['name']}</span>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            <div class="row row-space">
                                <div class="col-2">
                                    <div class="input-group">
                                        <label class="label">password</label>
                                        <input class="input--style-4" type="password" name="password" required="">
                                        <c:if test="${not empty ERROR_REGISTER['password']}">
                                            <span>${ERROR_REGISTER['password']}</span>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="input-group">
                                        <label class="label">re-password</label>
                                        <input class="input--style-4" type="password" name="re_pass" required="">
                                        <c:if test="${not empty ERROR_REGISTER['rePass']}">
                                            <span>${ERROR_REGISTER['rePass']}</span>
                                        </c:if>
                                    </div>
                                </div> 
                            </div>
                            <div class="row row-space">
                                <div class="col-2">
                                    <div class="input-group">
                                        <label class="label">Birthday</label>
                                        <div class="input-group-icon">
                                            <input class="input--style-4 js-datepicker" type="text" name="dob" required="">
                                            <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                                            <h5></h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="input-group">
                                        <label class="label">Gender</label>
                                        <div class="p-t-10">
                                            <label class="radio-container m-r-45">Male
                                                <input type="radio" checked="checked" name="gender" value="Male">
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="radio-container">Female
                                                <input type="radio" name="gender" value="Female">
                                                <span class="checkmark"></span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row row-space">
                                <div class="col-2">
                                    <div class="input-group">
                                        <label class="label">Email</label>
                                        <input class="input--style-4" type="email" name="email" required="">
                                        <c:if test="${not empty ERROR_REGISTER['duplicate']}">
                                            <span>${ERROR_REGISTER['duplicate']}</span>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="input-group">
                                        <label class="label">Phone Number</label>
                                        <input class="input--style-4" type="tel" id="phone" name="phone" placeholder="Phone" pattern="[0-9]{3}[0-9]{3}[0-9]{4}" required="">
                                        
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="p-t-15">
                                <button class="btn btn--radius-2 btn--blue" type="submit" name="action" value="Register">Submit</button>

                            </div>
                        </form>
                        <br> <a href="${pageContext.request.contextPath}/login">Already have account?</a>
                    </div>
                </div>
            </div>

        </div>

        <!-- Jquery JS-->
        <script src="${pageContext.request.contextPath}/Access/vendor/jquery/jquery.min.js"></script>
        <!-- Vendor JS-->
        <script src="${pageContext.request.contextPath}/Access/vendor/select2/select2.min.js"></script>
        <script src="${pageContext.request.contextPath}/Access/vendor/datepicker/moment.min.js"></script>
        <script src="${pageContext.request.contextPath}/Access/vendor/datepicker/daterangepicker.js"></script>

        <!-- Main JS-->
        <script src="${pageContext.request.contextPath}/Access/js/global.js"></script>

    </body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->
