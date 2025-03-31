import entities.Annonce;
import utils.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;
import java.util.logging.Logger;

public class Main {
    public static void main(String[] args) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // 2. Opération en base de données
            Transaction transaction = session.beginTransaction();

            List<Annonce> annonces = session.createQuery("FROM Annonce", Annonce.class).list();

            transaction.commit();

        } catch (HibernateException e) {
            System.exit(1);
        } finally {
            HibernateUtil.shutdown();}
    }
}
