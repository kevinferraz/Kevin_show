<%@page import="modelo.Jogador"%>
<%@page import="modelo.Categoria"%>
<%@page import="modelo.Pergunta"%>
<%@page import="dao.PerguntaDAO"%>
<%@include file="../cabecalho.jsp"%>
<%
  
    String a = request.getParameter("txtA");
    String b = request.getParameter("txtB");
    String c = request.getParameter("txtC");
    String d = request.getParameter("txtD");
    String certa = request.getParameter("txtCerta");
    String enunciado = request.getParameter("txtEnunciado");
    String nivel = request.getParameter("txtNivel");
    String categoria = request.getParameter("txtCategoria");
    
    
    PerguntaDAO dao = new PerguntaDAO();
    Pergunta obj = new Pergunta();
    Categoria objc = new Categoria();
    objc.setId(Integer.parseInt(categoria));
        
    
    obj.setEnunciado(enunciado);
    obj.setCategoria(objc);
    obj.setA(a);
    obj.setB(b);
    obj.setC(c);
    obj.setD(d);
    obj.setCerta(certa);
    obj.setNivel(Integer.parseInt(nivel));

    dao.incluir(obj);

%>

<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text ">
            <h4>Categoria - Cadastrar</h4>
            <p>Categoria cadastrada com sucesso.</p>
            <a href="list.jsp"><i class="material-icons">list</i></a>
            
        </div>

    </div>

</section>

<%@include file="../rodape.jsp"%>

