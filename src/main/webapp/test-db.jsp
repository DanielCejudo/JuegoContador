<%@ page import="javax.naming.InitialContext,javax.sql.DataSource,java.sql.*" %>
<pre>
<%
  try {
    DataSource ds = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/hmbDs");
    try (Connection c = ds.getConnection();
         PreparedStatement ps = c.prepareStatement("SELECT current_user, current_database()");
         ResultSet rs = ps.executeQuery()) {
      rs.next();
      out.println("OK: " + rs.getString(1) + " @ " + rs.getString(2));
    }
  } catch (Exception e) {
    out.println("ERROR: " + e.getMessage());
    e.printStackTrace(new java.io.PrintWriter(out));
  }
%>
</pre>

