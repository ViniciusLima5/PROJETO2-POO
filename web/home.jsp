<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <%@include file="WEB-INF/jspf/header.jspf" %>
    
    <body>
    
    <%@include file="WEB-INF/jspf/menu.jspf" %>    
        
    <div class="container" id="explicacao">
        <p>Amortização é um processo de extinção de uma dívida através de pagamentos periódicos, que são realizados em função de um planejamento, de modo que cada prestação corresponde à soma do reembolso do capital ou do pagamento dos juros do saldo devedor, podendo ser o reembolso de ambos, sendo que os juros são sempre calculados sobre o saldo devedor.</p>

        <p>No Brasil, existe amortização contábil, cujo conceito não se restringe à diminuição de dívidas, mas também a direitos intangíveis classificados no ativo (conta de balanço), derivado da teoria de dimensão econômico dos fundos contábeis. Assim, associa-se o termo amortização contábil, à depreciação contábil (redução de bens tangíveis) e à exaustão contábil (recursos naturais).</p>

        <p>Na<b> nossa aplicação</b> você poderá realizar o cálculo da amortização através do método Americano, Price e constante.</p>
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
        
       

         

    </script>

    </body>
    
</html>
