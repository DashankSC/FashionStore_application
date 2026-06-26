<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.fashionstore.model.Product" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Product Details | Fashion Store</title>

<link rel="stylesheet"
    href="${pageContext.request.contextPath}/assets/css/style.css">

<link rel="stylesheet"
    href="${pageContext.request.contextPath}/assets/css/product-details.css">

</head>

<body>

<!-- Navbar -->
<jsp:include page="/WEB-INF/views/partials/navbar.jsp" />

<%
    Product product =
        (Product) request.getAttribute("product");
%>

<div class="product-details-container">

    <!-- Product Image -->

    <div class="product-image-section">

        <%
        String imageUrl =
                product.getImageUrl();

        if(imageUrl != null &&
           (imageUrl.startsWith("http://")
            || imageUrl.startsWith("https://"))) {
        %>

            <img src="<%= imageUrl %>"
                 alt="Product Image"
                 width="450">

        <%
        } else {
        %>

            <img src="<%= request.getContextPath() %>/assets/images/<%= imageUrl %>"
                 alt="Product Image"
                 width="450">

        <%
        }
        %>

    </div>

    <!-- Product Info -->

    <div class="product-info-section">

        <h1>

            <%= product.getProductName() %>

        </h1>

        <p class="description">

            <%= product.getDescription() %>

        </p>

        <p class="price">

            ₹ <%= String.format("%.0f", product.getPrice()) %>

        </p>

        <p class="discount">

            Discount:
            <%= product.getDiscountPercent() %>%

        </p>

        <!-- Add To Cart Form -->

        <form
            action="<%=request.getContextPath()%>/cart"
            method="post">

            <input
                type="hidden"
                name="productId"
                value="<%= product.getProductId() %>">

            <div class="product-option">

                <label>

                    Select Size

                </label>

                <select name="sizeLabel">

                    <option value="S">S</option>
                    <option value="M">M</option>
                    <option value="L">L</option>
                    <option value="XL">XL</option>

                </select>

            </div>

            <div class="product-option">

                <label>

                    Quantity

                </label>

                <input
                    type="number"
                    name="quantity"
                    value="1"
                    min="1">

            </div>

          <button
    type="submit"
    class="add-cart-btn">

    🛒 Add To Cart

</button>

        </form>

    </div>

</div>

<!-- Footer -->
<jsp:include page="/WEB-INF/views/partials/footer.jsp" />

</body>

</html>