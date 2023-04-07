<%@page import="Models.Cargo"%>
<%@page import="Models.Comuna"%>
<%@page import="Models.Region"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Models.Pais" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title><% out.println("Bienvenido " + session.getAttribute("nombre") + "!"); %></title>

    <!-- Bootstrap -->
    <link href="static/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="static/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="static/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- jQuery custom content scroller -->
    <link href="static/vendors/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.min.css" rel="stylesheet"/>
    
    <!-- PNotify -->
    <link href="static/vendors/pnotify/dist/pnotify.css" rel="stylesheet">
    <link href="static/vendors/pnotify/dist/pnotify.buttons.css" rel="stylesheet">
    <link href="static/vendors/pnotify/dist/pnotify.nonblock.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="static/build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col menu_fixed">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>Tienda Médica!</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="images/img.jpg" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Bienvenid@,</span>
                <h2><% out.println(session.getAttribute("nombre") + " " + session.getAttribute("apellidos")); %></h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu">
                  <li class="active"><a><i class="fa fa-users"></i> Colaborador <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu" style="display: block;">
                        <li class="current-page"><a href="PanelControl?page=new_colaborador">Crear Colaborador</a></li>
                        <li><a href="PanelControl?page=list_colaborador">Listar Colaboradores</a></li>
                    </ul>
                  </li>
                  
                </ul>
              </div>
              

            </div>
            <!-- /sidebar menu -->

          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
            <div class="nav_menu">
                <div class="nav toggle">
                  <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                </div>
                <nav class="nav navbar-nav">
                <ul class=" navbar-right">
                  <li class="nav-item dropdown open" style="padding-left: 15px;">
                    <a href="javascript:;" class="user-profile dropdown-toggle" aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown" aria-expanded="false">
                      <img src="images/img.jpg" alt=""><% out.println(session.getAttribute("nombre") + " " + session.getAttribute("apellidos")); %>
                    </a>
                    <div class="dropdown-menu dropdown-usermenu pull-right" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="LoginUser?accion=cerrarSesion"><i class="fa fa-sign-out pull-right"></i> Cerrar Sesión</a>
                    </div>
                  </li>
                </ul>
              </nav>
            </div>
          </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Agregar datos del nuevo colaborador</h3>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12  ">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Todos los datos son obligatorios</h2>
                    
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                        <br />
                        <form id="frm-add-colaborador" action="PanelControl?page=add_colaborador" method="POST" data-parsley-validate class="form-horizontal form-label-left" >

                            <div class="item form-group">
                                <label class="col-form-label col-md-3 col-sm-3 label-align">Rut <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 ">
                                    <input type="text" id="rut" name="rut" required="required" class="form-control requieres">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="col-form-label col-md-3 col-sm-3 label-align">Nombres <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 ">
                                    <input type="text" id="nombres" name="nombres" required="required" class="form-control requieres">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="col-form-label col-md-3 col-sm-3 label-align">Apellidos <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 ">
                                    <input type="text" id="apellidos" name="apellidos" required="required" class="form-control requieres">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="col-form-label col-md-3 col-sm-3 label-align">Dirección <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 ">
                                    <input type="text" id="direccion" name="direccion" required="required" class="form-control requieres">
                                </div>
                            </div>

                            <div class="item form-group">
                                <label class="col-form-label col-md-3 col-sm-3 label-align">País <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 ">
                                    <select id="pais" name="pais" class="form-control requieres" required="">
                                        <option value="">Selccione..</option>
                                        <%
                                         List<Pais> paises=(List<Pais>)request.getAttribute("lstPaises");
                                        for(Pais pais:paises){%>
                                        <option value="<%= pais.getId() %>"><%= pais.getNombrePais() %></option>
                                        <%}%>
                                    </select>
                                </div>
                            </div>

                            <div class="item form-group">
                                <label class="col-form-label col-md-3 col-sm-3 label-align">Región <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 ">
                                    <select id="region" name="region" class="form-control requieres" required="">
                                        <option value="">Selccione..</option>
                                        <%
                                        List<Region> regiones=(List<Region>)request.getAttribute("lstRegiones");
                                        for(Region region:regiones){%>
                                        <option value="<%= region.getId() %>"><%= region.getNombreRegion() %></option>
                                        <%}%>
                                    </select>
                                </div>
                            </div>

                            <div class="item form-group">
                                <label class="col-form-label col-md-3 col-sm-3 label-align">Comuna <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 ">
                                    <select id="comuna" name="comuna" class="form-control requieres" required="">
                                        <option value="">Selccione..</option>
                                        <%
                                        List<Comuna> comunas=(List<Comuna>)request.getAttribute("lstComunas");
                                        for(Comuna comuna:comunas){%>
                                        <option value="<%= comuna.getId() %>"><%= comuna.getNombreComuna() %></option>
                                        <%}%>
                                    </select>
                                </div>
                            </div>

                            <div class="item form-group">
                                <label class="col-form-label col-md-3 col-sm-3 label-align">Estado civil <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 ">
                                    <select id="estado_civil" name="estado_civil" class="form-control requieres" required="">
                                        <option value="">Selccione..</option>
                                        <option value="S">Soltero</option>
                                        <option value="C">Casado</option>
                                    </select>
                                </div>
                            </div>

                            <div class="item form-group">
                                <label class="col-form-label col-md-3 col-sm-3 label-align">Sexo <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 ">
                                    <select id="sexo" name="sexo" class="form-control requieres" required="">
                                        <option value="">Selccione..</option>
                                        <option value="M">Masculino</option>
                                        <option value="F">Femenino</option>
                                    </select>
                                </div>
                            </div>

                            <div class="item form-group">
                                <label class="col-form-label col-md-3 col-sm-3 label-align">Cargos <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 ">
                                    <select id="cargo" name="cargo" class="form-control requieres" required="">
                                        <option value="">Selccione..</option>
                                        <%
                                        List<Cargo> cargos =(List<Cargo>)request.getAttribute("lstCargos");
                                        for(Cargo cargo:cargos){%>
                                        <option value="<%= cargo.getId() %>"><%= cargo.getNombreCargo() %></option>
                                        <%}%>
                                    </select>
                                </div>
                            </div>

                            <div class="item form-group">
                                <label class="col-form-label col-md-3 col-sm-3 label-align">Fecha de ingreso <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 ">
                                    <input id="fecha_ingreso" name="fecha_ingreso" autocomplete="off" class="date-picker form-control requieres" placeholder="dd-mm-yyyy" type="text" required="required" type="text" onfocus="this.type='date'" onmouseover="this.type='date'" onclick="this.type='date'" onblur="this.type='text'" onmouseout="timeFunctionLong(this)">
                                        <script>
                                        function timeFunctionLong(input) {
                                            setTimeout(function() {
                                                    input.type = 'text';
                                            }, 60000);
                                        }
                                        </script>
                                </div>
                            </div>

                            <div class="item form-group">
                                <label class="col-form-label col-md-3 col-sm-3 label-align">Contraseña <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 ">
                                    <input type="password" id="password" name="password" required="required" autocomplete="off" class="form-control requieres">
                                </div>
                            </div>

                            <div class="item form-group">
                                <label class="col-form-label col-md-3 col-sm-3 label-align">Perfil <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 ">
                                    <select id="perfil" name="perfil" class="form-control requieres" required="">
                                        <option value="">Selccione..</option>
                                        <option value="1">Administrador</option>
                                        <option value="2">Colaborador</option>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="item form-group">
                                <label class="col-form-label col-md-3 col-sm-3 label-align">Imagen <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 ">
                                    <br>
                                    <input type="file" id="imagen" name="imagen" class="requieres" accept="image/png,image/jpeg" multiple="multiple">
                                </div>
                            </div>
                                    
                            <div class="ln_solid"></div>
                            <div class="item form-group">
                                <div class="col-md-6 col-sm-6 offset-md-3">
                                    <button type="button" class="btn btn-primary" type="reset">Limpiar Formulario</button>
                                    <button type="button" id="save-colaborador" class="btn btn-success">Guardar</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="static/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
   <script src="static/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <!-- FastClick -->
    <script src="static/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="static/vendors/nprogress/nprogress.js"></script>
    <!-- jQuery custom content scroller -->
    <script src="static/vendors/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
    
    <!-- PNotify -->
    <script src="static/vendors/pnotify/dist/pnotify.js"></script>
    <script src="static/vendors/pnotify/dist/pnotify.buttons.js"></script>
    <script src="static/vendors/pnotify/dist/pnotify.nonblock.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="static/build/js/custom.min.js"></script>
    
    <script>
      
        $(document).ready(function(){
            $("#save-colaborador").click(function(){
                if(validar_form("#frm-add-colaborador")){
                    new PNotify({
                        title: 'Error!',
                        text: 'Faltan campos por llenar, revise el formulario.',
                        type: 'error',
                        styling: 'bootstrap3'
                    });
                }else{
                    $("#frm-add-colaborador").submit();
                }
            });
        });
        
        function validar_form(frm){
            var is_error = false;
            // Desde aqui se recorre el form, y asi se encuentran los inputs 
            $(frm).find(':input').each(function(){
                // console.log(this.type + " - " + this.id);
                
                if(this.type === 'hidden'){
                    console.log(this.type + " - " + this.id);
                    return;
                }else{
                    if(this.type === 'text' || this.type === 'password'){
                        if($(this).val().length === 0){
                            console.log(this.type + " - " + this.id);
                            is_error = true;
                        }else{
                            if(this.id === 'rut'){
                                if(!validarRut(this.value)){
                                    console.log(this.type + " - " + this.id);
                                    new PNotify({
                                        title: 'Error!',
                                        text: 'El rut ingresado no es valido.',
                                        type: 'error',
                                        styling: 'bootstrap3'
                                    });
                                    return false;
                                }
                            }
                            
                            if(this.type === 'email'){
                                if(!validarEmail(email)){
                                    if(!validarRut(this.value)){
                                        console.log(this.type + " - " + this.id);
                                        new PNotify({
                                            title: 'Error!',
                                            text: 'El mail ingresado no es valido.',
                                            type: 'error',
                                            styling: 'bootstrap3'
                                        });
                                        return false;
                                    }
                                }
                            }
                            
                        }
                    }
                    if(this.type === 'select-one'){
                        if($(this).val().length === 0){
                            console.log(this.type + " - " + this.id);
                            is_error = true;
                        }
                    }
                    if(this.type === 'file'){
                        if($(this).val().length === 0){
                            console.log(this.type + " - " + this.id);
                            is_error = true;
                        }
                    }
                }
            });
            
            return is_error;
        }
        
        function validarRut(rut) {

            // Separa el dígito verificador del resto del RUT
            var split = rut.split('-');
            var num = split[0];
            var dv = split[1];

            // Calcula el DV usando el algoritmo de RUT chileno
            var suma = 0;
            var multiplo = 2;
            for (var i = num.length - 1; i >= 0; i--) {
                suma += num.charAt(i) * multiplo;
                if (multiplo === 7) {
                    multiplo = 2;
                } else {
                    multiplo++;
                }
            }
            var dvCalculado = 11 - (suma % 11);
            if (dvCalculado === 11) {
                dvCalculado = '0';
            } else if (dvCalculado === 10) {
                dvCalculado = 'K';
            } else {
                dvCalculado = dvCalculado.toString();
            }

            // Compara el DV calculado con el DV ingresado
            return dvCalculado.toLowerCase() === dv.toLowerCase();
        }
        
        function validarEmail(email) {
            // Expresión regular para validar correo electrónico
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return emailRegex.test(email);
        }


    </script>
  </body>
</html>