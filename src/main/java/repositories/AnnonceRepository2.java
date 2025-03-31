package repositories;

import entities.Annonce;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

import java.util.List;

public class AnnonceRepository2 implements GenericRepository<Annonce> {
    private final EntityManagerFactory emf;

    public AnnonceRepository2() {
        this.emf = Persistence.createEntityManagerFactory("annonce");
    }

    @Override
    public boolean create(Annonce annonce) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(annonce);
            em.getTransaction().commit();
            return true;
        } finally {
            em.close();
        }
    }

    @Override
    public Annonce read(int id) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.find(Annonce.class, (long) id); // Conversion int -> Long
        } finally {
            em.close();
        }
    }

    @Override
    public List<Annonce> readAll() {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT a FROM Annonce a", Annonce.class)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public boolean update(Annonce annonce) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(annonce);
            em.getTransaction().commit();
            return true;
        } finally {
            em.close();
        }
    }

    @Override
    public boolean delete(int id) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            Annonce annonce = em.find(Annonce.class, (long) id); // Conversion int -> Long
            if (annonce != null) {
                em.remove(annonce);
            }
            em.getTransaction().commit();
            return true;
        } finally {
            em.close();
        }
    }

    public void close() {
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }
}
