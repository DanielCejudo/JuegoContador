<%@ page contentType="text/html; charset=UTF-8" %>
<html><body>
<h2>Registro</h2>
<form method="post" action="${pageContext.request.contextPath}/register">
  <input name="login" placeholder="Usuario" required/>
  <input name="correo" type="email" placeholder="Correo (opcional)"/>
  <input name="password" type="password" placeholder="Contraseña" required/>
  <button>Crear</button>
</form>
<a href="${pageContext.request.contextPath}/login">Volver a login</a>
</body></html>
