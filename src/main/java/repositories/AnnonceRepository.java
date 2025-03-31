package repositories;

import entities.Annonce;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import utils.HibernateUtil;

import java.util.List;

public class AnnonceRepository implements GenericRepository<Annonce> {

    private final SessionFactory sessionFactory;

    public AnnonceRepository() {
        this.sessionFactory = HibernateUtil.getSessionFactory();
    }

    @Override
    public boolean create(Annonce annonce) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.persist(annonce);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Annonce read(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Annonce.class, (long) id);
        } catch (Exception e) {
            throw new RuntimeException("Erreur lors de la lecture de l'annonce ID: " + id, e);
        }
    }

    @Override
    public List<Annonce> readAll() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM Annonce", Annonce.class).list();
        } catch (Exception e) {
            throw new RuntimeException("Erreur lors de la lecture des annonces", e);
        }
    }

    @Override
    public boolean update(Annonce annonce) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.merge(annonce);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            throw new RuntimeException("Erreur lors de la mise à jour de l'annonce ID: " + annonce.getId(), e);
        }
    }

    @Override
    public boolean delete(int id) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            Annonce annonce = session.get(Annonce.class, (long) id);
            if (annonce != null) {
                session.remove(annonce);
            }
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            throw new RuntimeException("Erreur lors de la suppression de l'annonce ID: " + id, e);
        }
    }
}
