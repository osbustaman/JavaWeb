<%@page import="java.util.List"%>
<%@page import="Models.Colaborador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <link href="static/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="static/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="static/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="static/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="static/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
    
    <link href="static/vendors/jquery.confirm/dist/jquery-confirm.min.css" rel="stylesheet">
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
                <img src="<% out.println(session.getAttribute("imagenColaborador")); %>" alt="..." class="img-circle profile_img">
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
                        <% if((int)session.getAttribute("perfilId") == 2){ %>
                        <li><a href="PanelControl?page=edit_colaborador&id=<%= session.getAttribute("id") %>">Mis datos</a></li>
                        <% }else{ %>
                        <li><a href="PanelControl?page=new_colaborador">Crear Colaborador</a></li>
                        <li class="current-page"><a href="PanelControl?page=list_colaborador">Listar Colaboradores</a></li>
                        <% } %>
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
                      <img src="<% out.println(session.getAttribute("imagenColaborador")); %>" alt=""><% out.println(session.getAttribute("nombre") + " " + session.getAttribute("apellidos")); %>
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
                <h3>Listado de colaboradores</h3>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12  ">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Listado de colaboradores</h2>
                    
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                      <ul class="nav nav-tabs bar_tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Colaboradores</a>
                            </li>
                            <% if((int)session.getAttribute("perfilId") == 1){ %>
                            <li class="nav-item">
                                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Carga Masiva</a>
                            </li>
                            <% } %>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <table id="datatable-keytable" class="table table-striped table-bordered" style="width:100%">
                                        <thead>
                                          <tr>
                                            <th>ID</th>
                                            <th>RUT</th>
                                            <th>NOMBRES</th>
                                            <th>APELLIDOS</th>
                                            <th>ESTADO CIVIL</th>
                                            <th>SEXO</th>
                                            <th>CARGO</th>
                                            <th>PERFIL</th>
                                            <th>ACCIONES</th>
                                          </tr>
                                        </thead>


                                        <tbody>
                                            <%
                                            List<Colaborador> colaboradores=(List<Colaborador>)request.getAttribute("lstColaboradores");
                                            for(Colaborador colaborador:colaboradores){
                                            %>
                                            <tr>
                                                <td><%= colaborador.getId() %></td>
                                                <td><%= colaborador.getRut()%></td>
                                                <td><%= colaborador.getNombres()%></td>
                                                <td><%= colaborador.getApellidos()%></td>
                                                <td><% if(colaborador.getEstadoCivil().equals("S")){out.println("Solter@");}else{out.println("Casad@");} %></td>
                                                <td><% if(colaborador.getSexo().equals("M")){out.println("Masculino");}else{out.println("Femenino");} %></td>
                                                <td><%= colaborador.getCargo().getNombreCargo() %></td>
                                                <td><% if(colaborador.getPerfil() == 1){out.println("Administrador");}else{out.println("Colaborador");} %></td>
                                                <td>
                                                    <button type="button" id="editar" class="btn btn-info" onclick="irAEditar(<%= colaborador.getId() %>)">Editar <i class="fa fa-edit"></i></button>
                                                    <% if((int)session.getAttribute("perfilId") == 1){ %>
                                                    <button type="button" id="borrar" class="btn btn-danger" onclick="deleteColaborador(<%= colaborador.getId() %>)">Borrar <i class="fa fa-trash"></i></button>
                                                    <% } %>
                                                </td>
                                            </tr>
                                            <%}%>
                                        </tbody>
                                  </table>
                            </div>
                            <% if((int)session.getAttribute("perfilId") == 1){ %>
                            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                <form id="frm" name="frm" method="post" action="PanelControl?page=carga_masiva" enctype="multipart/form-data">
                                    <div class="item form-group">
                                        <label class="col-form-label col-md-3 col-sm-3 label-align">Subir excel <span class="required">*</span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 ">
                                            <br>
                                            <input type="file" id="upload-file" name="upload-file" class="requieres">
                                            <br>
                                            <small>formatos correctos .xls y .xlsx</small>
                                        </div>
                                    </div>

                                    <div class="ln_solid"></div>
                                    <div class="item form-group">
                                        <div class="col-md-6 col-sm-6 offset-md-3">
                                            <button type="button" class="btn btn-primary" type="reset">Limpiar Formulario</button>
                                            <button type="button" id="upload-excel" name="upload-excel" class="btn btn-success">Guardar</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <% } %>
                        </div>
                      
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
            Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
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
    <script src="static/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="static/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="static/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="static/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="static/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="static/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="static/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="static/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="static/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="static/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="static/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="static/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
    <script src="static/vendors/jszip/dist/jszip.min.js"></script>
    <script src="static/vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="static/vendors/pdfmake/build/vfs_fonts.js"></script>
    
    <script src="static/vendors/jquery.confirm/dist/jquery-confirm.min.js"></script>
    
    
    <!-- Custom Theme Scripts -->
    <script src="static/build/js/custom.min.js"></script>
    
    <script>
        
        $(document).ready(function(){
            $("#upload-excel").click(function(){
                if(validar_form("#frm")){
                    $.alert({
                        title: 'Alerta!',
                        content: 'Debe agregar un archivo de tipo excel!'
                    });
                    return false;
                }else{
                    // Obtener el archivo cargado
                    const archivo = document.getElementById('upload-file').files[0];

                    // Obtener la extensión del archivo
                    const extension = archivo.name.split('.').pop();

                    // Lista de extensiones permitidas
                    const extensionesPermitidas = ['xls', 'xlsx'];

                    // Validar si la extensión está permitida
                    if (!extensionesPermitidas.includes(extension)) {
                        $.alert({
                            title: 'Alerta!',
                            content: 'La extension del archivo no es valida, debe agregar un archivo con extension .xls o .xlsx!'
                        });
                    } else {
                        $("#frm").submit();
                    }
                }
            });
        });
        
        function validar_form(frm){
            var is_error = false;
            // Desde aqui se recorre el form, y asi se encuentran los inputs 
            $(frm).find(':input').each(function(){
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
                                    is_error = true;
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
                                        is_error = true;
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
        
        function irAEditar(id){
            location.href="http://localhost:8080/JavaWeb/PanelControl?page=edit_colaborador&id="+id;
        }
        
        function deleteColaborador(id){
            $.confirm({
                title: 'Confirm!',
                content: 'Esta seguro de borrar al colaborador?, para borrar haga clic en confirmar de lo contrario en cancelar',
                buttons: {
                    confirmar: function () {
                        location.href="http://localhost:8080/JavaWeb/PanelControl?page=delete_colaborador&id="+id;
                    },
                    cancelar: function () {
                    }
                }
            });
        }
    </script>
  </body>
</html>