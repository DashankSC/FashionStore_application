<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Login | Fashion Store</title>

<link rel="stylesheet"
    href="${pageContext.request.contextPath}/assets/css/style.css">

<link rel="stylesheet"
    href="${pageContext.request.contextPath}/assets/css/auth.css">

</head>

<body>

<div class="auth-container">

    <div class="auth-form-container">

        <h2>Login</h2>

        <!-- Error Message -->
        <%
            String errorMessage =
                (String) request.getAttribute("errorMessage");

            if (errorMessage != null) {
        %>

            <p class="error-message">
                <%= errorMessage %>
            </p>

        <%
            }
        %>

        <form
            action="${pageContext.request.contextPath}/login"
            method="post">

            <div class="form-group">

                <label>Email</label>

                <input
                    type="email"
                    name="email"
                    required>

            </div>

            <div class="form-group">

                <label>Password</label>

                <input
                    type="password"
                    name="password"
                    required>

            </div>

            <button
                type="submit"
                class="auth-btn">

                Login

            </button>

        </form>

        <p class="auth-link">

            Don't have an account?

            <a href="${pageContext.request.contextPath}/register">

                Register

            </a>

        </p>

    </div>

</div>

</body>

</html>