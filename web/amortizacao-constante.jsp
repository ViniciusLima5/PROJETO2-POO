<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.lang.Double"%>


<html>
    <%@include file="WEB-INF/jspf/header.jspf" %>

    <body>

        <%@include file="WEB-INF/jspf/menu.jspf" %> 


        <div class="container" id="explicacao">

            <p>Sistema de Amortização Constante (SAC) é uma forma de amortização de um empréstimo por prestações que incluem os juros, amortizando assim partes iguais do valor total do empréstimo.</p>

            <p>Neste sistema o saldo devedor é reembolsado em valores de amortização iguais. Desta forma, no sistema SAC o valor das prestações é decrescente, já que os juros diminuem a cada prestação. O valor da amortização é calculada dividindo-se o valor do principal pelo número de períodos de pagamento, ou seja, de parcelas.</p>

            <p>O SAC é um dos tipos de sistema de amortização utilizados em financiamentos imobiliários. A principal característica do SAC é que ele amortiza um percentual fixo do valor principal (emissão), desde o início do financiamento. Esse percentual de amortização é sempre o mesmo, o que faz com que a parcela de amortização da dívida seja maior no início do financiamento, fazendo com que o saldo devedor caia mais rapidamente do que em outros mecanismos de amortização.</p>


            <form>
                <p>Valor da dívida em R$:</p>
                <input type="number" step="any" name="divida" value=""><br/><br/>
                <p>Taxa de juros ao mês (%):</p>
                <input type="number" step="any" min="0" name="taxa" value=""><br/><br/>
                <p>Quantidade de meses/parcelas:</p>
                <input type="number" step="any" min="0" name="n" value=""><br/><br/>
                <input type="submit" name="sendForm" value="Enviar"><br/>
            </form>        

            <%  
                double i=0, n=0, divida=0, amortizacao=0, juros=0, totala=0, totalj=0, prestacao=0,totalp=0;
            try {
                i = Double.parseDouble(request.getParameter("taxa"))/100;
                divida = Double.parseDouble(request.getParameter("divida"));
                n = Double.parseDouble(request.getParameter("n"));
                amortizacao = divida / n;
                } catch (Exception ex) {
            }
            %>
            <table style='border: 1px solid black; border-collapse: collapse'>
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
                        <td style='border: 1px solid black; border-collapse: collapse'>R$ <%=divida%></td>
                    </tr>
                    <%for (int x = 1; x <= n; x++) {%>
                    <tr style='border: 1px solid black; border-collapse: collapse'>
                        <td style='border: 1px solid black; border-collapse: collapse'><%=x%></td>
                        <%prestacao = amortizacao + (divida * i);%>
                        <td style='border: 1px solid black; border-collapse: collapse'>R$ <%=prestacao%></td>
                        <%totalp = prestacao + totalp;
                        juros = divida * i;
                        totalj = juros + totalj;
                        totala=amortizacao+totala;%>
                        <td style='border: 1px solid black; border-collapse: collapse'>R$ <%=juros%></td>
                        <td style='border: 1px solid black; border-collapse: collapse'>R$ <%=amortizacao%></td>
                        <%divida = divida - amortizacao;%>
                        <td style='border: 1px solid black; border-collapse: collapse'>R$ <%=divida%></td>


                    </tr>
                    <%}%>
                    <tr style='border: 1px solid black; border-collapse: collapse'>
                        <td style='border: 1px solid black; border-collapse: collapse'> ∑ →</td>
                        <td style='border: 1px solid black; border-collapse: collapse'>R$ <%=totalp%></td>
                        <td style='border: 1px solid black; border-collapse: collapse'>R$ <%=totalj%></td>
                        <td style='border: 1px solid black; border-collapse: collapse'>R$ <%=totala%></td>
                        <td style='border: 1px solid black; border-collapse: collapse'>  -  </td>
                        
                    </tr>
                </table>
        </div>
