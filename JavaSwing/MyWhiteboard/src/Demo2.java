import javax.swing.*;
import java.awt.*;

public class Demo2 extends JPanel {
    public void paint(Graphics g){
        super.paint(g);
        g.setColor(Color.orange);
        g.fillRect(20, 50, 100, 100);
    }
    public static void main(String[] args){
        JFrame frame = new JFrame();
        Demo2 panel = new Demo2();
        JLabel label = new JLabel("aaa");
        panel.setBackground(Color.blue);
        panel.add(label);
        frame.add(panel);
        frame.setDefaultCloseOperation (JFrame.EXIT_ON_CLOSE);
        frame.setSize(300, 300);
        frame.setVisible(true);
    }
}