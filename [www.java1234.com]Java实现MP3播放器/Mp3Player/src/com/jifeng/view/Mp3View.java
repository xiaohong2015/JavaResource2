package com.jifeng.view;

import java.awt.Checkbox;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.MenuItem;
import java.awt.Rectangle;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.io.File;
import java.util.List;

import javax.swing.DefaultListModel;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JSlider;
import javax.swing.SwingConstants;
import javax.swing.Timer;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;

import mp3x.ctl.Mp3TVShow;

import org.jvnet.substance.skin.SubstanceGreenMagicLookAndFeel;

import com.jifeng.model.Mp3Info;
import com.jifeng.util.MainControl;

public class Mp3View extends JFrame{

	private JSlider processSlider = null;
	private JSlider volumnSlider = null;
	private JButton playButton = null;
	private JButton stopButton = null;
	private JButton upButton = null;
	private JButton downButton = null;
	private JButton addButton = null;
	private JButton deleteButton = null;
	private JButton faseButton = null;
	private JButton slowButton = null;
	private JButton SfaseButton = null;
	private JButton SslowButton = null;
	private JList list = null;
	private JLabel l_name = null;
	private JPanel back;
	private JLabel [] l_texts = new JLabel[9];
	private JLabel [] l_text = new JLabel[3];
	private JLabel l_time = null;
	private Checkbox checkBox = null;
	private JCheckBox treanBox = null;
	private JCheckBox muteCheckBox = null;
	private JMenuBar mb;
	private JMenu menu;
	
	private boolean progressSliderDrag = false;
	private DefaultListModel model;
	private MainControl control = null;
	private List<Mp3Info> lists;
	private Mp3Info currentMp3;
	private static int crrentList = 0;
	private Mp3TVShow  mp3TVShow = new Mp3TVShow();
	private Mp3TVShow  mp3TVShow1 = new Mp3TVShow();
	private List<Long> times = null;
	private List<String> messages = null;
	
	private Timer progressTime = null;
	private Timer nameTime = null;
	private Timer textTime = null;
	private static int currentValue = 0;
	private static long currentTime = 0;
	private static int L_WIDTH = 40;
	private static int currentLocation = 4;
	private static int currentLoca = 1;
	
	private boolean tranType = false;
	
	public enum Mp3Status{
		PLAY,PAUSE,STOP
	}
	private Mp3Status currentStatus = Mp3Status.STOP;
	
