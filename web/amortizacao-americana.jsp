<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <%@include file="WEB-INF/jspf/header.jspf" %>
    
    <body>
    
    <%@include file="WEB-INF/jspf/menu.jspf" %>    
        
    <div class="container" id="conteudo">
        
            <h2>Amortização Americana</h2>
        
            <p>O Sistema de Amortização Americano é uma forma de pagamento de empréstimos que se caracteriza pelo pagamento apenas dos juros da dívida,deixando o valor da dívida constante, que pode ser paga em apenas um único pagamento.</p>

            <p>Esse sistema de amortização tem a vantagem em relação ao sistema de pagamento único, pois nele não há incidência de juros sobre juros.</p>

            <p>Os juros sempre incidem sobre o valor original da dívida. Com isso o devedor pode quitar sua dívida quando quiser.</p>

            <p>Tem como desvantagem que o pagamento de juros pode, em tese, ser perpétuo mesmo quando já se pagou o equivalente à dívida em si. Para isso, basta que o número de prestações exceda 100% quando da soma dos juros simples.</p>

            <form>
                
                <div class="form-row">
                <div class="form-group col-4">
                            <label for="inputEmprestimo">Empréstimo</label>
                            <input required min='0' step='0.01' id="inputEmprestimo" type="number" class="form-control" name="valorDaDivida" placeholder="R$">
                </div>
                <div class="form-group col-4">
                            <label for="inputMeses">Prazo</label>
                            <input required min='1' step='1'id="inputMeses" type="number" class="form-control" name="periodo" placeholder="Meses">
                </div>
                <div class="form-group col-4">
                            <label for="inputTaxa">Taxa de Juros</label>
                            <input required min='0' step='0.001'id="inputTaxa" type="number" class="form-control" name="taxaJuros" placeholder="% a.m.">
                </div>
                
                </div>
                <p><input type='submit' style="font-size: 150%;" value='CALCULAR' class="btn-block" name=""></p>
                <br/>

            </form>        
        
        
        
        <%
        //declaração das variáveis
        double D=0;         //Divida
        double P=0;         //Parcelas/Periodo
        double TJ=0;        //Juros
        double Prestacao=0; //Prestação
        double i=0;
        double totalPrestacao=0;
        double A = 0;       //Amortização
        String Periodo = "Meses";
        
        
        DecimalFormat formato = new DecimalFormat("#.##");
         
        try {
             if (request.getParameter("taxaJuros") != null || request.getParameter("valorDaDivida") != null || request.getParameter("periodo") != null ){
                TJ = Double.parseDouble(request.getParameter("taxaJuros"))/100;
                D = Double.parseDouble(request.getParameter("valorDaDivida"));
                P = Double.parseDouble(request.getParameter("periodo"));

                Prestacao = D*TJ;
                
                totalPrestacao= Prestacao*P;
             }
                
                } catch (Exception ex) { 
                     
            
            %>
            
                     <script>
                        alert("Parâmetro inválido. Digite os dados corretamente.");
                     </script>  
             <%
                     
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
                 <% if (request.getParameter("taxaJuros") != null || request.getParameter("valorDaDivida") != null || request.getParameter("periodo") != null) { %>
             <table class="table table-hover" style="border-color:red;">
                 <thead>
                <tr>
                    <th id="demo">Período(<%=Periodo %>)</th>
                    <th>Prestação</th>
                    <th>Juros</th>
                    <th>Amortização</th>
                    <th>Saldo Devedor</th>
                </tr>
                 </thead>
                <tr>
                    <td> 0 </td>
                    <td> - </td>
                    <td> - </td>
                    <td> - </td>
                    <td>R$ <%=formato.format(D)%></td>
                </tr>
                <%for (int x = 1; x <= P; x++) {
                
                if(x!=P){%>
                <tr >
                        <td ><%=x%></td>
                        <td >R$ <%=formato.format(Prestacao)%></td>
                        <td >R$ <%=(TJ*100)%></td>
                        <td >R$ <%=formato.format(A)%></td>
                        <td >R$ <%=formato.format(D)%></td>


                </tr>
                <%}else if(x==P){
                    A=D;
                %>
                <tr >
                        
                    <td ><%=x%></td>
                    <td >R$ <%=formato.format(Prestacao)%></td>
                    <td >R$ <%=(TJ*100)%></td>
                    <td >R$ <%=formato.format(A)%></td>
                    <td >R$ <%=formato.format(0)%></td>


                </tr>
                
                <%}%>
                <%}%>
                    <tr>
                        <td > ∑ →</td>
                        <td >R$ <%=formato.format(totalPrestacao)%></td>
                        <td >R$ <%=((TJ*100)*P)%></td>
                        <td >R$ <%=formato.format(D)%></td>
                        <td >  -  </td>
                        
                    </tr>
            </table>
                        <%}%>
             </div>

    </div>

    <%@include file="WEB-INF/jspf/footer.jspf" %>
  
    </body>
    
</html>
