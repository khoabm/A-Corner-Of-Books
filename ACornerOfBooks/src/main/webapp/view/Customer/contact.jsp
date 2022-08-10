<%-- 
    Document   : contact
    Created on : Mar 21, 2022, 12:45:48 PM
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

        <title>${bookMatched.title}</title>
        <!--Rating CSS/JS-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/Book/comment-assets/jquery.rating.css">
        <script src="${pageContext.request.contextPath}/view/Book/comment-assets/jquery.js"></script>
        <script src="${pageContext.request.contextPath}/view/Book/comment-assets/jquery.rating.js"></script>
        <!-- Additional CSS Files -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/font-awesome.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/templatemo-hexashop.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/owl-carousel.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/lightbox.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/User/assets/css/addingCss.css">
        <!--        <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">-->
        <!--
        
        TemplateMo 571 Hexashop
        
        https://templatemo.com/tm-571-hexashop
        
        -->
        <style>
            a.disabled {
                pointer-events: none;
                cursor: default;
            }
        </style>
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
                                <a href="home" class="logo">
                                    <img src="${pageContext.request.contextPath}/User/imgs/book-logo-1.jpg" class="primary-icon">
                                </a>
                            </div> 
                            <!-- ***** Logo End ***** -->
                            <!-- ***** Menu Start ***** -->
                            <ul class="nav">
                                <form action="${pageContext.request.contextPath}/searchBook" class="form-inline my-2 my-lg-0">
                                    <input class="form-control mr-sm-2" type="search" placeholder="Search..." aria-label="Search" name="search">
                                    <button type="submit" class="btn btn-outline-dark">Search</button>
                                    <input type="hidden" name="genres" value="all"/>
                                    <input type="hidden" name="rating" value="all"/>
                                    <input type="hidden" name="sortBy" value="High - low price"/>
                                </form>
                                <li><a href="view/Cart/Cart1.jsp"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
                                <li class="scroll-to-section"><a href="#top">Back to Top</a></li>

                                <li><a href="${pageContext.request.contextPath}/searchBook?search=&genres=all&rating=all&sortBy=High - low price&index=1">Products</a></li>
                                <li class="scroll-to-section" class="active"><a href="contact">Contact Us</a></li>

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
                                    <c:set var="state" value="disabled"/>
                                    <c:set var="icon" value = "fa fa-user-plus"/>
                                    <c:url var="url" value="/Access/register.jsp" />          
                                    <c:url var="url2" value="/Access/login.jsp" />
                                </c:if>
                                <a href="${url2}" class="btn btn-outline-dark"><i class="fa fa-user" aria-hidden="true"></i> ${login}</a>
                                <a href="${url}" class="btn btn-outline-dark"><i class="${icon}" aria-hidden="true"></i> ${logout}</a>

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
        <div class="page-heading about-page-heading" id="top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="inner-content">
                            <h2>Contact Us</h2>
                            <span>Awesome, clean &amp; creative HTML5 Template</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ***** Main Banner Area End ***** -->

        <!-- ***** Contact Area Starts ***** -->
        <div class="contact-us">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4">
                        <div id="map">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2666.8993290076105!2d106.67223887814302!3d10.762677063565935!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752ee2292e7431%3A0x818d730f03b238e8!2zMTk3IEhvw6AgSOG6o28sIFBoxrDhu51uZyAyLCBRdeG6rW4gMTAsIFRow6BuaCBwaOG7kSBI4buTIENow60gTWluaCwgVmlldG5hbQ!5e0!3m2!1sen!2s!4v1647795835129!5m2!1sen!2s" width="100%" height="400px" frameborder="0" style="border:0" allowfullscreen></iframe> 

                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="section-heading">
                            <h2>Contact us. Don't Be Shy!</h2>
                            <span>Through our given for more information.</span>
                        </div>
                        <div>
                            <i class="fa fa-phone fa-2x" aria-hidden="true"></i><h5 style="display: inline-block;">&nbsp;&nbsp;0912345235</h5><br><br>
                            <i class="fa fa-link fa-2x" aria-hidden="true"></i><h6 style="display: inline-block;">&nbsp;&nbsp;acornerofbooks@company.com</h6><br><br>
                            <i class="fa fa-map-marker fa-2x" aria-hidden="true"></i><h6 style="display: inline-block;">&nbsp;&nbsp;197, Hoa Hao, phuong 4, quan 10, TP.HCM</h6>

                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="section-heading">
                            <h2>Short about us</h2><br><br>
                            <span>We are A Corner Of Books. A store, a place for you to find out what is your favorite books. </span>
                            <span>We here to give you more inspiration about a world of books </span>
                            <span>Books can be a place, a friend, a realistic story or be a fiction world </span><br><br>
                            <b> So please, feel free to visit us. We will try our best to bring books close to people</b>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- ***** Contact Area Ends ***** -->

        <!-- ***** Subscribe Area Starts ***** -->
        <!-- ***** Subscribe Area Ends ***** -->

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
        <script src="${pageContext.request.contextPath}/assets/js/quantity.js"></script>

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
