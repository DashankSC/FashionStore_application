<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.fashionstore.model.Order" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Manage Orders</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/assets/css/style.css">

<style>

.container{
    width:90%;
    margin:40px auto;
}

.title{
    text-align:center;
    margin-bottom:30px;
}

.orders-table{
    width:100%;
    border-collapse:collapse;
    background:white;
}

.orders-table th,
.orders-table td{
    border:1px solid #ddd;
    padding:12px;
    text-align:center;
}

.orders-table th{
    background:#ff3f6c;
    color:white;
}

.status{
    font-weight:bold;
    color:#28a745;
}

</style>

</head>

<body>

<jsp:include page="/WEB-INF/views/partials/navbar.jsp"/>

<div class="container">

<h1 class="title">
Manage Orders
</h1>

<%

List<Order> orders =
(List<Order>)request.getAttribute("orders");

%>

<table class="orders-table">

<tr>

<th>Order ID</th>
<th>User ID</th>
<th>Total</th>
<th>Payment</th>
<th>Status</th>
<th>Date</th>

</tr>

<%

for(Order order : orders){

%>

<tr>

<td>
<%= order.getOrderId() %>
</td>

<td>
<%= order.getUserId() %>
</td>

<td>
₹ <%= order.getTotalAmount() %>
</td>

<td>
<%= order.getPaymentMethod() %>
</td>

<td>

<form method="post"
action="<%=request.getContextPath()%>/admin/update-order-status">

<input type="hidden"
name="orderId"
value="<%=order.getOrderId()%>">

<select name="status">

<option
<%= "PLACED".equals(order.getOrderStatus()) ? "selected" : "" %>>
PLACED
</option>

<option
<%= "CONFIRMED".equals(order.getOrderStatus()) ? "selected" : "" %>>
CONFIRMED
</option>

<option
<%= "SHIPPED".equals(order.getOrderStatus()) ? "selected" : "" %>>
SHIPPED
</option>

<option
<%= "DELIVERED".equals(order.getOrderStatus()) ? "selected" : "" %>>
DELIVERED
</option>

</select>

<button type="submit">

Update

</button>

</form>

</td>
<td>
<%= order.getOrderDate() %>
</td>

</tr>

<%
}
%>

</table>

</div>

</body>

</html>