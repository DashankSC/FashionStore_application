<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Admin Dashboard</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/assets/css/style.css">

<style>

.dashboard-container{
    width:95%;
    margin:30px auto;
}

.dashboard-title{
    text-align:center;
    margin-bottom:30px;
    color:#333;
}

/* Statistics Cards */

.stats-container{
    display:flex;
    gap:20px;
    justify-content:center;
    flex-wrap:wrap;
    margin-bottom:40px;
}

.stat-card{
    width:220px;
    background:white;
    padding:25px;
    border-radius:12px;
    text-align:center;
    box-shadow:0 0 15px rgba(0,0,0,0.08);
}

.stat-card h3{
    color:#666;
    margin-bottom:10px;
}

.stat-card h1{
    color:#ff3f6c;
}

/* Feature Cards */

.card-container{
    display:flex;
    gap:30px;
    justify-content:center;
    flex-wrap:wrap;
}

.card{
    width:280px;
    background:white;
    padding:30px;
    border-radius:12px;
    box-shadow:0 0 15px rgba(0,0,0,0.08);
    text-align:center;
    transition:0.3s;
}

.card:hover{
    transform:translateY(-5px);
}

.card h2{
    color:#ff3f6c;
    margin-bottom:15px;
}

.card p{
    color:#666;
    margin-bottom:20px;
}

.card a{
    display:inline-block;
    padding:10px 20px;
    background:#ff3f6c;
    color:white;
    text-decoration:none;
    border-radius:5px;
}

.card a:hover{
    background:#e6355f;
}

</style>

</head>

<body>

<jsp:include page="/WEB-INF/views/partials/navbar.jsp"/>

<div class="dashboard-container">

<h1 class="dashboard-title">

Admin Dashboard

</h1>

<!-- Statistics Section -->

<div class="stats-container">

<div class="stat-card">

<h3>Total Users</h3>

<h1>
<%= request.getAttribute("userCount") %>
</h1>

</div>

<div class="stat-card">

<h3>Total Products</h3>

<h1>
<%= request.getAttribute("productCount") %>
</h1>

</div>

<div class="stat-card">

<h3>Total Orders</h3>

<h1>
<%= request.getAttribute("orderCount") %>
</h1>

</div>

<div class="stat-card">

<h3>Total Revenue</h3>

<h1>
₹ <%= request.getAttribute("revenue") %>
</h1>

</div>

</div>

<!-- Management Cards -->

<div class="card-container">

<div class="card">

<h2>Products</h2>

<p>Manage Products</p>

<a href="<%=request.getContextPath()%>/admin/products">

Open

</a>

</div>

<div class="card">

<h2>Orders</h2>

<p>Manage Customer Orders</p>

<a href="<%=request.getContextPath()%>/admin/orders">

Open

</a>

</div>

<div class="card">

<h2>Users</h2>

<p>View Registered Users</p>

<a href="<%=request.getContextPath()%>/admin/users">

Open

</a>

</div>

</div>

</div>

<jsp:include page="/WEB-INF/views/partials/footer.jsp"/>

</body>

</html>
