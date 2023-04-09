package whiteboardClient;
import java.awt.Color;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.geom.Line2D;
import java.awt.image.BufferedImage;
import java.io.PrintWriter;
import javax.swing.*;

/*
 *
 * 画图面板
 */
public class ClientBoard extends JPanel {
    //定位点的坐标x1 y1 x2 y2
    static int[] location = new int[4];
    static final int width = 600;
    static final int height = 400;
    ClientServer clientServer;//服务器的运行方式
    static int mode = 0;            //用于判断要画什么图形
    /*
     * 1：直线
     * 2：矩形
     * 3：椭圆
     * 4：曲线
     * 5：清空
     */
    /*
     * 图形选择状态
     */
    static boolean lineboolean = true;     //为true时表明直线被选择，其他图形类似
    static boolean rectboolean = false;
    static boolean ellboolean = false;
    static boolean curboolean = false;
    static boolean isClear = false;

    static Color color = Color.black;        //初始颜色为黑色
    BufferedImage bi = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);    //图形缓存
    boolean ifClicked = false;

    //若服务器发来的消息类型不为clear和chat，表明是画图类型调用该方法
    synchronized public void drawReceive(int x1, int y1, int x2, int y2) {
        location[0] = x1;
        location[1] = y1;
        location[2] = x2;
        location[3] = y2;
        repaint();
    }

    //清除画板
    public void drawClear() {
        mode = 5;
        color = Color.black;    //颜色置为初始值，即黑色
        lineboolean = true;     //作图类型置为初始值，即直线
        rectboolean = false;
        ellboolean = false;
        curboolean = false;
        repaint();
    }

    //画图
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);

        Graphics2D g2d = (Graphics2D) g;//进行强制类型转化
        Graphics2D bg = bi.createGraphics();
        if (!ifClicked)//初始化画板
        {
            bi.getGraphics().fillRect(0, 0, width, height);
            ifClicked = true;
        }
        bg.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        bg.setColor(color);

        switch (mode) {
            case (1):
                //画直线
                Line2D.Double line = new Line2D.Double(location[0], location[1], location[2], location[3]);
                bg.draw(line);
                g2d.drawImage(bi, 0, 0, this);
                break;
            case (2):
                //画矩形
                //由于两个定位点之间有四种状态，因此需要判断
                if (location[0] <= location[2] && location[1] < location[3])
                    bg.drawRect(location[0], location[1], location[2] - location[0], location[3] - location[1]);
                else if (location[0] <= location[2] && location[1] >= location[3])
                    bg.drawRect(location[0], location[3], location[2] - location[0], location[1] - location[3]);
                else if (location[0] > location[2] && location[1] <= location[3])
                    bg.drawRect(location[2], location[1], location[0] - location[2], location[3] - location[1]);
                else
                    bg.drawRect(location[2], location[3], location[0] - location[2], location[1] - location[3]);
                g2d.drawImage(bi, 0, 0, this);
                break;
            case (3):
                //画椭圆，判断同矩形
                if (location[0] <= location[2] && location[1] < location[3])
                    bg.drawOval(location[0], location[1], location[2] - location[0], location[3] - location[1]);
                else if (location[0] <= location[2] && location[1] >= location[3])
                    bg.drawOval(location[0], location[3], location[2] - location[0], location[1] - location[3]);
                else if (location[0] > location[2] && location[1] <= location[3])
                    bg.drawOval(location[2], location[1], location[0] - location[2], location[3] - location[1]);
                else
                    bg.drawOval(location[2], location[3], location[0] - location[2], location[1] - location[3]);
                g2d.drawImage(bi, 0, 0, this);
                break;
            case (4):
                //画曲线
                Line2D.Double curs = new Line2D.Double(location[0], location[1], location[2], location[3]);
                bg.draw(curs);
                g2d.drawImage(bi, 0, 0, this);
                break;
            case (5)://清空
                bi = new BufferedImage(600, 400, BufferedImage.TYPE_INT_RGB);
                ifClicked = false;
                break;
        }
    }

    public ClientBoard(ClientServer clientServer) {
        this.clientServer = clientServer;
        location[0] = 0;
        location[1] = 0;
        location[2] = 0;
        location[3] = 0;  //一般图形需要四个点定位
    }

    public void update(Graphics g) {
        this.paint(g);
    }

}

//    public static void main(String[] args) {
//         PaintBoard paintBoard = new PaintBoard();
//         JPanel all = new JPanel();
//         JFrame main = new JFrame();
//         all.setBackground(new Color(102, 102, 102));
//         main.setSize(1200, 500);
//         main.setVisible(true);
//         main.setContentPane(all);
//         all.setLayout(null);
//         all.add(paintBoard);
//         paintBoard.setBounds(0, 20, PaintBoard.width, PaintBoard.height);
//         main.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
//
//     }
 