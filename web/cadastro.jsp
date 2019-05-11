<%-- 
    Document   : consulta
    Created on : 10 de mai de 2019, 11:15:21
    Author     : ademar
--%>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@page import="br.com.fapan.conexao.conexao" %>

<%! conexao con = new conexao();%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (request.getParameter("cadastro") != null) {

                Statement persistencia = null;
                
                persistencia = con.getConnection().createStatement();
                String id = request.getParameter("id");
                String nome = request.getParameter("nome");

                try {
                    persistencia.executeUpdate("insert into usuarios values('" + id + "','" + nome + "');");
                    out.println("<br></br> "
                            + "<table width='345' border='1' align='center' bgcolor='#FFFFFF'  cellpadding='0' cellspacing='0' bordercolor='#000099'>  "
                            + "<tr>"
                            + "<td align='center'>CADASTRADO!"
                            + "</td>     "
                            + " </tr> "
                            + " </table> ");
                    persistencia.close();

                } catch (SQLException e) {
                    out.println(e);
                };

            }
        %>
        
        
        
        <form name="form" method="post"  action="cadastro.jsp" >
            <br></br>
            <table width="352" border="1" bgcolor="#FFFFFF" align="center" cellpadding="0" cellspacing="0" bordercolor="#000099">
                <tr>
                    <td align="center" bgcolor="#0000CC"><FONT color="#FFFFFF" SIZE=4 >CADASTRO DE USUÁRIO</FONT></td>
                </tr>
            </table>
            <table width="352" height="81" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#000099" bgcolor="#FFFFFF">
                <tr>
                    <th width="144">ID do Usuário </th>
                    <td width="185"><input type="text" name="id" id="Id_usuario"/></td>
                </tr>
                <tr>
                    <th>Nome do Usuário</th>
                    <td><input type="text" name="nome" id="Nombre"/></td>
                </tr>
            </table>

            <table  width="345" border="0" align="center">
                <tr>
                    <td width="%50" align="center">
                    <input name="cadastro" type="submit"  value="CADASTRAR" /></td>    
                </tr>
            </table>  
    </body>
</html>
