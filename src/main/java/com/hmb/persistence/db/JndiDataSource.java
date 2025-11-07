package com.hmb.persistence.db;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JndiDataSource {
  private static DataSource ds;
  public static DataSource get() {
    if (ds == null) {
      try {
        ds = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/hmbDs");
      } catch (Exception e) {
        throw new RuntimeException(e);
      }
    }
    return ds;
  }
}
