

<%-- vamos a usar la directiva @page  --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Map"%>

<%-- a esto se le conoce como scriptles, código Java--%>
<%-- Con los atributos recogemos los datos del Servlet--%>
<% 
    Map<String, String> errors = (Map<String, String>)request.getAttribute("Errores");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"
            name="viewport" content="width=device-width, initial-scale=1.0">
        <%-- getContextPath devuelve el nombre del proyecto --%>
        <link href="<%=request.getContextPath()%>/CSS/bootstrap.min.css" rel="stylesheet">
        <title>Formulario de Usuarios</title>
    </head>
    <body class="bg-dark">
        
        <%--Esto muestra los errores arriba del formulario como una lista--@>
        <%--
        <%
            if(errors != null && errors.size() > 0){
        %>

        <ul class="alert alert-danger mx-5 px-5">
            <% for(String error : errors.values()){%>
                <li><%=error%></li>
             <%}%>
        </ul>
        <%}%>
        --%>
        <div class="modal-dialog  modal-lg text-center bg-light mt-5 p-4">
            <div class="modal-content bg-transparent p-3">
            <h3 class="display-7 mt-2 mb-3">Formulario De Usuarios</h3>
            <div class="px-7">
                <form action="/First_Web_App_Form/registro" method="post" class="col-12"/>
                
                    <div class="row">
                        <div class="col-6">
                            <div class="row mb-2 mt-4 m-2">
                                <label for="username" class="col-form-label col-sm-2 m-2">Usuario:</label>
                                <%-- value ${param.} lo utilizamos para almacenar los valores que haya metido
                                el usuario y no se pierdan en caso de que se equivoque al rellenar cualquier otro campo--%>
                                <div class="col-sm-8"><input type="text" name="username" id="username" 
                                    class="form-control" value="${param.username}"/></div>
                            </div>
                            <%
                                if (errors != null && errors.containsKey("username")) {
                                        out.println("<div class='row col-sm-11 d-flex justify-content-center' "
                                            + "style='color: red;'>"+ errors.get("username") + "</div>");
                                }
                            %>

                        </div>

                        <div class="col-6">
                            <div class="row mb-2 mt-4 m-2">
                                <label for="password" class="col-form-label col-sm-3 m-2">Contraseña:</label>
                                <div class="col-sm-8 mr-0"><input type="password" name="password" id="password" class="form-control"/></div>
                            </div>
                            <%
                                if (errors != null && errors.containsKey("password")) {
                                        out.println("<div class='row mb-5 col-sm-11 d-flex justify-content-center"
                                            + " col-sm-4' style='color: red;'>"+ errors.get("password") + "</div>");
                                }
                            %>
                        </div>
                    </div>
                   
                    <div class="row">
                        <div class="col-6">
                           <div class="row mb-2 m-2">
                                <label for="email" class="col-form-label col-sm-2 m-2">Email:</label>
                                <!<!-- Se comenta y se reemplaza por el de más abajo -->
                                <!--<div class="col-sm-8"><input type="text" name="email" id="email" class="form-control" value="${param.email}"/></div> -->   
                                <div class="col-sm-8">
                                    <div class="input-group">
                                      <div class="input-group-prepend">
                                        <div class="input-group-text">@</div>
                                      </div>
                                        <input type="text" name="email" id="email" class="form-control" 
                                            value="${param.email}" placeholder="user@user.com">
                                    </div>
                                </div>

                           </div>
                            <%
                                if (errors != null && errors.containsKey("email")) {
                                        out.println("<div class='row mb-4 col-sm-11 d-flex justify-content-center' style='color:"
                                            + " red;'>"+ errors.get("email") + "</div>");
                                }
                            %> 
                        </div>

                        <div class="col-6">
                            <div class="row mb-2 m-2">
                            <label for="country" class="col-form-label col-sm-2 m-2">País:</label>
                            <div class="col-sm-9 mr-0">
                                <select name="country" id="country" class="form-select">
                                    <option value="">-- Selecionar --</option>
                                    <option value="ES" ${param.country.equals("ES")? "selected" : ""}>España</option>
                                    <option value="MX" ${param.country.equals("MX")? "selected" : ""}>México</option>
                                    <option value="CL" ${param.country.equals("CL")? "selected" : ""}>Chile</option>
                                    <option value="AR" ${param.country.equals("AR")? "selected" : ""}>Argentina</option>
                                    <option value="PE" ${param.country.equals("PE")? "selected" : ""}>Perú</option>
                                    <option value="CO" ${param.country.equals("CO")? "selected" : ""}>Colombia</option>
                                    <option value="VE" ${param.country.equals("VE")? "selected" : ""}>Venezuela</option>
                                </select>
                            </div>    
                        </div>
                        <%
                            if (errors != null && errors.containsKey("country")) {
                                    out.println("<div class='row mb-4 col-sm-11  d-flex justify-content-center' "
                                        + "style='color: red;'>"+ errors.get("country") + "</div>");
                            }
                        %>
                        </div>
                    </div>
                    
                    <div class="row">
                        <label for="lenguajes" class="col-form-label col-sm-2 p-1 m-5 lb-md">Lenguajes de programación:</label>
                        <div class="col-sm-7 m-4">
                            <select name="lenguajes" id="lenguajes" multiple class="form-select">
                                <option value="java">Java SE</option>
                                <option value="jakartae">Jakarta EE9</option>
                                <option value="spring">Spring Boot</option>
                                <option value="js">Javascript</option>
                                <option value="angular">React</option>
                            </select>
                        </div>
                    </div>
                    <%
                        if (errors != null && errors.containsKey("lenguajes")) {
                                out.println("<div class='row mb-4 col-sm-11  d-flex justify-content-center' "
                                    + " col-sm-4' style='color: red;'>" + errors.get("lenguajes") + "</div>");
                        }
                    %>

                    <div class="row mb-3 d-flex justify-content-center">
                        <div class="col-4">
                            <strong><label class="col-form-label col-sm-1 d-flex
                                    justify-content-center">Roles:</label></strong>
                            <div>
                                <div class="form-check col-sm-2">
                                    <input type="checkbox" name="roles" value="ROLE_USER" class="form-check-input">
                                    <label class="form-check-label">Usuario</label>
                                </div>
                                <div class="form-check col-sm-2">
                                    <input type="checkbox" name="roles" value="ROLE_MODERATOR" class="form-check-input">
                                    <label class="form-check-label">Moderador</label>
                                </div>
                                <div class="form-check col-sm-2">
                                    <input type="checkbox" name="roles" value="ROLE_ADMIN" class="form-check-input">
                                    <label class="form-check-label">Administrador</label>
                                </div>
                                <%
                                    if (errors != null && errors.containsKey("roles")) {
                                            out.println("<div class='row mb-4 col-sm-11  d-flex justify-content-center'"
                                                + " style='color: red;'>"+ errors.get("roles") + "</div>");
                                    }
                                %>
                            </div>    
                        </div>

                        <div class="col-4">
                            <div class="row mb-3">
                                <strong><label class="col-form-label col-sm-2 d-flex justify-content-center">Idiomas:</label></strong>
                            <div>
                                <div class="form-check col-sm-2">
                                    <input type="radio" name="idiom" value="es" class="form-check-input" >
                                    <label class="form-check-label">Español</label>
                                </div>
                                <div class="form-check col-sm-2">
                                    <input type="radio" name="idiom" value="en" class="form-check-input" >
                                    <label class="form-check-label">Inglés</label>
                                </div>
                                <div class="form-check col-sm-2">
                                    <input type="radio" name="idiom" value="fr" class="form-check-input" >
                                    <label class="form-check-label">Francés</label>
                                </div>

                            </div>
                            <%
                                if (errors != null && errors.containsKey("idiom")) {
                                        out.println("<div class='row mb-4   col-sm-11 d-flex justify-content-center' "
                                            + "col-sm-4' style='color: red;'>"+ errors.get("idiom") + "</div>");
                                }
                            %>

                        </div>          
                    </div>     
                    <div class="col-2">
                        <div class="form-check">
                            <strong><label for="Habilitar" class="col-form-label">Habilitar:</label></strong>
                            <div>
                                <input type="checkbox" name="habilitar" id="habilitar" 
                                    checked class="form-check-input">
                            </div>
                        </div>
                    </div>
                        
                    <div>
                        <div>
                            <input type="hidden" name="secret" value="1234">
                        </div>
                    </div>
                    <div class="row mb-2 d-flex justify-content-center">
                        <input type="submit" value="Enviar" class="btn btn-default 
                            shadow bg-info btn-lg col-8"/>
                    </div>
                </form>
            </div>
                
        </div>  
    </body>
</html>

