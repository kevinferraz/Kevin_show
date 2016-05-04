<%@page import="modelo.Jogador"%>
<%@page import="dao.JogadorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String msg="";
    if(request.getParameter("txtCadastrarLogin") != null || request.getParameter("txtCadastrarSenha") != null || request.getParameter("txtCadastrarEmail") != null){
    
      if(!request.getParameter("txtCadastrarLogin").isEmpty() && !request.getParameter("txtCadastrarSenha").isEmpty() || !request.getParameter("txtCadastrarEmail").isEmpty())
      {     
        String login = request.getParameter("txtCadastrarLogin");
        String senha = request.getParameter("txtCadastrarSenha");
        String email = request.getParameter("txtCadastrarEmail");
        JogadorDAO dao = new JogadorDAO();
        Jogador obj = new Jogador();
        
        obj.setLogin(login);
        obj.setSenha(senha);
        obj.setEmail(email);
        try{
            dao.incluir(obj);
            msg="Registro realizado com sucesso.";
        }
        catch(Exception ex){
            msg="Erro no cadastro";
        }   
      }
  } 
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show do Milhão</title>
        <link rel="stylesheet" href="css/estilo.css"/>
    </head>
    <body>
        <h1><%=msg%></h1>
          <a href="index.jsp">Voltar ao inicio</a>
        
    </body>
</html>
    