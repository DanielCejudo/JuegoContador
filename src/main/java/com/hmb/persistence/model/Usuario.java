package com.hmb.persistence.model;

public class Usuario {
	  private long id;
	  private String login;
	  private String password;
	  private String correo;

	  public Usuario() {}
	  public Usuario(String login, String password, String correo) {
	    this.login = login; this.password = password; this.correo = correo;
	  }
	  public long getId() { return id; }
	  public void setId(long id) { this.id = id; }
	  public String getLogin() { return login; }
	  public void setLogin(String login) { this.login = login; }
	  public String getPassword() { return password; }
	  public void setPassword(String password) { this.password = password; }
	  public String getCorreo() { return correo; }
	  public void setCorreo(String correo) { this.correo = correo; }
	}