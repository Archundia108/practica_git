
package prestacion_servicio.academicos.dual;
import comun.BD;
import java.sql.*;

public class registro_pedagogico 
{
    BD SMBD;
    ResultSet RS;
    public String consultas,error,nombre,apellido_mat,apellido_pat,expediente,fecha_exa_psico,obser_exa_psico ;
    public int cve_alumno,cve_persona,cve_periodo,cve_competencia,calif_exa_psico; 
    
   public registro_pedagogico()throws Exception
   {
       SMBD=new BD();
       consultas=""; error="";nombre="";apellido_mat="";apellido_pat="";expediente="";fecha_exa_psico="";obser_exa_psico=""; 
       cve_alumno=0; cve_persona=0; cve_periodo=0;cve_competencia=0;calif_exa_psico=0;
   }
    
   public void FFechaAsignacion() throws Exception
   {
          consultas="update dual_alumnos " +
                    "set fecha_exa_psico=getdate() " +
                    "where(cve_alumno="+cve_alumno+")AND(cve_periodo="+cve_periodo+")AND(cve_competencia="+cve_competencia+")";
          SMBD.insertarSQL(consultas);
          error="Registro exitoso";        
    }
  
   
   
   public void bucarCalif()throws Exception
    {
      consultas="SELECT calif_exa_psico AS maximo " +
                "FROM dual_alumnos " +
                "WHERE (cve_alumno="+cve_alumno+") AND (cve_periodo="+cve_periodo+") AND (cve_competencia="+cve_competencia+")";
      
      calif_exa_psico=SMBD.buscaSQL(consultas);
 
        if(calif_exa_psico!=0)
        {
            consultas="SELECT calif_exa_psico, obser_exa_psico,convert(varchar,fecha_exa_psico,103) AS fecha "+
                      "FROM dual_alumnos "+ 
                      "WHERE cve_alumno="+cve_alumno+"";
            RS=SMBD.SQLBD(consultas);
            
            while(RS.next())
            {
            calif_exa_psico=RS.getInt(1);
            obser_exa_psico=RS.getString(2);
            fecha_exa_psico=RS.getString(3);
            }
            System.out.println(calif_exa_psico);
            System.out.println(obser_exa_psico);
            System.out.println(fecha_exa_psico);
        }
        SMBD.desconectarBD();
    }
   
   public void FAsignarCalif()throws Exception
   {
       consultas="UPDATE dual_alumnos " +
                 "SET calif_exa_psico="+calif_exa_psico+",obser_exa_psico='"+obser_exa_psico+"',fecha_exa_psico=GETDATE()  " +
                 "WHERE (cve_alumno="+cve_alumno+") AND (cve_periodo="+cve_periodo+") AND (cve_competencia="+cve_competencia+")";
        System.out.println(fecha_exa_psico);
        System.out.println(obser_exa_psico);
        System.out.println(calif_exa_psico);
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
    
    public static void main(String[] args) throws Exception
    {
        registro_pedagogico ebd=new registro_pedagogico();
        System.out.println("Egan Alexis Dueñas Martínez 06/07/21: Función para Asignar calificaciones de examen psicopedagógico");
        ebd.cve_alumno=26423;
        ebd.cve_periodo=69;
        ebd.cve_competencia=1;
        ebd.obser_exa_psico="Excelente";
        ebd.calif_exa_psico=8;
        //ebd.cve_alumno=9574;
        ebd.FAsignarCalif();
       //ebd.bucarCalif();
       //ebd.FFechaAsignacion();
        System.out.println(ebd.error);
        //System.out.println(ebd.calif_exa_psico);
        //System.out.println("El alumno es: "+ebd.nombre+ebd.apellido_pat+ebd.apellido_mat+ebd.expediente);
    }
}
