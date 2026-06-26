<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.fashionstore.model.User" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Manage Users</title>

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
    color:#333;
}

.users-table{
    width:100%;
    border-collapse:collapse;
    background:white;
    box-shadow:0 0 15px rgba(0,0,0,0.08);
}

.users-table th,
.users-table td{
    border:1px solid #ddd;
    padding:12px;
    text-align:center;
}

.users-table th{
    background:#ff3f6c;
    color:white;
}

.users-table tr:nth-child(even){
    background:#f9f9f9;
}

.users-table tr:hover{
    background:#f5f5f5;
}

</style>

</head>

<body>

<jsp:include page="/WEB-INF/views/partials/navbar.jsp"/>

<div class="container">

    <h1 class="title">
        Registered Users
    </h1>

    <%

    List<User> users =
    (List<User>)request.getAttribute("users");

    %>

    <table class="users-table">

        <tr>

            <th>ID</th>
            <th>Full Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Gender</th>
            <th>Address</th>

        </tr>

        <%

        if(users != null && !users.isEmpty()) {

            for(User user : users){

        %>

        <tr>

            <td>
                <%= user.getUserId() %>
            </td>

            <td>
                <%= user.getFullName() %>
            </td>

            <td>
                <%= user.getEmail() %>
            </td>

            <td>
                <%= user.getPhone() %>
            </td>

            <td>
                <%= user.getGender() %>
            </td>

            <td>
                <%= user.getAddress() %>
            </td>

        </tr>

        <%
            }
        } else {
        %>

        <tr>

            <td colspan="6">

                No users found.

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