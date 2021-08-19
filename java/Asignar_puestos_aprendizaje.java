package prestacion_servicio.academicos.dual;
import comun.BD;
import java.sql.*;

public class Asignar_puestos_aprendizaje 
{
    BD SMBD;
    ResultSet rs;
    public String consultas, error;
    public int cve_alummo, cve_competencia, cve_puesto_aprendizaje, orden;
    public boolean asignado = false;
        
    public Asignar_puestos_aprendizaje() throws Exception
    {
        SMBD = new BD();
        consultas = ""; error = "";
        cve_alummo = 0; cve_competencia = 0; cve_puesto_aprendizaje = 0; orden = 0;
    }
    
    public int buscar_puesto() throws Exception
    {
        orden = 0;
        consultas = "SELECT orden "
                  + "FROM dual_alumnos_puestos "
                  + "WHERE cve_puesto_aprendizaje = "+cve_puesto_aprendizaje+" AND cve_alumno = "+cve_alummo+" ";
        rs = SMBD.SQLBD(consultas);
        while (rs.next())
        {
            orden = rs.getInt(1);                
        }
        SMBD.desconectarBD();
        return orden;
    }
    
    public boolean existe_puesto() throws Exception
    {
        consultas = "SELECT cve_puesto_aprendizaje "
                  + "FROM dual_alumnos_puestos "
                  + "WHERE cve_alumno = "+cve_alummo+" AND cve_competencia = "+cve_competencia+" AND orden = "+orden+"";
        rs = SMBD.SQLBD(consultas);
        if (rs.next())
        {
            asignado = true;
        }
        return asignado;
    }
    
    public void guardar_puesto() throws Exception
    {
        if (existe_puesto())
        {
            error = "Este lugar ya está asignado";
        }
        else
        {
            consultas = "INSERT INTO dual_alumnos_puestos (cve_competencia, cve_puesto_aprendizaje, cve_alumno, orden) "
                      + "VALUES ("+cve_competencia+", "+cve_puesto_aprendizaje+", "+cve_alummo+", "+orden+")";
            if(SMBD.insertarSQL(consultas) != 0)
            {
                error = "Lugar guardado correctamente";
            }
            else
            {
                error = "El lugar no se guardó";
            }
        }
        
    }
    
    public void quitar_puesto() throws Exception
    {
        consultas = "DELETE dual_alumnos_puestos "
                  + "WHERE cve_puesto_aprendizaje = "+cve_puesto_aprendizaje+" AND cve_alumno = "+cve_alummo+" AND cve_competencia = "+cve_competencia+" ";
        if (SMBD.insertarSQL(consultas) != 0)
        {
            error = "Se quitó el lugar correctamente";
        }
        else
        {
            error = "No se quitó el lugar o no se registró";
        }
    }
    
    public static void main(String[]args) throws Exception
    {
        System.out.println("Gabriel 13/08/2021 Creación del método buscar_puesto() y quitar_puesto()");
    }
}