	public Mp3View(){
		setSize(760,630);
		//设置位置
		setLocation(200, 50);
		setLayout(null);
		initCompent();
		initMenu();
		this.setJMenuBar(mb);
		//设置可见
		setVisible(true);
		//点关闭按钮时退出
		this.setResizable(false);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
	}
	private void initMenu(){
		mb = new JMenuBar();
		menu = new JMenu("帮助");
		mb.add(menu);
		JMenuItem item1 = new JMenuItem("帮助");
		item1.addActionListener(new ActionListener(){

			@Override
			public void actionPerformed(ActionEvent e) {
				System.out.println("hello ");
				JOptionPane.showMessageDialog(null, "MP3使用说明：\n 该MP3实现了播放器的基本功能，除了界面上的功能 \n 在歌词上方的" +
						"< << > >> 是用来处理歌词同步的，<<表示歌词时间-0.5秒\n <表示歌词时间-0.1秒>表示歌词时间+0.1秒>>表示歌词时间+0.5秒");
			}
			
		});
		menu.add(item1);
	}
	private void initCompent(){
		processSlider = getProcessSlider();
		this.add(processSlider);
		playButton = getPlayButton();
		this.add(playButton);
		stopButton = getStopButton();
		this.add(stopButton);
		upButton = getUpButton();
		this.add(upButton);
		downButton = getDownButton();
		this.add(downButton);
		addButton = getAddButton();
		this.add(addButton);
		deleteButton = getDeleteButton();
		this.add(deleteButton);
		list = getList();
		this.add(list);
		//隐藏脉冲
		checkBox = getCheck();
		this.add(checkBox);
		//设置音量
		volumnSlider = getVolumnSlider();
		this.add(volumnSlider);
		muteCheckBox = getMuteCheckBox();
		this.add(muteCheckBox);
		//设置循环模式
		treanBox = getTranBox();
		this.add(treanBox);
		//显示时间
		l_time = new JLabel();
		l_time.setBounds(293, 40, 40, 20);
		l_time.setForeground(Color.white);
		l_time.setText("00:00");
		this.add(l_time);
		//调整歌词
		JLabel labels = new JLabel();
		labels.setText("调整歌词进度:");
		labels.setFont(new java.awt.Font("Dialog",0,15));
		labels.setForeground(Color.yellow);
		labels.setBounds(375, 70, 100, 20);
		this.add(labels);
		faseButton = getFastButton();
		this.add(faseButton);
		slowButton = getSlowButton();
		this.add(slowButton);
		SfaseButton = getSFastButton();
		this.add(SfaseButton);
		SslowButton = getSSlowButton();
		this.add(SslowButton);
		//设置脉冲
		mp3TVShow.setBounds(360, 100, 350, 270);
		//mp3TVShow.setVisible(false);
		this.add(mp3TVShow);
		mp3TVShow1.setBounds(350, 80, 1, 1);
		//mp3TVShow.setVisible(false);
		this.add(mp3TVShow1);
		l_name = getNameLabel();
		this.add(l_name);
		//歌词
		for(int i = 0; i<3; i++){
			l_text[i] = new JLabel();
			l_text[i].setHorizontalAlignment(SwingConstants.CENTER);
			//l_text[i].setText("hello world");
			l_text[i].setBounds(360,400+ i * L_WIDTH,330,20);
			this.add(l_text[i]);
		}
		
		
		control = new MainControl();
		nameTime = new Timer(100,new TextListener(l_name));
		nameTime.start();
		progressTime = new Timer(1000,new MyListener(processSlider));
		textTime = new Timer(10,new LrcListener());
	}
	
