<%-- 
    Document   : ProductManage
    Created on : Mar 13, 2022, 9:28:45 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
﻿<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Order Management</title>
        <!-- BOOTSTRAP STYLES-->
        <link href="${pageContext.request.contextPath}/admin/assets/css/bootstrap.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLES-->
        <link href="${pageContext.request.contextPath}/admin/assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
        <link href="${pageContext.request.contextPath}/admin/assets/css/custom.css" rel="stylesheet" />
        <!-- GOOGLE FONTS-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

        <link rel="stylesheet" href="${pageContext.request.contextPath}/home/assets/css/addingCss.css">

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
                        <div class="col-md-12">
                            <h2>Order Manage</h2>

                        </div>
                    </div>              
                    <!-- /. ROW  -->
                    <!--                  <hr />-->
                    <c:forEach items="${list}" var="order">
                        <c:if test="${order.statusOrder == 'Pending'}">
                            <h2><a class="btn btn-warning" href="./OrderManagement?statusSwitch=${order.orderID}&index=${currentPage}">${order.statusOrder}</a></h2>
                            </c:if>
                            <c:if test="${order.statusOrder == 'Delivered'}">
                            <h2><a class="btn btn-success" href="./OrderManagement?statusSwitch=${order.orderID}&index=${currentPage}">${order.statusOrder}</a></h2>
                            </c:if>
                        <h4>Customer phone: <b>${order.phone}</b></h4>
                        <h4>Customer address: <b>${order.address}</b></h4>
                        <h4>This order is created on <b>${order.time}</b></h4>
                        <table class="table table-striped">
                            <thead class="bg-primary text-white">
                                <tr>
                                    <th scope="col">ISBN</th>
                                    <th scope="col">Book Title</th>
                                    <th scope="col">Author</th>
                                    <th scope="col">Unit Price</th>
                                    <th scope="col">Quantity</th>

                                </tr>
                            </thead>
                            <tbody>

                                <c:forEach items="${order.listBook}" var="book">
                                    <tr>
                                        <th scope="row">${book.ISBN}</th>
                                        <td>${book.title}</td>
                                        <td>${book.author}</td>
                                        <td>$${book.price}</td>
                                        <td>${book.quantity}</td>

                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td scope="row"></td>
                                    <td></td>
                                    <td></td>
                                    <th scope="row">Total</th>
                                    <td>$${order.totalAmount}</td>

                                </tr>

                            </tbody>
                        </table>
                    </c:forEach>        










                    <div class="col-lg-12">
                        <c:forEach begin="1" end="${endPage}" var="i">
                            <a href="${pageContext.request.contextPath}/OrderManagement?index=${i}">${i}</a>        
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
                    <p>Copyright © 2022 Books Corner Co., Ltd. All Rights Reserved.
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
