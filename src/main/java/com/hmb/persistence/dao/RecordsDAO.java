package com.hmb.persistence.dao;

import com.hmb.persistence.model.GameRecord;
import com.hmb.persistence.model.Juego;
import com.hmb.persistence.model.Usuario;
import java.util.List;

public interface RecordsDAO {
  GameRecord crear(GameRecord r);
  List<GameRecord> consultar(Juego j);
  GameRecord consultar(Juego j, Usuario u);
  GameRecord consultar(GameRecord r);
  int consultarNumeroDeRecords(Juego j);
}

