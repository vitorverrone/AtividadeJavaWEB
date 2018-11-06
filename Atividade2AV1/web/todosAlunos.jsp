<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.atividade.Model.Aluno"%>
<%@page import="br.atividade.DAO.AlunoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Todos Alunos</title>
        <style>
            table, th, td{
                border: 1px solid black;
                text-align: center; 
                padding: 8px;
            }
        </style>
    </head>
    <body>
        <h2>Lista de todos os Alunos</h2><br/><br/>
        <hr/>
        <%
            String urlBD = "jdbc:derby://localhost:1527/universidade";
            Connection conn = null;
            Statement stm = null;
            ArrayList<Aluno> alunos = new ArrayList();
            try {
                conn = DriverManager.getConnection(urlBD, "root", "");
                
                /*AlunoDAO alunoDAO = new AlunoDAO();  
                if(request.getParameter("busca") != "") {
                    alunos = alunoDAO.getTodos();
                }else {
                    String busca = request.getParameter("busca");
                    alunos = alunoDAO.busca(busca);
                }*/
            } catch(SQLException e) {
                out.print("Erro: "+e);
            }
        %>
        <center>
            <table>
                <tr>
                    <th>RA</th>
                    <th>Nome</th>
                    <th>Curso</th>
                    <th>Tipo de Curso</th>
                    <th>Excluir</th>
                    <th>Editar</th>
                </tr>            
                <% 
                    for (Aluno a : alunos) {
                        out.print("<tr>");
                        out.print("<td>" + a.getRA()+ "</td>");
                        out.print("<td>" + a.getNomeAluno() + "</td>");
                        out.print("<td>" + a.getCurso().getNomeCurso()+ "</td>");
                        out.print("<td>" + a.getCurso().getTipoCurso() + "</td>");
                        out.print("<td><a href='excluiAluno.jsp?idAluno=" + a.getIdAluno()+ "'>Excluir</a>" + "</td>");
                        out.print("<td><a href='editarAluno.jsp?idAluno=" + a.getIdAluno() + "'>Editar</a>" + "</td>");
                        out.print("</tr>");
                    }
                %>
            </table>
            <br/><br/>
        </center>
    </body>
</html>
