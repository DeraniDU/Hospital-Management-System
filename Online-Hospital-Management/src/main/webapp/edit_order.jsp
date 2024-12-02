
<%@page import="com.order.OrderDBUtil"%>
<%@page import="com.cart.CartDBUtil"%>
<jsp:include page="header.jsp" />
<%@ page import="java.util.List"%>
<%@ page import="com.product.Product"%>
<%@ page import="com.order.Order"%>
<%@ page import="com.product.ProductDBUtil"%>

<%
String orderId = request.getParameter("orderId");
Order order = OrderDBUtil.getOrderDetails(orderId);
%>

<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">

<style>
.custom-input {
	height: 46px;
}

.custom-radio {
	width: auto;
}
</style>

<div class="limiter" style="display: flex;">
	<div class="container-login100">
		<div class="wrap-login100">
			<div class="login100-form-title"
				style="background-image: url(images/bg-05.jpg);">
				<span class="login100-form-title-1"> Update Order </span>
			</div>

			<form class="login100-form validate-form" action="EditOrderServlet"
				method="post">

				<div class="wrap-input100 validate-input m-b-26 custom-input">
					<span class="label-input100">Product Name</span> <input
						class="input100 " style="background-color: lightgrey;" type="text"
						name="p_name" value="<%=order.getCartId()%>" readonly> <span
						class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input m-b-26 custom-input">
					<span class="label-input100">Amount</span> <input class="input100"
						type="text" name="amount" readonly
						placeholder="Enter your Address" value="<%=order.getAmount()%>"
						style="background-color: lightgrey;"> <span
						class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input m-b-26 custom-input">
					<span class="label-input100">Customer Name</span> <input
						class="input100" type="text" name="customerName"
						value="<%=order.getCustomerName()%>" required
						placeholder="Enter Customer Name"> <span
						class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input m-b-26 custom-input">
					<span class="label-input100">Delivery Address</span> <input
						class="input100" type="text" name="deliveryAddress"
						value="<%=order.getDeliveryAddress()%>" required
						placeholder="Enter your Address"> <span
						class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input m-b-26 custom-input">
					<span class="label-input100">Payment Type</span> <input
						type="radio" id="" name="paymentMethod" value="cash"
						cash"" class="custom-radio" required
						<%=order.getPaymentMethod().equalsIgnoreCase("cash") ? "checked" : ""%>>
					<label for="cash">Cash</label> <input type="radio" id="credit"
						name="paymentMethod" value="credit" class="custom-radio" required
						<%=order.getPaymentMethod().equalsIgnoreCase("credit") ? "checked" : ""%>>
					<label for="credit">Credit</label><br> <span
						class="focus-input100"></span>
				</div>

				<input type="number" id="orderId" name="orderId"
					value="<%=order.getOrderId()%>" hidden>

				<div class="container-login100-form-btn">
					<input class="login100-form-btn" type="submit" value="Update Order">
				</div>
			</form>
		</div>
	</div>
</div>
