<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.fashionstore.model.Product" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Manage Products</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/assets/css/style.css">

<style>

.container{
    width:95%;
    margin:40px auto;
}

.title{
    text-align:center;
    margin-bottom:30px;
}

.top-bar{
    margin-bottom:20px;
}

.add-btn{
    background:#28a745;
    color:white;
    padding:10px 20px;
    text-decoration:none;
    border-radius:5px;
}

.products-table{
    width:100%;
    border-collapse:collapse;
    background:white;
    box-shadow:0 0 10px rgba(0,0,0,0.08);
}

.products-table th,
.products-table td{
    border:1px solid #ddd;
    padding:12px;
    text-align:center;
}

.products-table th{
    background:#ff3f6c;
    color:white;
}

.products-table tr:nth-child(even){
    background:#f9f9f9;
}

.products-table tr:hover{
    background:#f1f1f1;
}

.edit-btn{
    background:#007bff;
    color:white;
    padding:6px 12px;
    text-decoration:none;
    border-radius:4px;
}

.status-btn{
    background:#ff9800;
    color:white;
    padding:6px 12px;
    text-decoration:none;
    border-radius:4px;
}

.active{
    color:green;
    font-weight:bold;
}

.inactive{
    color:red;
    font-weight:bold;
}

</style>

</head>

<body>

<jsp:include page="/WEB-INF/views/partials/navbar.jsp"/>

<div class="container">

<h1 class="title">

Manage Products

</h1>

<div class="top-bar">

<a class="add-btn"
href="<%=request.getContextPath()%>/admin/add-product">

Add Product

</a>

</div>

<%

List<Product> products =
(List<Product>)request.getAttribute("products");

%>

<table class="products-table">

<tr>

<th>ID</th>
<th>Name</th>
<th>Price</th>
<th>Discount %</th>
<th>Status</th>
<th>Actions</th>

</tr>

<%

if(products != null){

for(Product product : products){

%>

<tr>

<td>
<%= product.getProductId() %>
</td>

<td>
<%= product.getProductName() %>
</td>

<td>
₹ <%= product.getPrice() %>
</td>

<td>
<%= product.getDiscountPercent() %> %
</td>

<td>

<span class="<%= product.isActive()
? "active"
: "inactive" %>">

<%= product.isActive()
? "Active"
: "Inactive" %>

</span>

</td>

<td>

<a class="edit-btn"
href="<%=request.getContextPath()%>/admin/edit-product?productId=<%=product.getProductId()%>">

Edit

</a>

 

<a class="status-btn"
href="<%=request.getContextPath()%>/admin/product-status?productId=<%=product.getProductId()%>&active=<%=!product.isActive()%>">

<%= product.isActive()
? "Deactivate"
: "Activate" %>

</a>

</td>

</tr>

<%
}
}
%>

</table>

</div>

<jsp:include page="/WEB-INF/views/partials/footer.jsp"/>

</body>

</html>
