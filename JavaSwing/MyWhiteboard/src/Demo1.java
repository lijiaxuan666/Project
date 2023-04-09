import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.geom.Line2D;
import java.awt.image.BufferedImage;

public class Demo1 extends JFrame {

    private static final long serialVersionUID = 1L;
    Plot plot;
    JPanel loginPanel;
    JPanel toolPanel;
    JPanel chatPanel;
    JButton clearButton;

    //创建绘图面板
    class Plot extends JPanel {

        private static final long serialVersionUID = 1L;
        private  static  final int width =  700;
        private  static  final int height = 500;

        BufferedImage buffer = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        int x1, x2, y1, y2;
        boolean recBool = false;
        boolean curBool = true;
        int mode = 0;
        boolean ifClicked = false;

        public Plot(){
            setBackground(Color.white);
            x1 = 0; x2 = 0; y1 = 0; y2 = 0;


            addMouseListener(new MouseAdapter() {
                @Override
                public void mouseClicked(MouseEvent e) {
                }
                @Override
                public void mousePressed(MouseEvent e) {
                    if(curBool){
                        x1 = e.getX();  x2 = e.getX();
                        y1 = e.getY();  y2 = e.getY();
                    }
                    else {
                        x1 = e.getX();
                        y1 = e.getY();
                    }
                }
                @Override
                public void mouseReleased(MouseEvent e) {
                    if(curBool){
                    }
                    else {
                        x2 = e.getX();
                        y2 = e.getY();
                        mode = 1;
                        repaint();
                    }
                }
            });
            addMouseMotionListener(new MouseAdapter() {
                @Override
                public void mouseDragged(MouseEvent e) {
                    if(curBool){
                        x2 = x1; y2 = y1;
                        x1 = e.getX(); y1 = e.getY();
                        mode = 1;
                        repaint();
                    }
                }
            });
        }

        //保存住痕迹的思路：通过BufferImage类型存住每次更新后的图象
        //修改为修改BufferImage生成的Graphics bufferP     通过使用draw函数修改bufferP即可修改BufferImage存储的图象
        //调用repaint中会调用paint  而paint会调用paintComponent 所以在paintComponent修改内容既可以达到更新图像的效果
        //每次在最后g.drawImage(bufferP, x, y, this)可将更新后的bufferP显示
        protected void paintComponent(Graphics g){
            super.paintComponent(g);
            Graphics2D gnow = (Graphics2D) g;
            Graphics2D bufferP = buffer.createGraphics();//存储部分

            if(!ifClicked){
                buffer.getGraphics().fillRect(0, 0, width, height);
                ifClicked = true;
            }
            bufferP.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);//为呈现算法设置单个首选项的值
            //笔画属性，
            BasicStroke bs = new BasicStroke( 10.1f,BasicStroke.CAP_ROUND,BasicStroke.JOIN_BEVEL);
            Color c1 = new Color(22, 147, 140);//创建红绿蓝不透明的srgb颜色
            bufferP.setColor(c1);
            bufferP.setStroke(bs);//设置笔画属性
            if(mode == 0){              bufferP.drawRect(x1, y1, x2 - x1, y2 - y1);
                                        gnow.drawImage(buffer, 0 , 0, this);
            }
            else{
                Line2D.Double curs=new Line2D.Double(x1, y1, x2, y2);
                bufferP.draw(curs);
                gnow.drawImage(buffer, 0, 0, this);
            }
        }
        public void updatae(Graphics g){ this.paint(g); }
        public void clear(){
            ifClicked = false;
            x1 = 0; x2 = 0; y1 = 0; y2 = 0;
            mode = 0;
            buffer = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
            repaint();
        }
    };
    public void setButtonShape(JButton jButton) {
        jButton.setPreferredSize(new Dimension(100,30));
        jButton.setBackground(new Color(0x57B1ED));
        jButton.setBorder(BorderFactory.createRaisedBevelBorder());
        jButton.setFont(new  Font("宋体",Font.BOLD,16));
    }

    //初始化窗体
    private void initialize(){
        plot = new Plot();
        loginPanel = new JPanel();
        toolPanel = new JPanel();
        chatPanel = new JPanel();
        clearButton = new JButton("清空");

        this.setSize(1500, 600);
        loginPanel.setBounds(0, 0, 1500, 100);
        toolPanel.setBounds(0, 100, 400, 500);
        chatPanel.setBounds(1100, 100, 400, 500);
        plot.setBounds(0, 0, 700, 500);
        setButtonShape(clearButton);
        chatPanel.add(clearButton);
        clearButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                plot.clear();
            }
        });
        add(plot);
        add(loginPanel);
        add(toolPanel);
        add(chatPanel);
        setResizable(false);

        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);//设置窗体关闭模式
        setTitle("绘图小Demo");
        setLocationRelativeTo(null);//窗体居中
        setVisible(true);//设置窗体的可见性
    }
    public Demo1(){
        super();
        initialize();
    }

    public static void main(String[] args) {
        new Demo1();
    }
}