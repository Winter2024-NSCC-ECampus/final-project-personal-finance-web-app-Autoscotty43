package ca.nscc.jaredscott_personal_finance.dao;

import ca.nscc.jaredscott_personal_finance.model.Transaction;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;
import java.util.List;

public class TransactionDao {

    private final EntityManagerFactory emf = Persistence.createEntityManagerFactory("financePU");

    public void saveTransaction(Transaction transaction) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(transaction);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            throw new RuntimeException("Error saving transaction", e);
        } finally {
            em.close();
        }
    }

    public List<Transaction> getAllTransactions() {
        EntityManager em = emf.createEntityManager();
        try {
            TypedQuery<Transaction> query = em.createQuery("SELECT t FROM Transaction t ORDER BY t.date DESC", Transaction.class);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Error retrieving transactions", e);
        } finally {
            em.close();
        }
    }
}