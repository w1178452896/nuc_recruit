package com.tools;
import java.util.Calendar;

import java.util.Properties;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * 发送邮件
 * @author superJJ
 *
 */
public class SendMail {
    public void sendMessage(String smtpHost, String from,  
            String fromUserPassword, String to,  
            String messageText, String messageType) throws MessagingException{  
        Properties props = new Properties();  
        props.put("mail.smtp.host", smtpHost);  
        props.put("mail.smtp.starttls.enable","true");
        props.put("mail.smtp.port", "25");            
        props.put("mail.smtp.auth", "true");  
        Session mailSession = Session.getInstance(props,new MyAuthenticator(from,fromUserPassword));  
  
        InternetAddress fromAddress = new InternetAddress(from);  
        InternetAddress toAddress = new InternetAddress(to);  
  
        MimeMessage message = new MimeMessage(mailSession);  
  
        message.setFrom(fromAddress);  
        message.addRecipient(RecipientType.TO, toAddress);  
        message.setSentDate(Calendar.getInstance().getTime());  
        message.setSubject("伯乐网");
        message.setContent(messageText, messageType);  
  
        Transport transport = mailSession.getTransport("smtp");  
        transport.connect(smtpHost,from, fromUserPassword);  
        Transport.send(message, message.getRecipients(RecipientType.TO));  
        System.out.println("message yes");  
    }    
    
}  
  