	private JButton getFastButton() {
		if (faseButton == null) {
			faseButton = new JButton();
			faseButton.setBounds(530, 70,25, 20);
			faseButton.setText(">");
			faseButton.addActionListener(new ActionListener(){
				
				public void actionPerformed(ActionEvent e) {				
					currentTime = currentTime + 200;
				}

			});
		}
		return faseButton;
	}
	private JButton getSlowButton() {
		if (slowButton == null) {
			slowButton = new JButton();
			slowButton.setBounds(500, 70,25, 20);
			slowButton.setText("<");
			slowButton.addActionListener(new ActionListener(){
				
				public void actionPerformed(ActionEvent e) {				
					currentTime = currentTime - 200;
				}

			});
		}
		return slowButton;
	}
	private JButton getSFastButton() {
		if (SfaseButton == null) {
			SfaseButton = new JButton();
			SfaseButton.setBounds(560, 70,25, 20);
			SfaseButton.setText(">>");
			SfaseButton.addActionListener(new ActionListener(){
				
				public void actionPerformed(ActionEvent e) {				
					currentTime = currentTime + 500;
				}

			});
		}
		return SfaseButton;
	}
	private JButton getSSlowButton() {
		if (SslowButton == null) {
			SslowButton = new JButton();
			SslowButton.setBounds(470, 70,25, 20);
			SslowButton.setText("<<");
			SslowButton.addActionListener(new ActionListener(){
				
				public void actionPerformed(ActionEvent e) {				
					currentTime = currentTime - 500;
				}

			});
		}
		return SslowButton;
	}
	private Checkbox getCheck(){
		if(checkBox==null){
			checkBox = new Checkbox();
			checkBox.setLabel("隐藏脉冲");
			checkBox.setBounds(600, 70, 200, 20);
			checkBox.addItemListener(new ItemListener(){

				public void itemStateChanged(ItemEvent e) {
					if(checkBox.getState()){
						back.setVisible(true);
						Mp3View.this.remove(mp3TVShow);
						Mp3View.this.repaint();
						l_text[0].setVisible(false);
						l_text[1].setVisible(false);
						l_text[2].setVisible(false);
					}else{
						back.setVisible(false);
						Mp3View.this.add(mp3TVShow);
						Mp3View.this.repaint();
						//currentMp3.getPlayer().setTVShow(mp3TVShow);
						l_text[0].setVisible(true);
						l_text[1].setVisible(true);
						l_text[2].setVisible(true);
					}
				}
				
			});
		}
		return checkBox;
	}
	private void initBack(){
		//添加歌词显示
		for(int i=0;i<9;i++){
			l_texts[i] = new JLabel();
			l_texts[i].setHorizontalAlignment(SwingConstants.CENTER);
			l_texts[i].setBounds(50, 20 + i * L_WIDTH, 200, 20);
			//l_texts[i].setText("hello world");
			back.add(l_texts[i]);
		}
		
		
	}
	private JLabel getNameLabel(){
		if(l_name == null){
			l_name = new JLabel();
			l_name.setBounds(150, 25, 100, 20);
			//l_name.setText("hello world");
			l_name.setFont(new java.awt.Font("Dialog",0,14));
			l_name.setForeground(Color.white);
		}
		return l_name;
	}
	private JSlider getProcessSlider() {
		if (processSlider == null) {
			processSlider = new JSlider();
			processSlider.setBounds(10, 40, 280, 20);
			processSlider.setValue(0);
			processSlider.addChangeListener(new ChangeListener(){

				public void stateChanged(ChangeEvent e) {
					textTime.stop();
					if(!processSlider.getValueIsAdjusting()){
						
						if(progressSliderDrag){			
							progressSliderDrag = false;
							double rate = processSlider.getValue()*1.0/processSlider.getMaximum();
							currentValue = processSlider.getValue();
							currentTime = (long) (currentMp3.getPlayer().getTotalTimeSecond()*1000 * rate);
							currentMp3.getPlayer().seek(rate);
							
						}
					}else{
						progressSliderDrag = true;
					}
					textTime.start();
				}
				
			});
		}
		return processSlider;
	}
	private JButton getPlayButton() {
		if (playButton == null) {
			playButton = new JButton();
			playButton.setBounds(150, 65,60, 20);
			playButton.setText("播放");
			playButton.addActionListener(new ActionListener(){
				
				public void actionPerformed(ActionEvent e) {				
					dealPlayButton();
					
				}

			});
		}
		return playButton;
	}
	private void dealPlayButton(){
		//currentMp3.getPlayer().setTVShow(mp3TVShow);
		if(currentStatus.equals(Mp3Status.PLAY)&&currentMp3!=null){
			currentMp3.pause();
			progressTime.stop();
			textTime.stop();
			currentStatus = Mp3Status.PAUSE;
			playButton.setText("播放");
		}else if(currentStatus.equals(Mp3Status.PAUSE)&&currentMp3!=null){
			currentMp3.goon();
			progressTime.start();
			textTime.start();
			currentStatus = Mp3Status.PLAY;
			playButton.setText("暂停");
		}else if(currentStatus.equals(Mp3Status.STOP)){
			playCurrentSong();
			currentStatus = Mp3Status.PLAY;
			playButton.setText("暂停");
		}
	}
	private JButton getStopButton() {
		if (stopButton == null) {
			stopButton = new JButton();
			stopButton.setBounds(20, 65,60, 20);
			stopButton.setText("停止");
			stopButton.addActionListener(new ActionListener(){
				
				public void actionPerformed(ActionEvent e) {				
				    currentMp3.stop();
				    progressTime.stop();
				    playButton.setText("播放");
				    currentStatus = Mp3Status.STOP;
				}

			});
		}
		return stopButton;
	}
	private JButton getUpButton() {
		if (upButton == null) {
			upButton = new JButton();
			upButton.setBounds(85, 65,60, 20);
			upButton.setText("上一首");
			upButton.addActionListener(new ActionListener(){
				
				public void actionPerformed(ActionEvent e) {				
				    int currentIndex = list.getSelectedIndex();
				    if(currentIndex>0){
				    	list.setSelectedIndex(currentIndex-1);
				    }else{
				    	
				    }
				    playCurrentSong();
				}

			});
		}
		return upButton;
	}
	private JButton getDownButton() {
		if (downButton == null) {
			downButton = new JButton();
			downButton.setBounds(220, 65,60, 20);
			downButton.setText("下一首");
			downButton.addActionListener(new ActionListener(){
				
				public void actionPerformed(ActionEvent e) {	
					int currentIndex = list.getSelectedIndex();
				    if(currentIndex<(lists.size()-1)){
				    	//currentMp3 = lists.get(currentIndex+1);
				    	list.setSelectedIndex(currentIndex+1);
				    }else{
				    	
				    }
				    playCurrentSong();
				}

			});
		}
		return downButton;
	}
	private JButton getAddButton() {
		if (addButton == null) {
			addButton = new JButton();
			addButton.setBounds(60, 530,60, 20);
			addButton.setText("添加歌曲");
			addButton.addActionListener(new ActionListener(){
				
				public void actionPerformed(ActionEvent e) {				
					loadFilesByJF();
				}

			});
		}
		return addButton;
	}
	private JButton getDeleteButton() {
		if (deleteButton == null) {
			deleteButton = new JButton();
			deleteButton.setBounds(160, 530,60, 20);
			deleteButton.setText("删除歌曲");
			deleteButton.addActionListener(new ActionListener(){
				
				public void actionPerformed(ActionEvent e) {
					  
			          int index = list.getSelectedIndex();
			          if(index >= 0){
			        	  lists.remove(index);
				          model.removeAllElements();
							for(int i=0;i<lists.size();i++){
								model.add(i, removeIndex(lists.get(i).getFile().getName()));
							}
							list.revalidate();
			          }
			          
				}

			});
		}
		return deleteButton;
	}
	private JSlider getVolumnSlider() {
		if (volumnSlider == null) {
			volumnSlider = new JSlider();
			volumnSlider.setBounds(200,90,80,20);
			volumnSlider.addChangeListener(new ChangeListener(){

				public void stateChanged(ChangeEvent e) {
					setVolumn();
				}
				
			});
		}
		return volumnSlider;
	}
	private JCheckBox getTranBox(){
		if(treanBox == null){
			treanBox = new JCheckBox();
			treanBox.setBounds(20,90,100,21);
			treanBox.setText("单曲循环");
			treanBox.addChangeListener(new ChangeListener(){
				public void stateChanged(ChangeEvent e) {
					if(treanBox.isSelected()){
						tranType = true;
					}else{
						tranType = false;
					}
				}
				
			});
		}
		return treanBox;
	}
	private JCheckBox getMuteCheckBox() {
		if (muteCheckBox == null) {
			muteCheckBox = new JCheckBox();
			muteCheckBox.setBounds(280,90,60,21);
			muteCheckBox.setText("静音");
			muteCheckBox.addChangeListener(new ChangeListener(){

				public void stateChanged(ChangeEvent e) {
					if(muteCheckBox.isSelected()){
						getVolumnSlider().setEnabled(false);
					}else{						
						getVolumnSlider().setEnabled(true);
					}
					setVolumn();
				}
				
			});
		}
		return muteCheckBox;
	}

