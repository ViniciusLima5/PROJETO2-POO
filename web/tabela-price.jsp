<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        
        <div class="container" id="conteudo">
            
            <h1>Tabela Price</h1>           
            <p>Também chamado de sistema francês de amortização, é um método usado em amortização de empréstimo cuja principal característica é apresentar prestações (ou parcelas) iguais. </p>            
            <p>O método foi idealizado para pensões e aposentadorias. No entanto, foi a partir da 2ª revolução industrial que sua metodologia de cálculo foi aproveitada para cálculos de amortização de empréstimo.</p>
            <p>A tabela utiliza o regime de juros compostos para calcular o valor das parcelas de um empréstimo e, dessa parcela, há uma proporção relativa ao pagamento de juros e amortização do valor emprestado. </p>
        
            <hr>
        
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
                            <input required min='0' step='0.001'id="inputTaxa" type="number" class="form-control" name="taxa" placeholder="% a.m.">
                </div>
                
        </div>
                <p><input type='submit' style="font-size: 150%;" value='CALCULAR' class="btn-block" name=""></p>
        </form>
            
            
            
        </div>
                <br/>
             
        <%  
                double i=0, n=0, divida=0, amortizacao=0, juros=0, totala=0, totalj=0, prestacao=0,totalp=0;
                DecimalFormat formato = new DecimalFormat("#.##");
            try {
                i = Double.parseDouble(request.getParameter("taxa"))/100;
                divida = Double.parseDouble(request.getParameter("divida"));
                n = Double.parseDouble(request.getParameter("n"));
                prestacao = divida * (i / (1 - Math.pow((1 + i), - n) ));
                } catch (Exception ex) { 
                     if (request.getParameter("taxa")!=null) {
            
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
                 <% if (request.getParameter("taxa") != null || request.getParameter("divida") != null || request.getParameter("n") != null) { %>
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
                        <%juros = divida * i;%>
                        <td>R$ <%=formato.format(prestacao)%></td>
                        <%totalp = prestacao + totalp;
                        amortizacao = prestacao - juros;
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
                <%}%>
             </div>
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
