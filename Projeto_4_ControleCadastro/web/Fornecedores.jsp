<%@page import="br.com.fatecpg.cadastros.DatabaseFornecedores"%>
<%@page import="br.com.fatecpg.cadastros.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><!--Usado para alinhas as caixas de texto-->
<html>
    <head>
        <%@include file="WEB-INF/jspf/menu.jspf"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Fornecedores</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf"%>
        <div id="interface">
        <h1>Cadastro de Fornecedores</h1>
        <fieldset>
            <legend><b>Incluir Fornecedor</b></legend>
            <link href="<c:url value='./css/alinhar.css' />" rel="stylesheet" type="text/css" /> <!-- Usado para alinhas as caixas de texto-->
              <div style="margin-top: 30px;" class="container"> <!-- Usado para alinhas as caixas de texto-->
            <form>
                <label class="alinhar">Nome:</label>
                <input type="text" name="nome"/><br/><br/>
                
                <label class="alinhar">Razão Social:</label>
                <input type="text" name="razao"/><br/><br/>
                
                <label class="alinhar">CNPJ:</label>
                <input type="text" name="cnpj"/><br/><br/>
                
                <label class="alinhar">E-mail:</label>
                <input type="text" name="email"/><br/><br/>
                
                <label class="alinhar">Telefone:</label>
                <input type="text" name="telefone"/><br/><br/>
                
                <label class="alinhar">Endereço:</label>
                <input type="text" name="endereco"><br/><br/>
    
                
                
                <input type="submit" name="incluir" value="Incluir"/>   <input type="reset" name="limpar" value="Limpar"/><br/><br/>
            </form>
                  
              </div>
        <%
            try{
                if(request.getParameter("incluir")!=null){
                    String nome = request.getParameter("nome");
                    String email = request.getParameter("email");
                    String telefone = request.getParameter("telefone");
                    String razao = request.getParameter("razao");
                    String endereco = request.getParameter("endereco");
                    String cnpj = request.getParameter("cnpj");
                    Fornecedor c = new Fornecedor();
                    c.setNome(nome);
                    c.setEmail(email);
                    c.setTelefone(telefone);
                    c.setEndereco(endereco);
                    c.setRazao(razao);
                    c.setCnpj(cnpj);
                    DatabaseFornecedores.getFornecedor().add(c);
                    response.sendRedirect(request.getRequestURI());
                }else if(request.getParameter("excluir")!=null){
                    String nome = request.getParameter("nome");
                    for(int i=0; i<DatabaseFornecedores.getFornecedor().size(); i++){
                        if(DatabaseFornecedores.getFornecedor().get(i).getNome().equals(nome)){
                            DatabaseFornecedores.getFornecedor().remove(i);
                            break;
                        }
                    }
                    response.sendRedirect(request.getRequestURI());
                }
            }catch(Exception ex){%>
            <div style="color: red;">Erro: <%= ex.getMessage() %></div>
          <%}
        %>
        </fieldset><br/>
        <table border="2">
            <tr>
                <th>Nome</th>
                <th>Email</th>
                <th>Telefone</th>
                <th>Endereço</th>
                <th>Razao Social</th>
                <th>Cnpj</th>
                <th>Comandos</th>
            </tr>
            <% for(Fornecedor c: DatabaseFornecedores.getFornecedor()){%>
            <tr>
                <td><%= c.getNome() %></td>
                <td><%= c.getEmail()%></td>
                <td><%= c.getTelefone() %></td>
                <td><%= c.getEndereco() %></td>
                <td><%= c.getRazao() %></td>
                <td><%= c.getCnpj() %></td>
                <td>
                    <form>
                        <input type="hidden" name="nome" value="<%= c.getNome() %>"/>
                        <input type="submit" name="excluir" value="Excluir"/>
                    </form>
                </td>
            </tr>
            <% }%>
        </table>
        </div>
    </body>
</html>