<%@ page import = "java.sql.*" %>
<%
    String pass = request.getParameter("pass");

    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("select * from adminlogin where password = '"+pass+"'");
        int f = 0;
        while(rs.next())
        {
            if(pass.equals(pass))
            {
                f = 1;
            }
        }
        if(f == 1)
        {
            %>
            <!-- <html>
                <head></head>
                <body>
                    <img src="" alt="" id="myimg">
                </body>
            </html> -->
            <script type="text/javascript">

                window.alert("Login Successfull...")
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

%>