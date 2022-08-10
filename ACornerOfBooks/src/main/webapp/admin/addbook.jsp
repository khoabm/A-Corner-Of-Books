<%-- 
    Document   : addBook
    Created on : Mar 14, 2022, 6:09:19 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
﻿<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Add A New Book</title>
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
        

        <div id="wrapper">
            <div class="navbar navbar-inverse navbar-fixed-top">
                <div class="adjust-nav">
                    <div class="navbar-header">
<!--                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>-->
                            <img src="${pageContext.request.contextPath}/assets/images/logo_amban.png" class="primary-icon"/>
                    </div>

                    <span class="logout-spn" >
                        <a class="btn btn-primary" href="#">Logout</a> 

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

                    </ul>
                </div>

            </nav>
            <!-- /. NAV SIDE  -->
            <div id="page-wrapper" >
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            <h2>Product Manage </h2>   
                        </div>
                    </div>              
                    <!-- /. ROW  -->
                    <!--                  <hr />-->
                            <div class="container">
            <div class="row">
                <div class="col-md-12 offset-md-12">
                    <div class="card">
                        <div class="card-body">
                            <form action="./AddBook">
                                <div class="form-group">
                                    <label for="ISBN">ISBN</label>
                                    <input name="isbn" id="ISBN" type="text" class="form-control" required="">
                                </div>
                                <div class="form-group">
                                    <label for="btitle">Book Title</label>
                                    <input name="title" id="btitle" type="text" class="form-control" required="">
                                </div>
                                <div class="form-group">
                                    <label for="des">Description</label>
                                    <textarea id="des" name="description" rows="5" cols="12" class="form-control"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="author">Author</label>
                                    <input name="author" id="author" type="text" class="form-control" required="">
                                </div>
                                <div class="form-group">
                                    <label for="publisher">Publisher</label>
                                    <input name="publisher" id="publisher" type="text" class="form-control" required="">
                                </div>
                                <div class="form-group">
                                    <label for="price">Price</label>
                                    <input name="price" id="price" type="number" class="form-control" step="0.01" min="0">
                                </div>
                                <div class="form-group">
                                    <label for="quantity">Quantity</label>
                                    <input name="quantity" id="quantity" type="number" class="form-control" max="1000" min="0">
                                </div>
                                <div class="form-group">
                                    <label for="image">Image Link</label>
                                    <input name="image" id="image" type="text" class="form-control">
                                </div>
                                <div class="form-group" id="tag-group">
                                    <%! int no;%>
                                    <c:forEach var="tag" items="${requestScope.tagList}">
                                        <%no++;%>                        
                                        <label for="tag<%=no%>">${tag}</label>
                                        <input type="checkbox" id="tag<%=no%>" name="tags" value="${tag}" >&nbsp;&nbsp;&nbsp;&nbsp;
                                    </c:forEach>
                                </div>
                                <div class="form-group">
                                    <input type="submit" class="form-control" value="Add">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
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
