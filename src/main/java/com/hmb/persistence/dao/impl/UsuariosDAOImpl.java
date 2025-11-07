package com.hmb.persistence.dao.impl;
import com.hmb.persistence.dao.UsuariosDAO;
import com.hmb.persistence.db.JndiDataSource;
import com.hmb.persistence.model.Usuario;
import java.sql.*;
import java.util.*;

public class UsuariosDAOImpl implements UsuariosDAO {
  @Override public Usuario crear(Usuario u){
    String sql="INSERT INTO usuarios(login,password,correo) VALUES(?,?,?) RETURNING id";
    try(Connection c=JndiDataSource.get().getConnection();
        PreparedStatement ps=c.prepareStatement(sql)){
      ps.setString(1,u.getLogin());
      ps.setString(2,u.getPassword());
      ps.setString(3,u.getCorreo());
      try(ResultSet rs=ps.executeQuery()){
        if(rs.next()) u.setId(rs.getLong(1));
      }
      return u;
    } catch(Exception e){ throw new RuntimeException(e); }
  }
  @Override public List<Usuario> consultar(){
    List<Usuario> out=new ArrayList<>();
    String sql="SELECT id,login,password,correo FROM usuarios";
    try(Connection c=JndiDataSource.get().getConnection();
        PreparedStatement ps=c.prepareStatement(sql);
        ResultSet rs=ps.executeQuery()){
      while(rs.next()){
        Usuario u=new Usuario();
        u.setId(rs.getLong(1)); u.setLogin(rs.getString(2));
        u.setPassword(rs.getString(3)); u.setCorreo(rs.getString(4));
        out.add(u);
      }
      return out;
    } catch(Exception e){ throw new RuntimeException(e); }
  }
  @Override public List<Usuario> consultar(Usuario u){ return consultar(); }
  @Override public Usuario modificar(Usuario u){
    String sql="UPDATE usuarios SET password=?, correo=? WHERE login=? RETURNING id";
    try(Connection c=JndiDataSource.get().getConnection();
        PreparedStatement ps=c.prepareStatement(sql)){
      ps.setString(1,u.getPassword());
      ps.setString(2,u.getCorreo());
      ps.setString(3,u.getLogin());
      try(ResultSet rs=ps.executeQuery()){
        if(rs.next()) u.setId(rs.getLong(1));
      }
      return u;
    } catch(Exception e){ throw new RuntimeException(e); }
  }
  @Override public int borrar(Usuario u){
    String sql="DELETE FROM usuarios WHERE login=?";
    try(Connection c=JndiDataSource.get().getConnection();
        PreparedStatement ps=c.prepareStatement(sql)){
      ps.setString(1,u.getLogin());
      return ps.executeUpdate();
    } catch(Exception e){ throw new RuntimeException(e); }
  }
  @Override public Usuario consultarPorLogin(String login){
    String sql="SELECT id,login,password,correo FROM usuarios WHERE login=?";
    try(Connection c=JndiDataSource.get().getConnection();
        PreparedStatement ps=c.prepareStatement(sql)){
      ps.setString(1,login);
      try(ResultSet rs=ps.executeQuery()){
        if(rs.next()){
          Usuario u=new Usuario();
          u.setId(rs.getLong(1));
          u.setLogin(rs.getString(2));
          u.setPassword(rs.getString(3));
          u.setCorreo(rs.getString(4));
          return u;
        }
        return null;
      }
    } catch(Exception e){ throw new RuntimeException(e); }
  }
}

