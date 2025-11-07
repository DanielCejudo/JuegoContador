package com.hmb.web.controller;
import com.hmb.persistence.dao.impl.UsuariosDAOImpl;
import com.hmb.service.AuthService;
import com.hmb.persistence.model.Usuario;
import jakarta.servlet.*; import jakarta.servlet.http.*; import java.io.IOException;

public class LoginServlet extends HttpServlet {
  private final AuthService auth = new AuthService(new UsuariosDAOImpl());

  @Override protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(req,resp);
  }

  @Override protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
    Usuario u = auth.login(req.getParameter("login"), req.getParameter("password"));
    if(u==null){
      req.setAttribute("err","Credenciales inválidas");
      doGet(req,resp); return;
    }
    req.getSession().setAttribute("user", u);
    resp.sendRedirect(req.getContextPath()+"/game");
  }
}
