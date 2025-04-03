package ca.nscc.jaredscott_personal_finance.servlet;

import ca.nscc.jaredscott_personal_finance.model.Transaction;
import ca.nscc.jaredscott_personal_finance.service.TransactionService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet("/listTransactions")
public class ListTransactionsServlet extends HttpServlet {

    private final TransactionService transactionService = new TransactionService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Transaction> transactions = transactionService.getAllTransactions();
            List<Date> dates = new ArrayList<>();

            List<Object[]> transactionsWithDates = new ArrayList<>();

            for(Transaction transaction: transactions){
                Date date = Date.from(transaction.getDate().atStartOfDay(ZoneId.systemDefault()).toInstant());
                Object[] transactionWithDate = {transaction, date};
                transactionsWithDates.add(transactionWithDate);
            }

            request.setAttribute("transactionsWithDates", transactionsWithDates);
            request.getRequestDispatcher("/list_transactions.jsp").forward(request, response);
        } catch (RuntimeException e) {
            request.setAttribute("errorMessage", "Error retrieving transactions: " + e.getMessage());
            request.getRequestDispatcher("/list_transactions.jsp").forward(request, response);
        }
    }
}