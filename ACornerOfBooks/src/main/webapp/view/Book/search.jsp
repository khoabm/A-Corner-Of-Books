<%-- 
    Document   : search
    Created on : Mar 9, 2022, 1:34:32 PM
    Author     : KHANG
--%>

<%@page import="java.util.List"%>
<%@page import="acornerofbooks.model.BookDTO"%>
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

        <title>Search Result</title>


        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/User/assets/css/addingCss.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/font-awesome.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/templatemo-hexashop.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/owl-carousel.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/lightbox.css">
        <!--
        
        TemplateMo 571 Hexashop
        
        https://templatemo.com/tm-571-hexashop
        
        -->
        <!--        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />-->
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
                                <li><a href="view/Cart/Cart1.jsp"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
                                <li class="scroll-to-section"><a href="#top" class="active">Back to Top</a></li>
                                <li><a href="./searchBook?search=&genres=all&rating=all&sortBy=High - low price&index=1">Products</a></li>
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

        <!-- ***** Main Banner Area Start ***** -->
        <!-- ***** Main Banner Area End ***** -->


        <!-- The space between product and navigation bar -->
        <div class="page-heading" id="top">
            <div class="container">
            </div>
        </div>
        <!-- The space between product and navigation bar End -->

        <!-- SEARCH AND FILER Begin -->
        <div class="subscribe container">
            <form action="${pageContext.request.contextPath}/searchBook" method="get">
                <div class="row">
                    <div class="col-lg-5">
                        <fieldset>
                            <input name="search" type="text" placeholder="Search" value="${searchText}">
                        </fieldset>
                    </div>
                    <br><br><br>
                    <div class="col-lg-2">
                        <fieldset> 
                            <select name="genres">
                                <option value="all">All genres</option>
                                <c:forEach items="${allTag}" var="tag">
                                    <option value="${tag}">${tag}</option>
                                </c:forEach>
                            </select>
                        </fieldset>
                    </div>

                    <div class="col-lg-2">
                        <fieldset> 
                            <select name="rating" value="haha">
                                <option value="all">All ratings</option>
                                <option value="5">5★</option>
                                <option value="4">4★ or more</option>
                                <option value="3">3★ or more</option>
                                <option value="2">2★ or more</option>
                                <option value="1">1★ or more</option>
                            </select>
                        </fieldset>
                    </div>
                    <div class="col-lg-2">
                        <fieldset> 
                            <select name="sortBy">
                                <option value="High - low price">High - low price</option>
                                <option value="Low - high price">Low - high price</option>
                            </select>
                        </fieldset>
                    </div>
                    <div class="col-lg-1">
                        <fieldset>
                            <button type="submit" class="main-dark-button"><i class="fa fa-search"></i></button>
                        </fieldset>
                    </div>
                </div>
            </form>
        </div>
        <!-- SEARCH AND FILTER End -->

        <!-- FILTER Begin -->




        <!--Display books match the search BEGIN-->
        <c:choose>
            <c:when test="${not empty requestScope.list}">
                <!-- ***** Products Area Starts ***** -->
                <section class="section" id="products">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="section-heading">
                                    <h2>Here're the books you looking for</h2>
                                    <!-- <span>Check out all of our products.</span> -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">



                            <c:forEach items="${requestScope.list}" var="book">


                                <div class="col-lg-4">
                                    <div class="item">
                                        <div class="thumb">
                                            <div class="hover-content">
                                                <ul>
                                                    <li><a href="${pageContext.request.contextPath}/singleBook?bookid=${book.ISBN}"><i class="fa fa-eye"></i></a></li>
                                                    <li><a href="${pageContext.request.contextPath}/favourite?bookid=${book.ISBN.trim()}&location=searchBook&search=${searchText}&index=${currentPage}" class="${state}"><i class="fa fa-heart"></i></a></li>
                                                    <c:if test="${book.quantityLeft > 0}">
                                                        <li><a href="${pageContext.request.contextPath}/addtocart?bookid=${book.ISBN.trim()}&quantity=1&location=searchBook&search=${searchText}&index=${currentPage}"><i class="fa fa-shopping-cart"></i></a></li>    
                                                            </c:if>
                                                            <c:if test="${book.quantityLeft == 0}">
                                                        <li><a onclick="alertQuantity()"><i class="fa fa-shopping-cart"></i></a></li>    
                                                            </c:if>
                                                </ul>
                                            </div>
                                            <img src="${book.image_link}" alt="">
                                        </div>
                                        <div class="down-content">
                                            <h4>${book.title}</h4>
                                            <span>$${book.price}</span>
                                        </div>
                                    </div>
                                </div>

                            </c:forEach>


                            <div class="col-lg-12">
                                <div class="pagination">
                                    <ul>
                                        <c:forEach begin="1" end="${endPage}" step="1" var="i">
                                            <c:choose>
                                                <c:when test="${currentPage == i}">
                                                    <li class = "active">
                                                        <a href="?search=${searchText}&genres=${genres}&rating=${rating}&sortBy=${sortBy}&index=${i}">${i}</a>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li>
                                                        <a href="?search=${searchText}&genres=${genres}&rating=${rating}&sortBy=${sortBy}&index=${i}">${i}</a>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- ***** Products Area Ends ***** -->
            </c:when>
            <c:otherwise>
                <section class="section" id="products">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="section-heading">
                                    <h2>There doesn't seem to be a book that matches your search.</h2>
                                    <!-- <span>Check out all of our products.</span> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </c:otherwise>
        </c:choose>
        <!--Display books match the search END-->        




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

                                                            function alertQuantity() {
                                                                alert("We are running out of this book. Please see our best recommends.");
                                                            }

        </script>

    </body>

</html>
