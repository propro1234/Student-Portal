<%@ page import = "java.io.*,java.util.*,javax.mail.*" %>
<%@ page import = "javax.mail.internet.*,javax.activation.*" %>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <!-- <script type="text/javascript" src="smtp.js"></script> -->
</head>
<body>
    <%

        String uname = request.getParameter("uname");
        String email = request.getParameter("email");
        String rm = request.getParameter("rm");

        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
        PreparedStatement ps = cn.prepareStatement("insert into random values(?)");
        ps.setString(1,rm);
        ps.executeUpdate();

        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("select * from register where username = '"+uname+"' and email = '"+email+"'");
        int f = 0;
        while(rs.next())
        {
            if(uname.equals(uname) && email.equals(email))
            {
                f = 1;
            }
        }
        if(f == 1)
        {
            %>
                <script>
                    window.alert("User is verified");
                    window.location = "verifyOTP.html"
                </script>
            <%
        }
        else
        {
            out.println("Invalid");
        }
    %>
</body>
</html>