/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prestacion_servicio.academicos.dual;
import comun.BD;
import java.sql.ResultSet;



public class seguimiento_a_dual {
    BD SMBD;
    ResultSet RS;
    public String error,consultas,nom_inst_empresa,ape_pat_inst_empresa;
    public String horario,ape_mat_inst_empresa,tel_inst_empresa,correo_inst_empresa,nom_plan_rotacion;
    public int cve_periodo,cve_alumno,cve_competencia,cve_empresa;
    public int l,m,i,j,v;
    public int mes_1,mes_2,mes_3,mes_4,cve_institucion;
    public int sem_,sem_UT;
    
    public seguimiento_a_dual() throws Exception
    {
     SMBD=new BD();
     consultas="";error="";nom_inst_empresa="";ape_pat_inst_empresa="";ape_mat_inst_empresa="";tel_inst_empresa="";correo_inst_empresa="";nom_plan_rotacion="";
     cve_periodo=0;cve_alumno=0;cve_competencia=0;cve_empresa=0;l=0;m=0;i=0;j=0;v=0;mes_1=0;mes_2=0;mes_3=0;mes_4=0;
     horario="";cve_institucion=0;sem_=0;sem_UT=0;
    }
    
    public void FGuardarDias()throws Exception
    {
        consultas="UPDATE dual_dias " +
                  "SET L="+l+", M="+m+", I="+i+", J="+j+", V="+v+" " +
                  "WHERE (cve_competencia="+cve_competencia+")AND(cve_alumno="+cve_alumno+")AND(cve_periodo="+cve_periodo+")";
        System.out.println(consultas);
        if(SMBD.insertarSQL(consultas)!=0){
            error="Los dias se garduaron correctamente";
        }
        else
        {
            error="No se pudieron guardar los dias";
        }
        System.out.println(error);
    }
    
    public void FGuardarMeses()throws Exception
    {
        consultas="UPDATE dual_meses " +
                  "SET mes_1="+mes_1+", mes_2="+mes_2+", mes_3="+mes_3+", mes_4="+mes_4+" " +
                  "WHERE (cve_alumno="+cve_alumno+") AND (cve_periodo="+cve_periodo+") AND (cve_competencia="+cve_competencia+")";
        System.out.println(consultas);
        if(SMBD.insertarSQL(consultas)!=0)
        {
            error="Los meses se guardaron correctamente";
        }
        else
        {
            error="No se pudieron guardar los meses";
        }
        System.out.println(error);
    }
    
    public void FGuardarSemanas()throws Exception
    {   
        consultas="UPDATE dual_semanas " +
                  "SET semana_1="+sem_+",semana_2="+sem_UT+" " +
                  " " +
                  "WHERE (cve_institucion="+cve_institucion+")AND(cve_competencia="+cve_competencia+") AND (cve_alumno="+cve_alumno+") AND (cve_periodo="+cve_periodo+")  ";
        if(SMBD.insertarSQL(consultas)!=0)
        {
            error="Las semanas se guardaron correctamente";
        }
        else
        {
            error="No se pudieron guardar las semanas";
        }
        System.out.println(error);
    }
    
    public void FGuardarHorario()throws Exception
    {
        consultas="UPDATE dual_alumnos " +
                  "SET horario='"+horario+"' " +
                  "where (cve_alumno="+cve_alumno+") AND (cve_competencia="+cve_competencia+") AND (cve_periodo="+cve_periodo+")";
        if(SMBD.insertarSQL(consultas)!=0)
        {
            error="El horario se guardó correctamente";
        }
        else
        {
            error="El horario no se pudo guardar correctamente";
        }
        System.out.println(error);
    }
    
    public void FGuardarDatos() throws Exception
    {
        consultas="UPDATE dual_alumnos " +
                  "SET cve_empresa="+cve_empresa+",nom_plan_rotacion='"+nom_plan_rotacion+"',nom_inst_empresa='"+nom_inst_empresa+"', " +
                  "ape_pat_inst_empresa='"+ape_pat_inst_empresa+"',ape_mat_inst_empresa='"+ape_mat_inst_empresa+"',tel_inst_empresa='"+tel_inst_empresa+"',correo_inst_empresa='"+correo_inst_empresa+"' " +
                  "WHERE (cve_alumno="+cve_alumno+") AND (cve_periodo="+cve_periodo+") AND (cve_competencia="+cve_competencia+")";
        System.out.println(consultas);
        if(SMBD.insertarSQL(consultas)!=0)
       {
           error="Los datos se guardaron correctamente";
       }
       else
       {
           error="No se han podido guardar los datos";
       }
       System.out.println(error);
    }

    public static void main(String[] args) throws Exception {
        seguimiento_a_dual ebd=new seguimiento_a_dual();
        System.out.println("Egan Alexis Dueñas Martínez 04/08/21: clase para pantalla emergente");
        
        ebd.sem_=0;ebd.sem_UT=0;
        
        ebd.mes_1=1;
        ebd.mes_2=1;
        ebd.mes_3=1;
        ebd.mes_4=1;
        ebd.l=1;
        ebd.m=0;
        ebd.i=1;
        ebd.j=0;
        ebd.v=1;
        ebd.cve_empresa=22;
        ebd.correo_inst_empresa="juan@hotmail.com";
        ebd.nom_plan_rotacion="Auxiliar";
        ebd.nom_inst_empresa="Carlos";
        ebd.ape_pat_inst_empresa="Benitez";
        ebd.ape_mat_inst_empresa="Juarez";
        ebd.tel_inst_empresa="4271221854";
        ebd.cve_alumno=34395;
        ebd.cve_periodo=69;
        ebd.cve_competencia=1;
        ebd.horario="06:pm-04:pm";
        ebd.cve_institucion=2;
        
        //ebd.FGuardarHorario();
        ebd.FGuardarSemanas();
        //ebd.FGuardarMeses();
        //ebd.FGuardarDias();
        //ebd.FGuardarDatos();
    }
}
