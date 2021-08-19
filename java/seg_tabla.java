/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prestacion_servicio.academicos.dual;
import comun.BD;
import java.sql.ResultSet;

/**
 *
 * @author TOSHIBA
 */
public class seg_tabla {
    BD SMBD;
    ResultSet RS;
    public int calif_exa_conoc,cve_competencia,cve_alumno,cve_periodo,expediente,cuatrimestre,cve_asesor_dual_utsjr;
    public String obser_exa_conoc,nombre,consultas,nombre_asesor_dual_utsjr,error, fecha_exa_conoc;
    
    public seg_tabla()throws Exception
    {
       SMBD=new BD();
       expediente=0;calif_exa_conoc=0;cuatrimestre=0;cve_asesor_dual_utsjr=0;nombre_asesor_dual_utsjr="";
       nombre="";consultas="";obser_exa_conoc=""; cve_competencia=0;cve_alumno=0;cve_periodo=0;error="";
       fecha_exa_conoc="";    
    }
    
     public void FFechaAsignacion() throws Exception
   {
          consultas="UPDATE dual_alumnos " +
                    "SET fecha_exa_conoc=getdate() " +
                    "WHERE(cve_alumno="+cve_alumno+")AND(cve_periodo="+cve_periodo+")AND(cve_competencia="+cve_competencia+")";
          SMBD.insertarSQL(consultas);
          error="Registro exitoso";        
    }
    
    public void FAsignarCalifConoc() throws Exception
    {
        consultas="UPDATE dual_alumnos " +
                  "SET calif_exa_conoc="+calif_exa_conoc+",obser_exa_conoc='"+obser_exa_conoc+"',fecha_exa_conoc=GETDATE() " +
                  "WHERE (cve_alumno="+cve_alumno+") and (cve_periodo="+cve_periodo+") and (cve_competencia="+cve_competencia+")";
        System.out.println(fecha_exa_conoc);
        System.out.println(obser_exa_conoc);
        if(SMBD.insertarSQL(consultas)!=0)
       {
           error="Asignacion de calificación insertada correctamente";
       }
       else
       {
           error="Asignacion de Calificación no se ha realizado";
       }
       System.out.println(error);
    }
    
    public void FBuscarCalif() throws Exception 
    {
        consultas="SELECT calif_exa_conoc AS maximo " +
                  "FROM dual_alumnos " +
                  "WHERE (cve_alumno="+cve_alumno+") and (cve_periodo="+cve_periodo+") and (cve_competencia="+cve_competencia+")";
        calif_exa_conoc=SMBD.buscaSQL(consultas);
        if(calif_exa_conoc!=0)
        {
            consultas="SELECT calif_exa_conoc,obser_exa_conoc,convert(varchar,fecha_exa_conoc,103) AS fecha "+
                      "FROM dual_alumnos "+
                      "WHERE cve_alumno="+cve_alumno+"";
            RS=SMBD.SQLBD(consultas);
            while(RS.next())
            {
            calif_exa_conoc=RS.getInt(1);
            obser_exa_conoc=RS.getString(2);
            fecha_exa_conoc=RS.getString(3);
            }
        System.out.println(calif_exa_conoc);
        System.out.println(obser_exa_conoc);
        System.out.println(fecha_exa_conoc);
        }
        SMBD.desconectarBD();
    }
    
    public static void main(String[] args) throws Exception {
         seg_tabla ebd=new seg_tabla();
        System.out.println("Egan Alexis Dueñas Martínez 22/07/21: funcion para asignar calificacion de conocimientos");
        
        ebd.cve_alumno=38708;
        ebd.cve_periodo=70;
        ebd.cve_competencia=1;
        ebd.obser_exa_conoc="Excelente";
        ebd.calif_exa_conoc=8; 
        ebd.FFechaAsignacion();
        System.out.println(ebd.error);
        //ebd.FAsignarCalifConoc();
        //ebd.FBuscarCalif();
    }
}
