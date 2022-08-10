<%-- 
    Document   : adminHome
    Created on : Mar 15, 2022, 7:28:29 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Home</title>
        <!-- BOOTSTRAP STYLES-->
        <link href="${pageContext.request.contextPath}/admin/assets/css/bootstrap.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLES-->
        <link href="${pageContext.request.contextPath}/admin/assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
        <link href="${pageContext.request.contextPath}/admin/assets/css/custom.css" rel="stylesheet" />
        <!-- GOOGLE FONTS-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    </head>
    <body>
        <%@taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
        <c:set var="user" value="${LOGIN_USER}"/>
        <c:set var="ad" value="${ADMIN_DETAIL}"/>
        <div id="wrapper">
            <div class="navbar navbar-inverse navbar-fixed-top">
                <div class="adjust-nav">
                    <div class="navbar-header">                    
                        <img src="${pageContext.request.contextPath}/assets/images/logo_amban.png" class="primary-icon"/>

                    </div>

                    <span class="logout-spn" >
                        <span style="opacity: 100%" class="btn btn-primary disabled">Welcome ${ad.name}</span> 
                        <a class="btn btn-primary" href="${pageContext.request.contextPath}/logout">Logout</a> 
                    </span>
                </div>
            </div>
            <!-- /. NAV TOP  -->
            <nav class="navbar-default navbar-side" role="navigation">
                <div class="sidebar-collapse">
                    <ul class="nav" id="main-menu">
                        <li class="active-link">
                            <a href="index.html" ><i class="fa fa-desktop "></i>Dashboard </a>
                        </li>
                    </ul>
                </div>

            </nav> 
            <!-- /. NAV SIDE  -->
            <div id="page-wrapper" >
                <div id="page-inner">
                    <div class="row">
                        <div class="col-lg-12">
                            <h2>ADMIN DASHBOARD</h2>   
                        </div>
                    </div>              
                    <!-- /. ROW  -->
                    <hr />

                    <!-- /. ROW  --> 
                    <div class="row text-center pad-top">


                        <div class="div-square">
                            <a href="${pageContext.request.contextPath}/BookManagement" >

                                <i class="fa fa-book fa-5x"></i>
                                <h4>Product Manage</h4>
                            </a>
                        </div>

                        <div class="div-square">
                            <a href="${pageContext.request.contextPath}/UserManagement" >
                                <i class="fa fa-users fa-5x"></i>
                                <h4>Customer Manage</h4>
                            </a>
                        </div>                                                          

                        <div class="div-square">
                            <a href="${pageContext.request.contextPath}/OrderManagement" >
                                <i class="fa fa-clipboard fa-5x"></i> 
                                <h4>Order manage</h4>
                            </a>
                        </div>
                                
                        <div class="div-square">
                            <a href="${pageContext.request.contextPath}/CommentManagement" >
                                <i class="fa fa-comment-o fa-5x" aria-hidden="true"></i>
                                <h4>Comment manage</h4>
                            </a>
                        </div>       


                    </div>

                </div>
                <!-- /. ROW    
                                 <div class="row">
                   <div class="col-lg-12 ">
                                       <br/>
                       <div class="alert alert-danger">
                            <strong>Want More Icons Free ? </strong> Checkout fontawesome website and use any icon <a target="_blank" href="http://fortawesome.github.io/Font-Awesome/icons/">Click Here</a>.
                       </div>
                      
                   </div>
                   </div> -->
                <!-- /. ROW  --> 
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->

        <div class="footer">


            <div class="row">
                <div class="col-lg-12" >
                    <p>Copyright © 2022 Books Corner Co., Ltd. All Rights Reserved.</p> 
                </div>
            </div>
        </div>


        <!-- /. WRAPPER  -->
        <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
        <!-- JQUERY SCRIPTS -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/jquery-1.10.2.js"></script>
        <!-- BOOTSTRAP SCRIPTS -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/bootstrap.min.js"></script>
        <!-- CUSTOM SCRIPTS -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/custom.js"></script>


    </body>
</html>

