<%@page import="br.com.fatecpg.cadastros.DataBaseCliente"%>
<%@page import="br.com.fatecpg.cadastros.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><!--Usado para alinhas as caixas de texto-->
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro Cliente</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf"%>
        <div id="interface">
        <h1>Cadastro de Clientes</h1>
        <form>
            <fieldset>
                <legend><b>Incluir Cliente</b></legend>
                <link href="<c:url value='./css/alinhar.css' />" rel="stylesheet" type="text/css" /><!-- Usado para alinhar as caixas de texto-->
                
                <div style="margin-top: 30px;" class="container"> <!-- Usado para alinhas as caixas de texto-->

                    <label class="alinhar">Nome:*</label>
                    <input type="text" name="nome"/><br/><br/>

                    <label class="alinhar">CPF:*</label>
                    <input type="text" name="cpf"/><br/><br/>

                    <label class="alinhar">RG:*</label>
                    <input type="text" name="rg"/><br/><br/>

                    <label class="alinhar">E-mail:*</label>
                    <input type="text" name="email"/><br/><br/>

                    <label class="alinhar">Telefone:*</label>
                    <input type="text" name="tel"/><br/><br/>

                    <label class="alinhar">Endereço:*</label>
                    <input type="text" name="end"><br/><br/>

                    <input type="submit" name="incluir" value="Incluir"/>
                    <input type="reset" name="limpar" value="Limpar"/>
                    <input type="submit" name="excluir" value="Excluir"/>
                    <input type="submit" name="alterar" value="Alterar"/>

                </div> <!-- Usado para alinhas as caixas de texto-->
                <%
                    try {
                        //botão incluir
                        if (request.getParameter("incluir") != null) {
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
                            //Botão Excluir
                        } else if (request.getParameter("excluir") != null) {
                            String nome = request.getParameter("nome");
                            for (int i = 0; i < DataBaseCliente.getClientes().size(); i++) {
                                if (DataBaseCliente.getClientes().get(i).getNome().equals(nome)) {
                                    DataBaseCliente.getClientes().remove(i);

                                    break;
                                }
                            }
                            response.sendRedirect(request.getRequestURI());
                            //Botão Alterar
                        } else if (request.getParameter("alterar") != null) {
                            String cpf = request.getParameter("cpf");
                            for (int i = 0; i < DataBaseCliente.getClientes().size(); i++) {
                                if (DataBaseCliente.getClientes().get(i).getCpf().equals(cpf)) {
                                    DataBaseCliente.getClientes().remove(i);
                                    String nome = request.getParameter("nome");

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
                                    break;
                                }
                            }
                            response.sendRedirect(request.getRequestURI());
                        }
                    } catch (Exception ex) {%>
                <div style="color: red;">Erro: <%= ex.getMessage()%></div>
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
                </tr>
                <%for (Cliente c : DataBaseCliente.getClientes()) {%>
                <tr>
                    <td><%= c.getNome()%></td>
                    <td><%= c.getCpf()%></td>
                    <td><%= c.getRg()%></td>
                    <td><%= c.getEmail()%></td>
                    <td><%= c.getTelefone()%></td>
                    <td><%= c.getEndereco()%></td>
                    <td><input type="hidden" name="nome" value="<%= c.getNome()%>"/></td>
                </tr>
                <% }%>
            </table>
        </form>
           <center>
            <footer>
                <p><strong>Instruções de uso</strong></p>
                <p>Para incluir um cliente: Preencha os campos solicitados (*) e clique em <b>INCLUIR</b></p>
                <p>Para excluir um cliente: Entrar com o <i>NOME</i> e depois clicar em <b>EXCLUIR</b></p>
                <p>Para alterar um cliente: Entrar com o <i>CPF</i> e preencher os campos que precisam ser alterados e clique em <b>ALTERAR</b></p>
            </footer>
           </center>
    </body>
</html>
