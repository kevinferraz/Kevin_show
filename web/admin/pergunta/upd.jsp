<%@page import="java.util.List"%>
<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="modelo.Pergunta"%>
<%@page import="dao.PerguntaDAO"%>
<%@include file="../cabecalho.jsp"%>
<%
    if(request.getParameter("id") == null){
        response.sendRedirect("list.jsp");
        return;
    }
    String id = request.getParameter("id");
    PerguntaDAO dao = new PerguntaDAO();
    Pergunta obj = dao.buscarPorChavePrimaria(Integer.parseInt(id));
    if(obj ==  null){
        response.sendRedirect("list.jsp");
        return;
    }
    CategoriaDAO daoc = new CategoriaDAO();
    List<Categoria> clist = daoc.listar();
    
    
  


%>

<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text">
            <h4>Pergunta8/ - Atualizar</h4>
            <form action="upd-ok.jsp" method="post">
                <!-- 
                    primeira div -- área que ocupará o campo de formulário
                    segunda div -- campo de texto e label 
                -->
                   <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" required  id="txtId" name="txtId" value="<%=obj.getId()%>" />
                        <label class="mdl-textfield__label" for="txtId">Id</label>
                    </div>
                </div>
                 <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" required  id="txtA" name="txtA"value="<%=obj.getA()%>" />
                        <label class="mdl-textfield__label" for="txtA">A</label>
                    </div>
                </div>
                 <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" required  id="txtB" name="txtB" value="<%=obj.getB()%>" />
                        <label class="mdl-textfield__label" for="txtB">B</label>
                    </div>
                </div>
                 <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" required  id="txtC" name="txtC" value="<%=obj.getC()%>" />
                        <label class="mdl-textfield__label" for="txtC">C</label>
                    </div>
                </div>
                
                <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" required  id="txtD" name="txtCerta" value="<%=obj.getCerta()%>" />
                        <label class="mdl-textfield__label" for="txtCerta">D</label>
                        
                    </div>
                </div>
                 <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" required  id="txtEnunciado" name="txtEnunciado" value="<%=obj.getEnunciado()%>" />
                        <label class="mdl-textfield__label" for="txtEnunciado">Enunciado</label>
                    </div>
                </div>
                 <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" required  id="txtEnunciado" name="txtNivel" value="<%=obj.getNivel()%>" />
                        <label class="mdl-textfield__label" for="txtNivel">Nível</label>
                    </div>
                </div>        
               
                  <div class="mdl-cell--12-col">
                    <div class="mdl-select mdl-js-select mdl-select--floating-label">
                        <select class="mdl-select__input" id="txtCerta" name="txtCategoria" name="txtCategoria">
                            <option value=""></option>
                            <%                                for (Categoria c : clist) {
                            %>
                            <option value="<%=c.getId()%>"><%=c%></option>
                            <%
                                }
                            %>

                        </select>
                        <label class="mdl-select__label" for="txtCerta">Selecione a categoria</label>
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


