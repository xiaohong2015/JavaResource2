package com.jifeng.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import com.jifeng.model.Mp3Info;

public class MainControl {
	private List<Mp3Info> mpLists = new ArrayList<Mp3Info>();
	
	LrcProcessor lrc;
	public MainControl(){
		lrc = new LrcProcessor();
	}
	public void add(File[]files){
		LrcProcessor lrc = new LrcProcessor();
		File childfiles = new File("D:\\lrc");
		for(File file:files){
			Mp3Info mp3Info = new Mp3Info();
			mp3Info.setFile(file);
			for(File fi:childfiles.listFiles()){
				if(removeIndex(fi.getName()).equals(removeIndex(file.getName()))){
					try {
						InputStream input = new FileInputStream(fi);
						lrc.process(input, mp3Info.getTimeMills(), mp3Info.getMessages());
						
						
					} catch (FileNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					break;
				}
			}
			mpLists.add(mp3Info);
		}
		
	}
	private String removeIndex(String name){
		int ind = name.indexOf('.');
		String child = name.substring(0, ind);
		return child;
	}
	public List<Mp3Info> getMpLists() {
		return mpLists;
	}
	public void setMpLists(List<Mp3Info> mpLists) {
		this.mpLists = mpLists;
	}
	
}
