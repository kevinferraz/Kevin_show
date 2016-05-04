<%@page import="modelo.Pergunta"%>
<%@page import="dao.PerguntaDAO"%>
<%@include file="../cabecalho.jsp"%>
<%
     if (request.getParameter("id") == null) {

        response.sendRedirect("agendamento.jsp");
        return;
    }
    String id = (request.getParameter("id"));
    
    
    PerguntaDAO dao = new PerguntaDAO();
   
    Pergunta obj = dao.buscarPorChavePrimaria(Integer.parseInt(id));
    
   
     String msg="";
    if (obj != null) {
        dao.excluir(obj);
        msg ="Pergunta excluída!";
    } 
   
    else {
         msg ="Erro ao executar a tarefa, tente novamente.";
    }



%>


<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text ">
            <h4>Categoria - Excluir</h4>
            <p>Registro excluído com sucesso.</p>
            <a href="list.jsp"><i class="material-icons">list</i></a>
            
        </div>

    </div>

</section>

<%@include file="../rodape.jsp"%>

