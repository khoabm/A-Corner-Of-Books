<%-- 
    Document   : Cart
    Created on : Mar 18, 2022, 11:43:44 AM
    Author     : KHANG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

        <title>Hexashop - Product Listing Page</title>


        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/User/assets/css/addingCss.css">

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/font-awesome.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/templatemo-hexashop.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/owl-carousel.css">

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/font-awesome.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/templatemo-hexashop.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/owl-carousel.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/lightbox.css">
        <!--
        
        TemplateMo 571 Hexashop
        
        https://templatemo.com/tm-571-hexashop
        
        -->
    </head>

    <body>
        <c:set var="acc" value="${LOGIN_USER}" />
        <c:set var="cus" value="${CUSTOMER_DETAIL}" />
        <!-- ***** Preloader Start ***** -->
        <div id="preloader">
            <div class="jumper">
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>  
        <!-- ***** Preloader End ***** -->


        <!-- ***** Header Area Start ***** -->
        <header class="header-area header-sticky">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <nav class="main-nav">
                            <!-- ***** Logo Start ***** -->
                            <div class="navbar-header">
                                <a href="${pageContext.request.contextPath}/home" class="logo">
                                    <img src="${pageContext.request.contextPath}/User/imgs/book-logo-1.jpg" class="primary-icon">
                                </a>
                            </div> 
                            <!-- ***** Logo End ***** -->
                            <!-- ***** Menu Start ***** -->
                            <ul class="nav">
                                <li><a href="#"><i class="fa-solid fa-cart-shopping"></i></a></li>
                                <li class="scroll-to-section"><a href="#top" class="active">Home</a></li>
                                <li><a href="./searchBook?search=&genres=all&rating=all&sortBy=High - low price&index=1">Products</a></li>
                                <li class="scroll-to-section"><a href="#">Contact Us</a></li>

                                <c:if test="${not empty acc}" >
                                    <c:set var="login" value="${cus.name}" />
                                    <c:set var="logout" value="Logout" />
                                    <c:set var="icon" value = "fa fa-user-times"/>
                                    <c:url var="url2" value="./logout" />
                                    <c:url var="url" value="./editaccount" />
                                </c:if>
                                <c:if test="${empty acc}" >
                                    <c:set var="login" value="Sign in" />
                                    <c:set var="logout" value="Sign up" />
                                    <c:set var="icon" value = "fa fa-user-plus"/>
                                    <c:url var="url" value="/Access/login.jsp" />
                                    <c:url var="url2" value="/Access/register.jsp" />
                                </c:if>
                                <a href="${url}" class="btn btn-outline-dark"><i class="fa fa-user" aria-hidden="true"></i> ${login}</a>
                                <a href="${url2}" class="btn btn-outline-dark"><i class="${icon}" aria-hidden="true"></i> ${logout}</a>
                            </ul>

                            <a class='menu-trigger'>
                                <span>Menu</span>
                            </a>
                            <!-- ***** Menu End ***** -->
                        </nav>
                    </div>
                </div>
            </div>

        </header>
        <!-- ***** Header Area End ***** -->

        <!-- ***** Main Banner Area Start ***** -->
        <!-- <div class="page-heading" id="top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="inner-content">
                            <h2>Check Our Products</h2>
                            <span>Awesome &amp; Creative HTML CSS layout by TemplateMo</span>

    <!-- ***** Main Banner Area Start ***** -->
    <!-- <div class="page-heading" id="top">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="inner-content">
                        <h2>Check Our Products</h2>
                        <span>Awesome &amp; Creative HTML CSS layout by TemplateMo</span>
                    </div>
                </div>
            </div>
        </div> -->
        <!-- ***** Main Banner Area End ***** -->


        <!-- The space between product and navigation bar -->
        <div class="page-heading" id="top">
            <div class="container">
            </div>
        </div>
        <!-- The space between product and navigation bar End -->



        <!-- <div class="subscribe container">
            <form action="" method="get">
                <div class="row">
                    <div class="col-lg-11">
                        <fieldset>
                            <input name="search" type="text" placeholder="Search" required="">
                        </fieldset>
                    </div>
                    <div class="col-lg-1">
                        <fieldset>
                            <button type="submit" class="main-dark-button"><i class="fa fa-paper-plane"></i></button>
                        </fieldset>
                    </div>
                </div>
            </form>
        </div> -->



        <!-- CART section starts -->
