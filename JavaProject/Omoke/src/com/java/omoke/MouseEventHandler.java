package com.java.omoke;

import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

public class MouseEventHandler extends MouseAdapter {
	private Map map;
	private MapSize ms;
	private DrawBoard d;
	private GUI main;
	
	public MouseEventHandler(Map m, MapSize ms, DrawBoard d, GUI main) {
		map = m;
		this.ms = ms;
		this.d = d;
		this.main = main;
	}
	
	@Override
	public void mousePressed(MouseEvent arg0) {
		super.mousePressed(arg0);
		//�Էµ� x, y ��ǥ�� Cell(30)�� ���� ���� ���� 1, 2�� ���� 0~19���̷� ����
		
		int x = (int) Math.round(arg0.getX()/(double) ms.getCell()) -1;
		int y = (int) Math.round(arg0.getY()/(double) ms.getCell()) -2;
		
		if( x < 0 || x > 19 || y < 0 || y > 19) {
			return;
		}
		
		// �̹� ������ �ڸ��� ��� return
		if(map.getXY(y, x) == map.getBlack() || map.getXY(y, x) == map.getWhite()) {
			return;
		}
		
		System.out.println(x + " " + y); // ���� ��ǥ�� Ȯ��
		map.setMap(y, x); // �Էµ� ��ǥ�� �迭�� ���� ǥ��
		map.changeCheck(); // ���ʸ� �ٲ�
		d.repaint();// ���� ���Ӱ� �ٽ� �׸�
		
		// �¸� ���θ� Ȯ�� �ϰ� �¸��� ���� �˾�â���� ���
		if(map.winCheck(x, y)) {
			if(map.getCheck() == true) {
				main.showPopUp("���� �¸� �Ͽ����ϴ�");
			}else {
				main.showPopUp("���� �¸� �Ͽ����ϴ�");
			}
		}
	}
	
}
