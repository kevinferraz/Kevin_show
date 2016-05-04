<%@page import="modelo.Jogador"%>   
<%@page import="modelo.Jogo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Pergunta"%>
<%@page import="java.util.List"%>
<%@page import="dao.PerguntaDAO"%>
<%  
    //verifica se diferencia o botão que eu cliquei
    Jogo jogo;
    //verificar se já tem jogo sendo jogado
    if(session.getAttribute("jogo") != null){
        jogo= (Jogo)session.getAttribute("jogo");
    }
    else{
          jogo= new Jogo();
    }
    if(request.getParameter("btnConfirmar") != null){
       String opcaomarcada = request.getParameter("rdoPergunta");
       //verificar se acertou ou errou
       if(!jogo.confirmar(opcaomarcada)){
             response.sendRedirect("fim.jsp");
       }
    }
    else{
      
        if(request.getParameter("btnPular") != null){
            jogo.pular();
        }
        else{
            if(request.getParameter("btnParar") != null){
          response.sendRedirect("fim.jsp");
    }
            else{
              //iniciar jogo
              jogo.iniciar();
            }
   }
 }
    //Trecho executado quando eu acesso o jogo pela primeira vez - Pergunta 01
   session.setAttribute("jogo", jogo);
   Pergunta pergunta = jogo.getListapergunta().get(0);
   Jogador jogador = (Jogador)session.getAttribute("jogador");   
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show do Milhão</title>
        <link rel="stylesheet" href="css/estilo.css"/>
    </head>

    <body>
        <div class="pergunta">
            <h4 class="enunciado"><%=pergunta%></h4>
            <div class="opcoes">
                <form action="pergunta.jsp" method="post">
                    <input type="radio" value="A" name="rdoPergunta" />
                    <%=pergunta.getA()%><br/>
                    <input type="radio" value="B" name="rdoPergunta" />
                    <%=pergunta.getB()%><br/>
                    <input type="radio" value="C" name="rdoPergunta" />
                    <%=pergunta.getC()%><br/>
                    <input type="radio" value="D" name="rdoPergunta" />
                    <%=pergunta.getD()%><br/>
                    <hr/>
                    <input type="submit" value="confirmar" name="btnConfirmar" />
                    <input type="submit" value="pular" name="btnPular" />(<%=jogo.getPulos()%>)
                    <input type="submit" value="parar" name="btnParar" />
                </form>
            </div>
        </div>
        <div class="painelUsuario">
            <%=jogador.getLogin()%><br />
            <%=jogo.getErro()%> errar<br/>
            <%=jogo.getPontuacao()%> parar<br/>
            <%=jogo.getAcerto()%> acertar<br/>
        </div>
    </body>
</html>
