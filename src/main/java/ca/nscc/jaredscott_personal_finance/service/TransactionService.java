package ca.nscc.jaredscott_personal_finance.service;

import ca.nscc.jaredscott_personal_finance.dao.TransactionDao;
import ca.nscc.jaredscott_personal_finance.model.Transaction;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.Validation;
import jakarta.validation.Validator;
import jakarta.validation.ValidatorFactory;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.List;
import java.util.Set;

public class TransactionService {

    private final TransactionDao transactionDao = new TransactionDao();
    private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    private final ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
    private final Validator validator = factory.getValidator();

    public String recordTransaction(String dateStr, String description, String amountStr, String type) {
        try {
            LocalDate date = LocalDate.parse(dateStr, DATE_FORMATTER);
            BigDecimal amount = new BigDecimal(amountStr);
            if (!type.equalsIgnoreCase("income") && !type.equalsIgnoreCase("expense")) {
                return "Transaction type must be 'income' or 'expense'.";
            }
            Transaction transaction = new Transaction(date, description, amount, type.toLowerCase());

            Set<ConstraintViolation<Transaction>> violations = validator.validate(transaction);
            if (!violations.isEmpty()) {
                StringBuilder errors = new StringBuilder();
                for (ConstraintViolation<Transaction> violation : violations) {
                    errors.append(violation.getMessage()).append("<br>");
                }
                return errors.toString();
            }

            transactionDao.saveTransaction(transaction);
            return null;
        } catch (DateTimeParseException e) {
            return "Invalid date format. Please use yyyy-MM-dd.";
        } catch (NumberFormatException e) {
            return "Invalid amount format. Please enter a valid number.";
        } catch (RuntimeException e) {
            return "Database error: " + e.getMessage();
        }
    }

    public List<Transaction> getAllTransactions() {
        return transactionDao.getAllTransactions();
    }
}