<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Checkout</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/assets/css/style.css">

<link rel="stylesheet"
href="<%=request.getContextPath()%>/assets/css/checkout.css">

</head>

<body class="checkout-page">

<jsp:include page="/WEB-INF/views/partials/navbar.jsp"/>

<div class="checkout-wrapper">

    <h1 class="checkout-heading">

        Secure Checkout

    </h1>

    <div class="checkout-container">

        <div class="left-section">

            <div class="checkout-card">

                <h2>
                    Delivery Address
                </h2>

                <form action="<%=request.getContextPath()%>/place-order"
                      method="post">

                    <label>
                        Address
                    </label>

                    <textarea
                        name="address"
                        rows="5"
                        required></textarea>

                    <label>
                        Payment Method
                    </label>

                    <select name="paymentMethod">

                        <option value="UPI">
                            UPI
                        </option>

                        <option value="COD">
                            Cash On Delivery
                        </option>

                        <option value="CARD">
                            Credit / Debit Card
                        </option>

                    </select>

                    <button
                        type="submit"
                        class="place-order-btn">

                        PLACE ORDER

                    </button>

                </form>

            </div>

        </div>

        <div class="right-section">

            <div class="checkout-card">

                <h2>
                    Order Summary
                </h2>

                <div class="summary-row">

                    <span>
                        Delivery Charges
                    </span>

                    <span class="free">
                        FREE
                    </span>

                </div>

                <hr>

                <div class="summary-row total-row">

                    <span>
                        Total Amount
                    </span>

                    <span>

                        ₹
                        <%= request.getAttribute("cartTotal") != null
                                ? request.getAttribute("cartTotal")
                                : "0" %>

                    </span>

                </div>

                <div class="secure-text">

                    🔒 100% Secure Payments

                </div>

            </div>

        </div>

    </div>

</div>

<jsp:include page="/WEB-INF/views/partials/footer.jsp"/>

</body>

</html>