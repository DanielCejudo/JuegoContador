package com.hmb.service;
import com.hmb.persistence.dao.UsuariosDAO;
import com.hmb.persistence.model.Usuario;

public class AuthService {
  private final UsuariosDAO usuariosDAO;
  public AuthService(UsuariosDAO dao){ this.usuariosDAO=dao; }

  public Usuario registrar(String login, String rawPass, String correo){
    Usuario u=new Usuario(login, rawPass, correo);
    return usuariosDAO.crear(u);
  }
  public Usuario login(String login, String rawPass){
    Usuario u=usuariosDAO.consultarPorLogin(login);
    return (u!=null && u.getPassword().equals(rawPass)) ? u : null;
  }
}
