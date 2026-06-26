<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.fashionstore.model.CartItem" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Shopping Cart</title>

<link rel="stylesheet"
href="<%= request.getContextPath() %>/assets/css/style.css">

<style>

.cart-container {
    width: 90%;
    margin: 40px auto;
}

.cart-title {
    text-align: center;
    margin-bottom: 30px;
}

.cart-table {
    width: 100%;
    border-collapse: collapse;
}

.cart-table th,
.cart-table td {
    border: 1px solid #ddd;
    padding: 12px;
    text-align: center;
}

.cart-table th {
    background-color: #222;
    color: white;
}

.total-section {
    margin-top: 20px;
    text-align: right;
    font-size: 22px;
    font-weight: bold;
}

.remove-btn {
    color: red;
    text-decoration: none;
    font-weight: bold;
}

.remove-btn:hover {
    text-decoration: underline;
}

.checkout-btn {
    background-color: green;
    color: white;
    padding: 10px 20px;
    text-decoration: none;
    border-radius: 5px;
}

.checkout-btn:hover {
    background-color: darkgreen;
}

.empty-cart {
    text-align: center;
    font-size: 22px;
    margin-top: 40px;
}

</style>

</head>

<body>

<jsp:include page="/WEB-INF/views/partials/navbar.jsp" />

<div class="cart-container">

<h1 class="cart-title">
Shopping Cart
</h1>

<%

List<CartItem> cartItems =
(List<CartItem>) request.getAttribute("cartItems");

Double cartTotal =
(Double) request.getAttribute("cartTotal");

if(cartItems != null && !cartItems.isEmpty()) {

%>

<table class="cart-table">

<thead>

<tr>

<th>Product ID</th>
<th>Size</th>
<th>Quantity</th>
<th>Price</th>
<th>Subtotal</th>
<th>Action</th>

</tr>

</thead>

<tbody>

<%
for(CartItem item : cartItems) {
%>

<tr>

<td>
<%= item.getProductId() %>
</td>

<td>
<%= item.getSizeLabel() %>
</td>

<td>

<a href="<%= request.getContextPath() %>/cart?action=update&cartItemId=<%= item.getCartItemId() %>&quantity=<%= item.getQuantity() - 1 %>">
-
</a>

&nbsp;

<%= item.getQuantity() %>

&nbsp;

<a href="<%= request.getContextPath() %>/cart?action=update&cartItemId=<%= item.getCartItemId() %>&quantity=<%= item.getQuantity() + 1 %>">
+
</a>

</td>

<td>
₹ <%= item.getUnitPrice() %>
</td>

<td>
₹ <%= item.getQuantity() * item.getUnitPrice() %>
</td>

<td>

<a class="remove-btn"
href="<%= request.getContextPath() %>/cart?action=remove&cartItemId=<%= item.getCartItemId() %>">

Remove

</a>

</td>

</tr>

<%
}
%>

</tbody>

</table>

<div class="total-section">

Total :
₹ <%= cartTotal %>

<br><br>

<a href="<%= request.getContextPath() %>/checkout"
   class="checkout-btn">

   Proceed To Checkout

</a>

</div>

<%

} else {

%>

<div class="empty-cart">

Your cart is empty.

</div>

<%
}
%>

</div>

<jsp:include page="/WEB-INF/views/partials/footer.jsp" />

</body>

</html>