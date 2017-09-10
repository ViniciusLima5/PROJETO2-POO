<%-- 
    Document   : tabela-price
    Created on : 10/09/2017, 15:33:28
    Author     : Gabi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Price</title>
    </head>
    <body
       <%--<%@include file="WEB-INF/jspf/cabecalho.jspf" %>--%> 
       <%--<%@include file="WEB-INF/jspf/menu.jspf" %>--%>
       <h1><b>Tabela Price</h1></b><br/><br/>

        <% 
           String vprinc = "", juros = "", periodo = "";
           if(request.getParameter("sendForm")!=null){
           vprinc = request.getParameter("vprinc");
           juros = request.getParameter("juros");
           periodo = request.getParameter("periodo");
           }
        %>
         <%
             //declarando do valor principal, juros e periodo como double
          double vp = 0, j = 0, p = 0;
          try{
              vp = Integer.parseInt(request.getParameter("vp"));
              j = Integer.parseInt(request.getParameter("j"));
              p = Integer.parseInt(request.getParameter("p"));
          }catch(Exception ex){}
        %>
        <form>
            Valor Principal:<br/>
            <input type="text" name="nome" value="<%=vprinc%>"><br/>
            Juros:<br/>
            <input type="text" name="idade" value="<%=juros%>"><br/>
            Período:<br/>
            <input type="text" name="idade" value="<%=periodo%>"><br/><br/>
            <input type="submit" name="sendForm" value="Enviar"><br/>
        </form> 
            
            
           
    </body>
</html>
