package whiteboardServer;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseMotionAdapter;
import java.awt.geom.Line2D;
import java.awt.image.BufferedImage;
import javax.swing.*;

/*
 *
 * 画图面板
 */
public class PaintBoard extends JPanel
{
    //定位点的坐标x1 y1 x2 y2
    static int [] location=new int[4];
    static final int width = 600;
    static final int height = 400;
    ServerServer serverServer;//服务器的运行方式
    static int mode=0;            //用于判断要画什么图形
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
    static boolean lineboolean=true;     //为true时表明直线被选择，其他图形类似
    static boolean rectboolean=false;
    static boolean ellboolean=false;
    static boolean curboolean=false;
    static boolean isClear=false;

    static Color color=Color.black;        //初始颜色为黑色
    BufferedImage bi=new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);    //图形缓存
    String message=null;
    boolean ifClicked=false;
    //若服务器发来的消息类型不为clear和chat，表明是画图类型调用该方法
    synchronized public void drawReceive(int x1,int y1,int x2,int y2)
    {
        location[0]=x1;
        location[1]=y1;
        location[2]=x2;
        location[3]=y2;
        repaint();
    }
    //清除画板
    public void drawClear()
    {
        mode=5;
        repaint();
    }

    //画图
    protected void paintComponent(Graphics g)
    {
        super.paintComponent(g);

        Graphics2D g2d = (Graphics2D) g;//进行强制类型转化
        Graphics2D bg = bi.createGraphics();
        if(!ifClicked)//初始化画板
        {
            bi.getGraphics().fillRect(0, 0, width, height);
            ifClicked=true;
        }
        bg.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        bg.setColor(color);

        switch(mode)
        {
            case(1):
                //画直线
                Line2D.Double line=new Line2D.Double(location[0],location[1],location[2],location[3]);
                bg.draw(line);
                g2d.drawImage(bi, 0, 0, this);
                break;
            case(2):
                //画矩形
                //由于两个定位点之间有四种状态，因此需要判断
                if(location[0]<=location[2]&&location[1]<location[3])
                    bg.drawRect(location[0],location[1],location[2]-location[0],location[3]-location[1]);
                else if(location[0]<=location[2]&&location[1]>=location[3])
                    bg.drawRect(location[0],location[3],location[2]-location[0],location[1]-location[3]);
                else if(location[0]>location[2]&&location[1]<=location[3])
                    bg.drawRect(location[2],location[1],location[0]-location[2],location[3]-location[1]);
                else
                    bg.drawRect(location[2],location[3],location[0]-location[2],location[1]-location[3]);
                g2d.drawImage(bi, 0, 0, this);
                break;
            case(3):
                //画椭圆，判断同矩形
                if(location[0]<=location[2]&&location[1]<location[3])
                    bg.drawOval(location[0],location[1],location[2]-location[0],location[3]-location[1]);
                else if(location[0]<=location[2]&&location[1]>=location[3])
                    bg.drawOval(location[0],location[3],location[2]-location[0],location[1]-location[3]);
                else if(location[0]>location[2]&&location[1]<=location[3])
                    bg.drawOval(location[2],location[1],location[0]-location[2],location[3]-location[1]);
                else
                    bg.drawOval(location[2],location[3],location[0]-location[2],location[1]-location[3]);
                g2d.drawImage(bi, 0, 0, this);
                break;
            case(4):
                //画曲线
                Line2D.Double curs=new Line2D.Double(location[0],location[1],location[2],location[3]);
                bg.draw(curs);
                g2d.drawImage(bi, 0, 0, this);
                break;
            case(5)://清空
                bi=new BufferedImage(600,400,BufferedImage.TYPE_INT_RGB);
                ifClicked=false;
                break;
        }
    }
    public PaintBoard(ServerServer serverServer)
    {
        this.serverServer = serverServer;
        location[0]=0;
        location[1]=0;
        location[2]=0;
        location[3]=0;  //一般图形需要四个点定位
        setPreferredSize(new Dimension(width, height));
        addMouseListener(new MouseAdapter()          //添加鼠标响应事件
        {
            public void mousePressed(MouseEvent e)
            {
                if(curboolean)
                {  //曲线状态较为特殊，鼠标按下经过的每个点都要绘出
                    location[0]=e.getX();
                    location[1]=e.getY();
                    location[2]=e.getX();
                    location[3]=e.getY();
                    mode=4;
                    repaint();
                    messCraetAndSend(location[0],location[1],location[2],location[3]);
                }
                else
                {
                    location[0]=e.getX();
                    location[1]=e.getY();
                }
            }
            public void mouseReleased(MouseEvent e)
            {
                //直线 矩形  椭圆只需知道按下和释放时两个点的位置
                if(curboolean)  //为true时表明被选择，其他图形类似
                {

                }
                else if(lineboolean)             //lineboolean为真时表明当前选中的是直线，于是mode=1，画直线
                {
                    location[2]=e.getX();
                    location[3]=e.getY();
                    mode=1;
                    repaint();
                    messCraetAndSend(location[0],location[1],location[2],location[3]);
                    //画图之时调用messCreatAndSend方法，向服务器发送当前的绘图信息 共享到其他客户端
                }
                else if(rectboolean)
                {
                    location[2]=e.getX();
                    location[3]=e.getY();
                    mode=2;
                    repaint();
                    messCraetAndSend(location[0],location[1],location[2],location[3]);
                }
                else if(ellboolean)
                {
                    location[2]=e.getX();
                    location[3]=e.getY();
                    mode=3;
                    repaint();
                    messCraetAndSend(location[0],location[1],location[2],location[3]);
                }
            }
        });
        //鼠标移动时监听器  画曲线需要沿途每一个点
        addMouseMotionListener(new MouseMotionAdapter()
        {
            public void mouseDragged(MouseEvent e)
            {
                if(curboolean)
                {
                    location[0]=location[2];
                    location[1]=location[3];
                    location[2]=e.getX();
                    location[3]=e.getY();
                    mode=4;
                    repaint();
                    messCraetAndSend(location[0],location[1],location[2],location[3]);
                }
            }
        });
    }
    public void update(Graphics g)
    {
        this.paint(g);
    }
    //向服务器发送绘图信息
    //消息类似ell:42:69:42:69:red  前面是图形 中间是坐标 后面是颜色
    public  void messCraetAndSend(int x1,int y1,int x2, int y2)
    {
        String str = null;
        if(color==Color.red)
        {
            str="red";
        }
        else if(color==Color.green)
        {
            str="green";
        }
        else if(color==Color.blue)
        {
            str="blue";
        }
        else if(color==Color.black)
        {
            str="black";
        }
        //生成绘图消息
        if(lineboolean)
            message="line"+":"+x1+":"+y1+":"+x2+":"+y2+":"+str;
        else if(rectboolean)
            message="rect"+":"+x1+":"+y1+":"+x2+":"+y2+":"+str;
        else if(ellboolean)
            message="ell"+":"+x1+":"+y1+":"+x2+":"+y2+":"+str;
        else if(curboolean)
            message="cur"+":"+x1+":"+y1+":"+x2+":"+y2+":"+str;
        serverServer.sendMsg(message);
    }

    //向服务器发送clear信息
    public void messCraetAndSend()
    {
        if(isClear)
            message="clear"+":"+"black";
        serverServer.sendMsg(message);
    }

}
