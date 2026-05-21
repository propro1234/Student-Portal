<%@ page import = "java.sql.*" %>
<%
    String email = request.getParameter("email");

    try
    {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery("select * from register where email = '"+email+"'");
            int f = 0;
            while(rs.next())
            {
                if(email.equals(email))
                {
                    f = 1;
                }
            }
            if(f == 1)
            {
                %>
                    <script type="text/javascript">
                        window.location = "otp.html"
                    </script>
                <%
            }
            else
            {
                out.println("Email not registered");
            }
    }
    catch(Exception e)
    {
        out.println(e);
    }
%>