package prestacion_servicio.academicos.dual;
import comun.BD;
import java.sql.*;

public class Dual_puestos_aprendizaje {
    BD SMBD;
    ResultSet rs;
    public int cve_puesto_aprendizaje, anio, vigente, cve_competencia;
    public String consultas, error, nombre_puesto_aprendizaje, objetivo_gral, requerimientos_gral, 
                  con_teoricos, con_procedimentales, con_actitudinales, actvd_desarrollo, fecha;
    
    public Dual_puestos_aprendizaje () throws Exception
    {
        SMBD = new BD();
        cve_puesto_aprendizaje = 0; anio = 0; vigente = 0; cve_competencia = 0;
        consultas = ""; error = ""; nombre_puesto_aprendizaje = ""; objetivo_gral = ""; requerimientos_gral = "";
        con_teoricos = ""; con_procedimentales = ""; con_actitudinales = ""; actvd_desarrollo = ""; fecha = "";
    }
    
    public void consultar_puesto_aprendizaje () throws Exception
    {
        consultas = "SELECT pu.cve_puesto_aprendizaje, pu.anio, pl.cve_competencia, pu.nombre_puesto_aprendizaje, "
                  +        "pu.objetivo_gral, pu.requerimientos_gral, pu.con_teoricos, pu.con_procedimentales, "
                  +        "pu.con_actitudinales, pu.actvd_desarrollo, pu.vigente "
                  + "FROM dual_puestos_aprendizaje pu "
                  + "INNER JOIN dual_competencias pl ON pu.cve_competencia = pl.cve_competencia "
                  + "INNER JOIN carreras_universidad c ON pl.cve_carrera = c.cve_carrera "
                  + "WHERE (cve_puesto_aprendizaje = "+cve_puesto_aprendizaje+")";
        rs = SMBD.SQLBD(consultas);
        while (rs.next())
        {
            cve_puesto_aprendizaje = rs.getInt(1);
            anio = rs.getInt(2);
            cve_competencia = rs.getInt(3);
            nombre_puesto_aprendizaje = rs.getString(4);
            objetivo_gral = rs.getString(5);
            requerimientos_gral = rs.getString(6);
            con_teoricos = rs.getString(7);
            con_procedimentales = rs.getString(8);
            con_actitudinales = rs.getString(9);
            actvd_desarrollo = rs.getString(10);
            vigente = rs.getInt(11);
        }
        SMBD.desconectarBD();
    }
    
    public void registrar_puesto_aprendizaje () throws Exception
    {
        consultas = "SELECT MAX (cve_puesto_aprendizaje) AS maximo "
                  + "FROM dual_puestos_aprendizaje "
                  + "WHERE (DATEPART(YY,GETDATE())) = anio";
        cve_puesto_aprendizaje = SMBD.buscaSQL(consultas) + 1;
        
        consultas = "INSERT INTO dual_puestos_aprendizaje (cve_puesto_aprendizaje, anio, nombre_puesto_aprendizaje, "
                  +             "objetivo_gral, requerimientos_gral, con_teoricos, con_procedimentales, "
                  +             "con_actitudinales, actvd_desarrollo, fecha, vigente, cve_competencia) "
                  + "VALUES ("+cve_puesto_aprendizaje+", (DATEPART(YY,GETDATE())), '"+nombre_puesto_aprendizaje+"', "
                  +         "'"+objetivo_gral+"', '"+requerimientos_gral+"', '"+con_teoricos+"', "
                  +         "'"+con_procedimentales+"', '"+con_actitudinales+"', '"+actvd_desarrollo+"', "
                  +         "GETDATE(), "+vigente+", "+cve_competencia+")";
        if (SMBD.insertarSQL(consultas) != 0)
        {
            error = "Puesto registrado correctamente";
        }
        else
        {
            error = "No se registró el puesto";
        }
    }
    
    public void actualizar_puesto_aprendizaje (int cve_puesto_aprendizaje) throws Exception
    {
        consultas = "UPDATE dual_puestos_aprendizaje "
                  + "SET anio = (DATEPART(YY,GETDATE())), nombre_puesto_aprendizaje = '"+nombre_puesto_aprendizaje+"', "
                  +     "objetivo_gral = '"+objetivo_gral+"', requerimientos_gral = '"+requerimientos_gral+"', "
                  +     "con_teoricos = '"+con_teoricos+"', con_procedimentales = '"+con_procedimentales+"', "
                  +     "con_actitudinales = '"+con_actitudinales+"', actvd_desarrollo = '"+actvd_desarrollo+"', "
                  +     "fecha = GETDATE(), vigente = "+vigente+", cve_competencia  = "+cve_competencia+" " 
                  + "WHERE (cve_puesto_aprendizaje = "+cve_puesto_aprendizaje+")";
        if (SMBD.insertarSQL(consultas) != 0)
        {
            error = "Puesto modificado correctamente";
        }
        else
        {
            error = "El puesto no se modificó";
        }
    }
    
    public void duplicar_puesto_aprendizaje (int cve_puesto_aprendizaje) throws Exception
    {
        consultas = "SELECT pu.anio, pl.cve_competencia, pu.nombre_puesto_aprendizaje, "
                  +        "pu.objetivo_gral, pu.requerimientos_gral, pu.con_teoricos, pu.con_procedimentales, "
                  +        "pu.con_actitudinales, pu.actvd_desarrollo, pu.vigente "
                  + "FROM dual_puestos_aprendizaje pu "
                  + "INNER JOIN dual_competencias pl ON pu.cve_competencia = pl.cve_competencia "
                  + "INNER JOIN carreras_universidad c ON pl.cve_carrera = c.cve_carrera "
                  + "WHERE (cve_puesto_aprendizaje = "+cve_puesto_aprendizaje+")";
        rs = SMBD.SQLBD(consultas);
        while (rs.next())
            {
                anio = rs.getInt(1);
                cve_competencia = rs.getInt(2);
                nombre_puesto_aprendizaje = rs.getString(3);
                objetivo_gral = rs.getString(4);
                requerimientos_gral = rs.getString(5);
                con_teoricos = rs.getString(6);
                con_procedimentales = rs.getString(7);
                con_actitudinales = rs.getString(8);
                actvd_desarrollo = rs.getString(9);
                vigente = rs.getInt(10);
            }
        registrar_puesto_aprendizaje();
        SMBD.desconectarBD();
    }
    
    public static void main (String[]args) throws Exception
    {
        System.out.println("Gabriel 06/08/2021 Acomodo de las variables a la tabla de dual_puestos_aprendizaje");
    }
}
