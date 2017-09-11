<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <%@include file="WEB-INF/jspf/header.jspf" %>
    
    <body>
    
    <%@include file="WEB-INF/jspf/menu.jspf" %>    
        
    <%
        //declaração das variáveis
        double d=0; //Divida
        double p=0; //Parcelas
        double j=0; //Juros

        %>
    
    
    <div class="container" id="explicacao">
        
        <p>O Sistema de Amortização Americano é uma forma de pagamento de empréstimos que se caracteriza pelo pagamento apenas dos juros da dívida,deixando o valor da dívida constante, que pode ser paga em apenas um único pagamento.</p>
        
        <p>Esse sistema de amortização tem a vantagem em relação ao sistema de pagamento único, pois nele não há incidência de juros sobre juros.</p>
        
        <p>Os juros sempre incidem sobre o valor original da dívida. Com isso o devedor pode quitar sua dívida quando quiser.</p>

        <p>Tem como desvantagem que o pagamento de juros pode, em tese, ser perpétuo mesmo quando já se pagou o equivalente à dívida em si. Para isso, basta que o número de prestações exceda 100% quando da soma dos juros simples.</p>
        
        <form>
            <p>Valor da dívida:</p>
            <input type="text" name="valorDaDivida" value=""><br/>
            <p>Juros:</p>
            <input type="text" name="juros" value=""><br/>
            <p>Como pretende pagar a divida:</p>
            <select id="seletor" onchange="myFunction()">
                
                <option value="padrao">Escolher</option>
                <option value="escolha-1">Em um determinado numero de prestações</option>
                <option value="escolha-2">De uma vez após um periodo de tempo</option>
                
            </select><br>
            <p id="textoBotaoEscolha-1"></p>
            <input id="botaoEscolha-1" type="hidden" ><br/>
            
            
            <input type="submit" name="sendForm" value="Enviar"><br/>
        </form>        
        
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        
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
