<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<footer class="footer">

    <div class="footer-container">

        <div class="footer-logo">

            <h2>FashionStore</h2>

            <p>
                Your one-stop destination for modern fashion.
            </p>

        </div>

        <div class="footer-links">

            <h3>Quick Links</h3>

            <a href="<%=request.getContextPath()%>/home">
                Home
            </a>

            <a href="<%=request.getContextPath()%>/products">
                Products
            </a>

            <a href="<%=request.getContextPath()%>/cart">
                Cart
            </a>

            <a href="<%=request.getContextPath()%>/login">
                Login
            </a>

        </div>

        <div class="footer-contact">

            <h3>Contact</h3>

            <p>Email : support@fashionstore.com</p>

            <p>Phone : +91 9876543210</p>

        </div>

    </div>

    <div class="footer-bottom">

        <p>
            © 2026 FashionStore. All Rights Reserved.
        </p>

    </div>

</footer>