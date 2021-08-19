package prestacion_servicio.academicos.dual;
import comun.BD;
import java.sql.*;


public class revision_propuestos {
    BD SMBD;
    ResultSet rs;
    public int l,m,i,j,v,cve_institucion;
    public int cve_competencia,cve_alumno,cve_periodo,expediente,cuatrimestre,cve_asesor_dual_utsjr,cve_puesto_aprendizaje;
    public String nombre,consultas,nombre_asesor_dual_utsjr,error, fecha_notif_asesor_dual;
    //private int cve_asesor_dual;
    
    public revision_propuestos()throws Exception
    {
       SMBD=new BD();
       expediente=0;cuatrimestre=0;cve_asesor_dual_utsjr=0;nombre_asesor_dual_utsjr="";
       nombre="";consultas=""; cve_competencia=0;cve_alumno=0;cve_periodo=0;error="";
       fecha_notif_asesor_dual="";cve_puesto_aprendizaje=0;l=0;m=0;i=0;j=0;v=0;cve_institucion=0;    
    }
    
    public void FFechaNotificacion() throws Exception
    {
        consultas="SELECT cve_asesor_dual_utsjr AS maximo " +
                  "FROM dual_alumnos " +
                  "WHERE (cve_periodo="+cve_periodo+" AND cve_alumno="+cve_alumno+" AND "
                + "cve_competencia="+cve_competencia+")";
        cve_asesor_dual_utsjr=SMBD.buscaSQL(consultas);
        if(cve_asesor_dual_utsjr!=0)
        {
        consultas="UPDATE dual_alumnos " +
                  "SET fecha_notif_asesor_dual=getdate() " +
                  "WHERE(cve_alumno="+cve_alumno+" and cve_periodo="+cve_periodo+" and cve_competencia="+cve_competencia+")";
        SMBD.insertarSQL(consultas);
        error="Notificacion exitosa";        
        }
        else
        {
            error="Para notificar es necesario seleccionar un asesor.";
        }
            
    }
    
    
    public void FAsignar_asesor_dual() throws Exception
    {
        consultas="UPDATE dual_alumnos " +
                  "SET cve_asesor_dual_utsjr="+cve_asesor_dual_utsjr+" " +
                  "WHERE (cve_alumno="+cve_alumno+" AND cve_periodo="+cve_periodo+" AND cve_competencia="+cve_competencia+")";
        //System.out.println(consultas);
        if (SMBD.insertarSQL(consultas)!=0)
        {
          error="Asignacion de docente dual insertada correctamente";
          
        }
        else
        {
          error="Asignacion de docente dual no se ha realizado";
        }
        consultas="SELECT cve_alumno as maximo "
                    +"FROM dual_dias "
                  + "WHERE (cve_alumno="+cve_alumno+")AND(cve_competencia="+cve_competencia+")AND"
                  + "(cve_periodo="+cve_periodo+")";
          
          //SMBD.buscaSQL(consultas);
          if (SMBD.buscaSQL(consultas)==0) 
          {
           consultas="INSERT INTO dual_dias (cve_competencia,cve_alumno, "
                   + "cve_periodo,L,M,I,J,V) " +
                     "VALUES ("+cve_competencia+","+cve_alumno+","+cve_periodo+",0,0,0,0,0)"; 
           //System.out.println(cve_competencia+" "+cve_alumno+" "+cve_periodo+" "+cve_puesto_aprendizaje);
               System.out.println(consultas);
              SMBD.insertarSQL(consultas);
          }
          
       consultas="SELECT cve_alumno as maximo "
                +"FROM dual_semanas "
                +"WHERE (cve_alumno="+cve_alumno+")AND(cve_competencia="+cve_competencia+")AND"
                +"(cve_periodo="+cve_periodo+") AND (cve_institucion="+cve_institucion+")";
       
                 if (SMBD.buscaSQL(consultas)==0) 
          {
            consultas="INSERT INTO dual_semanas (cve_institucion,cve_competencia,cve_alumno,cve_periodo,semana_1,semana_2, " +
"                      semana_3,semana_4,semana_5,semana_6,semana_7,semana_8,semana_9,semana_10,semana_11,"
                    + "semana_12,semana_13,semana_14,semana_15,semana_16) "
                    + "VALUES (1,"+cve_competencia+","+cve_alumno+","+cve_periodo+",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)"; 
            System.out.println(consultas);  
            SMBD.insertarSQL(consultas);
            
            consultas="INSERT INTO dual_semanas (cve_institucion,cve_competencia,cve_alumno,cve_periodo,semana_1,semana_2, " +
"                      semana_3,semana_4,semana_5,semana_6,semana_7,semana_8,semana_9,semana_10,semana_11,"
                    + "semana_12,semana_13,semana_14,semana_15,semana_16) "
                    + "VALUES (2,"+cve_competencia+","+cve_alumno+","+cve_periodo+",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)"; 
            System.out.println(consultas);  
            SMBD.insertarSQL(consultas);
            
          }
                 
       consultas="SELECT cve_alumno as maximo "
                    +"FROM dual_meses "
                  + "WHERE (cve_alumno="+cve_alumno+")AND(cve_competencia="+cve_competencia+")AND"
                  + "(cve_periodo="+cve_periodo+")";
       if (SMBD.buscaSQL(consultas)==0) {
            consultas="INSERT INTO dual_meses "
                    + "VALUES ("+cve_competencia+","+cve_alumno+","+cve_periodo+",0,0,0,0)";
            System.out.println(consultas);
            SMBD.insertarSQL(consultas);
        }
         
    }
    
