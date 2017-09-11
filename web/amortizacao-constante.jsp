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
                <div class="form-group col-3">
                            <label for="inputEmprestimo">Empréstimo</label>
                            <input required min='0' step='0.01' id="inputEmprestimo" type="number" class="form-control" name="divida" placeholder="R$">
                </div>
                <div class="form-group col-3">
                            <label for="inputMeses">Prazo</label>
                            <input required min='1' step='1'id="inputMeses" type="number" class="form-control" name="n" placeholder="Meses">
                </div>
                <div class="form-group col-3">
                            <label for="inputTaxa">Taxa de Juros</label>
                            <input required min='0' step='0.001'id="inputTaxa" type="number" class="form-control" name="taxa" placeholder="%">
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
                    <table style='border: 1px solid black; border-collapse: collapse; margin-right:auto; margin-left:auto;'>
                    <tr>
                        <th style='border: 1px solid black; border-collapse: collapse'>Período(meses)</th>
                        <th style='border: 1px solid black; border-collapse: collapse'>Prestação</th>
                        <th style='border: 1px solid black; border-collapse: collapse'>Juros</th>
                        <th style='border: 1px solid black; border-collapse: collapse'>Amortização</th>
                        <th style='border: 1px solid black; border-collapse: collapse'>Saldo Devedor</th>
                    </tr>
                    <tr style='border: 1px solid black; border-collapse: collapse'>
                        <td style='border: 1px solid black; border-collapse: collapse'> 0 </td>
                        <td style='border: 1px solid black; border-collapse: collapse'> - </td>
                        <td style='border: 1px solid black; border-collapse: collapse'> - </td>
                        <td style='border: 1px solid black; border-collapse: collapse'> - </td>
                        <td style='border: 1px solid black; border-collapse: collapse'>R$ <%=formato.format(divida)%></td>
                    </tr>
                    <%for (int x = 1; x <= n; x++) {%>
                    <tr style='border: 1px solid black; border-collapse: collapse'>
                        <td style='border: 1px solid black; border-collapse: collapse'><%=x%></td>
                        <%prestacao = amortizacao + (divida * i);%>
                        <td style='border: 1px solid black; border-collapse: collapse'>R$ <%=formato.format(prestacao)%></td>
                        <%totalp = prestacao + totalp;
                        juros = divida * i;
                        totalj = juros + totalj;
                        totala=amortizacao+totala;%>
                        <td style='border: 1px solid black; border-collapse: collapse'>R$ <%=formato.format(juros)%></td>
                        <td style='border: 1px solid black; border-collapse: collapse'>R$ <%=formato.format(amortizacao)%></td>
                        <%divida = divida - amortizacao;%>
                        <td style='border: 1px solid black; border-collapse: collapse'>R$ <%=formato.format(divida)%></td>


                    </tr>
                    <%}%>
                    <tr style='border: 1px solid black; border-collapse: collapse'>
                        <td style='border: 1px solid black; border-collapse: collapse'> ∑ →</td>
                        <td style='border: 1px solid black; border-collapse: collapse'>R$ <%=formato.format(totalp)%></td>
                        <td style='border: 1px solid black; border-collapse: collapse'>R$ <%=formato.format(totalj)%></td>
                        <td style='border: 1px solid black; border-collapse: collapse'>R$ <%=formato.format(totala)%></td>
                        <td style='border: 1px solid black; border-collapse: collapse'>  -  </td>
                        
                    </tr>
                </table>
                        </br>
                        </br>
                        </br>
                        
        </form>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
