<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Add Product</title>

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
}

.form-group input,
.form-group textarea{
    width:100%;
    padding:10px;
}

.btn{
    background:#ff3f6c;
    color:white;
    border:none;
    padding:12px 20px;
    cursor:pointer;
    border-radius:5px;
}

</style>

</head>

<body>

<jsp:include page="/WEB-INF/views/partials/navbar.jsp"/>

<div class="container">

<h1>Add Product</h1>

<form action="<%=request.getContextPath()%>/admin/add-product"
      method="post">

<div class="form-group">

<label>Category ID</label>

<input type="number"
       name="categoryId"
       required>

</div>

<div class="form-group">

<label>Product Name</label>

<input type="text"
       name="productName"
       required>

</div>

<div class="form-group">

<label>Description</label>

<textarea name="description"
          rows="4"
          required></textarea>

</div>

<div class="form-group">

<label>Price</label>

<input type="number"
       step="0.01"
       name="price"
       required>

</div>

<div class="form-group">

<label>Discount %</label>

<input type="number"
       step="0.01"
       name="discount"
       required>

</div>

<div class="form-group">

<label>Image URL</label>

<input type="text"
       name="imageUrl"
       required>

</div>

<button type="submit"
        class="btn">

Add Product

</button>

</form>

</div>

</body>

</html>