package prestacion_servicio.academicos.dual;
import comun.BD;
import java.sql.*;

public class Dual_competencias {
    BD SMBD;
    ResultSet rs;
    public int cve_competencia, cve_carrera;
    public String consultas, error, nombre_competencia, fecha;
    
    public Dual_competencias () throws Exception
    {
        SMBD = new BD();
        cve_competencia = 0; cve_carrera = 0;
        consultas = ""; error = ""; nombre_competencia = ""; fecha = "";
    }
    
    public void consultar_competencia () throws Exception
    {
        consultas = "SELECT cve_competencia, nombre_competencia, fecha, cve_carrera " 
                  + "FROM dual_competencias " 
                  + "WHERE cve_competencia = "+cve_competencia+"";
        rs = SMBD.SQLBD(consultas);
        while (rs.next())
        {
            cve_competencia = rs.getInt(1);
            nombre_competencia = rs.getString(2);
            fecha = rs.getString(3);
            cve_carrera = rs.getInt(4);
        }
        SMBD.desconectarBD();
    }
    
    public void registrar_competencia () throws Exception
    {
        consultas = "SELECT MAX (cve_competencia) AS maximo "
                  + "FROM dual_competencias";
        cve_competencia = SMBD.buscaSQL(consultas) + 1;
        
        consultas = "INSERT INTO dual_competencias (cve_competencia, nombre_competencia, fecha, cve_carrera) "
                  + "VALUES ("+cve_competencia+", '"+nombre_competencia+"', GETDATE(), "+cve_carrera+")";
        if (SMBD.insertarSQL(consultas) != 0)
        {
            error = "Competencia insertada correctamente";
        }
        else
        {
            error = "No se insertó la competencia";
        }
    }   
    
    public void actualizar_competencia (int cve_competencia) throws Exception
    {
        consultas = "UPDATE dual_competencias "
                  + "SET nombre_competencia = '"+nombre_competencia+"', fecha = GETDATE(), cve_carrera = "+cve_carrera+" "
                  + "WHERE (cve_competencia = "+cve_competencia+")";
        if (SMBD.insertarSQL(consultas) != 0)
        {
            error = "Competencia modificada correctamente";
        }
        else
        {
            error = "No se modificó la competencia";
        }
    }
    
    public static void main (String[]args) throws Exception
    {
        System.out.println("Gabriel 06/08/2021 Actualización a la tabla. Cambio a dual_competencias");
    }
}