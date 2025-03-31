package servlets;

import entities.Annonce;
import repositories.AnnonceRepository2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/annonce/update")
public class AnnonceUpdateServlet extends HttpServlet {

    private AnnonceRepository2 annonceRepository;

    @Override
    public void init() throws ServletException {
        this.annonceRepository = new AnnonceRepository2();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID manquant");
            return;
        }

        int id = Integer.parseInt(idParam);

        Annonce annonce = annonceRepository.read(id);
        if (annonce == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Annonce introuvable");
            return;
        }

        request.setAttribute("annonce", annonce);
        request.getRequestDispatcher("/WEB-INF/annonceUpdate.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Map<String, String> errors = new HashMap<>();

        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            errors.put("id", "ID manquant");
        }

        String titre = request.getParameter("titre");
        if (titre == null || titre.trim().isEmpty()) {
            errors.put("titre", "Le titre est obligatoire");
        }

        String description = request.getParameter("description");
        if (description == null || description.trim().isEmpty()) {
            errors.put("description", "La description est obligatoire");
        }

        String adresse = request.getParameter("adresse");
        if (adresse == null || adresse.trim().isEmpty()) {
            errors.put("adresse", "L'adresse est obligatoire");
        }

        String email = request.getParameter("mail");
        if (email == null || email.trim().isEmpty()) {
            errors.put("mail", "L'email est obligatoire");
        } else if (!email.matches("^[\\w-.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
            errors.put("mail", "Format d'email invalide");
        }

        // 2. Gestion des erreurs
        if (!errors.isEmpty()) {
            Annonce annonce = new Annonce();
            annonce.setId(idParam != null ? Long.parseLong(idParam) : 0);
            annonce.setTitle(titre);
            annonce.setDescription(description);
            annonce.setAdresse(adresse);
            annonce.setEmail(email);

            request.setAttribute("annonce", annonce);
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("/WEB-INF/annonceUpdate.jsp")
                    .forward(request, response);
            return;
        }

        // 3. Mise à jour de l'annonce
        try {
            Annonce annonce = new Annonce();
            annonce.setId(Long.parseLong(idParam));
            annonce.setTitle(titre.trim());
            annonce.setDescription(description.trim());
            annonce.setAdresse(adresse.trim());
            annonce.setEmail(email.trim());
            annonce.setDateCreation(new Date()); // Utilisation de java.util.Date

            annonceRepository.update(annonce);
            response.sendRedirect(request.getContextPath() + "/annonce/list?updated=true");

        } catch (Exception e) {
            getServletContext().log("Erreur lors de la mise à jour", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Erreur lors de la mise à jour");
        }
    }

    @Override
    public void destroy() {
        if (annonceRepository != null) {
            annonceRepository.close();
        }
    }
}