<!--        <section class="section" id="changePersonal">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-heading">
                            <h2>Let's Check Out &nbsp;<i class="fa fa-arrow-right"></i></h2>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
        <!-- ***** Main Banner Area End ***** -->


        <!-- The space between product and navigation bar -->
        <div class="page-heading" id="top">
            <div class="container">
            </div>
        </div>
        <!-- The space between product and navigation bar End -->



        <!-- <div class="subscribe container">
            <form action="" method="get">
                <div class="row">
                    <div class="col-lg-11">
                        <fieldset>
                            <input name="search" type="text" placeholder="Search" required="">
                        </fieldset>
                    </div>
                    <div class="col-lg-1">
                        <fieldset>
                            <button type="submit" class="main-dark-button"><i class="fa fa-paper-plane"></i></button>
                        </fieldset>
                    </div>
                </div>
            </form>
        </div> -->



        <!-- CART section starts -->
        <section class="section" id="changePersonal">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-heading">
                            <h2>Let's Check Out &nbsp;<i class="fa fa-arrow-right"></i></h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- DELIVERY INFORMATION section begins -->
        <div class="subscribe container">
            <form action="/AcornerOfBooks/CheckOutController" method="get">
                <div class="row">
                    <div class="col-lg-2" style="text-align:center;">Address</div>
                    <div class="col-lg-10">
                        <input name="addressDelivery" type="text" placeholder="Enter your address" required="">
                    </div>
                    <br><br><br>

                    <!-- <br><br><br>
                    <div class="col-lg-8"></div>
                    <div class="col-lg-4">
                        <button type="submit" class="main-dark-button"><i class="fa fa-check"></i></button>
                    </div> -->
                </div>
            </form>
        </div>
        <!-- DELIVERY INFORMATION section ends -->
        <c:set var="cartSS" value="${sessionScope.CART}"/>
        <c:set var="items" value="${cartSS.cart}"/>
        <c:set var="sum" value="0"/>
        <c:if test="${not empty cart}">
            <c:if test="${not empty items}">

                <section class="cart-section" id="orders">
                    <div class="container">
                        <div class="row">
                            <!-- heading section Begin -->
                            <div class="col-lg-8">
                                <div class="price-item">
                                    <h5></h5>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="service-item">
                                    <h5><b>Unit price</b></h5>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="service-item">
                                    <h5><b>Quantity</b></h5>
                                </div>
                            </div>
                            <!-- heading section End -->
                            <c:forEach var="book" items="${items}" varStatus="counter">
                                <c:set var="sum" value="${pageScope.sum+(book.value*book.key.price)}"/>
                                <div class="col-lg-8">
                                    <div class="service-item">
                                        <h5><b>${book.key.title}</b></h5>
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="price-item">
                                        <h5>${book.key.price}</h5>
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="price-item">
                                        <h5>${book.value}</h5>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </c:if>
                    <!-- total Begin -->
                    <div class="col-lg-8">
                        <div class="price-item">
                            <h5>Total Price: <b>${sum}</b></h5>
                        </div>
                    </div>
                    
                    <div class="col-lg-2">

                        <c:url value="/CheckOutController" var="checkOut">
                            <c:param name="txtAddress" value="${addressDelivery}"/>
                        </c:url>
                        <div class="option">  
                            <div class="main-border-button">
                                <a href="${checkOut}">Check Out</a>
                            </div>
                        </div>
                    </div>        
        </section>

        <!-- DELIVERY INFORMATION section begins -->

        <!-- DELIVERY INFORMATION section ends -->

        <!-- CART section ends -->



        <!-- ***** Footer Start ***** -->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="first-item">
                            <div class="logo">
                                <img src="${pageContext.request.contextPath}/assets/images/logo_amban.png" alt="hexashop ecommerce templatemo">
                            </div>
                            <ul>
                                <li><a href="#">16501 Collins Ave, Sunny Isles Beach, FL 33160, United States</a></li>
                                <li><a href="#">hexashop@company.com</a></li>
                                <li><a href="#">010-020-0340</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <h4>Shopping &amp; Categories</h4>
                        <ul>
                            <li><a href="#">Men’s Shopping</a></li>
                            <li><a href="#">Women’s Shopping</a></li>
                            <li><a href="#">Kid's Shopping</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-3">
                        <h4>Useful Links</h4>
                        <ul>
                            <li><a href="#">Homepage</a></li>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Help</a></li>
                            <li><a href="#">Contact Us</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-3">
                        <h4>Help &amp; Information</h4>
                        <ul>
                            <li><a href="#">Help</a></li>
                            <li><a href="#">FAQ's</a></li>
                            <li><a href="#">Shipping</a></li>
                            <li><a href="#">Tracking ID</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-12">
                        <div class="under-footer">
                            <p>Copyright © 2022 HexaShop Co., Ltd. All Rights Reserved. 

                                <br>Design: <a href="https://templatemo.com" target="_parent" title="free css templates">TemplateMo</a></p>
                            <ul>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#"><i class="fa fa-behance"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </footer>


        <!-- jQuery -->
        <script src="${pageContext.request.contextPath}/assets/js/jquery-2.1.0.min.js"></script>

        <!-- Bootstrap -->
        <script src="${pageContext.request.contextPath}/assets/js/popper.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

        <!-- Plugins -->
        <script src="${pageContext.request.contextPath}/assets/js/owl-carousel.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/accordions.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/datepicker.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/scrollreveal.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/waypoints.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery.counterup.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/imgfix.min.js"></script> 
        <script src="${pageContext.request.contextPath}/assets/js/slick.js"></script> 
        <script src="${pageContext.request.contextPath}/assets/js/lightbox.js"></script> 
        <script src="${pageContext.request.contextPath}/assets/js/isotope.js"></script> 

        <!-- Global Init -->
        <script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>

        <script>

            $(function () {
                var selectedClass = "";
                $("p").click(function () {
                    selectedClass = $(this).attr("data-rel");
                    $("#portfolio").fadeTo(50, 0.1);
                    $("#portfolio div").not("." + selectedClass).fadeOut();
                    setTimeout(function () {
                        $("." + selectedClass).fadeIn();
                        $("#portfolio").fadeTo(50, 1);
                    }, 500);

                });
            });

        </script>

    </body>

</html>
