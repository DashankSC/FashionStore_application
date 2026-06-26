<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.fashionstore.model.User" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>My Profile</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/assets/css/style.css">

<style>

.profile-container{
    width:60%;
    margin:40px auto;
    background:white;
    padding:30px;
    border-radius:12px;
    box-shadow:0 0 15px rgba(0,0,0,0.08);
}

.profile-title{
    text-align:center;
    margin-bottom:30px;
}

.profile-row{
    margin-bottom:18px;
    font-size:18px;
}

.label{
    font-weight:bold;
    color:#ff3f6c;
}

</style>

</head>

<body>

<jsp:include page="/WEB-INF/views/partials/navbar.jsp"/>

<%

User user =
(User)request.getAttribute("user");

%>

<div class="profile-container">

<h1 class="profile-title">

My Profile

</h1>

<div class="profile-row">

<span class="label">
Full Name :
</span>

<%= user.getFullName() %>

</div>

<div class="profile-row">

<span class="label">
Email :
</span>

<%= user.getEmail() %>

</div>

<div class="profile-row">

<span class="label">
Phone :
</span>

<%= user.getPhone() %>

</div>

<div class="profile-row">

<span class="label">
Gender :
</span>

<%= user.getGender() %>

</div>

<div class="profile-row">

<span class="label">
Address :
</span>

<%= user.getAddress() %>

</div>
<div style="margin-top:20px;">

<a href="<%=request.getContextPath()%>/edit-profile"
class="primary-btn">

Edit Profile

</a>

</div>
</div>

<jsp:include page="/WEB-INF/views/partials/footer.jsp"/>

</body>

</html>