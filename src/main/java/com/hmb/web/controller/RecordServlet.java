package com.hmb.web.controller;

import com.hmb.persistence.dao.impl.RecordsDAOImpl;
import com.hmb.persistence.model.Juego;
import com.hmb.service.RecordService;

import jakarta.servlet.*; 
import jakarta.servlet.http.*; 
import java.io.IOException;

public class RecordServlet extends HttpServlet {
  private final RecordService records = new RecordService(new RecordsDAOImpl());
  private final Juego HMB = new Juego(){ { setId(1L); setNombre("HMB"); } };

  @Override protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.setAttribute("ranking", records.ranking(HMB));
    req.getRequestDispatcher("/WEB-INF/jsp/record.jsp").forward(req,resp);
  }
}