	private void setVolumn(){
		if(currentMp3!=null){
			if(getVolumnSlider().isEnabled()){			
				double gain = getVolumnSlider().getValue()*1.0/getVolumnSlider().getMaximum();
				currentMp3.getPlayer().setVolumnGain(gain);
			}else{
				currentMp3.getPlayer().setVolumnGain(0);
			}
		}
	}

	private JList getList(){
		model = new DefaultListModel();
		
		if(list==null){
			list = new JList();
			list.setModel(model);
			list.setBounds(15, 120, 300, 400);
			list.setBackground(Color.white);
			list.setFixedCellHeight(20);
			list.addMouseListener(new MouseAdapter(){
				public void mouseClicked(MouseEvent e) {
					if(e.getClickCount() == 2){
						dealPlay();
					}
				}
			});
		}
		return list;
	}
	private void dealPlay(){
		playButton.setText("暂停");
		currentStatus = Mp3Status.PLAY;
		playCurrentSong();
	}
	private void playCurrentSong(){
		if(currentMp3!=null){
			currentMp3.stop();
			currentMp3=null;
		}
		
		if(list.getSelectedIndex()>=0){
			crrentList = list.getSelectedIndex();
			currentMp3 = lists.get(list.getSelectedIndex());
			currentMp3.getPlayer().setTVShow(mp3TVShow);
			currentMp3.on();
			l_name.setText("");
			l_name.setText(removeIndex(currentMp3.getFile().getName()));
			//处理进度条
			currentValue = 0;
			processSlider.setMaximum((int)currentMp3.getPlayer().getTotalTimeSecond());
			progressTime.start();
			//添加歌词面板
			if(back!=null){
				back.removeAll();
				this.remove(back);
				this.repaint();
				back = null;
			}
			if(removeIndex(currentMp3.getFile().getName()).equals("千里之外")||removeIndex(currentMp3.getFile().getName()).equals("菊花台")||removeIndex(currentMp3.getFile().getName()).equals("双截棍")){
				back = new Panel1(1);
			}else if(removeIndex(currentMp3.getFile().getName()).equals("为爱痴狂")){
				back = new Panel1(2);
			}else if(removeIndex(currentMp3.getFile().getName()).equals("荷塘月色")||removeIndex(currentMp3.getFile().getName()).equals("最炫民族风")){
				back = new Panel1(3);
			}else if(removeIndex(currentMp3.getFile().getName()).equals("六月的雨")){
				back = new Panel1(4);
			}else{
				back = new Panel1(0);
			}
			back.setBounds(370, 120, 330, 400);
			//back.setLayout(null);
			back.setOpaque(false);
			//back.setBackground(Color.red);
			initBack();
			if(checkBox.getState()){
				back.setVisible(true);
			}else{
				back.setVisible(false);
			}
			
			this.getContentPane().add(back);
			
			this.repaint();
			
			//处理歌词
			if(textTime!=null){
				textTime.stop();
			}
			for(int index = 0; index < 9; index++){
				l_texts[index].setText("");
			}
			for(int ind = 0; ind<3;ind++){
				l_text[ind].setText("");
			}
			if(currentMp3.getMessages().size()>1){
				
				times = currentMp3.getTimeMills();
				
				messages = currentMp3.getMessages();
				currentTime = 0;
				textTime.start();
				
			}else{
				l_text[1].setText("该歌曲暂无歌词");
				l_texts[currentLocation].setText("该歌曲暂无歌词");
			}
			
		}
		
	}
	private void loadFilesByJF(){
		JFileChooser chooser = new JFileChooser();
		chooser.setMultiSelectionEnabled(true);
		int returnVal = chooser.showOpenDialog(this);
		if(returnVal == JFileChooser.APPROVE_OPTION) {
			File[] selectedFiles = chooser.getSelectedFiles();
			control.add(selectedFiles);
			lists = control.getMpLists();
			model.removeAllElements();
			for(int i=0;i<lists.size();i++){
				model.add(i, removeIndex(lists.get(i).getFile().getName()));
			}
			list.revalidate();
			list.setSelectedIndex(0);
			if(currentMp3==null){
				currentMp3 = lists.get(list.getSelectedIndex());
			}
		}

	}
	private String removeIndex(String name){
		int ind = name.indexOf('.');
		String child = name.substring(0, ind);
		return child;
	}
	class TextListener implements ActionListener{

