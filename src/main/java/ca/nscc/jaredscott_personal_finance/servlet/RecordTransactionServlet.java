package ca.nscc.jaredscott_personal_finance.servlet;

import ca.nscc.jaredscott_personal_finance.service.TransactionService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/recordTransaction")
public class RecordTransactionServlet extends HttpServlet {

    private final TransactionService transactionService = new TransactionService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/record_transaction.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String date = request.getParameter("date");
        String description = request.getParameter("description");
        String amount = request.getParameter("amount");
        String type = request.getParameter("type");

        String errorMessage = transactionService.recordTransaction(date, description, amount, type);

        if (errorMessage == null) {
            response.sendRedirect(request.getContextPath() + "/listTransactions");
        } else {
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("/record_transaction.jsp").forward(request, response);
        }
    }
}