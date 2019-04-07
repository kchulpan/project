package dynamic_beat4;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;

import javazoom.jl.player.Player;

public class Music extends Thread{
	
	private Player player;
	private boolean isLoop;// 무한반복인지 1회실행인지 여부
	private File file;
	private FileInputStream fis;
	private BufferedInputStream bis;
	
	public Music(String name, boolean isLoop) {
		try {
			this.isLoop = isLoop;
			file = new File(Main.class.getResource("../music/" + name).toURI());
			fis = new FileInputStream(file);
			bis = new BufferedInputStream(fis);
			player = new Player(bis);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public int getTime() {
		if(player == null)
		{
			return 0;
		}
		return player.getPosition();
	}
	
	// 음악이 실행되는 도중 언제나 취소할 수 있는 함수
	public void close() {
		isLoop = false;
		player.close();
		
		//실행한 곡을 종료하는 것
		this.interrupt();
	}
	
	// Thread를 상속받으면 무조건 override 해줘야 하는 함수
	@Override
	public void run() {
		try {
			do {
				player.play();
				fis = new FileInputStream(file);
				bis = new BufferedInputStream(fis);
				player = new Player(bis);
			}while(isLoop);
		}catch (Exception e){
			System.out.println(e.getMessage());
		}
		
	}
}
