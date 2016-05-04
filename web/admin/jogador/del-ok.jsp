<%@page import="modelo.Jogador"%>
<%@page import="dao.JogadorDAO"%>
<%@include file="../cabecalho.jsp"%>
<%
    String msg = "";
    if (request.getParameter("login") == null) {
        response.sendRedirect("list.jsp");
    } else {
        String Login = request.getParameter("login");
        JogadorDAO dao = new JogadorDAO();
        Jogador obj = dao.buscarPorChavePrimaria(Login);

        if (obj != null) {
            dao.excluir(obj);
            msg = "Registro excluído.";
        } else {
            msg = "Erro ao executar a tarefa, tente novamente.";
        }


%>


<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text ">
            <h4>Jogador - Excluir</h4>
            <p><%=msg%></p>
            <a href="list.jsp"><i class="material-icons">list</i></a>
        </div>

    </div>

</section>
<%
    }
%>


<%@include file="../rodape.jsp"%>

