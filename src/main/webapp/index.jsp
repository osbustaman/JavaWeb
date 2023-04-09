<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Ingresar usuario</title>
		
        <!-- Bootstrap -->
        <link href="static/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="static/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <!-- NProgress -->
        <link href="static/vendors/nprogress/nprogress.css" rel="stylesheet">
        <!-- Animate.css -->
        <link href="static/vendors/animate.css/animate.min.css" rel="stylesheet">
        
        <link href="static/vendors/jquery.confirm/dist/jquery-confirm.min.css" rel="stylesheet">

        <!-- Custom Theme Style -->
        <link href="static/build/css/custom.min.css" rel="stylesheet">
    </head>
    <body class="login">
        <div>
            <div class="login_wrapper">
                <div class="animate form login_form">
                    <section class="login_content">
                        <form action="LoginUser" method="POST">
                            <h1>Login Usuario</h1>
                            <div>
                                <input type="text" name="rut" class="form-control" placeholder="Username" required="" />
                            </div>
                            <div>
                                <input type="password" name="password" class="form-control" placeholder="Password" required="" />
                            </div>
                            <div>
                                <button type="submit" class="btn btn-default submit">Ingresar</button>
                                <a class="btn btn-default reset_pass" href="#">Recuperar Contraseña</a>
                            </div>
                            <div class="clearfix"></div>

                            <div class="separator">
                                <div class="clearfix"></div>
                                <br />

                                <div>
                                    <h1><i class="fa fa-paw"></i> Tienda Médica Margarita</h1>
                                    <p>©2023 Todos los derechos reservados. Annakyn Momberg</p>
                                </div>
                            </div>
                        </form>
                    </section>
                </div>
            </div>
        </div>
    </body>
    
    <!-- jQuery -->
    <script src="static/vendors/jquery/dist/jquery.min.js"></script>
    <script src="static/vendors/jquery.confirm/dist/jquery-confirm.min.js"></script>
    
    <script>
        $(document).ready(function(){
            <%
            if(request.getAttribute("mensaje") != null){
            %>
            $.alert({
                title: 'Alerta!',
                content: '<%= request.getAttribute("mensaje") %>'
            });
            <%
            }
            %>
        });
    </script>
</html>
