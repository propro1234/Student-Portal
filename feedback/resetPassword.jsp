<%@ page import = "java.sql.*" %>
<%
    String uname = request.getParameter("uname");
    String newpass = request.getParameter("newpass");
    String connewpass = request.getParameter("connewpass");

    if(connewpass.equals(newpass))
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
            PreparedStatement ps = cn.prepareStatement("update register set password = '"+newpass+"' where username = '"+uname+"'");
            int x = ps.executeUpdate();
            if(x > 0)
            {
                %>
                    <script>
                        window.alert("New password is set");
                        window.location = "Homepage.html";
                    </script>
                <%
            }
            else
            {
                out.println("Password is not set");
            }
        }
        catch(Exception e)
        {
            out.println(e);
        }
    }
    else
    {
        out.println("Password not matched");
    }
%>