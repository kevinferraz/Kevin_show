<%@page import="modelo.Categoria"%>
<%@page import="modelo.Pergunta"%>
<%@page import="dao.PerguntaDAO"%>
<%@include file="../cabecalho.jsp"%>
<%
    String id = request.getParameter("txtId");
    String a = request.getParameter("txtA");
    String b = request.getParameter("txtB");
    String c = request.getParameter("txtC");
    String d = request.getParameter("txtD");
    String certa = request.getParameter("txtCerta");
    String enunciado = request.getParameter("txtEnunciado");
    String nivel = request.getParameter("txtNivel");
    String categoria = request.getParameter("txtCategoria");

    PerguntaDAO dao = new PerguntaDAO();
    
    Categoria objc = new Categoria();

    Pergunta obj = dao.buscarPorChavePrimaria(Integer.parseInt(id));
    if (obj == null) {
        response.sendRedirect("list.jsp");
        return;
    }
    
    objc.setId(Integer.parseInt(categoria));
    obj.setEnunciado(enunciado);
    obj.setCategoria(objc);
    obj.setA(a);
    obj.setB(b);
    obj.setC(c);
    obj.setD(d);
    obj.setCerta(certa);
    obj.setNivel(Integer.parseInt(nivel));

    dao.alterar(obj);
%>




<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text ">
            <h4>Atualizar</h4>
            <p>Registro atualizado.</p>
            <a href="list.jsp"><i class="material-icons">list</i></a>

        </div>

    </div>

</section>

<%@include file="../rodape.jsp"%>

