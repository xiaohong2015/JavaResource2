package com.jifeng.view;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Image;

import javax.swing.ImageIcon;
import javax.swing.JPanel;

class Panel1 extends JPanel {
	   BorderLayout borderLayout1 = new BorderLayout();
	   public static int currentImage = 0;
	   private ImageIcon image1 = null;
	   private ImageIcon image2 = null;
	   private ImageIcon image3 = null;
	   private ImageIcon image4 = null;
	   private int index = 0;
	   private int count = 0;
	   public Panel1(int type) {
	       try {
	    	  this.currentImage = type;
	           jbInit();
	       } catch (Exception exception) {
	           exception.printStackTrace();
	       }
	   }

	   private void jbInit() throws Exception {
		   new Thread(new PaintThread()).start();
	       this.setLayout(null);
	   }          
	   public static void setImage(int a){
		   currentImage = a;
	   }
	   protected void paintComponent(Graphics g) {   
	       setOpaque(false);   
	       super.paintComponent(g);    
	       if (currentImage==3){
    		   this.image1 = new ImageIcon("f1.png"); 
	           this.image2 = new ImageIcon("f2.png");
	           this.image3 = new ImageIcon("f3.png");
	           this.image4 = new ImageIcon("f4.png");
    	   }else if(currentImage==2){
    		   this.image1 = new ImageIcon("l1.png"); 
	           this.image2 = new ImageIcon("l2.png");
	           this.image3 = new ImageIcon("l3.png");
	           this.image4 = new ImageIcon("l4.png");
    	   }else if(currentImage==1){
    		   this.image1 = new ImageIcon("z1.png"); 
	           this.image2 = new ImageIcon("z2.png");
	           this.image3 = new ImageIcon("z3.png");
	           this.image4 = new ImageIcon("z4.png");
    	   }else if(currentImage==4){
    		   this.image1 = new ImageIcon("h1.png"); 
	           this.image2 = new ImageIcon("h2.png");
	           this.image3 = new ImageIcon("h3.png");
	           this.image4 = new ImageIcon("h4.png");
    	   }else{
    		   this.image1 = new ImageIcon("b1.png"); 
	           this.image2 = new ImageIcon("b2.png");
	           this.image3 = new ImageIcon("b3.png");
	           this.image4 = new ImageIcon("b4.png");
    	   }
    	   
	               Dimension d = getSize();  
	               if(index ==0){
	            	   for( int x = 0; x < d.width; x += image1.getIconWidth() )      
	     	              for( int y = 0; y < d.height; y += image1.getIconHeight() )      
	     	              g.drawImage( image1.getImage(), x, y, null, null );  
	            	      
	     	  
	               }else if(index == 1){
	            	   for( int x = 0; x < d.width; x += image2.getIconWidth() )      
		     	              for( int y = 0; y < d.height; y += image2.getIconHeight() )      
		     	              g.drawImage( image2.getImage(), x, y, null, null );  
	               }else if(index == 2){
	            	   for( int x = 0; x < d.width; x += image3.getIconWidth() )      
		     	              for( int y = 0; y < d.height; y += image3.getIconHeight() )      
		     	              g.drawImage( image3.getImage(), x, y, null, null );  
	               }
	               else if(index == 3){
	            	   for( int x = 0; x < d.width; x += image4.getIconWidth() )      
		     	              for( int y = 0; y < d.height; y += image4.getIconHeight() )      
		     	              g.drawImage( image4.getImage(), x, y, null, null );  
	               }
	   }           
	   private class PaintThread implements Runnable {

			public void run() {
				while(true) {
					
					try {
						if(count<4){
							Thread.sleep(5000);
							count++;
						}else{
							Thread.sleep(200);
							if(count<7){
								count++;
							}else{
								count=0;
							}
						}
						
						index = (index+1)%4;
						repaint();
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}
			}
		}
		
	}