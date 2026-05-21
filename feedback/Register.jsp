<%@ page import = "java.sql.*" %>
<%
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String gender = request.getParameter("gender");
    String email = request.getParameter("email");
    String uname = request.getParameter("uname");
    String pass = request.getParameter("pass");
    String conpass = request.getParameter("conpass");

    if(conpass.equals(pass))
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
            PreparedStatement ps = cn.prepareStatement("insert into register values(?,?,?,?,?,?)");
            ps.setString(1,fname);
            ps.setString(2,lname);
            ps.setString(3,gender);
            ps.setString(4,email);
            ps.setString(5,uname);
            ps.setString(6,pass);
            int x = ps.executeUpdate();
            if(x > 0)
            {
                %>
                <script>
                     window.alert("Registered Successfully.....");
                     window.location = "Login.html";
                </script>
                <%
            }
            else
            {
                out.println("Registration Failed");
            }
        }
        catch(Exception e)
        {
            out.println(e);
        }
    }
%>