package wyf.zrk;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class SendMail implements Runnable{
	private String name = "JavaLover@foxmail.com";
	private String pwd = "860607";
	private String from = "JavaLover@foxmail.com";
	private String to;
	private String text;
	private String title;
	
	public void setName(String name) {
		this.name = name;
	}
	public String getName() {
		return this.name;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPwd() {
		return this.pwd;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getFrom() {
		return this.from;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getTo() {
		return this.to;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitle() {
		return this.title;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getText() {
		return this.text;
	}
	
	
    //=========��ʾ��Ȩ��֤���ڲ���=========begin======================
    public static class SmtpAuthenticator extends Authenticator{   
		  private String authenUser=null;//smtp��֤�û���   
		  private String authenPass=null;//smtp��֤���� 
		  public SmtpAuthenticator(){   
		  	super();
		  }   
		    
		  public SmtpAuthenticator(String authenUser,String authenPass){   
			  super();   
			  this.authenUser=authenUser;   
			  this.authenPass=authenPass;   
		  }  		    
  
		  public void setAuthenUser(String authenUser){   
		  	  this.authenUser=authenUser;   
		  }   		    
 
		  public void setAuthenPass(String authenPass){   
		      this.authenPass=authenPass;   
		  }   

		  protected PasswordAuthentication getPasswordAuthentication(){   
			  if(authenUser==null||authenPass==null){   
			  	 return null;   
			  }   
			  return new PasswordAuthentication(authenUser,authenPass);   
		  }   
  	 }
	public void send(){ //�����ʼ���ҵ�����       
    	Properties prop=new Properties();
		prop.put("mail.transport.default","smtp");
		prop.put("mail.smtp.host","smtp.foxmail.com");
		prop.put("mail.smtp.auth","true");
		try{
			//�����Ự
			Session sess=Session.getInstance(prop,new SmtpAuthenticator(this.name,this.pwd));			
			//����Ҫ���͵���Ϣ
			Message message=new MimeMessage(sess);
			message.setSubject(this.title.trim());
			message.setContent(new String(this.text.trim().getBytes(),"ISO-8859-1"),"text/plain");			
			//������ʾ�����ʼ���ַ�Ķ���
			InternetAddress toAddr=new InternetAddress(this.to.trim());
			message.setRecipient(Message.RecipientType.TO,toAddr);			
			//������ʾ�����ʼ���ַ�Ķ���
			InternetAddress fromAddr=new InternetAddress(this.from.trim());
			message.setFrom(fromAddr);
			//�����ʼ�
			Transport transport = sess.getTransport("smtp");
			transport.connect("smtp.foxmail.com",this.name,this.pwd);
			transport.send(message);
			transport.close();
		}
		catch(Exception ea){
			System.out.println("�ʼ�����ʧ�ܣ�");
		}
	}
	public void run() {
		this.send();
	}
}
