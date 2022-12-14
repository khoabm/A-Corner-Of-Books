<%-- 
    Document   : usermanagement
    Created on : Mar 16, 2022, 11:08:53 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Customer Management</title>
        <!-- BOOTSTRAP STYLES-->
        <link href="${pageContext.request.contextPath}/admin/assets/css/bootstrap.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLES-->
        <link href="${pageContext.request.contextPath}/admin/assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
        <link href="${pageContext.request.contextPath}/admin/assets/css/custom.css" rel="stylesheet" />
        <!-- GOOGLE FONTS-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

        <link rel="stylesheet" href="${pageContext.request.contextPath}/home/assets/css/addingCss.css"/>
        <style>
            a.disabled {
                pointer-events: none;
                cursor: default;
            }
            .haha{
                margin-top: 2.2rem;
                margin-left: auto;
            }
        </style>
    </head>
    <body>
        <%@taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
                        <li >
                            <a href="${pageContext.request.contextPath}/admin/admin-home.jsp" ><i class="fa fa-desktop "></i>Dashboard </a>
                        </li>					
                        <li>
                            <a href="${pageContext.request.contextPath}/BookManagement"><i class="fa fa-qrcode "></i>Product</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/UserManagement"><i class="fa fa-bar-chart-o"></i>Customer</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/OrderManagement"><i class="fa fa-edit "></i>Order </a>
                        </li>             
                        <li>
                            <a href="${pageContext.request.contextPath}/CommentManagement"><i class="fa fa-comment-o"></i>Comment </a>
                        </li>  
                    </ul>
                </div>

            </nav>
            <!-- /. NAV SIDE  -->
            <div id="page-wrapper" >
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-4">
                            <h2>User Manage</h2>
                        </div>
                        <div class="col-md-8 haha">
                        </div>
                    </div>              
                    <!-- /. ROW  -->
                    <!--                  <hr />-->
                    <table class="table table-striped">
                        <thead class="bg-primary text-white">
                            <tr>
                                <th scope="col">Email</th>
                                <th scope="col">Full Name</th>
                                <th scope="col">Phone</th>
                                <th scope="col">Birthday</th>
                                <th scope="col">Gender</th>
                                <th scope="col">Customer Status</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="user">
                                <tr>
                                    <th scope="row">${user.email}</th>
                                    <td>${user.name}</td>
                                    <td>${user.phone}</td>
                                    <td><fmt:formatDate pattern = "dd-MM-yyyy" value = "${user.dob}" /></td>

                                    <td>${user.gender}</td>
                                    <td>${user.status}</td>
                                    <td>

                                        <form action="./EditUser">
                                            <input type="hidden" value="${user.email.trim()}" name ="email" />

                                            <c:if test="${user.status.trim() eq 'active'}">
                                                <button type="submit" value="Disable" name="action" class="btn btn-sm btn-danger">Disable</button>
                                            </c:if>
                                            <c:if test="${user.status.trim() eq 'disabled'}">
                                                <button type="submit" value="Active" name="action" class="btn btn-sm btn-success">Active</button>
                                            </c:if>

                                            <button type="submit" value="Delete" name="action" class="btn btn-sm btn-default">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="col-lg-12">
                        <c:forEach begin="1" end="${endPage}" var="i">
                            <a href="${pageContext.request.contextPath}/UserManagement?index=${i}">${i}</a>        
                        </c:forEach>
                    </div>
                    <!-- /. ROW  -->           
                </div>

                <!-- /. PAGE INNER  -->
            </div>
            <!-- /. PAGE WRAPPER  -->
        </div>
        <div class="footer">


            <div class="row">
                <div class="col-lg-12" >
                    Copyright ?? 2022 Books Corner Co., Ltd. All Rights Reserved.
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
