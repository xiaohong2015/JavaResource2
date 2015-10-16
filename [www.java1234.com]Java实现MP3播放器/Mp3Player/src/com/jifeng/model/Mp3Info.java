package com.jifeng.model;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import mp3x.ctl.PlayerControl;

public class Mp3Info {
	private PlayerControl player = new PlayerControl(); 
    private File file;
    private List<Long> timeMills = new ArrayList<Long>();
    private List<String> messages = new ArrayList<String>();
   
	 public File getFile() {
		return file;
	}
    public void on(){
    	player.openSong(file.getAbsolutePath());
    	player.play();
    }
    public void goon(){
    	player.resume();
    }
    public void pause(){
    	player.pause();
    }
    public void stop(){
    	player.stop();
    }
	public void setFile(File file) {
		this.file = file;
	}

	public List<Long> getTimeMills() {
		return timeMills;
	}

	public void setTimeMills(List<Long> timeMills) {
		this.timeMills = timeMills;
	}

	public List<String> getMessages() {
		return messages;
	}

	public void setMessages(List<String> messages) {
		this.messages = messages;
	}

	public PlayerControl getPlayer() {
		return player;
	}

	
}
