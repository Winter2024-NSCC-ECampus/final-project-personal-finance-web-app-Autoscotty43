<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
  <title>Personal Finance Web App</title>
  <link rel="icon" href="favicon.ico" type="image/x-icon">
  <link rel="icon" href="favicon.png" type="image/png">
  <style>
    body {
      font-family: 'Arial', sans-serif;
      margin: 0;
      padding: 0;
      background: linear-gradient(135deg, #e0f7fa, #b2ebf2);
      color: #333;
    }

    .navbar {
      background-color: #00897b;
      overflow: hidden;
      display: flex;
      justify-content: center;
    }

    .navbar a {
      float: left;
      display: block;
      color: white;
      text-align: center;
      padding: 14px 20px;
      text-decoration: none;
      transition: background-color 0.3s ease;
    }

    .navbar a:hover {
      background-color: #00695c;
    }

    .container {
      width: 80%;
      margin: 50px auto;
      text-align: center;
      padding: 20px;
      background-color: rgba(255, 255, 255, 0.8);
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    h1 {
      color: #004d40;
      margin-bottom: 30px;
    }

    .content {
      display: flex;
      justify-content: space-around;
      align-items: center;
    }

    .content img {
      max-width: 300px;
      border-radius: 8px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      margin: 20px; /* Add margin around images */
    }

    .content p {
      font-size: 1.1em;
      line-height: 1.6;
      text-align: left;
      padding: 20px; /* Add padding around text */
      max-width: 400px; /* Limit text width for better readability */
    }
  </style>
</head>
<body>
<div class="navbar">
  <a href="index.jsp">Home</a>
  <a href="recordTransaction">Record Income/Expense</a>
  <a href="listTransactions">View Transactions</a>
</div>

<div class="container">
  <h1>Welcome to Your Personal Finance Web App</h1>
  <div class="content">
    <img src="images/finance1.png" alt="Finance Image 1">
    <p>Manage your finances with ease. Record your income and expenses, and view your transaction history.
      Keep track of your financial health and make informed decisions.</p>
    <img src="images/finance2.png" alt="Finance Image 2">
  </div>
</div>
</body>
</html>