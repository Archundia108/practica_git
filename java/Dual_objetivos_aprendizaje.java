package prestacion_servicio.academicos.dual;
import comun.BD;
import java.sql.*;

public class Dual_objetivos_aprendizaje 
{
    BD SMBD;
    ResultSet rs;
    public int numero, cve_puesto_aprendizaje, anio;
    public String consultas, error, objetivo, resultado;
    
    public Dual_objetivos_aprendizaje () throws Exception 
    {
        SMBD = new BD();
        numero = 0; cve_puesto_aprendizaje = 0; anio = 0;
        consultas = ""; error = ""; objetivo = ""; resultado = "";
    }
    
    public void consultar_objetivo_aprendizaje () throws Exception
    {
        consultas = "SELECT numero, objetivo, resultado, cve_puesto_aprendizaje, anio "
                  + "FROM dual_objetivos_aprendizaje "
                  + "WHERE (numero = "+numero+")";
        rs = SMBD.SQLBD(consultas);
        while (rs.next())
        {
            numero = rs.getInt(1);
            objetivo = rs.getString(2);
            resultado = rs.getString(3);
            cve_puesto_aprendizaje = rs.getInt(4);
            anio = rs.getInt(5);
        }
        SMBD.desconectarBD();
    }
    
    public void registrar_objetivo_aprendizaje () throws Exception
    {
        consultas = "SELECT MAX(numero) AS maximo "
                  + "FROM dual_objetivos_aprendizaje";
        numero = SMBD.buscaSQL(consultas) + 1;
        
        consultas = "INSERT INTO dual_objetivos_aprendizaje (numero, objetivo, resultado, cve_puesto_aprendizaje, anio) "
                  + "VALUES ("+numero+",'"+objetivo+"', '"+resultado+"', "+cve_puesto_aprendizaje+", "+anio+")";
        if(SMBD.insertarSQL(consultas) != 0)
        {
            error = "Objetivo insertado correctamente";
        }
        else
        {
            error = "El objetivo no se registró";
        }
    }
    
    public void actualizar_objetivo_aprendizaje (int numero) throws Exception
    {
        consultas = "UPDATE dual_objetivos_aprendizaje "
                  + "SET objetivo = '"+objetivo+"', resultado = '"+resultado+"', "
                  +     "cve_puesto_aprendizaje = "+cve_puesto_aprendizaje+", anio = "+anio+" "
                  + "WHERE (numero = "+numero+")";
        if (SMBD.insertarSQL(consultas) != 0)
        {
            error = "Objetivo actualizado correctamente";
        }
        else
        {
            error = "El objetivo no se actualizó";
        }
    }
    
    public static void main (String[]args) throws Exception
    {
        System.out.println("Gabriel 06/08/2021 Corrección de nombres de la tabla dual_objetivos_aprendizaje");
    }
}