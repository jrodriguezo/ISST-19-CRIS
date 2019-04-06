package es.upm.dit.isst.webLab.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.crypto.hash.Sha256Hash;

import es.upm.dit.isst.webLab.dao.ProfessorDAO;
import es.upm.dit.isst.webLab.dao.ProfessorDAOImplementation;
import es.upm.dit.isst.webLab.dao.TFGDAO;
import es.upm.dit.isst.webLab.dao.TFGDAOImplementation;
import es.upm.dit.isst.webLab.model.Professor;
import es.upm.dit.isst.webLab.model.TFG;

@WebServlet("/CreateTFGServlet")
public class CreateTFGServlet extends HttpServlet {
	//con get se enviaria la informacion en la URL usandolo como transporte
	//recomendable para depuraciones
	//con post utiliza request como transporte de la informacion
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title = req.getParameter( "title" );
		String name = req.getParameter( "name" );
		String email = req.getParameter( "email" );
		String advisor = req.getParameter("advisor");
		String pass = req.getParameter("pass");
		
		
		ProfessorDAO pdao = ProfessorDAOImplementation.getInstance();
		Professor prof = pdao.read(advisor);
		
		TFG tfg = new TFG();

		tfg.setTitle(title);
		tfg.setName( name );
		tfg.setEmail( email );
		tfg.setAdvisor(prof);
		tfg.setStatus(1);
		tfg.setPassword( new Sha256Hash( pass ).toString() );
		
		TFGDAO tdao = TFGDAOImplementation.getInstance();
		tdao.create( tfg );
		
		resp.sendRedirect( req.getContextPath() + "/LoginServlet" );
	}
}
