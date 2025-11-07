<%@ page import="java.sql.*" %>
<pre>
<%
try {
  Class.forName("org.postgresql.Driver");
  try (Connection c = DriverManager.getConnection(
         "jdbc:postgresql://localhost:5432/hmbdb", "hmb", "p123")) {
    out.println("Driver OK, conectado como: " + c.getMetaData().getUserName());
  }
} catch (Exception e) {
  out.println("ERROR: " + e);
  e.printStackTrace(new java.io.PrintWriter(out));
}
%>
</pre>