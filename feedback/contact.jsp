<%@ page import = "java.sql.*" %>
<%
    String uname = request.getParameter("uname");
    String email = request.getParameter("email");
    String sem = request.getParameter("sem");
    String comment = request.getParameter("comm");

        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
            
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery("select * from register where username = '"+uname+"'");
            int f = 0;
            while(rs.next())
            {
                if(uname.equals(uname))
                {
                    f = 1;
                }
            }
            if(f == 1)
            {
                PreparedStatement ps = cn.prepareStatement("insert into contact values(?,?,?,?)");
                ps.setString(1,uname);
                ps.setString(2,email);
                ps.setString(3,sem);
                ps.setString(4,comment);
                int x = ps.executeUpdate();
                if(x > 0)
                {
                    %>
                        <script>
                            window.alert("Comment Posted...");
                            window.location = "Homepage.html";
                        </script>
                    <%
                }
                else
                {
                    out.println("Comment not posted");
                }
            }
            else
            {
                out.println("You are not registerd or entered wrong username");
            } 
        }
        catch(Exception e)
        {
            out.println(e);
        }
%>