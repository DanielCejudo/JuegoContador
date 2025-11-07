package com.hmb.persistence.dao.impl;

import com.hmb.persistence.dao.RecordsDAO;
import com.hmb.persistence.db.JndiDataSource;
import com.hmb.persistence.model.GameRecord;
import com.hmb.persistence.model.Juego;
import com.hmb.persistence.model.Usuario;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RecordsDAOImpl implements RecordsDAO {

  @Override
  public GameRecord crear(GameRecord r){
    String sql = "INSERT INTO records(usuario_id,juego_id,puntaje,fecha,posicion) " +
                 "VALUES(?,?,?,?,0) RETURNING id";
    try (Connection c = JndiDataSource.get().getConnection();
         PreparedStatement ps = c.prepareStatement(sql)) {
      ps.setLong(1, r.getUsuario().getId());
      ps.setLong(2, r.getJuego().getId());
      ps.setInt(3, r.getPuntaje());
      ps.setDate(4, new java.sql.Date(r.getFecha().getTime()));
      try (ResultSet rs = ps.executeQuery()) {
        if (rs.next()) r.setId(rs.getLong(1));
      }
      return r;
    } catch (Exception e) { throw new RuntimeException(e); }
  }

  @Override
  public List<GameRecord> consultar(Juego j){
    String sql = "SELECT r.id,u.login,r.puntaje,r.fecha " +
                 "FROM records r JOIN usuarios u ON u.id=r.usuario_id " +
                 "WHERE r.juego_id=? ORDER BY r.puntaje ASC, r.fecha ASC";
    List<GameRecord> out = new ArrayList<>();
    try (Connection c = JndiDataSource.get().getConnection();
         PreparedStatement ps = c.prepareStatement(sql)) {
      ps.setLong(1, j.getId());
      try (ResultSet rs = ps.executeQuery()) {
        while (rs.next()) {
          GameRecord r = new GameRecord();
          r.setId(rs.getLong(1));
          Usuario u = new Usuario(); u.setLogin(rs.getString(2));
          r.setUsuario(u);
          r.setPuntaje(rs.getInt(3));
          r.setFecha(rs.getDate(4));
          r.setJuego(j);
          out.add(r);
        }
      }
      return out;
    } catch (Exception e) { throw new RuntimeException(e); }
  }

  @Override
  public GameRecord consultar(Juego j, Usuario u){
    String sql = "SELECT id,puntaje,fecha FROM records " +
                 "WHERE juego_id=? AND usuario_id=? " +
                 "ORDER BY puntaje ASC, fecha ASC LIMIT 1";
    try (Connection c = JndiDataSource.get().getConnection();
         PreparedStatement ps = c.prepareStatement(sql)) {
      ps.setLong(1, j.getId());
      ps.setLong(2, u.getId());
      try (ResultSet rs = ps.executeQuery()) {
        if (rs.next()) {
          GameRecord r = new GameRecord();
          r.setId(rs.getLong(1));
          r.setPuntaje(rs.getInt(2));
          r.setFecha(rs.getDate(3));
          r.setUsuario(u);
          r.setJuego(j);
          return r;
        }
        return null;
      }
    } catch (Exception e) { throw new RuntimeException(e); }
  }

  @Override
  public GameRecord consultar(GameRecord r){
    return consultar(r.getJuego(), r.getUsuario());
  }

  @Override
  public int consultarNumeroDeRecords(Juego j){
    String sql = "SELECT COUNT(*) FROM records WHERE juego_id=?";
    try (Connection c = JndiDataSource.get().getConnection();
         PreparedStatement ps = c.prepareStatement(sql)) {
      ps.setLong(1, j.getId());
      try (ResultSet rs = ps.executeQuery()) {
        rs.next(); return rs.getInt(1);
      }
    } catch (Exception e) { throw new RuntimeException(e); }
  }
}
