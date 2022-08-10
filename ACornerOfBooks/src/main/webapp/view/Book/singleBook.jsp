<%-- 
    Document   : singleBook
    Created on : Mar 12, 2022, 1:52:28 PM
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
                                <li class="scroll-to-section"><a href="#top" class="active">Back to Top</a></li>

                                <li><a href="./searchBook?search=&genres=all&rating=all&sortBy=High - low price&index=1">Products</a></li>
                                <li class="scroll-to-section"><a href="contact">Contact Us</a></li>

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

        <!-- The space between product and navigation bar -->
        <div class="page-heading" id="top">
            <div class="container">
            </div>
        </div>
        <!-- The space between product and navigation bar End -->

        <!-- ***** Product Area Starts ***** -->
        <section class="section" id="product">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="item">
                            <div class="thumb">
                                <div class="hover-content">
                                    <ul>
                                        <li><a class="${state}" href="${pageContext.request.contextPath}/favourite?bookid=${bookMatched.ISBN.trim()}&location=singleBook"><i class="fa fa-heart"></i></a></li>
                                    </ul>
                                </div>
                                <img src="${bookMatched.image_link}" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="right-content">
                            <h4>${bookMatched.title}</h4><br>
                            <h4>
                                <c:forEach begin="1" end="${bookMatched.avgRate}" step="1">
                                    <i class="fa fa-star"></i>&nbsp;
                                </c:forEach>
                                <c:forEach begin="1" end="${5-bookMatched.avgRate}" step="1">
                                    <i class="fa fa-star-o"></i>&nbsp;
                                </c:forEach>
                            </h4>
                            <span class="price"><a href="./searchBook?search=${bookMatched.author}&genres=all&rating=all&sortBy=High - low price&index=1">${bookMatched.author}</a>  -  $ ${bookMatched.price}</span>                            
                            <span>
                                <i class="fa fa-tags"></i>
                                <c:forEach items="${requestScope.listTag}" var="tag">
                                    <a href="./searchBook?search=&genres=${tag}&rating=all&sortBy=High - low price&index=1">${tag}</a>|
                                </c:forEach>
                            </span>
                            <div class="quote">
                                <i class="fa fa-quote-left"></i><p>${bookMatched.description}</p>
                            </div>
                            <form action="addtocart">
                                <input type="hidden" name="bookid" value="${bookMatched.ISBN}"/>
                                <input type="hidden" name="location" value="singleBook"/>
                                <div class="quantity-content">
                                    <div class="left-content">
                                        <h6>No. of Orders</h6>
                                    </div>
                                    <div class="right-content">
                                        <div class="quantity buttons_added">
                                            <input type="button" value="-" class="minus" onclick="changeTotalAmount_Minus()"><input id="quantityChoosing"type="number" step="1" min="1" max="${bookMatched.quantityLeft}" name="quantity" value="1" title="Qty" class="input-text qty text" size="4" pattern="" inputmode=""><input type="button" value="+" class="plus" onclick="changeTotalAmount_Plus()">
                                        </div>
                                    </div>
                                </div>
                                <div class="total">
                                    <h4 id="totalAmount">Total: $${bookMatched.price}</h4>
                                    <!-- <div class="main-border-button"><a href="#">Add to cart</i></a></div> -->
                                    <div class="main-border-button">
                                        <input onclick="alertQuantityMainBook()" type="submit" value="Add to cart" >
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ***** Product Area Ends ***** -->


        <!-- *** Recommend For You Starts *** -->
        <section class="section" id="men">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="section-heading">
                            <h2>Recommend For You</h2>
                            <!-- <span>Details to details is what makes Hexashop different from the other themes.</span> -->
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="men-item-carousel">
                            <div class="owl-men-item owl-carousel">

                                <c:forEach items="${listRecommend}" var="bookRecommend">

                                    <div class="item">
                                        <div class="thumb">
                                            <div class="hover-content">
                                                <ul>
                                                    <li><a href="${pageContext.request.contextPath}/singleBook?bookid=${bookRecommend.ISBN}"><i class="fa fa-eye"></i></a></li>
                                                    <!--<li><a href="single-product.html"><i class="fa fa-star"></i></a></li>-->



                                                    <c:if test="${bookRecommend.quantityLeft > 0}">
                                                        <li><a class="${state}" href="${pageContext.request.contextPath}/addtocart?bookid=${bookRecommend.ISBN.trim()}&quantity=1&location=singleBook"><i class="fa fa-shopping-cart"></i></a></li>
                                                            </c:if>
                                                            <c:if test="${bookRecommend.quantityLeft == 0}">
                                                        <li><a onclick="alertQuantity()" class="${state}"><i class="fa fa-shopping-cart"></i></a></li>
                                                            </c:if>
                                                </ul>
                                            </div>
                                            <img src="${bookRecommend.image}" alt="">
                                        </div>
                                        <div class="down-content">
                                            <h4>${bookRecommend.title}</h4>
                                            <span>$${bookRecommend.price}</span>
                                            <span>${bookRecommend.matchCredit} matched</span>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- *** Recommend For You Ends *** -->
        <!-- ***** Recommend For You Ends ***** -->


        <!-- ***** Comment Starts ***** -->                        

        <div class="contact-us">  
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-heading">
                            <h2>Just Comment. Don't Be Shy!</h2>
                            <!-- <span>Details to details is what makes Hexashop different from the other themes.</span> -->
                        </div>  
                        <form id="contact" action="./comment" method="post">
                            <div class="row">
                                <div class="col-lg-12">
                                    <fieldset>                        
                                        <input ${state} type="radio" name="rating" value="1" class="star">
                                        <input type="radio" name="rating" value="2" class="star">
                                        <input type="radio" name="rating" value="3" class="star">
                                        <input type="radio" name="rating" value="4" class="star">
                                        <input type="radio" name="rating" value="5" class="star"> 
                                    </fieldset>
                                </div>
                                <div class="col-lg-12">
                                    <fieldset>
                                        <textarea ${state} name="comment" rows="6" id="message" placeholder="Your message" required=""></textarea>
                                    </fieldset>
                                </div>
                                <div class="col-lg-12">
                                    <fieldset>
                                        <input type="hidden" value="${acc.email}" name="email" />
                                        <input type="hidden" value="${bookMatched.ISBN}" name="isbn" />
                                        <button ${state} type="submit" id="form-submit" class="main-dark-button"><i class="fa fa-paper-plane"></i></button>
                                    </fieldset>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- ***** Comment Ends ***** -->
        <!-- Display all comment Begin -->
        <section class="comment-section" id="comments">
            <div class="container">
                <div class="row">
                    <c:forEach var="comment" items="${requestScope.commentList}">
                        <div class="col-lg-12">
                            <div class="service-item">
                                <h5>${comment.name} &nbsp;
                                    <c:forEach begin="1" end="${comment.rating}" step="1">
                                        <i class="fa fa-star"></i>&nbsp;
                                    </c:forEach>
                                    <c:forEach begin="1" end="${5-comment.rating}" step="1">
                                        <i class="fa fa-star-o"></i>&nbsp;
                                    </c:forEach>
                                    <!--                                    <i class="fa fa-star"></i>&nbsp;<i class="fa fa-star"></i>&nbsp;<i class="fa fa-star"></i>
                                                                        &nbsp;<i class="fa fa-star-o"></i>&nbsp;<i class="fa fa-star-o"></i>-->
                                </h5>
                                <p><i>commented on ${comment.time}</i></p>
                                <p>&nbsp;&nbsp;&nbsp;&nbsp;${comment.content}.</p>
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
                                                <a href="?bookid=${bookMatched.ISBN}&index=${i}">${i}</a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li>
                                                <a href="?bookid=${bookMatched.ISBN}&index=${i}">${i}</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>

                    <!-

                </div>
            </div>
        </section>
        <!-- Display all comment End -->
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

                                                            function changeTotalAmount_Minus() {
                                                                var quantity = (parseInt(document.getElementById("quantityChoosing").value) - 1);
                                                                if (quantity <= 0)
                                                                    quantity = 1;
                                                                var total = quantity *${bookMatched.price};
                                                                document.getElementById("totalAmount").innerHTML = "Total: $" + Math.round(total * 100) / 100;
                                                            }

                                                            function changeTotalAmount_Plus() {
                                                                var quantity = (parseInt(document.getElementById("quantityChoosing").value) + 1);
                                                                var total = quantity *${bookMatched.price};
                                                                document.getElementById("totalAmount").innerHTML = "Total: $" + Math.round(total * 100) / 100;
                                                            }

                                                            function alertQuantity() {
                                                                alert("We are running out of this book. Please see our best recommends.");
                                                            }
                                                            
                                                            function alertQuantityMainBook() {
                                                                if (document.getElementById("quantityChoosing").value > ${bookMatched.quantityLeft}) 
                                                                    alert("We are running out of this book. Please see our best recommends.");
                                                            }
        </script>

    </body>

</html>

