package servlets;

import entities.Annonce;
import repositories.AnnonceRepository2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/annonce/delete")
public class AnnonceDeleteServlet extends HttpServlet {

    private AnnonceRepository2 annonceRepository;

    @Override
    public void init() throws ServletException {
        this.annonceRepository = new AnnonceRepository2();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID manquant");
            return;
        }

        int id = Integer.parseInt(idParam); // Lève NumberFormatException

        Annonce annonce = annonceRepository.read(id);
        if (annonce == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Annonce introuvable");
            return;
        }

        annonceRepository.delete(id);

        response.sendRedirect(request.getContextPath() + "/annonce/list?deleted=true");
    }

    @Override
    public void destroy() {
        if (annonceRepository != null) {
            annonceRepository.close();
        }
    }
}
