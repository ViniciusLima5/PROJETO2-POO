<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="WEB-INF/jspf/header.jspf" %>

    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>

        <div class="container" id="conteudo">
        	<h2>Amortização Constante</h2>

        	<p>Sistema de Amortização Constante (SAC) é uma forma de amortização de um empréstimo por prestações que incluem os juros, amortizando assim partes iguais do valor total do empréstimo.</p>

                <p>Neste sistema o saldo devedor é reembolsado em valores de amortização iguais. Desta forma, no sistema SAC o valor das prestações é decrescente, já que os juros diminuem a cada prestação. O valor da amortização é calculada dividindo-se o valor do principal pelo número de períodos de pagamento, ou seja, de parcelas.</p>

                <p>O SAC é um dos tipos de sistema de amortização utilizados em financiamentos imobiliários. A principal característica do SAC é que ele amortiza um percentual fixo do valor principal (emissão), desde o início do financiamento. Esse percentual de amortização é sempre o mesmo, o que faz com que a parcela de amortização da dívida seja maior no início do financiamento, fazendo com que o saldo devedor caia mais rapidamente do que em outros mecanismos de amortização.</p>

        <form>

            <div class="form-row">
                <div class="form-group col-4">
                            <label for="inputEmprestimo">Empréstimo</label>
                            <input required min='0' step='0.01' id="inputEmprestimo" type="number" class="form-control" name="divida" placeholder="R$">
                </div>
                <div class="form-group col-4">
                            <label for="inputMeses">Prazo</label>
                            <input required min='1' step='1'id="inputMeses" type="number" class="form-control" name="n" placeholder="Meses">
                </div>
                <div class="form-group col-4">
                            <label for="inputTaxa">Taxa de Juros</label>
                            <input required min='0' step='0.001'id="inputTaxa" type="number" class="form-control" name="taxa" placeholder="%">
                </div>
                
</div>
                <p><input type='submit' style="font-size: 150%;" value='CALCULAR' class="btn-block" name=""></p>
        </form>
                
             
        <%  
                double i=0, n=0, divida=0, amortizacao=0, juros=0, totala=0, totalj=0, prestacao=0,totalp=0;
                DecimalFormat formato = new DecimalFormat("#.##");
            try {
                i = Double.parseDouble(request.getParameter("taxa"))/100;
                divida = Double.parseDouble(request.getParameter("divida"));
                n = Double.parseDouble(request.getParameter("n"));
                amortizacao = divida / n;
                } catch (Exception ex) { 
                     if (request.getParameter("taxa")!=null) {
            
            %>
            %>
                     <script>
                        alert("Parâmetro inválido. Digite os dados corretamente.");
                     </script>  
             <%
                     }
                }
             %>
                     <style>
                 .table-hover > tbody > tr > td, .table-hover > tbody > tr > th, .table-hover > tfoot > tr > td, .table-hover > tfoot > tr > th, .table-hover > thead > tr > td, .table-hover > thead > tr > th {
                    border: 1px solid #7C064D;
                    font-size: 125%;
                    text-align: center;
                  }
             </style>
             
             <div class="container">
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
                        <td>R$ <%=formato.format(divida)%></td>
                    </tr>
                    <%for (int x = 1; x <= n; x++) {%>
                    <tr>
                        <td><%=x%></td>
                        <%prestacao = amortizacao + (divida * i);%>
                        <td>R$ <%=formato.format(prestacao)%></td>
                        <%totalp = prestacao + totalp;
                        juros = divida * i;
                        totalj = juros + totalj;
                        totala=amortizacao+totala;%>
                        <td>R$ <%=formato.format(juros)%></td>
                        <td>R$ <%=formato.format(amortizacao)%></td>
                        <%divida = divida - amortizacao;%>
                        <td>R$ <%=formato.format(divida)%></td>


                    </tr>
                    <%}%>
                    <tr>
                        <td> ∑ →</td>
                        <td >R$ <%=formato.format(totalp)%></td>
                        <td >R$ <%=formato.format(totalj)%></td>
                        <td >R$ <%=formato.format(totala)%></td>
                        <td >  -  </td>
                        
                    </tr>
                </table>
             </div>
            
                       
                        
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
