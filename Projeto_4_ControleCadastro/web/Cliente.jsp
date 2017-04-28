<%@page import="br.com.fatecpg.cadastros.DataBaseCliente"%>
<%@page import="br.com.fatecpg.cadastros.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- Usado para alinhas as caixas de texto-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro Cliente</title>
    </head>
    <body>
        <h1>Cadastro de Clientes</h1>
        <fieldset>
            <legend><b>Incluir Cliente</b></legend>
            <link href="<c:url value='./css/alinhar.css' />" rel="stylesheet" type="text/css" /> <!-- Usado para alinhas as caixas de texto-->
              <div style="margin-top: 30px;" class="container"> <!-- Usado para alinhas as caixas de texto-->
            <form>
                <label class="alinhar">Nome:</label>
                <input type="text" name="nome"/><br/><br/>
                
                <label class="alinhar">CPF:</label>
                <input type="text" name="cpf"/><br/><br/>
                
                <label class="alinhar">RG:</label>
                <input type="text" name="rg"/><br/><br/>
                
                <label class="alinhar">E-mail:</label>
                <input type="text" name="email"/><br/><br/>
                
                <label class="alinhar">Telefone:</label>
                <input type="text" name="tel"/><br/><br/>
                
                <label class="alinhar">Endereço:</label>
                <input type="text" name="end"><br/><br/>
                
                <input type="submit" name="incluir" value="Incluir"/>   <input type="reset" name="limpar" value="Limpar"/><br/><br/>
            </form>
              </div> <!-- Usado para alinhas as caixas de texto-->
            <%
                try{
                   if(request.getParameter("incluir")!=null){
                     String nome = request.getParameter("nome");
                     String cpf = request.getParameter("cpf");
                     String rg = request.getParameter("rg");
                     String email = request.getParameter("email");
                     String telefone = request.getParameter("tel");
                     String endereco = request.getParameter("end");
                     Cliente c = new Cliente();
                     c.setNome(nome);
                     c.setCpf(cpf);
                     c.setRg(rg);
                     c.setEmail(email);
                     c.setTelefone(telefone);
                     c.setEndereco(endereco);
                     DataBaseCliente.getClientes().add(c);
                     response.sendRedirect(request.getRequestURI());
                    }else if(request.getParameter("excluir")!=null){
                        String nome = request.getParameter("nome");
                        for(int i=0;i< DataBaseCliente.getClientes().size();i++){
                            if(DataBaseCliente.getClientes().get(i).getNome().equals(nome)){
                                DataBaseCliente.getClientes().remove(i);
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
        <table border="1">
            <tr>
                <th>Nome</th>
                <th>CPF</th>
                <th>RG</th>
                <th>E-mail</th>
                <th>Telefone</th>
                <th>Endereço</th>
                <th>OPÇÕES</th>
            </tr>
            <%for(Cliente c: DataBaseCliente.getClientes())%>
            <tr>
                
            </tr>
        </table>
    </body>
</html>
