package com.omfys.crm.utility;

import java.util.ArrayList;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Component;

import com.omfys.crm.model.RenewedMailCommunication;


@Component
public class MailService {
	
	final String user = "hrdesk@omfysgroup.com"; // for production

	 final String password = "0mfysMa1l@123"; // change accordingly
	
	//final String user = "santosh.kotgyale@omfysgroup.com";// for UAT
	
	//final String password = "Santosh@123";// change accordingly
	
	public void updatedSendMail(RenewedMailCommunication renewMailObj) throws MessagingException {
		
				String host = "mail.omfysgroup.com";
				final String port = "587";
			
				Properties props = new Properties();
				props.put("mail.smtp.host", host);
				props.put("mail.smtp.port", port);
				props.put("mail.smtp.auth", "true");
				
				
			
				//String to = renewMailObj.getTo_mail(); 
				//ArrayList<String> cc = renewMailObj.getCc_mail();
				
				String cc = null; 
		 	    String to = "priyanka.shukla@omfysgroup.com"; 
			   
			    
			    Session session1 = Session.getInstance(props, new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(user, password);
					}
				});
			
				MimeMessage message1 = new MimeMessage(session1);
				message1.setFrom(new InternetAddress(user));
				message1.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
				
				if (cc != null) {
					
//					InternetAddress[] address = new InternetAddress[cc.size()];
//				    for (int i = 0; i < cc.size(); i++) {
//				    	System.out.println("cc mail is "+cc.get(i));
//				        address[i] = new InternetAddress(cc.get(i));
//				    }
				    

				   // message1.setRecipients(Message.RecipientType.CC, address);
					
				}
				
				message1.setSubject(renewMailObj.getSubject());
			
				try {
					message1.setContent(renewMailObj.getBody(), "text/html");
				} catch (MessagingException e1) {
					e1.printStackTrace();
				}
				try {
					Transport.send(message1);
//					System.out.println("mail send updatedSendMail"+to );
				} catch (MessagingException e) {
				
					e.printStackTrace();
				}

		}

}
