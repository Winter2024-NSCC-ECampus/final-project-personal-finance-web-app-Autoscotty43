<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Transaction List</title>
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
            width: 80%;
            margin: 50px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #004d40; /* Darker teal for heading */
            text-align: center;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            border: 1px solid #ddd;
            background-color: white;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px 15px;
            text-align: left;
        }

        th {
            background-color: #e0f2f7; /* Light blue table header */
            color: #004d40;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        a {
            background-color: #00897b; /* Teal button */
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
            transition: background-color 0.3s ease;
        }

        a:hover {
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
<div class="container">
    <h1>Transaction List</h1>
    <c:if test="${not empty errorMessage}">
        <p style="color: red;">${errorMessage}</p>
    </c:if>
    <c:if test="${not empty transactionsWithDates}">
        <table>
            <thead>
            <tr>
                <th>Date</th>
                <th>Description</th>
                <th>Amount</th>
                <th>Type</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="transactionWithDate" items="${requestScope.transactionsWithDates}">
                <tr>
                    <td><fmt:formatDate value="${transactionWithDate[1]}" pattern="yyyy-MM-dd"/></td>
                    <td>${transactionWithDate[0].description}</td>
                    <td><fmt:formatNumber value="${transactionWithDate[0].amount}" type="currency"/></td>
                    <td>${transactionWithDate[0].type}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
    <a href="recordTransaction">Record New Transaction</a>
</div>
</body>
</html>