<div class="container-fluid" id="equipe">
        <h2 id="equipe-logo">EQUIPE</h2>

        <div class="row">
            <div class="col-md-3 col-sm-6" id="primeiro-membro" class="membro">
                <div id="foto">
                    <img class="rounded-circle" src="res/img/vinicius.png" width="225" height="225">
                </div>
                <div id="descricao">
                    <h3>Vinícius Lima</h3>
                    <div class="social">
                        <a class="fa fa-facebook " href="https://www.facebook.com/vinicius.lima.1671" target="_blank" href="#"></a>
                        <a class="fa fa-linkedin" href="https://www.linkedin.com/in/vin%C3%ADcius-lima-5b5b9a138/" target="_blank" href="#"></a>
                        <a class="fa fa-github" href="https://github.com/ViniciusLima5" target="_blank" href="#"></a>
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6" id="segundo-membro" class="membro">
                <div id="foto">
                    <img class="rounded-circle" src="res/img/viniciusloreto.jpg" width="225" height="225">
                </div>
                <div id="descricao">
                    <h3>Vinicius Loreto</h3>
                    <div class="social">
                        <a class="fa fa-facebook " href="https://www.facebook.com/viniloreto" target="_blank" href="#"></a>
                        <a class="fa fa-linkedin" href="https://www.linkedin.com/in/vinicius-loreto-ferreira-b2b97114a/" target="_blank" href="#"></a>
                        <a class="fa fa-github" href="https://github.com/viniloreto" target="_blank" href="#"></a>
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6" id="terceiro-membro" class="membro">
                <div id="foto">
                    <img class="rounded-circle" src="res/img/gabriela.jpg" width="225" height="225">
                </div>
                <div id="descricao">
                    <h3>Gabriela Duarte</h3>
                    <div class="social">
                        <a class="fa fa-facebook " href="https://www.facebook.com/gabi.duarte.10" target="_blank" href="#"></a>
                        <a class="fa fa-linkedin" href="https://www.linkedin.com/in/gabriela-santos-duarte-63473622/" " target="_blank" href="#"></a>
                        <a class="fa fa-github" href="https://github.com/Gabriela87" target="_blank" href="#"></a>
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6" id="quarto-membro" class="membro">
                <div id="foto">
                    <img class="rounded-circle" src="res/img/maciel.png" width="225" height="225">
                </div>
                <div id="descricao">
                    <h3>Luiz Maciel</h3>
                    <div class="social">
                        <a class="fa fa-facebook " href="https://www.facebook.com/LuizM98" target="_blank" href="#"></a>
                        <a class="fa fa-linkedin" href="https://www.linkedin.com/in/luiz-maciel-segura-dos-santos-a0911b128/" target="_blank" href="#"></a>
                        <a class="fa fa-github" href="https://github.com/LuizMaciel98" target="_blank" href="#"></a>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <%@include file="WEB-INF/jspf/footer.jspf" %>

    <script type="text/javascript">
    
        $(window).on('scroll', function() {
             var y_scroll_pos = window.pageYOffset;
             var scroll_pos_test = 300 ;

            if(y_scroll_pos > scroll_pos_test) { 
                $("#primeiro-membro").fadeTo('slow', 1, function() {
                    $("#segundo-membro").fadeTo('slow', 1, function() {
                        $("#terceiro-membro").fadeTo('slow', 1, function() {
                            $("#quarto-membro").fadeTo('slow', 1, function() {
                                $("#equipe-logo").html('EQUIPE <i style="color:red;" class="fa fa-heart" aria-hidden="false"></i>');
                                

                            }); 
                        }); 
                    });  
                });     
            }
         });
         
        function myFunction() {
            
            if(document.getElementById('seletor').value != "padrao") {
            
                if(document.getElementById('seletor').value == "escolha-1") {
            
                    document.getElementById("textoBotaoEscolha-1").innerHTML = "Insira o numero de prestações";
                    document.getElementById('botaoEscolha-1').type = 'text';
                
                }
                
                if(document.getElementById('seletor').value == "escolha-2") {
                    
                    document.getElementById("textoBotaoEscolha-1").innerHTML = "Insira quantos meses você ira pagar antes de quitar a sua divida";
                    document.getElementById('botaoEscolha-1').type = 'text';
                    
                }
                
            }
            
            if(document.getElementById('seletor').value == "padrao") {
                document.getElementById("textoBotaoEscolha-1").innerHTML = "";
                document.getElementById('botaoEscolha-1').type = 'hidden';    
            }
            
        }
        
       

         

    </script>

    </body>
    
</html>