package prestacion_servicio.academicos.dual;
import comun.BD;
import java.sql.*;

public class Dual_alumnos 
{
    BD SMBD;
    ResultSet rs;
    public String consultas, error, exp_alumno;						  
    public int cve_convocatoria, cve_tutor, cve_alumno;
    public boolean existe;
    
    public Dual_alumnos() throws Exception
    {
        SMBD = new BD();
        consultas = ""; error = ""; exp_alumno = ""; 
        cve_convocatoria = 0; cve_tutor = 0; cve_alumno = 0;
        existe = false;
    }
    
    public boolean existe_alumno_propuesto() throws Exception
    {
        consultas = "SELECT dal.cve_alumno "
                  + "FROM dual_alumnos dal "
                  + "INNER JOIN alumnos al ON al.cve_alumno = dal.cve_alumno "
                  + "WHERE al.expediente = '"+exp_alumno+"' ";
        rs = SMBD.SQLBD(consultas);
        if(rs.next())
        {
            existe = true;
        }
        SMBD.desconectarBD();
        return existe;
    }
    
    public void registrar_alumno_propuesto() throws Exception
    {
        if (existe_alumno_propuesto())
        {
            error = "Este alumno ya está registrado";
        }
        else
        {
            consultas = "INSERT INTO dual_alumnos (cve_alumno, cve_convocatoria, cve_periodo, cve_competencia, cve_empresa, horario, cve_tutor, "
                      +                           "cve_asesor_dual_utsjr, nom_inst_empresa, ape_pat_inst_empresa, ape_mat_inst_empresa, "
                      +                           "tel_inst_empresa, correo_inst_empresa, fecha_exa_conoc, calif_exa_conoc, obser_exa_conoc, "
                      +                           "fecha_exa_psico, calif_exa_psico, obser_exa_psico, fecha_tutor_notif, fecha_notif_asesor_dual, nom_plan_rotacion) "
                      + "VALUES ("
                      +         "("
                      +          "SELECT cve_alumno "
                      +          "FROM alumnos "
                      +          "WHERE (expediente like '"+exp_alumno+"') "
                      +         "), "
                      +         ""+cve_convocatoria+", "
                      +           "("
                      +           "SELECT DISTINCT p.cve_periodo "
                      +           "FROM periodos p "
                      +           "INNER JOIN grupos g ON p.cve_periodo = g.cve_periodo "
                      +           "WHERE  (g.cve_maestro = "+cve_tutor+") and (p.activo = 1) "
                      +          "), " 
                      +          "("
                      +           "SELECT com.cve_competencia "
                      +           "FROM dual_competencias com "
                      +           "INNER JOIN dual_convocatorias con ON con.cve_competencia = com.cve_competencia "
                      +           "WHERE (con.cve_convocatoria = "+cve_convocatoria+")"
                      +          "), 0, '', "+cve_tutor+", 0, '', '', '', 0, '', null, 0, '', null, 0, '', null, null, null "
                      +        ")";
            if (SMBD.insertarSQL(consultas) != 0)
            {
                error = "Alumno registrado correctamente";
            }
            else
            {
                error = "No se registró el alumno";
            }
        }
    }
    
    public void eliminar_alumno_propuesto () throws Exception
    {
        consultas = "DELETE FROM dual_alumnos "
                  + "WHERE cve_alumno = "+cve_alumno+" ";
        if (SMBD.insertarSQL(consultas) != 0)
        {
            error = "Se eliminó el alumno correctamente";
        }
        else
        {
            error = "No se eliminó el alumno";
        }
    }
    
    public void notificar_alumno_propuesto () throws Exception
    {
        consultas = "UPDATE dual_alumnos "
                  + "SET fecha_tutor_notif = GETDATE() "
                  + "WHERE cve_alumno = "+cve_alumno+"";
        if (SMBD.insertarSQL(consultas) != 0)
        {
            error = "Alumno notificado";
        }
        else
        {
            error = "No se notificó al alumno";
        }
    }
    
    public static void main (String[]args) throws Exception
    {
        System.out.println("Gabriel 09/08/2021 Adición del método de notificar_alumno_propuesto");
    }
}
