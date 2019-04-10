package es.upm.dit.isst.webLab.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.apache.shiro.subject.Subject;

import es.upm.dit.isst.webLab.dao.ProfessorDAO;
import es.upm.dit.isst.webLab.dao.ProfessorDAOImplementation;
import es.upm.dit.isst.webLab.dao.TFGDAO;
import es.upm.dit.isst.webLab.dao.TFGDAOImplementation;
import es.upm.dit.isst.webLab.model.Professor;
import es.upm.dit.isst.webLab.model.TFG;

/**
 * Servlet implementation class Form2ProfessorServlet
 */
@WebServlet("/Form2ProfessorServlet")
public class Form2ProfessorServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String emailTutor = req.getParameter("emailTutor");
		TFGDAO tdao = TFGDAOImplementation.getInstance();
		TFG tfg = tdao.read(email); //cojo el email
		tfg.setStatus(2);
		tdao.update(tfg);
		resp.sendRedirect( req.getContextPath() + "/ProfessorServlet?email=" + emailTutor);

	}

}
