package prestacion_servicio.academicos.dual;
import comun.BD;
import java.sql.*;

public class Dual_convocatorias 
{
    BD SMBD;
    ResultSet rs;
    public int cve_convocatoria, cve_competencia, vigente;
    public String consultas, error, fecha_inicio, fecha_termino, descripcion;
    
    public Dual_convocatorias () throws Exception
    {
        SMBD = new BD();
        cve_convocatoria = 0; cve_competencia = 0; vigente = 0;
        consultas = ""; error  = ""; fecha_inicio = ""; fecha_termino = ""; descripcion = "";
    }
    
     public void consultar_convocatoria () throws Exception
    {
        consultas = "SELECT cve_convocatoria, fecha_inicio, fecha_termino, descripcion, vigente, cve_competencia "
                  + "FROM dual_convocatorias "
                  + "WHERE cve_convocatoria = "+cve_convocatoria+"";
        rs = SMBD.SQLBD(consultas);
        while (rs.next())
        {
            cve_convocatoria = rs.getInt(1);
            fecha_inicio = rs.getString(2);
            fecha_termino = rs.getString(3);
            descripcion = rs.getString(4);
            vigente = rs.getInt(5);
            cve_competencia = rs.getInt(6);
        }
        SMBD.desconectarBD();
    }
    
    public void registra_convocatoria () throws Exception
    {
        consultas = "SELECT MAX(cve_convocatoria) AS maximo "
                  + "FROM dual_convocatorias";
        cve_convocatoria = SMBD.buscaSQL(consultas) + 1;
        
        consultas = "INSERT INTO dual_convocatorias (cve_convocatoria, fecha_inicio, "
                  +             "fecha_termino, descripcion, vigente, cve_competencia) "
                  + "VALUES ("+cve_convocatoria+", "+SMBD.fecha_convertida(fecha_inicio)+", "+SMBD.fecha_convertida(fecha_termino)+", "
                  +         "'"+descripcion+"', "+vigente+","+cve_competencia+")";
        if (SMBD.insertarSQL(consultas) != 0)
        {
            error = "Convocatoria registrada correctamente";
        }
        else
        {
            error = "No se registró la convocatoria";
        }
    }
    
    public void actualizar_convocatoria (int cve_convocatoria) throws Exception
    {
        consultas = "UPDATE dual_convocatorias "
                  + "SET fecha_inicio = '"+fecha_inicio+"', fecha_termino = '"+fecha_termino+"', "
                  +     "descripcion = '"+descripcion+"', vigente = "+vigente+", "
                  +     "cve_competencia = "+cve_competencia+" "
                  + "WHERE cve_convocatoria = "+cve_convocatoria+"";
        if (SMBD.insertarSQL(consultas) != 0)
        {
            error = "Convocatoria modificada correctamente";
        }
        else
        {
            error = "La convocatoria no se modificó";
        }
    }
    
    public void notificar (int cve_convocatoria) throws Exception
    {
        consultas = "UPDATE dual_convocatorias "
                  + "SET fecha_notificacion = GETDATE() "
                  + "WHERE cve_convocatoria = "+cve_convocatoria+"";
        if (SMBD.insertarSQL(consultas) != 0)
        {
            error = "Tutores notificados";
        }
        else
        {
            error = "No se notificó a los tutores";
        }
    }
    
    public void actualizar_vigencia (int cve_convocatoria) throws Exception
    {
        consultas = "UPDATE dual_convocatorias "
                  + "SET vigente = 0 "
                  + "WHERE cve_convocatoria = "+cve_convocatoria+"";
        SMBD.insertarSQL(consultas);
    }
    
    public static void main (String[]args) throws Exception
    {
        System.out.println("Gabriel 10/08/2021 Adición del método actualizar_vigencia");
    }
}