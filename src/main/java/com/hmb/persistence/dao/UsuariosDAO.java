package com.hmb.persistence.dao;
import com.hmb.persistence.model.Usuario;
import java.util.List;

public interface UsuariosDAO {
  Usuario crear(Usuario u);
  List<Usuario> consultar();
  List<Usuario> consultar(Usuario u);
  Usuario modificar(Usuario u);
  int borrar(Usuario u);
  Usuario consultarPorLogin(String login);
}