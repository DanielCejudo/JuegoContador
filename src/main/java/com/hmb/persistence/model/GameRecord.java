package com.hmb.persistence.model;

import java.util.Date;
public class GameRecord {
  private Usuario usuario;
  private int puntaje;
  private Date fecha;
  private Juego juego;
  private long id;
  private int posicion;

  public Usuario getUsuario() { return usuario; }
  public void setUsuario(Usuario usuario) { this.usuario = usuario; }
  public int getPuntaje() { return puntaje; }
  public void setPuntaje(int puntaje) { this.puntaje = puntaje; }
  public Date getFecha() { return fecha; }
  public void setFecha(Date fecha) { this.fecha = fecha; }
  public Juego getJuego() { return juego; }
  public void setJuego(Juego juego) { this.juego = juego; }
  public long getId() { return id; }
  public void setId(long id) { this.id = id; }
  public int getPosicion() { return posicion; }
  public void setPosicion(int posicion) { this.posicion = posicion; }
}