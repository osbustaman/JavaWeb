<%@page import="Models.ExpedienteUsuario"%>
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
    
    <!-- Datatables -->
    <link href="static/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="static/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="static/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="static/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="static/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
    
    <!-- PNotify -->
    <link href="static/vendors/pnotify/dist/pnotify.css" rel="stylesheet">
    <link href="static/vendors/pnotify/dist/pnotify.buttons.css" rel="stylesheet">
    <link href="static/vendors/pnotify/dist/pnotify.nonblock.css" rel="stylesheet">
    
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
                        <li class="current-page"><a href="PanelControl?page=new_colaborador">Crear Colaborador</a></li>
                        <li><a href="PanelControl?page=list_colaborador">Listar Colaboradores</a></li>
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
                      
                        <ul class="nav nav-tabs bar_tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Crear/Editar Colaborador</a>
                            </li>
                            <%
                            if(request.getAttribute("loQueHace") == "Editar"){
                            %>
                            <li class="nav-item">
                                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Documentación Colaborador</a>
                            </li>
                            <%
                            }
                            %>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                              <br />
                                <form id="frm-add-colaborador" action="PanelControl?<% out.println(request.getQueryString()); %>" method="POST" data-parsley-validate class="form-horizontal form-label-left" >
                                    
                                    <input type="hidden" id="colaborador_id" name="colaborador_id" value="<% out.println(request.getParameter("id")); %>">
                                    
                                    <div class="item form-group">
                                        <label class="col-form-label col-md-3 col-sm-3 label-align">Rut <span class="required">*</span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 ">
                                            <input type="text" id="rut" name="rut" required="required" class="form-control requieres" value="<% if(request.getAttribute("rut")!=null){out.println((String)request.getAttribute("rut"));} %>">
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="col-form-label col-md-3 col-sm-3 label-align">Nombres <span class="required">*</span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 ">
                                            <input type="text" id="nombres" name="nombres" required="required" class="form-control requieres" value="<% if(request.getAttribute("nombres")!=null){out.println((String)request.getAttribute("nombres"));} %>">
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="col-form-label col-md-3 col-sm-3 label-align">Apellidos <span class="required">*</span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 ">
                                            <input type="text" id="apellidos" name="apellidos" required="required" class="form-control requieres" value="<% if(request.getAttribute("apellidos")!=null){out.println((String)request.getAttribute("apellidos"));} %>">
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="col-form-label col-md-3 col-sm-3 label-align">Dirección <span class="required">*</span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 ">
                                            <input type="text" id="direccion" name="direccion" required="required" class="form-control requieres" value="<% if(request.getAttribute("direccion")!=null){out.println((String)request.getAttribute("direccion"));} %>">
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
                                                for(Pais pais:paises){
                                                    String isSelected = "";
                                                    if(request.getAttribute("pais") != null && pais.getId() == (int)request.getAttribute("pais")){
                                                        isSelected = "selected";
                                                    }
                                                %>
                                                <option value="<%= pais.getId() %>" <%= isSelected %>><%= pais.getNombrePais() %></option>
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
                                                for(Region region:regiones){
                                                    String isSelected = "";
                                                    if(request.getAttribute("region") != null && region.getId() == (int)request.getAttribute("region")){
                                                        isSelected = "selected";
                                                    }
                                                %>
                                                <option value="<%= region.getId() %>" <%= isSelected %>><%= region.getNombreRegion() %></option>
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
                                                List<Comuna> comunas = (List<Comuna>) request.getAttribute("lstComunas");
                                                for (Comuna comuna : comunas) {
                                                    String isSelected = "";
                                                    if(request.getAttribute("comuna") != null && comuna.getId() == (int)request.getAttribute("comuna")){
                                                        isSelected = "selected";
                                                    }
                                                %>
                                                    <option value="<%= comuna.getId() %>" <%= isSelected %>><%= comuna.getNombreComuna() %></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="item form-group">
                                        <label class="col-form-label col-md-3 col-sm-3 label-align">Estado civil <span class="required">*</span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 ">
                                            <select id="estado_civil" name="estado_civil" class="form-control requieres" required="">
                                                <option value="">Selccione..</option>
                                                <option value="S" <% if ("S".equals(request.getAttribute("estado_civil"))) { %>selected<% } %>>Solter@</option>
                                                <option value="C" <% if ("C".equals(request.getAttribute("estado_civil"))) { %>selected<% } %>>Casad@</option>
                                            </select>

                                        </div>
                                    </div>

                                    <div class="item form-group">
                                        <label class="col-form-label col-md-3 col-sm-3 label-align">Sexo <span class="required">*</span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 ">
                                            <select id="sexo" name="sexo" class="form-control requieres" required="">
                                                <option value="">Selccione..</option>
                                                <option value="M" <% if("M".equals(request.getAttribute("sexo"))) { out.print("selected"); } %>>Masculino</option>
                                                <option value="F" <% if("F".equals(request.getAttribute("sexo"))) { out.print("selected"); } %>>Femenino</option>
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
                                                for(Cargo cargo:cargos){
                                                    String isSelected = "";
                                                    if(request.getAttribute("cargo") != null && cargo.getId() == (int)request.getAttribute("cargo")){
                                                        isSelected = "selected";
                                                    }
                                                %>
                                                <option value="<%= cargo.getId() %>" <%= isSelected %>><%= cargo.getNombreCargo() %></option>
                                                <%}%>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="item form-group">
                                        <label class="col-form-label col-md-3 col-sm-3 label-align">Fecha de ingreso <span class="required">*</span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 ">
                                            <input id="fecha_ingreso" name="fecha_ingreso" autocomplete="off" class="date-picker form-control requieres" value="<% if(request.getAttribute("fecha_ingreso")!=null){out.println((String)request.getAttribute("fecha_ingreso"));} %>" placeholder="yyyy-mm-dd" type="text" required="required" type="text" onfocus="this.type='date'" onmouseover="this.type='date'" onclick="this.type='date'" onblur="this.type='text'" onmouseout="timeFunctionLong(this)">
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
                                            <input type="password" id="password" name="password" required="required" autocomplete="off" class="form-control requieres" value="<% if(request.getAttribute("password")!=null){out.println((String)request.getAttribute("password"));} %>">
                                        </div>
                                    </div>

                                    <div class="item form-group">
                                        <label class="col-form-label col-md-3 col-sm-3 label-align">Perfil <span class="required">*</span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 ">
                                            <select id="perfil" name="perfil" class="form-control requieres" required="">
                                                <option value="">Seleccione..</option>
                                                <option value="1" <% if (request.getAttribute("perfil") != null && (int) request.getAttribute("perfil") == 1) { %>selected="selected"<% } %>>Administrador</option>
                                                <option value="2" <% if (request.getAttribute("perfil") != null && (int) request.getAttribute("perfil") == 2) { %>selected="selected"<% } %>>Colaborador</option>
                                            </select>

                                        </div>
                                    </div>

                                    <div class="ln_solid"></div>
                                    <div class="item form-group">
                                        <div class="col-md-6 col-sm-6 offset-md-3">
                                            <button type="button" class="btn btn-primary" type="reset">Limpiar Formulario</button>
                                            <% if((int)session.getAttribute("perfilId") == 1){ %>
                                            <button type="button" id="save-colaborador" class="btn btn-success">Guardar</button>
                                            <% } %>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            
                            <%
                            if(request.getAttribute("loQueHace") == "Editar"){
                            %>                
                            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                <form id="frm" name="frm" method="post" action="PanelControl?page=carga_masiva&id=<% out.println(request.getParameter("id")); %>" enctype="multipart/form-data">
                                    <input type="hidden" id="nombre_completo" name="nombre_completo">
                                    <input type="hidden" id="_rut" name="_rut">
                                    <div class="item form-group">
                                        <label class="col-form-label col-md-3 col-sm-3 label-align">Tipo archivo <span class="required">*</span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 ">
                                            <select id="tipo_archivo" name="tipo_archivo" class="form-control requieres" required="">
                                                <option value="">Seleccione..</option>
                                                <option value="FP" >Foto de perfil </option>
                                                <% if((int)session.getAttribute("perfilId") == 1){ %>
                                                <option value="OT" >Otros</option>
                                                <% } %>
                                            </select>

                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="col-form-label col-md-3 col-sm-3 label-align">Nombre imagen <span class="required">*</span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 ">
                                            <input type="text" id="nombre_imagen" name="nombre_imagen" required="required" autocomplete="off" class="form-control requieres">
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="col-form-label col-md-3 col-sm-3 label-align">Imagen <span class="required">*</span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 ">
                                            <br>
                                            <input type="file" id="upload-file" name="upload-file" class="requieres" multiple="multiple">
                                        </div>
                                    </div>

                                    <div class="ln_solid"></div>
                                    <div class="item form-group">
                                        <div class="col-md-6 col-sm-6 offset-md-3">
                                            <button type="button" id="save-documento" class="btn btn-success">Guardar</button>
                                        </div>
                                    </div>
                                </form>
                                
                                <table id="datatable-keytable" class="table table-striped table-bordered" style="width:100%">
                                        <thead>
                                          <tr>
                                            <th>ID</th>
                                            <th>NOMBRE ARCHIVO</th>
                                            <th>ACCION</th>
                                          </tr>
                                        </thead>
                                        <%
                                        List<ExpedienteUsuario> expedienteUsuarios=(List<ExpedienteUsuario>)request.getAttribute("lstExpedientes");
                                        for(ExpedienteUsuario expedienteUsuario:expedienteUsuarios){
                                        %>
                                        <tbody>
                                            <tr>
                                                <td><%= expedienteUsuario.getId() %></td>
                                                <td><%= expedienteUsuario.getNombreArchivo() %></td>
                                                <td>
                                                    <a href="<%= expedienteUsuario.getPath()%>" target="_blank" type="button" id="descargar" class="btn btn-success" onclick="">Descargar <i class="fa fa-cloud-download"></i></a>
                                                    <% if((int)session.getAttribute("perfilId") == 1){ %>
                                                    <button type="button" id="borrar" class="btn btn-danger" onclick="">Borrar <i class="fa fa-trash"></i></button>
                                                    <% } %>
                                                </td>
                                            </tr>
                                        </tbody>
                                        <%
                                        }
                                        %>
                                  </table>
                            </div>
                            <%
                            }
                            %>
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
    
            <!-- Datatables -->
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
            
            <%
            if("success".equals(request.getParameter("accion"))){
            %>
            $.alert({
                title: 'Alerta!',
                content: '<% if("add".equals(request.getAttribute("p"))){%>El colaborador fue creado con éxito<%}else{%>El colaborador fue editado con éxito<%}%>'
            });
            <%
            }
            %>
            
            $("#_rut").val($("#rut").val());
                
            $("#save-colaborador").click(function(){
               // console.log(validar_form("#frm-add-colaborador"));
                if(validar_form("#frm-add-colaborador")){
                    $.alert({
                        title: 'Alerta!',
                        content: 'Faltan campos por llenar, revise el formulario.'
                    });
                    return false;
                }else{
                    $("#frm-add-colaborador").submit();
                }
            });
            
            $("#save-documento").click(function(){
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
                    const extensionesPermitidas = ['png', 'jpg', 'gif', 'jpeg', 'pdf', 'xlsx', 'xls', 'docx', 'doc'];

                    // Validar si la extensión está permitida
                    if (!extensionesPermitidas.includes(extension)) {
                        $.alert({
                            title: 'Alerta!',
                            content: 'La extension del archivo no es valida, debe agregar un archivo con extension .png, .jpg, .gif, .jpeg, .pdf, .xlsx, .xls, .docx, .doc'
                        });
                    } else {
                        $("#nombre_completo").val($("#nombre_imagen").val() + "." + extension);
                        $("#frm").submit();
                    }
                }
            });
            
            /*$("#tipo_archivo").change(function (){
                if(this.value === "FP"){
                    $("#_rut").val($("#rut").val());
                }else{
                    $("#_rut").val($("#rut").val());
                }
            });*/
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


    </script>
  </body>
</html>