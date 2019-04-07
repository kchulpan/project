package dynamic_beat1;

import javax.swing.JFrame;

public class DynamicBeat extends JFrame{
	public DynamicBeat() {
		//제목
		setTitle("Dynamic Beat");
		
		//사이즈
		setSize(Main.SCREEN_WIDTH, Main.SCREEN_HEIGHT);
		
		//임의로 사이즈 변경
		setResizable(false);
		
		//실행시 화면이 모니터 중앙에 위치
		setLocationRelativeTo(null);
		
		//게임종료시 프로그램도 종료되게
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		//실행된 화면이 모니터에 보이게 default:false
		setVisible(true);
	}
}
