<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link href="https://fonts.googleapis.com/css?family=Economica" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="res/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="res/styles.css">
        <script src="res/jquery/jquery.min.js"></script>
        <script src="res/popper/popper.min.js"></script>
        <script src="res/bootstrap/js/bootstrap.min.js"></script>
        <script src="res/typeit/typeit.min.js"></script>

        <title>Amortizadora</title>

    </head>


    <body>
    
    <div class="container-fluid">
        
        <h1 id="logo">Calculadora de amortização<span class="type-it"></span></h1>

        <img id="logofatecpg" src="res/img/logo-fatecpg.png" width="150px" height="75px">
        
    </div>
    
    <div class="clearfix"></div>

    <script type="text/javascript">
        
        $('.type-it').typeIt({

            cursor: false,
            deleteSpeed: 150,
            lifeLike: false,
            loop: true,
            startDelay: 500

        })
        
        .tiSettings({speed:150})
        .tiType('price')
        .tiPause(2000)
        .tiDelete(5)   
        .tiType('americana')
        .tiPause(2000)
        .tiDelete(9)
        .tiType('constante')
        .tiPause(2000);


    </script>
        
        
    </body>
</html>
