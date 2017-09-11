<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="WEB-INF/jspf/header.jspf" %>

    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>

        <div class="container" id="conteudo">
        	<h2>Amortização Base</h2>

        	<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. </p>

        <form>

            <div class="form-row">
                <div class="form-group col-3">
                            <label for="inputEmprestimo">Empréstimo</label>
                            <input required min='0' step='0.01' id="inputEmprestimo" type="number" class="form-control" name="" placeholder="R$">
                </div>
                <div class="form-group col-3">
                            <label for="inputMeses">Prazo</label>
                            <input required min='1' step='1'id="inputMeses" type="number" class="form-control" name="" placeholder="Meses">
                </div>
                <div class="form-group col-3">
                            <label for="inputTaxa">Taxa de Juros</label>
                            <input required min='0' step='0.001'id="inputTaxa" type="number" class="form-control" name="" placeholder="%">
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
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
