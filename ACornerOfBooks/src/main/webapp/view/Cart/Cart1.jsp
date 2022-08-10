<%-- 
    Document   : Cart1
    Created on : Mar 20, 2022, 3:53:57 PM
    Author     : ASUS
--%>

<%@page import="acornerofbooks.model.BookDTO"%>
<%@page import="acornerofbooks.cart.CartDTO"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

        <title>Let's Check Out</title>


        <!-- Additional CSS Files -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/font-awesome.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/templatemo-hexashop.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/owl-carousel.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/lightbox.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/User/assets/css/addingCss.css">
        <!--
        
        TemplateMo 571 Hexashop
        
        https://templatemo.com/tm-571-hexashop
        
        -->
    </head>

    <body>
        <c:set var="acc" value="${LOGIN_USER}" />
        <c:set var="cus" value="${CUSTOMER_DETAIL}" />
        <c:if test="${empty acc}">
            <c:redirect url = "/home"/>
        </c:if>
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
                                <li class="scroll-to-section"><a href="#top" class="active">Back to Top</a></li>
                                <li><a href="${pageContext.request.contextPath}/searchBook?search=&genres=all&rating=all&sortBy=High - low price&index=1">Products</a></li>
                                <li class="scroll-to-section"><a href="contact">Contact Us</a></li>

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

        <!-- ***** Main Banner Area End ***** -->

        <!-- The space between product and navigation bar -->
        <div class="page-heading" id="top">
            <div class="container">               
            </div>
        </div>
        <!-- The space between product and navigation bar End -->
        <!-- CART section starts -->
        <section class="section" id="changePersonal">
            <div class="container">               
                <div class="row">                    
                    <div class="col-lg-12">

                        <div class="section-heading">
                            <%
                                CartDTO cart = (CartDTO) session.getAttribute("CART");
                                if (cart == null || cart.getCart().size() == 0) {
                            %>
                            <a href="${pageContext.request.contextPath}/home"><h2>May be you want to browse out products &nbsp;</h2></a><br>
                            <a href="${pageContext.request.contextPath}/home"><h3>Click here to find out more &nbsp;<i class="fa fa-arrow-right"></i></h3></a>
                                    <%
                                    } else {
                                    %>
                            <h2>Let's Check Out &nbsp;<i class="fa fa-arrow-right"></i></h2>
                            <c:if test="${errorQuantity != null}">
                                <p>${errorQuantity}</p>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- DELIVERY INFORMATION section begins -->
        <div class="subscribe container">
            <form action="${pageContext.request.contextPath}/CheckOutController" method="get">
                <div class="row">
                    <div class="col-lg-2" style="text-align:center;">Phone</div>
                    <div class="col-lg-10">
                        <input name="phoneDelivery" type="text" placeholder="Enter your phone number" required="">
                    </div>
                    <br><br><br>
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



                <section class="cart-section" id="orders">
                    <div class="container">
                        <div class="row">
                            <!-- heading section Begin -->
                            <div class="col-lg-6">
                                <div class="price-item">
                                    <h5>Book Title</h5>
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

                            <div class="col-lg-2">
                                <div class="service-item">
                                    <h5><b>Total</b></h5>
                                </div>
                            </div>

                            <!-- heading section End -->

                            <%
                                int count = 1;
                                float total = 0;
                                float round = 0;
                                for (BookDTO book : cart.getCart().values()) {                                  
                                    total += book.getPrice()*book.getQuantityOrder();
                                    round = (float) Math.round(total*100)/100;
                            %>
                            <div class="col-lg-6">
                                <div class="service-item">
                                    <h5><b><%= book.getTitle()%></b></h5>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="price-item">
                                    <h5>$<%= book.getPrice()%></h5>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="price-item">
                                    <h5><%= book.getQuantityOrder()%></h5>
                                </div>
                            </div>
                            <div class="col-lg-1">
                                <div class="price-item">                                                                    
                                   <%= book.getPrice()*book.getQuantityOrder() %>                          
                                </div>
                            </div>
                            <div class="col-lg-1">
                                <div class="price-item">                                                                    
                                    <a href="${pageContext.request.contextPath}/removecart?bookid=<%=book.getISBN()%>" style="color:black"><i class="fa fa-times"></i></a>                             
                                </div>
                            </div>

                            <%
                                }

                            %>


                            <!-- total Begin -->
                            <div class="col-lg-8">
                                <div class="price-item">
                                    <h5><b>Total</b></h5>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="service-item">
                                    <h5><b>$<%=round%></b></h5>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="option">
                                    <input type="hidden" name="totalAmount"  value="<%=round%>" />
                                    <input type="submit" class="main-border-button" value="Check out!" style="color:black">
                                </div>
                            </div>
                            <%                                }
                            %>
                        </div>
                        <!-- total End -->

                    </div>
                </section>
                <!-- CART section ends -->
            </form>
        </div>


        <!-- DELIVERY INFORMATION section ends -->




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

