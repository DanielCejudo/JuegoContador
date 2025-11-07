<%@ page contentType="text/html; charset=UTF-8" %>
<html><body>
<img src="${pageContext.request.contextPath}/imagenes/portada.jpg" alt="Portada"><br>
<img src="${pageContext.request.contextPath}/imagenes/cabeza.jpg" alt="Cabeza"><br>

<h2>Ingreso</h2>
<% String msg = request.getParameter("msg"); %>
<% if (msg != null) { %>
 <div style="color:green;"><%= msg %></div>
<% } %>
<form method="post" action="${pageContext.request.contextPath}/login">
 <input name="login" placeholder="Usuario" required/>
 <input name="password" type="password" placeholder="Contraseña" required/>
 <button>Entrar</button>
</form>
<a href="${pageContext.request.contextPath}/register">Crear cuenta</a>
<% String err=(String)request.getAttribute("err"); if(err!=null){ %>
 <p style="color:red"><%= err %></p>
<% } %>
</body></html>