<%-- 
    Document   : home
    Created on : Mar 11, 2022, 8:09:30 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

        <title>Home</title>


        <!-- Additional CSS Files -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/User/assets/css/bootstrap.min.css">

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/User/assets/css/font-awesome.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/User/assets/css/templatemo-hexashop.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/User/assets/css/owl-carousel.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/User/assets/css/lightbox.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/User/assets/css/addingCss.css">

        <!--        <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">-->
        <!--
        
        TemplateMo 571 Hexashop
        
        https://templatemo.com/tm-571-hexashop
        
        -->
        a.disabled {
        pointer-events: none;
        cursor: default;
        }
    </head>

    <body>
        <%@taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
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
                                <form action="${pageContext.request.contextPath}/searchBook" class="form-inline my-2 my-lg-0">
                                    <input class="form-control mr-sm-2" type="search" placeholder="Search..." aria-label="Search" name="search">
                                    <button type="submit" class="btn btn-outline-dark">Search</button>
                                    <input type="hidden" name="genres" value="all"/>
                                    <input type="hidden" name="rating" value="all"/>
                                    <input type="hidden" name="sortBy" value="High - low price"/>
                                </form>
                                <li><a href="view/Cart/Cart1.jsp"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
                                <li class="scroll-to-section"><a href="#top" class="active">Back to Top</a></li>
                                <li><a href="./searchBook?search=&genres=all&rating=all&sortBy=High - low price&index=1">Products</a></li>
                                <li class="scroll-to-section"><a href="#explore">About Us</a></li>
                                    <c:if test="${not empty acc}" >
                                        <c:set var="login" value="${cus.name}" />
                                        <c:set var="logout" value="Logout" />
                                        <c:set var="icon" value = "fa fa-user-times"/>
                                        <c:url var="url" value="logout" />
                                        <c:url var="url2" value="editaccount" />
                                    </c:if>
                                    <c:if test="${empty acc}" >
                                        <c:set var="login" value="Sign in" />
                                        <c:set var="logout" value="Sign up" />
                                        <c:set var="icon" value = "fa fa-user-plus"/>
                                        <c:set var="state" value="disabled" />
                                        <c:url var="url" value="register" />
                                        <c:url var="url2" value="login" />

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
        <div class="main-banner" id="top">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="left-content">
                            <div class="thumb">
                                <div class="inner-content">
                                    <h4 style="color: #FFFFFF">We Are Books' Corner Store</h4>
                                    <span style="color: #FFFFFF">A great book should leave you with many experiences, and slightly exhausted at the end. You live several lives while reading.</span>
                                    <div class="main-border-button">
                                        <a href="./searchBook?search=&genres=all&rating=all&sortBy=High - low price&index=1">Explore!</a>
                                    </div>
                                </div>
                                <img src="${pageContext.request.contextPath}/assets/images/5.jpg" alt="" class="left-banner">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ***** Main Banner Area End ***** -->

        <!-- ***** History Books Starts ***** -->
        <section class="section" id="men">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="section-heading">
                            <h2>Best Rating History</h2>
                            <span>History is only the register of crimes and misfortunes.</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="men-item-carousel">
                            <div class="owl-men-item owl-carousel">
                                <c:forEach var="hBook" items="${requestScope.HISTORY_LIST}">
                                    <div class="item">
                                        <div class="thumb">
                                            <div class="hover-content">
                                                <ul>
                                                    <c:url var="addToCart" value="addToCart">
                                                        <c:param name="book" value="${fbook.ISBN}"/>
                                                    </c:url>
                                                    <li><a href="${pageContext.request.contextPath}/singleBook?bookid=${hBook.ISBN}"><i class="fa fa-eye"></i></a></li>
                                                    <li><a href="${pageContext.request.contextPath}/favourite?bookid=${hBook.ISBN.trim()}&location=home" class="${state}"><i class="fa fa-heart"></i></a></li>
              
                                                    <c:if test="${hBook.quantityLeft > 0}">
                                                        <li><a href="${pageContext.request.contextPath}/addtocart?bookid=${hBook.ISBN}&quantity=1&location=home"><i class="fa fa-shopping-cart"></i></a></li>    
                                                    </c:if>
                                                    <c:if test="${hBook.quantityLeft == 0}">
                                                        <li><a onclick="alertQuantity()"><i class="fa fa-shopping-cart"></i></a></li>    
                                                    </c:if>

                                                </ul>
                                            </div>
                                            <img src="${hBook.image_link}" class="book-imgs">
                                        </div>
                                        <div class="down-content">
                                            <h4>${hBook.title}</h4>
                                            <span>$${hBook.price}</span>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ***** History Books Area Ends ***** -->

        <!-- ***** Fiction Books Starts ***** -->
        <section class="section" id="women">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="section-heading">
                            <h2>Best Rating Fiction</h2>
                            <span>You ready to dive in fiction world?</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="women-item-carousel">
                            <div class="owl-women-item owl-carousel">
                                <c:forEach var="fBook" items="${requestScope.FICTION_LIST}">
                                    <div class="item">
                                        <div class="thumb">
                                            <div class="hover-content">
                                                <ul>
                                                    <c:url var="addToCart" value="addToCart">
                                                        <c:param name="book" value="${fbook.ISBN}"/>
                                                    </c:url>
                                                    <li><a href="${pageContext.request.contextPath}/singleBook?bookid=${fBook.ISBN}"><i class="fa fa-eye"></i></a></li>
                                                    <li><a href="${pageContext.request.contextPath}/favourite?bookid=${fBook.ISBN.trim()}&location=home" class="${state}"><i class="fa fa-heart"></i></a></li>                                               
                                                    <c:if test="${fBook.quantityLeft > 0}">
                                                        <li><a href="${pageContext.request.contextPath}/addtocart?bookid=${fBook.ISBN}&quantity=1&location=home"><i class="fa fa-shopping-cart"></i></a></li>    
                                                    </c:if>
                                                    <c:if test="${fBook.quantityLeft == 0}">
                                                        <li><a onclick="alertQuantity()"><i class="fa fa-shopping-cart"></i></a></li>    
                                                    </c:if>
                                                </ul>
                                            </div>
                                            <img src="${fBook.image_link}" class="book-imgs">
                                        </div>
                                        <div class="down-content">
                                            <h4>${fBook.title}</h4>
                                            <span>$${fBook.price}</span>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ***** Fiction Books Ends ***** -->

        <!-- ***** Horror Books Starts ***** -->
        <section class="section" id="kids">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="section-heading">
                            <h2>Best Rating Horror</h2>
                            <span>Are you afraid of horror?</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="kid-item-carousel">
                            <div class="owl-kid-item owl-carousel">
                                <c:forEach var="hoBook" items="${requestScope.HORROR}">
                                    <div class="item">
                                        <div class="thumb">
                                            <div class="hover-content">
                                                <ul>
                                                    <c:url var="addToCart" value="addToCart">
                                                        <c:param name="book" value="${fbook.ISBN}"/>
                                                    </c:url>
                                                    <li><a href="${pageContext.request.contextPath}/singleBook?bookid=${hoBook.ISBN}"><i class="fa fa-eye"></i></a></li>
                                                    <li><a href="${pageContext.request.contextPath}/favourite?bookid=${hoBook.ISBN.trim()}&location=home" class="${state}"><i class="fa fa-heart"></i></a></li>
                                                    <c:if test="${hoBook.quantityLeft > 0}">
                                                        <li><a href="${pageContext.request.contextPath}/addtocart?bookid=${hoBook.ISBN}&quantity=1&location=home"><i class="fa fa-shopping-cart"></i></a></li>    
                                                    </c:if>
                                                    <c:if test="${hoBook.quantityLeft == 0}">
                                                        <li><a onclick="alertQuantity()"><i class="fa fa-shopping-cart"></i></a></li>    
                                                    </c:if>

                                                </ul>
                                            </div>
                                            <img src="${hoBook.image_link}" class="book-imgs">
                                        </div>
                                        <div class="down-content">
                                            <h4>${hoBook.title}</h4>
                                            <span>$${hoBook.price}</span>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ***** Horror Books Ends ***** -->

        <!-- ***** Explore Area Starts ***** -->
        <section class="section" id="explore">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="left-content">
                            <h2>About Us</h2>
                            <span>We are Books' Corner</span>
                            <div class="quote">
                                <i class="fa fa-quote-left"></i><p>Welcome to Books' Corner where we serve your reading.</p>
                            </div>
                            <p>Book store is a way for you to find out the truth and also fictions.</p>
                            <p>With various of experience from multiple writers book brings you to a whole new world for you and your imagination.</p>
                            <p>“Books took me to places I could never go otherwise. They shared the confessions of people I'd never met and lives I'd never witnessed. The emotions I could never feel, and the events I hadn't experienced could all be found in those volumes.”.</p>
                            &nbsp;<b>― Won-pyung Sohn</b>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="right-content">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="leather">
                                        <h4></h4>
                                        <span>I owe everything I am and everything I will ever be to books.</span>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="first-image">
                                        <img src="${pageContext.request.contextPath}/assets/images/6.jpg" alt="book-image" class="book-imgs">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="second-image">
                                        <img src="${pageContext.request.contextPath}/assets/images/7.jpg" alt="">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="types">
                                        <h4></h4>
                                        <span>Reading is to the mind what exercise is to the body.</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ***** Explore Area Ends ***** -->



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
                                                            
                                                            function alertQuantity() {
                                                                alert("We are running out of this book. Please see our best recommends.");
                                                            }

        </script>

    </body>
</html>
