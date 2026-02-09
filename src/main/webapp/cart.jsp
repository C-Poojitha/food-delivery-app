<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping Cart</title>

<style>
body {
    font-family: Arial, sans-serif;
    background: #f5f5f5;
}

.cart-container {
    width: 80%;
    margin: 40px auto;
    background: white;
    padding: 20px;
    border-radius: 8px;
}

.cart-header {
    display: flex;
    justify-content: space-between;
    font-weight: bold;
    border-bottom: 1px solid #ddd;
    padding-bottom: 10px;
}

.cart-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 0;
    border-bottom: 1px solid #eee;
}

.cart-item img {
    width: 80px;
    border-radius: 5px;
}

.qty-btn {
    padding: 5px 10px;
    font-size: 16px;
    cursor: pointer;
}

.total {
    text-align: right;
    font-size: 20px;
    margin-top: 20px;
}

.checkout {
    text-align: right;
    margin-top: 15px;
}

.checkout button {
    padding: 10px 25px;
    font-size: 16px;
    background: #28a745;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}
</style>

<script>
function updateTotal() {
    let price = 500;
    let qty = document.getElementById("qty").innerText;
    document.getElementById("itemTotal").innerText = price * qty;
}

function increaseQty() {
    let qty = document.getElementById("qty");
    qty.innerText = parseInt(qty.innerText) + 1;
    updateTotal();
}

function decreaseQty() {
    let qty = document.getElementById("qty");
    if (parseInt(qty.innerText) > 1) {
        qty.innerText = parseInt(qty.innerText) - 1;
        updateTotal();
    }
}
</script>

</head>
<body>

<div class="cart-container">
    <h2>My Cart</h2>

    <div class="cart-header">
        <span>Product</span>
        <span>Quantity</span>
        <span>Price</span>
    </div>

    <div class="cart-item">
        <div>
            <img src="https://via.placeholder.com/80" alt="product">
            <span>Smart Watch</span>
        </div>

        <div>
            <button class="qty-btn" onclick="decreaseQty()">-</button>
            <span id="qty">1</span>
            <button class="qty-btn" onclick="increaseQty()">+</button>
        </div>

        <div>₹ <span id="itemTotal">500</span></div>
    </div>

    <div class="total">
        Total: ₹ <span id="itemTotal">500</span>
    </div>

    <div class="checkout">
        <button>Checkout</button>
    </div>
    <div class="quantity-controls">

<form action="cart" method="post" style="display: inline;">

<input type="hidden" name="itemId" value="<%=item.getItemId()%>"> I <input type="hidden" name="action" value="update"> <input type="hidden" name="quantity" value="<%-item.getQuantity() + 1%>

<button class="quantity-btn">+</button>

</form>

<p><%=item.getQuantity()%></p>

< form action="cart" method="post" style="display: inline;">

<input type="hidden" name="itemId" value="<%-item.getItemId()%>">

<input type="hidden" name="action" value="update"> <input disabled <%}%>>-</button>

type="hidden" name="quantity" value="<%=item.getQuantity() - 1%> <button class="quantity-btn" <%if (item.getQuantity() == 1) {%>

</form>

</div>
</div>

<form action="cart" method="post">

<input type="hidden" name="itemId" value="<%=item.getItemId()%>">

<input type="hidden" name="restaurantId"

value="<%=session.getAttribute("restaurantId")%>"> <input type="hidden" name="action" value="remove">

<button class="remove-btn">Remove</button>

</form>

</div>
    <div class ="add-more-items">
    <a href="menu?restaurantId=<%=session.getAttribute("restaurantId") %>"
         class="btn add-more-item-btn"> Add More Items</a>
    </div>
</div>

</body>
</html>
