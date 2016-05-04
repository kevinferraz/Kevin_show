<%@include file="cabecalho-index.jsp"%>
<%
    //Sair
    if(request.getParameter("sair") != null){
        //Verifica se veio requisição do sistema
        session.setAttribute("usuarioAdmin", null);
        
        
    }
    String msg="";
    if(request.getParameter("txtLogin") != null && request.getParameter("txtSenha") != null){
        msg="Tentou fazer o login";
        String login= request.getParameter("txtLogin").toString();
        String senha = request.getParameter("txtSenha").toString();
        if(login.equals("Admin") && login.equals("Admin")){
            //Crio a sessão do usuário admin
            session.setAttribute("usuarioAdmin", login);
            //redirecionar para a página inicial
            response.sendRedirect("home/index_logado.jsp");
        }
        else{
            msg ="Dados incorretos";
        }
    }
%>

<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text">
            <h4>Entrar- Parte Administrativa.</h4>
            <div>
                <%=msg%>
            </div>
            <form action="index.jsp" method="post">
                <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" required  id="txtId" name="txtLogin" />
                        <label class="mdl-textfield__label" for="txtId">Login</label>
                    </div>
                </div>
                <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="password" required  id="txtSenha" name="txtSenha" />
                        <label class="mdl-textfield__label" for="txtA">Senha</label>

                    </div>
                </div>
                <div class="mdl-cell--12-col">
                    <button class="mdl-button mdl-js-button mdl-button--primary">
                        Entrar
                    </button>
                </div>    

        </div>
        </form>

</section>


<%@include file="rodape-index.jsp"%>
