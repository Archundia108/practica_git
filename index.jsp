<%@ page language="java" contentType="application-json; charset=UTF-8" pageEncoding="UTF-8" errorPage="./error.jsp"%> 

<% 
    session.setAttribute("usuario","Gabriel");
    session.setAttribute("cve_usuario", "59");
    session.setMaxInactiveInterval(1600);
    response.sendRedirect("menuDual.jsp");

    //estudiante : 34397
    
    //director QUIMICA : 184  
    //  --tutor INDUSTRIAL: 14620 --tutor FARMA: 1178

    //director TICS y MECA: 59 
    //  --tutor TICS: 131 --tutor MECATRONICA: 30824
%> 