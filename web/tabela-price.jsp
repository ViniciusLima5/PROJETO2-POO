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
            <!--calculando a amortização-->  
            <% for (x = 1; x <= p; x++) {
                        jur = saldo * j;
                        jacu += jur;

                        amort = vparc - jur;
                        tamort += amort;
                        saldo -= amort;%>
           <%}%>  
                
       </table><br/><br/>
                <%@include file="WEB-INF/jspf/footer.jspf"%>  
    </body>
           
</html>
