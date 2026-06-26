<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.fashionstore.model.Product" %>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Fashion Store</title>

<link rel="stylesheet"
href="${pageContext.request.contextPath}/assets/css/style.css">

<link rel="stylesheet"
href="${pageContext.request.contextPath}/assets/css/home.css">

</head>

<body>

    <!-- NAVBAR -->
    <%@ include file="../partials/navbar.jsp" %>

    <!-- HERO SECTION -->
    <section class="hero-section">

        <div class="hero-content">

            <h1>
                Discover Modern Fashion
            </h1>

            <p>
                Explore trending styles, premium collections,
                and exclusive offers.
            </p>

            <a href="products" class="shop-btn">
                Shop Now
            </a>

        </div>

    </section>

    <!-- CATEGORY SECTION -->

    <!-- CATEGORY SECTION -->

<section class="category-section">

    <h2>
        Shop By Category
    </h2>

    <div class="category-container">

        <a href="<%=request.getContextPath()%>/products?categoryId=1"
           class="category-card">

            <h3>Men</h3>

        </a>

        <a href="<%=request.getContextPath()%>/products?categoryId=2"
           class="category-card">

            <h3>Women</h3>

        </a>

        <a href="<%=request.getContextPath()%>/products?categoryId=3"
           class="category-card">

            <h3>Kids</h3>

        </a>

        <a href="<%=request.getContextPath()%>/products?categoryId=4"
           class="category-card">

            <h3>Footwear</h3>

        </a>

        <a href="<%=request.getContextPath()%>/products?categoryId=5"
           class="category-card">

            <h3>Accessories</h3>

        </a>

    </div>

</section>

    <!-- FEATURED PRODUCTS -->

   <section class="featured-section">

    <h2>
        Featured Products
    </h2>

    <div class="product-container">

    <%

    List<Product> featuredProducts =
            (List<Product>) request.getAttribute(
                    "featuredProducts");

    if(featuredProducts != null){

        int count = 0;

        for(Product product : featuredProducts){

            if(count == 6) {
                break;
            }

    %>

        <div class="product-card">

        <%

        String imageUrl =
                product.getImageUrl();

        if(imageUrl != null &&
           (imageUrl.startsWith("http://")
            || imageUrl.startsWith("https://"))) {

        %>

            <img src="<%= imageUrl %>"
                 alt="Product">

        <%

        } else {

        %>

            <img src="<%=request.getContextPath()%>/assets/images/<%=imageUrl%>"
                 alt="Product">

        <%

        }

        %>

            <h3>

                <%= product.getProductName() %>

            </h3>

            <p>

                ₹ <%= product.getPrice() %>

            </p>

            <a href="<%=request.getContextPath()%>/product-details?id=<%=product.getProductId()%>"
               class="shop-btn">

                View Details

            </a>

        </div>

    <%

        count++;
        }
    }

    %>

    </div>

</section>
    <!-- FOOTER -->
    <%@ include file="../partials/footer.jsp" %>

</body>

</html>