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

@WebServlet("/annonce/add")
public class AnnonceAddServlet extends HttpServlet {

    private AnnonceRepository2 annonceRepository;

    @Override
    public void init() throws ServletException {
        this.annonceRepository = new AnnonceRepository2();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/AnnonceAdd.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Validation
        Map<String, String> errors = validateParameters(request);
        if (!errors.isEmpty()) {
            forwardWithErrors(request, response, errors);
            return;
        }

        Annonce annonce = createAnnonceFromRequest(request);
        annonceRepository.create(annonce); // Exception non attrapée

        request.setAttribute("successMessage", "Annonce créée avec succès !");
        response.sendRedirect(request.getContextPath() + "/annonce/list");
    }

    private Map<String, String> validateParameters(HttpServletRequest request) {
        Map<String, String> errors = new HashMap<>();

        if (request.getParameter("titre") == null || request.getParameter("titre").trim().isEmpty()) {
            errors.put("titre", "Le titre est obligatoire");
        }

        if (request.getParameter("description") == null || request.getParameter("description").trim().isEmpty()) {
            errors.put("description", "La description est obligatoire");
        }

        if (request.getParameter("adresse") == null || request.getParameter("adresse").trim().isEmpty()) {
            errors.put("adresse", "L'adresse est obligatoire");
        }

        String email = request.getParameter("mail");
        if (email == null || email.trim().isEmpty()) {
            errors.put("mail", "L'email est obligatoire");
        } else if (!email.matches("^[\\w-.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
            errors.put("mail", "Format d'email invalide");
        }

        return errors;
    }

    private Annonce createAnnonceFromRequest(HttpServletRequest request) {
        Annonce annonce = new Annonce();
        annonce.setTitle(request.getParameter("titre").trim());
        annonce.setDescription(request.getParameter("description").trim());
        annonce.setAdresse(request.getParameter("adresse").trim());
        annonce.setEmail(request.getParameter("mail").trim());
        annonce.setDateCreation(new Date()); // Utilise java.util.Date
        return annonce;
    }

    private void forwardWithErrors(HttpServletRequest request, HttpServletResponse response,
                                   Map<String, String> errors) throws ServletException, IOException {
        request.setAttribute("errors", errors);
        request.setAttribute("formData", request.getParameterMap());
        doGet(request, response);
    }

    @Override
    public void destroy() {
        if (annonceRepository != null) {
            annonceRepository.close();
        }
    }
}
