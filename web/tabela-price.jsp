<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
        <%@include file="WEB-INF/jspf/header.jspf" %>
    <body
        <%@include file="WEB-INF/jspf/menu.jspf" %></br></br></br></br>
        
        <div class="container" id="explicacao">
            
            <h1>Tabela Price</h1>           
            <p>Também chamado de sistema francês de amortização, é um método usado em amortização de empréstimo cuja principal característica é apresentar prestações (ou parcelas) iguais. </p>            
            <p>O método foi idealizado para pensões e aposentadorias. No entanto, foi a partir da 2ª revolução industrial que sua metodologia de cálculo foi aproveitada para cálculos de amortização de empréstimo.</p>
            <p>A tabela utiliza o regime de juros compostos para calcular o valor das parcelas de um empréstimo e, dessa parcela, há uma proporção relativa ao pagamento de juros e amortização do valor emprestado. </p>
            <p></p>
        </div>
        
         <%
             //declarando do valor principal, juros e periodo como double
          double vp = 0, j = 0, p = 0, parc = 0, saldodev = 0, vjuros = 0, jacu = 0, amort = 0, tamort = 0, tparc = 0;
          int x = 0;
          DecimalFormat formato = new DecimalFormat("#.##");
          try{
              vp = Integer.parseInt(request.getParameter("emprestimo"));
          }catch(Exception ex){}   
          try{
              j = Integer.parseInt(request.getParameter("juros")) / 100;
              p = Integer.parseInt(request.getParameter("periodo"));
          }catch(Exception ex){}
              //fórmula do calculo price
              //parc = vp * (j / (1 - Math.pow((1 + j), - p)));
              saldodev = vp;
        %>
              
        <form>
            
           <div class="form-row">
                <div class="form-group col-3">
                            <label for="inputEmprestimo">Empréstimo</label>
                            <input required min='0' step='0.01' id="inputEmprestimo" type="number" class="form-control" name="vp" placeholder="R$">
                </div>
                <div class="form-group col-3">
                            <label for="inputMeses">Prazo</label>
                            <input required min='1' step='1'id="inputMeses" type="number" class="form-control" name="p" placeholder="Meses">
                </div>
                <div class="form-group col-3">
                            <label for="inputTaxa">Taxa de Juros</label>
                            <input required min='0' step='0.001'id="inputTaxa" type="number" class="form-control" name="j" placeholder="%">
                </div>
                <div class="form-group  col-3">
                            <label for="selectPeriodo">Período da Taxa</label>
                            <select id="selectPeriodo" class="form-control" id="exampleSelect1">
                                <option>Mensal</option>
                                <option>Anual</option>
                            </select>
                        </div>
                </div>
            
                <p><input type='submit' style="font-size: 150%;" value='CALCULAR' class="btn-block" name=""></p>
                
             </div>
        </form> 
             <hr/>
           
                     <style>
                 .table-hover > tbody > tr > td, .table-hover > tbody > tr > th, .table-hover > tfoot > tr > td, .table-hover > tfoot > tr > th, .table-hover > thead > tr > td, .table-hover > thead > tr > th {
                    border: 1px solid #7C064D;
                    font-size: 125%;
                    text-align: center;
                  }
             </style>
             
             <div class="container">
                 <% if (request.getParameter("j") != null || request.getParameter("vp") != null || request.getParameter("p") != null) { %>
                    <table class="table table-hover">
                        <thead>
                    <tr>
                        <th>Período(meses)</th>
                        <th>Prestação</th>
                        <th>Juros</th>
                        <th>Amortização</th>
                        <th>Saldo Devedor</th>
                    </tr>
                        </thead>
                    <tr >
                        <td> 0 </td>
                        <td> - </td>
                        <td> - </td>
                        <td> - </td>
                        <td>R$ <%=formato.format(vp)%></td>
                    </tr>
                     <!--calculando a amortização-->  
                    <%for (x = 1; x <= p; x++) {%>
                    <tr>
                        <td><%=x%></td>
                        <%parc = vp * (j / (1 - Math.pow((1 + j), - p)));%>
                        <td>R$ <%=formato.format(parc)%></td>
                        <%tparc = parc + tparc;
                        vjuros = saldodev * j;
                        jacu = vjuros + vjuros;
                        amort = parc - vjuros;
                        tamort = amort + tamort;%>
                        
                        <td>R$ <%=formato.format(parc)%></td>
                        <td>R$ <%=formato.format(vjuros)%></td>
                        <td>R$ <%=formato.format(amort)%></td>
                        <%saldodev = vp - amort;%>
                        <td>R$ <%=formato.format(saldodev)%></td>


                    </tr>
                    <%}%>
                    <tr>
                        <td> ∑ →</td>
                        <td >R$ <%=formato.format(tparc)%></td>
                        <td >R$ <%=formato.format(jacu)%></td>
                        <td >R$ <%=formato.format(tamort)%></td>
                        <td >  -  </td>
                        
                    </tr>
                </table>
                <%}%>
             </div>
                
       <%@include file="WEB-INF/jspf/footer.jspf"%>  
    </body>
           
</html>