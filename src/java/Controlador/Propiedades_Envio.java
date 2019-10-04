package Controlador;


import javax.mail.Authenticator;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.*;

public class Propiedades_Envio {

    public static void EnvioCorreo(String host, String puerto, final String usuario,
            final String clave, String destino, String suCorreo,String asunto, String mensaje) throws MessagingException {

        Properties propiedades = new Properties();
        propiedades.put("mail.smtp.host", host);
        propiedades.put("mail.smtp.port", puerto);
        propiedades.put("mail.smtp.mail.sender", suCorreo);
        propiedades.put("mail.smtp.auth", "true");
        propiedades.put("mail.smtp.starttls.enable", "true");
    
        Authenticator autenticar = new Authenticator() {
        
            @Override
            public PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication(usuario, clave);
            }
        };
        Session sesion = Session.getInstance(propiedades, autenticar);
        
        BodyPart parteDatos = new MimeBodyPart();
        parteDatos.setContent("Hola, soy: " + suCorreo, "text/html");
        
        BodyPart parteMensaje = new MimeBodyPart();
        parteMensaje.setText("\n" + mensaje);
        
        MimeMultipart todasLasPartes = new MimeMultipart();
        todasLasPartes.addBodyPart(parteDatos);
        todasLasPartes.addBodyPart(parteMensaje);
        
        Message message = new MimeMessage(sesion);
        InternetAddress[] direcciones = {new InternetAddress(destino)};
        message.setRecipients(Message.RecipientType.TO, direcciones);
        message.setSubject(asunto);
        message.setSentDate(new Date());
        message.setContent(todasLasPartes);
        
        Transport.send(message);
    }
}//fin clase propiedades
