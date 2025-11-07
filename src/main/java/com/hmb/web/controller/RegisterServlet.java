package com.hmb.web.controller;
import com.hmb.persistence.dao.impl.UsuariosDAOImpl;
import com.hmb.service.AuthService;
import jakarta.servlet.*; import jakarta.servlet.http.*; import java.io.IOException;

public class RegisterServlet extends HttpServlet {
  private final AuthService auth = new AuthService(new UsuariosDAOImpl());

  @Override protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.getRequestDispatcher("/WEB-INF/jsp/register.jsp").forward(req,resp);
  }

  @Override protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
    auth.registrar(req.getParameter("login"), req.getParameter("password"), req.getParameter("correo"));
    resp.sendRedirect(req.getContextPath()+"/login");
  }
}
