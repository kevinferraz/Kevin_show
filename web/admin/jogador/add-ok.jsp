<%@page import="modelo.Jogador"%>
<%@page import="dao.JogadorDAO"%>
<%@include file="../cabecalho.jsp"%>
<%
    String msg="";
    if(request.getParameter("txtLogin") == null || request.getParameter("txtSenha") == null ){
        response.sendRedirect("list.jsp");
    }
    else{
        String login = request.getParameter("txtLogin");
        String senha = request.getParameter("txtSenha");
        String email = request.getParameter("txtEmail");
        String foto = request.getParameter("txtFoto");
        
        JogadorDAO dao = new JogadorDAO();
        Jogador obj = new Jogador();
        
        obj.setLogin(login);
        obj.setSenha(senha);
        obj.setEmail(email);
        obj.setFoto(foto);
        
        try{
            dao.incluir(obj);
            msg="Registro realizado.";
        }
        catch(Exception ex){
            msg="Erro ao executar a tarefa, tente novamente.";
        }
        
    
%>


<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text ">
            <h4>Jogador   - Cadastrar</h4>
            <div>
                <%=msg%>
                <a href="list.jsp"><i class="material-icons">list</i></a>
            </div>
        </div>
 </div>
                
<%
    }
%>
</section>

<%@include file="../rodape.jsp"%>

