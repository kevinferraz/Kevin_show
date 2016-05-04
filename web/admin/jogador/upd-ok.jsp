<%@page import="modelo.Jogador"%>
<%@page import="dao.JogadorDAO"%>
<%@include file="../cabecalho.jsp"%>
<%
    String msg = "";
    if (request.getParameter("txtLogin") == null || request.getParameter("txtSenha") == null) {
        response.sendRedirect("list.jsp");
        return;
    }
        String login = request.getParameter("txtLogin");
        String senha = request.getParameter("txtSenha");
        String email = request.getParameter("txtEmail");
        String foto = request.getParameter("txtFoto");
        
        JogadorDAO dao = new JogadorDAO();
        
        Jogador obj = dao.buscarPorChavePrimaria(login);
        
        if (obj == null) {
            response.sendRedirect("list.jsp");
            return;
        }

        obj.setLogin(login);
        obj.setSenha(senha);
        obj.setEmail(email);
        obj.setFoto(foto);

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