		private JLabel label;
		int index = 2;
		public TextListener(JLabel label){
			this.label = label;
			
		}
		@Override
		public void actionPerformed(ActionEvent e) {
			// TODO Auto-generated method stub
			label.setBounds(100+index,22,150,20);
			index = index +3;
			
			if(index > 150){
				index = 3;
			}
		}
		
	}
	class MyListener implements ActionListener{

		private JSlider lider;
		public MyListener(JSlider lider){
			this.lider = lider;
		}
		@Override
		public void actionPerformed(ActionEvent e) {
			lider.setValue(currentValue++);
			int minite = currentValue/60;
			int seconds = currentValue%60;
			String second = "";
			if(seconds>=10){
				second = seconds+"";
			}else{
				second = "0"+seconds;
			}
			l_time.setText("0"+minite+":"+second);
			if(lider.getValue() >= lider.getMaximum()-1){
				//int currentIndex = list.getSelectedIndex();
				if(tranType){
					list.setSelectedIndex(crrentList);
				}else{
					if(crrentList<(lists.size()-1)){
				    	//currentMp3 = lists.get(currentIndex+1);
				    	list.setSelectedIndex(crrentList+1);
				    }else{
				    	list.setSelectedIndex(0);
				    }
				}
			    
			    playCurrentSong();
			}
		}
		
	}
	class LrcListener implements ActionListener{

