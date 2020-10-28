<%-- 
    Document   : index
    Created on : 24/08/2020, 13:49:39
    Author     : Claudia
--%>

<%@page import="java.sql.*"%>
<%@page import="config.Conexao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<body>
    <div id="login">
        <h3 class="text-center text-white pt-5">Login form</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="" method="post">
                            <h3 class="text-center text-info">Login</h3>
                            <div class="form-group">
                                <label for="username" class="text-info">Email</label><br>
                                <input type="text" name="email" id="username" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Senha</label><br>
                                <input type="text" name="senha" id="password" class="form-control">
                            </div><button>Logar</button><div
                            
                       
                         <% 
           Statement st = null;
           ResultSet rs = null;
                     
        String user = request.getParameter("email");
        String pass = request.getParameter("senha");
        String nomeUsuario = "";
        String usuario = "";
        String senha = "";
        int i =0;
        try{ 
        st = new Conexao().conectar().createStatement();
        rs = st.executeQuery("SELECT * FROM usuarios WHERE  email = '"+user+"' and senha ='"+pass+"'");
        
        while(rs.next()){
            usuario = rs.getString(3);
            senha = rs.getString(4);
            nomeUsuario = rs.getString(2);
            rs.last();
            i = rs.getRow();
        }
        } catch(Exception e){
            out.println(e);
        }
        
        if(i == 0){
            out.println("Usuario incorreto");
        }else{
            
            session.setAttribute("nomeUsuario", nomeUsuario);
            response.sendRedirect("usuarios.jsp");
                   
            }


        %>
        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</head>
</body>

</html>
