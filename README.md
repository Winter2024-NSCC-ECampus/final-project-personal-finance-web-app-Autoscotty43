# Personal Finance Web Application

This web application allows users to record and track their income and expenses. It's built using Java servlets, JSP, and JSTL, and utilizes a MySQL database for data persistence.

## Table of Contents

- [Features](#features)
- [Technologies Used](#technologies-used)
- [Prerequisites](#prerequisites)
- [Setup and Installation](#setup-and-installation)
- [Usage](#usage)
- [Database Setup](#database-setup)
- [Contributing](#contributing)
- [Screenshots](#screenshots)

## Features

- **Record Transactions:** Users can add new income or expense transactions with details like date, description, amount, and type.
- **View Transactions:** Users can view a list of all recorded transactions, displayed in a table format.
- **User-Friendly Interface:** A simple and intuitive web interface for easy navigation and data entry.
- **Data Persistence:** Transactions are stored in a MySQL database, ensuring data is preserved between sessions.

## Technologies Used

- **Java Servlets:** For handling server-side logic and processing user requests.
- **JavaServer Pages (JSP):** For creating dynamic web pages.
- **JSTL (JavaServer Pages Standard Tag Library):** For simplifying JSP development.
- **MySQL:** For storing transaction data.
- **JDBC (Java Database Connectivity):** For connecting to the MySQL database.
- **HTML/CSS:** For the front-end structure and styling.
- **Maven:** For project management and dependency handling.
- **Tomcat:** For deploying and running the web application.

## Prerequisites

Before running this application, ensure you have the following installed:

- **Java Development Kit (JDK):** Version 8 or later.
- **Apache Tomcat:** Version 9 or later.
- **MySQL:** Community Server or a similar MySQL distribution.
- **Maven:** For building the project.
- **Git:** (Optional, for version control)

## Setup and Installation

1.  **Clone the Repository:**

    ```bash
    git clone [https://github.com/Winter2024-NSCC-ECampus/final-project-personal-finance-web-app-Autoscotty43.git](https://www.google.com/search?q=https://github.com/Winter2024-NSCC-ECampus/final-project-personal-finance-web-app-Autoscotty43.git)
    cd final-project-personal-finance-web-app-Autoscotty43
    ```

2.  **Build the Project using Maven:**

    ```bash
    mvn clean install
    ```

3.  **Deploy the WAR File:**

    -   The `mvn install` command will create a WAR file in the `target` directory.
    -   Copy the WAR file to the `webapps` directory of your Tomcat installation.
    -   Start Tomcat.

## Usage

1.  **Access the Application:**

    -   Open your web browser and navigate to `http://localhost:8080/your-war-file-name/` (replace `your-war-file-name` with the actual name of your WAR file).

2.  **Record Transactions:**

    -   Click on the "Record Income/Expense" link to add a new transaction.
    -   Fill in the required fields (date, description, amount, type) and submit the form.

3.  **View Transactions:**

    -   Click on the "View Transactions" link to see a list of all recorded transactions.

## Database Setup

1.  **Create a Database:**

    -   Use the MySQL command-line client or a GUI tool like MySQL Workbench to create a database for the application.

        ```sql
        CREATE DATABASE personal_finance;
        USE personal_finance;
        ```

2.  **Create the `transactions` Table:**

    -   Execute the following SQL script to create the `transactions` table:

        ```sql
        CREATE TABLE transactions (
            id INT AUTO_INCREMENT PRIMARY KEY,
            date DATE NOT NULL,
            description VARCHAR(255) NOT NULL,
            amount DECIMAL(10, 2) NOT NULL,
            type VARCHAR(50) NOT NULL
        );
        ```

3.  **Configure Database Connection:**

    -   Update the database connection details in your Java code (Example: in your `TransactionService.java` file) to match your MySQL setup.

## Contributing

If you'd like to contribute to this project, please follow these steps:

1.  Fork the repository.
2.  Create a new branch for your feature or bug fix.
3.  Make your changes and commit them.
4.  Push your changes to your fork.
5.  Submit a pull request.

## Screenshots

![image](https://github.com/user-attachments/assets/7f1bc2be-1a4e-4883-841d-81f4dc118687)

![image](https://github.com/user-attachments/assets/4e228f18-e4ec-4a81-8112-aec622fa4aab)

![image](https://github.com/user-attachments/assets/ca2fb3a7-a16e-43c4-b506-7212b8d5986c)

![image](https://github.com/user-attachments/assets/c0de4bc1-ac56-46ed-8b69-14a8f832b0ed)


