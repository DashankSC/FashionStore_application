<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.fashionstore.model.Product" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Products | Fashion Store</title>

<link rel="stylesheet"
    href="${pageContext.request.contextPath}/assets/css/style.css">

<link rel="stylesheet"
    href="${pageContext.request.contextPath}/assets/css/products.css">

</head>

<body>

<jsp:include page="/WEB-INF/views/partials/navbar.jsp" />

<div class="products-container">

```
<h2 class="page-title">
    Our Products
</h2>

<div class="products-grid">

    <%
        List<Product> products =
            (List<Product>) request.getAttribute("products");

        if (products != null && !products.isEmpty()) {

            for (Product product : products) {
    %>

    <div class="product-card">

        <div class="product-image">

            <%

            String imageUrl =
                    product.getImageUrl();

            if(imageUrl != null &&
               imageUrl.startsWith("http")) {

            %>

            <img
                src="<%= imageUrl %>"
                alt="Product Image"
                width="250"
                height="250">

            <%

            } else {

            %>

            <img
                src="<%= request.getContextPath() %>/assets/images/<%= imageUrl %>"
                alt="Product Image"
                width="250"
                height="250">

            <%

            }

            %>

        </div>

        <div class="product-details">

            <h3>
                <%= product.getProductName() %>
            </h3>

            <p class="product-description">
                <%= product.getDescription() %>
            </p>

            <p class="product-price">
                ₹ <%= product.getPrice() %>
            </p>

            <p class="discount">
                Discount:
                <%= product.getDiscountPercent() %>%
            </p>

            <a
                href="<%= request.getContextPath() %>/product-details?id=<%= product.getProductId() %>"
                class="view-btn">

                View Details

            </a>

        </div>

    </div>

    <%
            }
        } else {
    %>

    <p class="no-products">
        No products available.
    </p>

    <%
        }
    %>

</div>
```

</div>

<jsp:include page="/WEB-INF/views/partials/footer.jsp" />

</body>

</html>
