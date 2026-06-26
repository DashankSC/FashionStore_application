<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Register | Fashion Store</title>

<link rel="stylesheet"
    href="${pageContext.request.contextPath}/assets/css/style.css">

<link rel="stylesheet"
    href="${pageContext.request.contextPath}/assets/css/auth.css">

</head>

<body>

<div class="auth-container">

    <div class="auth-form-container">

        <h2>Create Account</h2>

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
            action="${pageContext.request.contextPath}/register"
            method="post">

            <div class="form-group">

                <label>Full Name</label>

                <input
                    type="text"
                    name="fullName"
                    required>

            </div>

            <div class="form-group">

                <label>Email</label>

                <input
                    type="email"
                    name="email"
                    required>

            </div>

            <div class="form-group">

                <label>Phone Number</label>

                <input
                    type="text"
                    name="phone"
                    required>

            </div>

            <div class="form-group">

                <label>Password</label>

                <input
                    type="password"
                    name="password"
                    required>

            </div>

            <div class="form-group">

                <label>Gender</label>

                <select name="gender" required>

                    <option value="">
                        Select Gender
                    </option>

                    <option value="Male">
                        Male
                    </option>

                    <option value="Female">
                        Female
                    </option>

                    <option value="Other">
                        Other
                    </option>

                </select>

            </div>

            <div class="form-group">

                <label>Address</label>

                <textarea
                    name="address"
                    rows="4"
                    required></textarea>

            </div>

            <button
                type="submit"
                class="auth-btn">

                Register

            </button>

        </form>

        <p class="auth-link">

            Already have an account?

            <a href="${pageContext.request.contextPath}/login">

                Login

            </a>

        </p>

    </div>

</div>

</body>

</html>