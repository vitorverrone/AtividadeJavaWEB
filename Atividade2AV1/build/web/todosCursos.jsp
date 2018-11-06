<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.atividade.Model.CursoDisciplina"%>
<%@page import="br.atividade.DAO.CursoDisciplicaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Todos os Cursos</title>
        <style>
            table, th, td{
                border: 1px solid black;
                text-align: center; 
                padding: 8px;
            }
        </style>
    </head>
    <body>
        <h2>Lista de todos os Cursos</h2><br/><br/>
        <hr/>
        <%
            ArrayList<CursoDisciplina> cursos = new ArrayList();
            try {
                CursoDisciplicaDAO cursoDAO = new CursoDisciplicaDAO();
                cursos = cursoDAO.getTodos();
            } catch(SQLException e) {
                out.print("Erro: "+e);
            }
        %>
        <center>
            <table>
                <tr>
                    <th>Curso</th>
                    <th>Disciplina</th>
                </tr>            
                <% 
                    for (CursoDisciplina c : cursos) {
                        out.print("<tr>");
                        out.print("<td>" + c.getNomeCurso()+ "</td>");
                        out.print("<td>" + c.getNomeDisciplina()+ "</td>");
                        out.print("</tr>");
                    }
                %>
            </table>
            <br/><br/>
        </center>
    </body>
</html>
