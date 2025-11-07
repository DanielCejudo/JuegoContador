package com.hmb.web.controller;
import com.hmb.service.GameService;
import com.hmb.service.RecordService;
import com.hmb.persistence.dao.impl.RecordsDAOImpl;
import com.hmb.persistence.model.Juego;
import com.hmb.persistence.model.Usuario;
import jakarta.servlet.*; import jakarta.servlet.http.*; import java.io.IOException;

public class GameServlet extends HttpServlet {
  private final GameService game=new GameService();
  private final RecordService records=new RecordService(new RecordsDAOImpl());
  private final Juego HMB = new Juego(){ { setId(1L); setNombre("HMB"); } };

  @Override protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    if(req.getSession().getAttribute("hmb.secret")==null) game.start(req.getSession());
    req.getRequestDispatcher("/WEB-INF/jsp/game.jsp").forward(req,resp);
  }
  @Override protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
    int n=Integer.parseInt(req.getParameter("guess"));
    String res=game.guess(req.getSession(), n);
    if("OK".equals(res)){
      int tries=game.tries(req.getSession());
      records.guardarRecord((Usuario)req.getSession().getAttribute("user"), HMB, tries);
      req.setAttribute("msg","¡Adivinaste en "+tries+" intentos!");
      req.getSession().removeAttribute("hmb.secret"); // reinicia partida
    } else {
      req.setAttribute("msg", res.equals("MAYOR")? "El número es MAYOR" : "El número es MENOR");
    }
    doGet(req,resp);
  }
}
