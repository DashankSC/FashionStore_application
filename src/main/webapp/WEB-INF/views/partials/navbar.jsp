<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<nav class="navbar">

    <div class="nav-container">

        <div class="logo">

            <a href="<%=request.getContextPath()%>/home"
               class="logo-link">

                FashionStore

            </a>

        </div>

        <div class="search-bar">

            <form action="<%=request.getContextPath()%>/products"
                  method="get">

                <input type="text"
                       name="keyword"
                       placeholder="Search products...">

                <button type="submit">
                    Search
                </button>

            </form>

        </div>

        <div class="nav-links">

            <a href="<%=request.getContextPath()%>/home">
                Home
            </a>

            <a href="<%=request.getContextPath()%>/products">
                Products
            </a>

            <a href="<%=request.getContextPath()%>/cart">
                Cart
            </a>
            <a href="<%=request.getContextPath()%>/profile">
    Profile
</a>
			<a href="<%=request.getContextPath()%>/my-orders">
    My Orders
</a>
            <a href="<%=request.getContextPath()%>/login">
                Login
            </a>

        </div>

    </div>

</nav>