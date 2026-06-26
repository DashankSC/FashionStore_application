<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.fashionstore.model.Order" %>
<%@ page import="com.fashionstore.model.OrderItem" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Order Details</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/assets/css/style.css">

<style>

.details-container{

    width:90%;
    margin:40px auto;
}

.order-header{

    background:white;
    padding:20px;
    margin-bottom:20px;
    border-radius:10px;
    box-shadow:0 0 10px rgba(0,0,0,0.1);
}

.items-table{

    width:100%;
    border-collapse:collapse;
    background:white;
}

.items-table th,
.items-table td{

    padding:15px;
    border:1px solid #ddd;
    text-align:center;
}

.items-table th{

    background:#ff3f6c;
    color:white;
}

.status{

    padding:6px 12px;
    border-radius:5px;
    color:white;
    font-weight:bold;
}

.placed{
    background:#007bff;
}

.shipped{
    background:#ff9800;
}

.delivered{
    background:#28a745;
}

</style>

</head>

<body>

<jsp:include page="/WEB-INF/views/partials/navbar.jsp"/>

<%

Order order =
(Order) request.getAttribute(
        "order");

List<OrderItem> orderItems =
(List<OrderItem>) request.getAttribute(
        "orderItems");

%>

<div class="details-container">

<div class="order-header">

<h2>

Order #<%= order.getOrderId() %>

</h2>

<br>

<p>

<b>Date:</b>

<%= order.getOrderDate() %>

</p>

<p>

<b>Payment:</b>

<%= order.getPaymentMethod() %>

</p>

<p>

<b>Total:</b>

₹ <%= order.getTotalAmount() %>

</p>

<p>

<b>Status:</b>

<span class="status
<%= order.getOrderStatus().toLowerCase() %>">

<%= order.getOrderStatus() %>

</span>

</p>

</div>

<table class="items-table">

<tr>

<th>Product</th>
<th>Size</th>
<th>Quantity</th>
<th>Price</th>
<th>Subtotal</th>

</tr>

<%

for(OrderItem item : orderItems){

%>

<tr>

<td>

<%= item.getProductName() %>

</td>

<td>

<%= item.getSizeLabel() %>

</td>

<td>

<%= item.getQuantity() %>

</td>

<td>

₹ <%= item.getUnitPrice() %>

</td>

<td>

₹ <%= item.getSubtotal() %>

</td>

</tr>

<%

}

%>

</table>

</div>

<jsp:include page="/WEB-INF/views/partials/footer.jsp"/>

</body>

</html>