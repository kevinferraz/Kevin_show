<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%@include file="../cabecalho.jsp"%>
<%
    String msg = "";
    if (request.getParameter("id") == null) {
        response.sendRedirect("list.jsp");
    } else {
        String id = (request.getParameter("id"));
        Integer iden = Integer.parseInt(id);
        CategoriaDAO dao = new CategoriaDAO();
        Categoria obj = dao.buscarPorChavePrimaria(iden);
        
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
            <h4>Categoria - Excluir</h4>
            <p><%=msg%></p>
            <a href="list.jsp"><i class="material-icons">list</i></a>
            
        </div>

    </div>
<%
    }
%>
</section>

<%@include file="../rodape.jsp"%>

