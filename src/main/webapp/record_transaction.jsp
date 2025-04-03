<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Record Transaction</title>
  <link rel="icon" href="favicon.ico" type="image/x-icon">
  <link rel="icon" href="favicon.png" type="image/png">
  <style>
    body {
      font-family: 'Arial', sans-serif;
      margin: 0;
      padding: 0;
      background: linear-gradient(135deg, #e0f7fa, #b2ebf2); /* Light blue gradient */
      color: #333;
    }

    .navbar {
      background-color: #00897b; /* Teal navbar */
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
      background-color: #00695c; /* Darker teal on hover */
    }

    .container {
      width: 60%;
      margin: 50px auto;
      padding: 30px;
      background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white */
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    h1 {
      color: #004d40; /* Darker teal for heading */
      text-align: center;
      margin-bottom: 30px;
    }

    form {
      display: flex;
      flex-direction: column;
    }

    label {
      margin-top: 15px;
      font-weight: bold;
    }

    input[type="text"], input[type="number"], select {
      padding: 10px;
      margin-top: 5px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    input[type="submit"] {
      background-color: #00897b; /* Teal button */
      color: white;
      padding: 12px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      margin-top: 20px;
      transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
      background-color: #00695c; /* Darker teal on hover */
    }

    .error-message {
      color: red;
      font-weight: bold;
      margin-top: 10px;
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
  <h1>Record New Transaction</h1>

  <% if (request.getAttribute("errorMessage") != null) { %>
  <p class="error-message"><%= request.getAttribute("errorMessage") %></p>
  <% } %>

  <form action="recordTransaction" method="post">
    <label for="date">Date (YYYY-MM-DD):</label>
    <input type="text" id="date" name="date" required>

    <label for="description">Description:</label>
    <input type="text" id="description" name="description" required>

    <label for="amount">Amount:</label>
    <input type="number" step="0.01" id="amount" name="amount" required>

    <label for="type">Type:</label>
    <select id="type" name="type" required>
      <option value="">-- Select --</option>
      <option value="income">Income</option>
      <option value="expense">Expense</option>
    </select>

    <input type="submit" value="Record Transaction">
  </form>
</div>
</body>
</html>