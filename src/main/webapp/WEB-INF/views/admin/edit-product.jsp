<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.fashionstore.model.Product" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Edit Product</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/assets/css/style.css">

<style>

.container{
    width:60%;
    margin:40px auto;
    background:white;
    padding:30px;
    border-radius:10px;
    box-shadow:0 0 10px rgba(0,0,0,0.1);
}

.container h1{
    text-align:center;
    margin-bottom:20px;
}

.form-group{
    margin-bottom:15px;
}

.form-group label{
    display:block;
    margin-bottom:5px;
    font-weight:bold;
}

.form-group input,
.form-group textarea{
    width:100%;
    padding:10px;
    border:1px solid #ccc;
    border-radius:5px;
}

.btn{
    background:#ff3f6c;
    color:white;
    border:none;
    padding:12px 20px;
    cursor:pointer;
    border-radius:5px;
    width:100%;
}

.btn:hover{
    background:#e6335f;
}

</style>

</head>

<body>

<jsp:include page="/WEB-INF/views/partials/navbar.jsp"/>

<%

Product product =
(Product)request.getAttribute("product");

%>

<div class="container">

<h1>Edit Product</h1>

<form method="post"
action="<%=request.getContextPath()%>/admin/edit-product">

<input type="hidden"
name="productId"
value="<%=product.getProductId()%>">

<div class="form-group">

<label>Category ID</label>

<input type="number"
name="categoryId"
value="<%=product.getCategoryId()%>"
required>

</div>

<div class="form-group">

<label>Product Name</label>

<input type="text"
name="productName"
value="<%=product.getProductName()%>"
required>

</div>

<div class="form-group">

<label>Description</label>

<textarea
name="description"
rows="4"
required><%=product.getDescription()%></textarea>

</div>

<div class="form-group">

<label>Price</label>

<input type="number"
step="0.01"
name="price"
value="<%=product.getPrice()%>"
required>

</div>

<div class="form-group">

<label>Discount %</label>

<input type="number"
step="0.01"
name="discount"
value="<%=product.getDiscountPercent()%>"
required>

</div>

<div class="form-group">

<label>Image URL</label>

<input type="text"
name="imageUrl"
value="<%=product.getImageUrl()%>"
required>

</div>

<button type="submit"
class="btn">

Update Product

</button>

</form>

</div>

</body>

</html>