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
       <%@include file="WEB-INF/jspf/footer.jspf" %> 
       <%@include file="WEB-INF/jspf/header.jspf" %>
       <%@include file="WEB-INF/jspf/menu.jspf" %>
       <h1><b>Tabela Price</h1></b><br/><br/>

        <% 
           String vprinc = "", juros = "", periodo = "";
           vprinc = request.getParameter("vprinc");
           juros = request.getParameter("juros");
           periodo = request.getParameter("periodo");
        %>
        <%
             //declarando do valor principal, juros e periodo como double
          double vp = 0, j = 0, p = 0, vparc = 0, saldo = 0, jur = 0, jacu = 0, amort = 0, tamort = 0;
          int x = 0;
          try{
              vp = Integer.parseInt(request.getParameter("vprinc"));
          }catch(Exception ex){}   
          try{
              j = Integer.parseInt(request.getParameter("juros")) / 100;
              p = Integer.parseInt(request.getParameter("periodo"));
          }catch(Exception ex){}
              //fórmula do calculo price
              vparc = vp * (j / (1 - Math.pow((1 + j), - p)));
              saldo = vp;
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
             <hr/>
             <!--criação da tabela com os valores-->
            <table border ="2" >
                <tr>
                    <td>Periodo</td>
                    <td>Parcela</td>
                    <td>Juros</td>
                    <td>Amortização</td>
                    <td>Saldo Devedor</td>
                </tr>
                <tr>
                    <td><%=x%></td>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                    <td><%=saldo%></td>
                </tr> 
             <!--calculando a amortização-->  
            <% for (x = 1; x <= p; x++) {
                        jur = saldo * j;
                        jacu += jur;

                        amort = vparc - jur;
                        tamort += amort;
                        saldo -= amort;%>
                <tr>
                    <td><%=x%></td>
                    <td><%=String.format("%.2f", vparc)%></td>
                    <td><%=String.format("%.2f", jur)%></td>
                    <td><%=String.format("%.2f", amort)%></td>
                   <td><%=String.format("%.2f", saldo)%></td>
                </tr>
                <%}%>       
                
    </body>
</html>