		private int i = 0;
		private long nextMill = 0;
		private String message = "";
		public void actionPerformed(ActionEvent e) {
			
			for(int j = 0;j<times.size();j++){
				nextMill = times.get(j);
				if(currentTime < nextMill){
					nextMill = times.get(j-1);
					i = j - 1;
					break;
				}
			}
			currentTime = currentTime + 10;
			if(currentTime>nextMill){
				if(message.equals(messages.get(i))){
				}else{
					
					for(int a=0;a<times.size();a++){
					}
					message = messages.get(i);
					System.out.println(message);
					for(int index=0; index < 5;index++){
				        if(index == 0){
							l_texts[(currentLocation + index)%9].setFont(new java.awt.Font("Dialog",0,22));
							l_texts[(currentLocation + index)%9].setForeground(Color.red);
							l_texts[(currentLocation + index)%9].setText(messages.get(i + index));
							l_text[currentLoca + index].setFont(new java.awt.Font("Dialog",0,22));
							l_text[currentLoca + index].setForeground(Color.red);
							l_text[currentLoca + index].setText(messages.get(i + index));
							if(i>0){
								l_text[0].setFont(new java.awt.Font("Dialog",0,16));
								l_text[0].setForeground(Color.white);
								l_text[0].setText(messages.get(i - 1));
							}
							if(i<(messages.size()-1)){
								l_text[2].setFont(new java.awt.Font("Dialog",0,16));
								l_text[2].setForeground(Color.white);
								l_text[2].setText(messages.get(i + 1));
							}
							
						}else {
							if(i+index<messages.size()){
								l_texts[(currentLocation + index)%9].setFont(new java.awt.Font("Dialog",0,16));
								l_texts[(currentLocation + index)%9].setForeground(Color.white);
								l_texts[(currentLocation + index)%9].setText(messages.get(i + index));
							}else{
								l_texts[(currentLocation + index)%9].setText("");
							}
							
						}
					}
					for(int c = 1;c<5;c++){
						if(c-1<i){
							if(currentLocation - c>=0){
								l_texts[currentLocation - c].setFont(new java.awt.Font("Dialog",0,16));
								l_texts[currentLocation - c].setForeground(Color.white);
								l_texts[currentLocation - c].setText(messages.get(i -c));
							}else{
								l_texts[currentLocation - c + 9].setFont(new java.awt.Font("Dialog",0,16));
								l_texts[currentLocation - c + 9].setForeground(Color.white);
								l_texts[currentLocation - c + 9].setText(messages.get(i -c));
							}
						}
						
					}
					for(int je = 0;je<9;je++){
						if(currentLocation >= 4){
							l_texts[(currentLocation-4 + je)%9].setBounds(20, 20 + je * L_WIDTH, 270, 20);
						}else {
							l_texts[(currentLocation + 9 -4 + je)%9].setBounds(20, 20 + je * L_WIDTH, 270, 20);
						}
					}
				}
                 
			}
			
		}
		
	}
	
	public static void main(String[]args){
		try {
			UIManager.setLookAndFeel(new SubstanceGreenMagicLookAndFeel());
		} catch (UnsupportedLookAndFeelException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Mp3View mainview = new Mp3View();
	}
}
