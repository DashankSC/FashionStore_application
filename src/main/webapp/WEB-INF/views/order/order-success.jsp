<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Order Success</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/assets/css/style.css">

<style>

.success-box{

    width:700px;
    margin:80px auto;
    background:white;
    padding:40px;
    text-align:center;
    border-radius:10px;
    box-shadow:0 0 10px rgba(0,0,0,0.1);
}

.success-box h1{

    color:green;
    margin-bottom:20px;
}

.success-box a{

    display:inline-block;
    margin-top:20px;
    padding:12px 25px;
    background:#ff3f6c;
    color:white;
    text-decoration:none;
    border-radius:5px;
}

</style>

</head>

<body>

<jsp:include page="/WEB-INF/views/partials/navbar.jsp"/>

<div class="success-box">

    <h1>
        Order Placed Successfully
    </h1>

    <p>
        Thank you for shopping with FashionStore.
    </p>

    <a href="<%=request.getContextPath()%>/products">

        Continue Shopping

    </a>

</div>

<jsp:include page="/WEB-INF/views/partials/footer.jsp"/>

</body>

</html>