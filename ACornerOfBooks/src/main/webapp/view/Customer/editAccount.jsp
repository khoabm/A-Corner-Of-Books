<%-- 
    Document   : editAccount
    Created on : Mar 14, 2022, 2:20:55 PM
    Author     : KHANG
--%>
<%@taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

        <title>Edit Profile</title>


        <!-- Additional CSS Files -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/font-awesome.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/templatemo-hexashop.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/owl-carousel.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/lightbox.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/form-custom-Khang.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/User/assets/css/addingCss.css">
        <!--
        
        TemplateMo 571 Hexashop
        
        https://templatemo.com/tm-571-hexashop
        
        -->
    </head>

    <body>
        <c:set var="acc" value="${LOGIN_USER}" />
        <c:set var="cus" value="${CUSTOMER_DETAIL}" />
        <c:if test="${cus.gender.trim() eq 'male'}"><c:set var="male" value="checked"/></c:if>
        <c:if test="${cus.gender.trim() eq 'female'}"><c:set var="female" value="checked"/></c:if>

        <!-- ***** Preloader Start ***** -->
        <div id="preloader">
            <div class="jumper">
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>  
        <!-- ***** Preloader End ***** -->


        <!--  ***** Header Area Start ***** -->
        <header class="header-area header-sticky">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <nav class="main-nav">
                            <!-- ***** Logo Start ***** -->
                            <div class="navbar-header">
                                <a href="home" class="logo">
                                    <img src="${pageContext.request.contextPath}/User/imgs/book-logo-1.jpg" class="primary-icon">
                                </a>
                            </div> 
                            <!-- ***** Logo End ***** -->
                            <!-- ***** Menu Start ***** -->
                            <ul class="nav">
                                <li><a href="view/Cart/Cart1.jsp"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
                                <li class="scroll-to-section"><a href="#top" class="active">Back to Top</a></li>
                                <li><a href="./searchBook?search=&genres=all&rating=all&sortBy=High - low price&index=1">Products</a></li>
                                
                                    <c:if test="${not empty acc}" >
                                        <c:set var="login" value="${cus.name}" />
                                        <c:set var="logout" value="Logout" />
                                        <c:set var="icon" value = "fa fa-user-times"/>
                                        <c:url var="url" value="./logout" />
                                        <c:url var="url2" value="./editaccount" />
                                    </c:if>
                                    <c:if test="${empty acc}" >
                                        <c:set var="login" value="Sign in" />
                                        <c:set var="logout" value="Sign up" />
                                        <c:set var="icon" value = "fa fa-user-plus"/>
                                        <c:url var="url" value="/Access/register.jsp" />
                                        <c:url var="url2" value="/Access/login.jsp" />
                                    </c:if>
                                <a href="${url2}" class="btn btn-outline-dark"><i class="fa fa-user" aria-hidden="true"></i> ${login}</a>
                                <a href="${url}" class="btn btn-outline-dark"><i class="${icon}"></i> ${logout}</a>

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


        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="option">
                        <div class="main-border-button"><a class="active" href="${pageContext.request.contextPath}/editaccount">Edit Account</a></div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="option">
                        <div class="main-border-button"><a href="${pageContext.request.contextPath}/changepassword">Change Password</a></div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="option">
                        <div class="main-border-button"><a href="${pageContext.request.contextPath}/favourite">Your Favourite</a></div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="option">
                        <div class="main-border-button"><a href="${pageContext.request.contextPath}/order">Order History</a></div>
                    </div>
                </div>
            </div>
        </div>



        <!-- EDIT ACCOUNT section starts -->
        <section class="section" id="changePersonal">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-heading">
                            <h2>Edit Personal Information</h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="subscribe container">
            <form action="${pageContext.request.contextPath}/editaccount" method="POST">
                <div class="row">
                    <!--this hidden input is for make sure the user submitted the form (true) or the user just came to the form (null)-->
                    <input type="hidden" name="submitted" value="true"> 
                    <div class="col-lg-4" style="text-align:center;">Name</div>
                    <div class="col-lg-8">
                        <input name="newName" type="text" placeholder="Enter your new name" value="${CUSTOMER_DETAIL.name.trim()}" required="">
                    </div>
                    <br><br><br>
                    <div class="col-lg-4" style="text-align:center;">Phone</div>
                    <div class="col-lg-8">
                        <input name="newPhone" type="text" placeholder="Enter your new phone" value="${CUSTOMER_DETAIL.phone.trim()}" required="">
                    </div>
                    <br><br><br>
                    <div class="col-lg-4" style="text-align:center;">Date of birth</div>
                    <div class="col-lg-8">
                        <input name="newDate" type="date" placeholder="Enter your new phone" value="${CUSTOMER_DETAIL.dob}" required="">
                    </div>
                    <br><br><br>
                    <div class="col-lg-4" style="text-align:center;">Gender</div>
                    <div class="col-lg-8">
                        <label class="container-radio-custom">Male
                            <input name="newGender" value="male" id="male" type="radio" placeholder="Search" required="" ${male}>
                            <span class="checkmark"></span>
                        </label>

                        <label class="container-radio-custom">Female
                            <input name="newGender" value="female" id="female" type="radio" placeholder="Search" required="" ${female}>
                            <span class="checkmark"></span>
                        </label>
                    </div>
                    <br><br><br>
                    <div class="col-lg-8"></div>
                    <div class="col-lg-4">
                        <button type="submit" class="main-dark-button"><i class="fa fa-check"></i></button>
                    </div>
                </div>
            </form>
        </div>
        <!-- EDIT ACCOUNT section ends -->



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
                                <li><a href="#">497 Hoà Hảo, Phường 4, Quận 10, Thành phố Hồ Chí Minh</a></li>
                                <li><a href="#">ACornorOfBook@company.com</a></li>
                                <li><a href="#">098-773-0862</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <h4>Our Best Books' Categories</h4>
                        <ul>
                            <li><a href="#">Fiction</a></li>
                            <li><a href="#">Romance</a></li>
                            <li><a href="#">Thriller</a></li>
                            <li><a href="#">Horror</a></li>
                            <li><a href="#">Young-adult</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-3">
                        <h4> &nbsp; </h4>
                        <ul>
                            <li><a href="#">Biography</a></li>
                            <li><a href="#">Fantasy</a></li>
                            <li><a href="#">LGBTQ+</a></li>
                            <li><a href="#">Science fiction</a></li>
                            <li><a href="#">Classics</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-3">
                        <h4>Help &amp; Information</h4>
                        <ul>
                            <li><a href="#">Home</a></li>
                            <li><a href="#">Contact us</a></li>
                            <li><a href="#">About us</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-12">
                        <div class="under-footer">
                            </p>
                            <ul>
                                <li><a href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="https://www.twitter.com/"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="https://www.instagram.com/"><i class="fa fa-instagram"></i></a></li>
                                <li><a href="https://www.youtube.com/"><i class="fa fa-youtube"></i></a></li>
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
