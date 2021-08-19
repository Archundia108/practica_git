package prestacion_servicio.academicos.dual;
import comun.BD;
import java.sql.*;

public class Dual_empresas {
   BD SMBD;
   ResultSet rs;
   public int cve_competencia, cve_empresa; 
   public String consultas, error;
   public boolean existe;
   
   public Dual_empresas () throws Exception
    {
        SMBD = new BD();
        cve_competencia = 0; cve_empresa = 0;
        consultas = ""; error = "";
        existe = false;
    }
   
   
    public boolean existe_empresa () throws Exception
    {
        consultas = "SELECT emp.nombre, emp.giro_empresa "
                  + "FROM dual_empresas pe "
                  + "INNER JOIN direc_empresas emp ON emp.cve_empresa = pe.cve_empresa "
                  + "INNER JOIN dual_competencias pl ON pl.cve_competencia = pe.cve_competencia "
                  + "WHERE pl.cve_competencia = "+cve_competencia+" AND pe.cve_empresa = "+cve_empresa+"";
        rs = SMBD.SQLBD(consultas);
        if (rs.next())
        {
            existe = true;
        }
        SMBD.desconectarBD();
        return existe;
    }
    
    public void registrar_empresa () throws Exception
    {
        if (existe_empresa())
        {
            error = "Este registro ya existe";
        }
        else
        {
            consultas = "INSERT INTO dual_empresas (cve_competencia, cve_empresa) "
                      + "VALUES ("+cve_competencia+", "+cve_empresa+")";
            if (SMBD.insertarSQL(consultas) != 0)
            {
                error = "Empresa registrada correctamente";
            }
            else
            {
                error = "No se registró el puesto";
            }
        }
    }
    
    public void eliminar_empresa () throws Exception
    {
        consultas = "DELETE FROM dual_empresas "
                  + "WHERE cve_competencia = "+cve_competencia+" AND cve_empresa = "+cve_empresa+"";
        if (SMBD.insertarSQL(consultas) != 0)
        {
            error = "Empresa eliminada correctamente";
        }
        else
        {
            error = "La empresa no se eliminó";
        }
    }
    
    public static void main (String[]args) throws Exception
    {
        System.out.println("Gabriel 09/08/2021 Cambio de variables de cve_puesto_aprendizaje a cve_convocatoria");
    }
}
