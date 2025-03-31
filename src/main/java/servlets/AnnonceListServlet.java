package servlets;

import entities.Annonce;
import repositories.AnnonceRepository2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/annonce/list")
public class AnnonceListServlet extends HttpServlet {

    private AnnonceRepository2 annonceRepository;

    @Override
    public void init() throws ServletException {
        this.annonceRepository = new AnnonceRepository2();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            List<Annonce> annonces = annonceRepository.readAll();

            request.setAttribute("annonces", annonces);

            if (request.getParameter("deleted") != null) {
                request.setAttribute("successMessage", "Annonce supprimée avec succès");
            }

            request.getRequestDispatcher("/WEB-INF/annonceList.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            getServletContext().log("Erreur lors de la récupération des annonces", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Erreur lors du chargement des annonces");
        }
    }

    @Override
    public void destroy() {
        if (annonceRepository != null) {
            annonceRepository.close();
        }
    }
}
