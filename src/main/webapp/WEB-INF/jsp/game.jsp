<%@ page contentType="text/html; charset=UTF-8" %>
<html><body>
<img src="${pageContext.request.contextPath}/imagenes/calamardo.jpg" alt="Calamardo"><br>


<h2>Juego HMB</h2>
<p><%= request.getAttribute("msg")==null ? "" : request.getAttribute("msg") %></p>
<form method="post">
 <input type="number" name="guess" min="1" max="100" required/>
 <button>Probar</button>
</form>
<a href="${pageContext.request.contextPath}/record">Ver ranking</a> |
<a href="${pageContext.request.contextPath}/logout">Salir</a>
</body></html>

