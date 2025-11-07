package com.hmb.service;

import com.hmb.persistence.dao.RecordsDAO;
import com.hmb.persistence.model.GameRecord;
import com.hmb.persistence.model.Juego;
import com.hmb.persistence.model.Usuario;

import java.util.Date;
import java.util.List;

public class RecordService {
  private final RecordsDAO recordsDAO;
  public RecordService(RecordsDAO dao){ this.recordsDAO = dao; }

  public void guardarRecord(Usuario u, Juego j, int intentos){
    GameRecord actual = recordsDAO.consultar(j, u);
    if(actual==null || intentos < actual.getPuntaje()){
      GameRecord r = new GameRecord();
      r.setUsuario(u); r.setJuego(j);
      r.setPuntaje(intentos); r.setFecha(new Date());
      recordsDAO.crear(r);
    }
  }

  public List<GameRecord> ranking(Juego j){
    return recordsDAO.consultar(j);
  }
}
