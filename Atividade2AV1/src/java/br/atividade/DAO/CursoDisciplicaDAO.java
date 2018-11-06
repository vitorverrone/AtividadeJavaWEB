package br.atividade.DAO;

import br.atividade.Model.Aluno;
import br.atividade.Model.Curso;
import br.atividade.Model.CursoDisciplina;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class CursoDisciplicaDAO {
    private static final String urlBD = "jdbc:derby://localhost:1527/universidade";
    private static Connection conn = null;
    private static Statement stm = null;
    
    public ArrayList<CursoDisciplina> getTodos() throws SQLException {
        ArrayList<CursoDisciplina> cursos = new ArrayList();
        conn = DriverManager.getConnection(urlBD, "root", "");
        stm = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        
        String select = 
                "SELECT cur.\"nome_curso\", dis.NOMEDISCIPLINA FROM APP.\"tb_curso_disciplina\" "
                + "cd INNER JOIN APP.\"tb_cursos\" cur ON cd.IDCURSO = cur.\"idCurso\""
                + "INNER JOIN APP.\"tb_disciplinas\" dis ON dis.IDDISCIPLICA = cd.IDDISCIPLINA ORDER BY cur.\"nome_curso\"";

        ResultSet resultados = stm.executeQuery(select);

        while (resultados.next()) {
            CursoDisciplina cd = new CursoDisciplina();
            cd.setNomeCurso(resultados.getString("nome_curso"));
            cd.setNomeDisciplina(resultados.getString("NOMEDISCIPLINA"));

            cursos.add(cd);
        }
        conn.close();
        return cursos;
    }
}
