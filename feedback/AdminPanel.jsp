<%@ page import = "java.sql.*" %>
<%
    String uname = request.getParameter("uname");
    String pass = request.getParameter("pass");
    String conpass = request.getParameter("conpass");
    String c = request.getParameter("opt");

    if(c.equals("insert"))
    {
    if(conpass.equals(pass))
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
            PreparedStatement ps = cn.prepareStatement("insert into register values(?,?)");
            ps.setString(1,uname);
            ps.setString(2,pass);
            int x = ps.executeUpdate();
            if(x > 0)
            {
                %>
                <script>
                    window.alert("1 row inserted");
                    window.location = "AdminPanel.html";
                </script>
                <%
            }
            else
            {
                out.println("No row inseted");
            }
        }
        catch(Exception e)
        {
            out.println(e);
        }
    }
    else
    {
        out.println("password not matched");
    }
    }

    if(c.equals("delete"))
    {
    if(conpass.equals(pass))
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
            PreparedStatement ps = cn.prepareStatement("delete from register where username = '"+uname+"' and password = '"+pass+"'");
            int x = ps.executeUpdate();
            if(x == 0 && x <= 1)
            {
                %>
                <script>
                    window.alert("1 row deleted");
                    window.location = "AdminPanel.html";
                </script>
                <%
            }
            else
            {
                out.println("No row deleted");
            }
        }
        catch(Exception e)
        {
            out.println(e);
        }
    }
    else
    {
        out.println("password not matched");
    }
    }
    if(c.equals("search"))
    {
    if(conpass.equals(pass))
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery("select * from register where username = '"+uname+"' and password = '"+pass+"'");
            int f = 0;
            while(rs.next())
            {
                if(uname.equals(uname) && pass.equals(pass))
                {
                    f = 1;
                }
            }
            if(f == 1)
            {
                %>
                <script type="text/javascript">
                    window.alert("Rcord exists...")
                    window.location = "AdminPanel.html"
                </script>
                <%
            }
            else
            {
                out.println("Invalid");
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
    }
    
%>