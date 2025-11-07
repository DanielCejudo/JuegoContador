<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List,com.hmb.persistence.model.GameRecord" %>
<html><body>
<h2>Ranking HMB (menor intentos)</h2>
<table border="1">
<tr><th>#</th><th>Usuario</th><th>Intentos</th><th>Fecha</th></tr>
<%
  List<GameRecord> r = (List<GameRecord>)request.getAttribute("ranking");
  int i=1; if(r!=null) for(GameRecord x : r){
%>
<tr>
  <td><%= i++ %></td>
  <td><%= x.getUsuario().getLogin() %></td>
  <td><%= x.getPuntaje() %></td>
  <td><%= x.getFecha() %></td>
</tr>
<% } %>
</table>
<a href="${pageContext.request.contextPath}/game">Volver al juego</a>
</body></html>