    public void FBuscar_asesor_dual_utsjr() throws Exception
    {
        consultas="SELECT cve_asesor_dual_utsjr AS maximo " +
                  "FROM dual_alumnos " +
                  "WHERE (cve_periodo="+cve_periodo+" AND cve_alumno="+cve_alumno+" AND "
                + "cve_competencia="+cve_competencia+")";
        
        cve_asesor_dual_utsjr = SMBD.buscaSQL(consultas);
        nombre_asesor_dual_utsjr="";
        //System.out.println(consultas);
        //System.out.println(": "+cve_periodo+" "+cve_alumno+" "+cve_competencia);
        if(cve_asesor_dual_utsjr!=0)
        {
            consultas="SELECT nombre,apellido_pat,apellido_mat " +
                      "FROM personas " +
                      "WHERE cve_persona = "+cve_asesor_dual_utsjr+"";
            
            rs=SMBD.SQLBD(consultas);
            
            while(rs.next())
            {
                nombre_asesor_dual_utsjr=rs.getString(1)+" "+rs.getString(2)+" "+rs.getString(3);
            }
          SMBD.desconectarBD();
        }
        //System.out.println("asesor: "+nombre_asesor_dual_utsjr);
       //System.out.println(cve_asesor_dual_utsjr);
    }
    
    
    
    public static void main(String[] args) throws Exception {
        revision_propuestos ebd=new revision_propuestos();
        System.out.println("Egan Alexis Dueñas Martínez 06/07/21: Método que asigna el asesor dual e inicializa las tablas del calendario");
        
        ebd.cve_institucion=1;
        ebd.cve_alumno=34395;
        ebd.cve_periodo=69;
        ebd.cve_puesto_aprendizaje=1;
        ebd.cve_competencia=1;
        ebd.cve_asesor_dual_utsjr=79;
        //ebd.FBuscar_asesor_dual_utsjr();
        ebd.FAsignar_asesor_dual();
        //ebd.FFechaNotificacion();
        System.out.println(ebd.error);
        
    }
        
}


//cve_alumno	cve_competencia	cve_periodo	cve_tutor	cve_asesor_dual_utsjr
    //38889         1                       68              28          8188