<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.fashionstore.model.Order" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>My Orders</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/assets/css/style.css">

<style>

.orders-container{

    width:90%;
    margin:40px auto;
}

.orders-title{

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

    padding:15px;
    border:1px solid #ddd;
    text-align:center;
}

.orders-table th{

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

.processing{
    background:#6c757d;
}

.view-btn{

    background:#ff3f6c;
    color:white;
    text-decoration:none;
    padding:8px 15px;
    border-radius:5px;
    font-weight:bold;
}

.view-btn:hover{

    background:#e6335d;
}

</style>

</head>

<body>

<jsp:include page="/WEB-INF/views/partials/navbar.jsp"/>

<div class="orders-container">

<h1 class="orders-title">

My Orders

</h1>

<%

List<Order> orders =
(List<Order>)request.getAttribute(
        "orders");

if(orders != null &&
   !orders.isEmpty()) {

%>

<table class="orders-table">

<tr>

<th>Order ID</th>
<th>Date</th>
<th>Amount</th>
<th>Payment</th>
<th>Status</th>
<th>Action</th>

</tr>

<%

for(Order order : orders){

String status =
order.getOrderStatus();

%>

<tr>

<td>
<%= order.getOrderId() %>
</td>

<td>
<%= order.getOrderDate() %>
</td>

<td>
₹ <%= order.getTotalAmount() %>
</td>

<td>
<%= order.getPaymentMethod() %>
</td>

<td>

<span class="status
<%= status.toLowerCase() %>">

<%= status %>

</span>

</td>

<td>

<a class="view-btn"

href="<%=request.getContextPath()%>/order-details?orderId=<%=order.getOrderId()%>">

View Details

</a>

</td>

</tr>

<%
}
%>

</table>

<%

}else{

%>

<h3 align="center">

No Orders Found

</h3>

<%
}
%>

</div>

<jsp:include page="/WEB-INF/views/partials/footer.jsp"/>

</body>

</html>