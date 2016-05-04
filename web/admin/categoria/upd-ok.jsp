<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%@include file="../cabecalho.jsp"%>
<%
     String msg = "";
    if (request.getParameter("txtNome") == null || request.getParameter("txtId") == null) {
        response.sendRedirect("list.jsp");
        return;
    }
        String nome = request.getParameter("txtNome");
        String id = request.getParameter("txtId");
      
        
        CategoriaDAO dao = new CategoriaDAO();
        
        Categoria obj = dao.buscarPorChavePrimaria(Integer.parseInt(id));
        
        if (obj == null) {
            response.sendRedirect("list.jsp");
            return;
        }
         
        obj.setNome(nome);
        obj.setId(Integer.parseInt(id));
        dao.alterar(obj);




%>


<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text ">
            <h4>Atualizar</h4>
            <p>Registro atualizado com sucesso.</p>
            <a href="list.jsp"><i class="material-icons">list</i></a>
            
        </div>

    </div>

</section>

<%@include file="../rodape.jsp"%>

