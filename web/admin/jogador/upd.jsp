<%@page import="modelo.Jogador"%>
<%@page import="dao.JogadorDAO"%>
<%@include file="../cabecalho.jsp"%>
<%
     if (request.getParameter("login") == null) {
        response.sendRedirect("list.jsp");
        return;
    }
   String login = request.getParameter("login");
   JogadorDAO dao = new JogadorDAO();
   Jogador obj = dao.buscarPorChavePrimaria(login);
    if (obj == null) {
        response.sendRedirect("list.jsp");
        return;
    }
   

%>

<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text">
            <h4>Jogador - Atualizar</h4>
            <form action="upd-ok.jsp" method="post">
                <!-- 
                    primeira div -- área que ocupará o campo de formulário
                    segunda div -- campo de texto e label 
                -->
               <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" required  id="txtLogin" name="txtLogin" readonly value="<%=obj.getLogin()%>"/>
                        <label class="mdl-textfield__label" for="txtLogin">Login</label>
                    </div>
                </div>
                
                 <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" required  id="txtSenha" name="txtSenha"value="<%=obj.getSenha()%>" />
                        <label class="mdl-textfield__label" for="txtSenha">Senha</label>
                    </div>
                </div>
                
                 <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" required  id="txtEmail" name="txtEmail"value="<%=obj.getEmail()%>"/>
                        <label class="mdl-textfield__label" for="txtEmail">E-mail</label>
                    </div>
                </div>
                
                 <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" required  id="txtFoto" name="txtFoto"value="<%=obj.getFoto()%>" />
                        <label class="mdl-textfield__label" for="txtFoto">Foto</label>
                    </div>
                </div>
                <div class="mdl-cell--12-col">
                    
                    <button type="submit" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
                    <i class="material-icons">save</i></button>
                    <button type="reset" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
                    <i class="material-icons">clear</i></button>
                    
                    
                </div>
            </form>
        </div>

    </div>

</section>

<%@include file="../rodape.jsp"%>


