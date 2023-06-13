<!DOCTYPE html>
<html>
<head>
  <title>MariaDB</title>
</head>
<body>
  <%-- MariaDB 연결 정보 --%>
  <% String url = "jdbc:mariadb://reca3team-mariadb-pmh.c1eiqtt31v98.ap-northeast-2.rds.amazonaws.com:3306/test";
     String username = "admin";
     String password = "12345678";
     String driver = "org.mariadb.jdbc.Driver"; %>

  <%@ page import="java.sql.*" %>
  <%@ page import="javax.naming.*" %>
  <%@ page import="javax.sql.*" %>

  <%!
    public Connection getConnection() throws Exception {
      String driver = "org.mariadb.jdbc.Driver";
      String url = "jdbc:mariadb://reca3team-mariadb-pmh.c1eiqtt31v98.ap-northeast-2.rds.amazonaws.com:3306/test";
     String username = "admin";
     String password = "12345678";
      Class.forName(driver);
      Connection conn = DriverManager.getConnection(url, username, password);
      return conn;
    }
  %>

  <%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
       conn = getConnection();
       stmt = conn.createStatement();
       String sql = "SELECT * FROM user";
       rs = stmt.executeQuery(sql);
  %>

  <h1>MariaDB Data</h1>
    <% while (rs.next()) { %>
        <p>Name: <%= rs.getString("name") %></p>
        <p>Age: <%= rs.getInt("age") %></p>
    <% }
       rs.close();
       stmt.close();
       conn.close();
     } catch (Exception e) {
       e.printStackTrace();
     }
    %>
</body>
</html>