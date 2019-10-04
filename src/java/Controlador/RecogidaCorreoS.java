package Controlador;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import javax.mail.MessagingException;
import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author APRENDIZ
 */
@WebServlet(urlPatterns = {"/RecogidaCorreoS"})
public class RecogidaCorreoS extends HttpServlet {
    
    private String host;
    private String puerto;
    private String usuario;
    private String clave;
    
    @Override
    public void init(){
    
        ServletContext context = getServletContext();
        
        host = context.getInitParameter("host");
        puerto = context.getInitParameter("puerto");
        usuario = context.getInitParameter("usuario");
        clave = context.getInitParameter("clave");
        
    }

    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String destino = request.getParameter("destino");
        String asunto = request.getParameter("asunto");
        String mensaje = request.getParameter("mensaje");
        String suCorreo = request.getParameter("suCorreo");
        
        String resultado = "";
        
        try {
            Propiedades_Envio.EnvioCorreo(host, puerto, usuario, clave, destino, suCorreo, asunto, mensaje);
            resultado = "Mensaje Enviado";
       
        } catch (MessagingException e) { 
            
            resultado = "Error al enviar el mensaje" + e.toString();
        }finally{
            
            request.setAttribute("MensajeResultado", resultado);
        
        }
       request.getRequestDispatcher("Java_mail.jsp").forward(request, response);
    }



}
