/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.lang.model.SourceVersion;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/First_Web_App_Form/registro")
public class FormServlet extends HttpServlet {

    
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        resp.setContentType("text/html");
        //Se pasa de parámetro el NAME de los INPUTS
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String country = req.getParameter("country");        
        String[] lenguajes = req.getParameterValues("lenguajes");
        String[] roles = req.getParameterValues("roles");

        String idiom = req.getParameter("idiom");
        boolean enable = req.getParameter("habilitar") != null &&
                req.getParameter("habilitar").equals("on");
        String secret = req.getParameter("secret");

        Map<String, String> errors = new HashMap<>();
        
        if(username == null || username.isBlank())
            errors.put("username","Nombre se usuario obligatorio!");
        
        if(password == null || username.isBlank())
            errors.put("password", "Contraseña no puede estar vacía!");
        
        if(email == null || !email.contains("@"))
            errors.put("email",  "Email obligatorio con formato correcto");
        
        if(country == null || country.equals("") || country.equals(" "))
            errors.put("country",  "País obligatorio");
        
        if(lenguajes == null || lenguajes.length == 0)
            errors.put("lenguajes",  "Debe selecionar al menos un lenguaje!");
        
        if(roles == null || roles.length == 0)
            errors.put("roles",  "Selecione al menos un rol!");
        
        if(idiom == null)
            errors.put("idiom",  "Debe selecionar un idioma!");
        
        if(errors.isEmpty()){
            try(PrintWriter out = resp.getWriter()){
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("     <head>");
                out.println("         <meta charset=\"UTF-8\">");
                out.println("             <tittle></tittle");
                out.println("     </head>");
                out.println("     <body>");
                out.println("         <h1>Resultado Form!</h1>");
                out.println("         <ul>");
                    out.println("             <li>Usuario: " + username +"<li/>");
                    out.println("             <li>Contraseña: " + password +"<li/>");
                    out.println("             <li>Email: " + email +"<li/>");
                    out.println("             <li>País: " + country +"<li/>");

                    out.println("             <li>Lenguajes: <ul>");             
                    Arrays.asList(lenguajes).forEach(lenguaje -> {
                        out.println("    <li>" + lenguaje + "</li>");
                    });
                    out.println("             </ul></li>");

                    out.println("             <li>Roles: <ul>");      
                    Arrays.asList(roles).forEach(role -> {
                        out.println("                  <li>" + role + "</li>");
                    });
                    out.println("              </ul></li>");   

                    out.println("           <li>Idioma: " + idiom + "</li>");
                    out.println("           <li>Habilitado: " + enable + "</li>");
                    out.println("           <li>Secreto: " + secret + "</li>");
                //si hay campos vacíos se muestran los errores
                out.println("         </ul>");
                out.println("     </body>");
                out.println("</html>");
            }
        } else {
            //errors.forEach(error -> {
            //out.println("<li>" + error + "</li>");
            //});
            //como un link para volver atrás en el formulario
            //out.println("<p><a href=\"/index.html\">volver</a></p>");
                

            // Los atributos nos permiten pasar datos de un servlet a un
            // JSP o de un servlet a otro servlet
            // Para reedireccionar este request a la vista utilizamos
            // getServletContext
            req.setAttribute("Errores", errors);
            // usamos el foward para direccionar la información
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
            }
    }

}
