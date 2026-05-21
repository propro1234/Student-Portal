<%@ page import = "java.sql.*" %>
<%
    String uname = request.getParameter("uname");
    String pass = request.getParameter("pass");
    String conpass = request.getParameter("conpass");

    if(conpass.equals(pass))
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
            PreparedStatement ps = cn.prepareStatement("insert into login values(?,?)");
            ps.setString(1,uname);
            ps.setString(2,pass);

            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery("select * from register where username = '"+uname+"' and password = '"+pass+"'");
            ps.executeUpdate();
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
                    
                    window.alert("Login Successfull...")
                    window.location = "Register.html"
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
%>