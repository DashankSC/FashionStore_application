<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.fashionstore.model.User" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Edit Profile</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/assets/css/style.css">

<style>

.form-container{
    width:60%;
    margin:40px auto;
    background:white;
    padding:30px;
    border-radius:12px;
    box-shadow:0 0 15px rgba(0,0,0,0.08);
}

.form-group{
    margin-bottom:15px;
}

.form-group label{
    display:block;
    margin-bottom:5px;
}

.form-group input{
    width:100%;
    padding:10px;
}

.btn{
    background:#ff3f6c;
    color:white;
    border:none;
    padding:12px 20px;
    cursor:pointer;
}

</style>

</head>

<body>

<jsp:include page="/WEB-INF/views/partials/navbar.jsp"/>

<%

User user =
(User)request.getAttribute("user");

%>

<div class="form-container">

<h2>Edit Profile</h2>

<form method="post"
action="<%=request.getContextPath()%>/edit-profile">

<div class="form-group">

<label>Full Name</label>

<input type="text"
name="fullName"
value="<%= user.getFullName() %>">

</div>

<div class="form-group">

<label>Phone</label>

<input type="text"
name="phone"
value="<%= user.getPhone() %>">

</div>

<div class="form-group">

<label>Gender</label>

<input type="text"
name="gender"
value="<%= user.getGender() %>">

</div>

<div class="form-group">

<label>Address</label>

<input type="text"
name="address"
value="<%= user.getAddress() %>">

</div>

<button class="btn"
type="submit">

Update Profile

</button>

</form>

</div>

</body>

</html>