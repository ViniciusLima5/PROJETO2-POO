<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <%@include file="WEB-INF/jspf/header.jspf" %>
    
    <body>
    
    <%@include file="WEB-INF/jspf/menu.jspf" %>    
        
    <div class="container" id="explicacao">
        
            <h2>Amortização Americana</h2>
        
            <p>O Sistema de Amortização Americano é uma forma de pagamento de empréstimos que se caracteriza pelo pagamento apenas dos juros da dívida,deixando o valor da dívida constante, que pode ser paga em apenas um único pagamento.</p>

            <p>Esse sistema de amortização tem a vantagem em relação ao sistema de pagamento único, pois nele não há incidência de juros sobre juros.</p>

            <p>Os juros sempre incidem sobre o valor original da dívida. Com isso o devedor pode quitar sua dívida quando quiser.</p>

            <p>Tem como desvantagem que o pagamento de juros pode, em tese, ser perpétuo mesmo quando já se pagou o equivalente à dívida em si. Para isso, basta que o número de prestações exceda 100% quando da soma dos juros simples.</p>

            <form>
                
                <div class="form-row">
                <div class="form-group col-3">
                            <label for="inputEmprestimo">Empréstimo</label>
                            <input required min='0' step='0.01' id="inputEmprestimo" type="number" class="form-control" name="valorDaDivida" placeholder="R$">
                </div>
                <div class="form-group col-3">
                            <label for="inputMeses">Prazo</label>
                            <input required min='1' step='1'id="inputMeses" type="number" class="form-control" name="periodo" placeholder="Meses">
                </div>
                <div class="form-group col-3">
                            <label for="inputTaxa">Taxa de Juros</label>
                            <input required min='0' step='0.001'id="inputTaxa" type="number" class="form-control" name="taxaJuros" placeholder="%">
                </div>
                <div class="form-group  col-3">
                            <label for="selectPeriodo">Período da Taxa</label>
                            <select id="selectPeriodo" class="form-control" id="exampleSelect1">
                                <option>Mensal</option>
                                <option>Anual</option>
                            </select>
                        </div>
                </div>
                
                <p><input type='submit' style="font-size: 150%;" value='Calcular' class="btn-block" name=""></p>

            </form>        
        
        </div>
        
        <%
        //declaração das variáveis
        double D=0;         //Divida
        double P=0;         //Parcelas/Periodo
        double TJ=0;        //Juros
        double Prestacao=0; //Prestação
        double i=0;
        double totalPrestacao=0;
        double A = 0;       //Amortização
        
        
        DecimalFormat formato = new DecimalFormat("#.##");
         
        try {
                TJ = Double.parseDouble(request.getParameter("taxaJuros"))/100;
                D = Double.parseDouble(request.getParameter("valorDaDivida"));
                P = Double.parseDouble(request.getParameter("periodo"));
                
                Prestacao = D*TJ;
                totalPrestacao= Prestacao*P;
                
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
                    <td style='border: 1px solid black; border-collapse: collapse'>R$ <%=formato.format(D)%></td>
                </tr>
                <%for (int x = 1; x <= P; x++) {
                
                if(x!=P){%>
                <tr style='border: 1px solid black; border-collapse: collapse'>
                        <td style='border: 1px solid black; border-collapse: collapse'><%=x%></td>
                        <td style='border: 1px solid black; border-collapse: collapse'>R$ <%=formato.format(Prestacao)%></td>
                        <td style='border: 1px solid black; border-collapse: collapse'>% <%=(TJ*100)%></td>
                        <td style='border: 1px solid black; border-collapse: collapse'>R$ <%=formato.format(A)%></td>
                        <td style='border: 1px solid black; border-collapse: collapse'>R$ <%=formato.format(D)%></td>


                </tr>
                <%}else if(x==P){
                    A=D;
                %>
                <tr style='border: 1px solid black; border-collapse: collapse'>
                        
                    <td style='border: 1px solid black; border-collapse: collapse'><%=x%></td>
                    <td style='border: 1px solid black; border-collapse: collapse'>R$ <%=formato.format(Prestacao)%></td>
                    <td style='border: 1px solid black; border-collapse: collapse'>% <%=(TJ*100)%></td>
                    <td style='border: 1px solid black; border-collapse: collapse'>R$ <%=formato.format(A)%></td>
                    <td style='border: 1px solid black; border-collapse: collapse'>R$ <%=formato.format(0)%></td>


                </tr>
                
                <%}%>
                <%}%>
                    <tr style='border: 1px solid black; border-collapse: collapse'>
                        <td style='border: 1px solid black; border-collapse: collapse'> ∑ →</td>
                        <td style='border: 1px solid black; border-collapse: collapse'>R$ <%=formato.format(totalPrestacao)%></td>
                        <td style='border: 1px solid black; border-collapse: collapse'>% <%=((TJ*100)*P)%></td>
                        <td style='border: 1px solid black; border-collapse: collapse'>R$ <%=formato.format(D)%></td>
                        <td style='border: 1px solid black; border-collapse: collapse'>  -  </td>
                        
                    </tr>
            </table>

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
         
    </script>

    </body>
    
</html>
