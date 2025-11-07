<%@ page import="javax.naming.InitialContext,javax.sql.DataSource,java.sql.*" %>
<pre>
<%
try {
  DataSource ds = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/ds");
  try (Connection c = ds.getConnection();
       PreparedStatement ps = c.prepareStatement(
         "select current_user, current_database(), inet_server_addr(), inet_server_port()"
       );
       ResultSet rs = ps.executeQuery()) {
    rs.next();
    out.println("OK");
    out.println("user=" + rs.getString(1));
    out.println("db=" + rs.getString(2));
    out.println("server_addr=" + rs.getString(3));
    out.println("server_port=" + rs.getInt(4));
    out.println("jdbc_url=" + c.getMetaData().getURL());
  }
} catch (Exception e) {
  out.println("ERROR: " + e.getMessage());
  e.printStackTrace(new java.io.PrintWriter(out));
}
%>
</pre>
