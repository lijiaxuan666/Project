package whiteboardServer;
import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.util.HashSet;
import java.util.Iterator;
import javax.swing.*;

import config.configs;
import whiteboardUtil.WhiteboardUtil;

/*
 *
 * 角色：客户端
 * 功能：提供GUI界面，共享白板
 */
public class ServerGUI extends JFrame implements ActionListener  {

    PaintBoard pan;//画板
    JToolBar jt;//工具栏目
    JPanel onlineArea;//在线列表
    JPanel jp6;//在线列表与画板
    JPanel jp2;//消息部分
    JPanel jp3;//login
    JPanel jp4;//清空
    JPanel jp5;//发送消息部分
    JScrollPane onlineScroll;
    HashSet<String> users = new HashSet<String>();
    /*
     * 图形资源加载
     */

    ImageIcon line=new ImageIcon(configs.LINESHAPE);      //直线
    ImageIcon rect=new ImageIcon(configs.RECTSHAPE);      //矩形
    ImageIcon ellipse=new ImageIcon(configs.ELLIPSESHAPE);//椭圆
    ImageIcon curly=new ImageIcon(configs.CURVESHAPE);    //曲线

    /*
     * 颜色资源加载
     */
    ImageIcon r=new ImageIcon(configs.REDCOLOUR);          //红色
    ImageIcon b=new ImageIcon(configs.BLUECOLOUR);         //蓝色
    ImageIcon g=new ImageIcon(configs.GREENCOLOUR);          //绿色
    ImageIcon bk=new ImageIcon(configs.BLACKCOLOUR);     //黑色

    JButton lin=new JButton(line);
    JButton rec=new JButton(rect);
    JButton ell=new JButton(ellipse);
    JButton cur=new JButton(curly);
    /*
     * 功能按钮
     */
    JButton clear_record= new JButton("清空记录");
    JButton clear= new JButton("清空画板");

    /*
     * 颜色按钮
     */
    JButton red=new JButton(r);
    JButton green=new JButton(g);
    JButton blue=new JButton(b);
    JButton black=new JButton(bk);
    JButton sendButton=new JButton("发送");              //与服务器建立或断开连接

    JLabel portlLabel=new JLabel("port:");
    JLabel pathLabel=new JLabel("path:");
    JLabel namelJLabel=new JLabel("用户名:");

    JTextField port=new JTextField(""+configs.PORT);         //服务器端口号
    JTextField path=new JTextField("src/test.txt");           //服务器IP
    JTextField name=new JTextField("Teacher");
    JTextField chat_mess=new JTextField("回车发送");
    static JTextArea chat_record =new JTextArea(20,20);   //存放聊天记录

    JScrollPane scrollBar;        //滚动条控件

    ServerServer serverServer;
    //设置按钮样式
    public void setButtonShape(JButton jButton) {
        jButton.setPreferredSize(new Dimension(100,30));
        jButton.setBackground(new Color(0x57B1ED));
        jButton.setBorder(BorderFactory.createRaisedBevelBorder());
        jButton.setFont(new  Font("宋体",Font.BOLD,16));
    }
    public void setButtonShape2(JButton jButton){
        jButton.setBackground(Color.WHITE);
        jButton.addActionListener(this);
    }
    //设置文本域样式
    public void setTextShape(JTextField jTextField) {
        jTextField.setFont(new Font("宋体", Font.PLAIN, 15) );
        jTextField.setBackground(Color.WHITE);
    }

    //设置标签样式
    public void setLabelShape(JLabel jLabel) {
        jLabel.setFont(new Font("黑体", Font.BOLD, 15) );
        jLabel.setBackground(Color.WHITE);

    }
    //事件响应
    public void actionPerformed(ActionEvent e)
    {
        //根据被点击的按钮资源判断
        //System.out.println("被点击！");
        if(e.getSource()==clear_record)         //未建立连接时只有清空记录按钮和连接按钮有效
        {
            //清除聊天记录
            chat_record.setText(null);
        }
        //msg格式  msg : id : 信息内容
        else if(e.getSource()==chat_mess)
        {
            String s="msg"+":"+name.getText()+":"+chat_mess.getText();
            if(!chat_mess.getText().equals(""))
            {
                //发送聊天消息
                chat_record.append("我说:\n" + chat_mess.getText());
                serverServer.sendMsg(s);
                chat_mess.setText(null);
            }
            else if(chat_mess.getText().equals(""))
            {
                chat_record.append("请输入至少一个字符！\n");
            }
        }
        else if(e.getSource()==sendButton){
            File file = new File(path.getText());
            StringBuffer buffer = new StringBuffer();
            BufferedReader reader = null;
            try{
                reader = new BufferedReader(new FileReader(file));
            } catch (FileNotFoundException fileNotFoundException) {
                WhiteboardUtil.showErrorBox("文件输入流打开错误");
            }
            try{
                String line = "";
                while((line = reader.readLine()) != null){
                    buffer.append(line + "\n");
                }
                buffer.deleteCharAt(buffer.length()-1);
            }catch (IOException ioException){
                WhiteboardUtil.showErrorBox("读取文件错误");
            }
            String content = buffer.toString();
            serverServer.sendMsg("file" + ":" + file.getName() + ":" + content);
            try {
                reader.close();
            } catch (IOException ioException) {
                WhiteboardUtil.showErrorBox("关闭输入流错误！");
            }
            chat_record.append("成功发送文件！\n");
        }
        else
        {
            if(e.getSource()==lin)          //点击画直线
            {
                PaintBoard.lineboolean=true;
                PaintBoard.rectboolean=false;
                PaintBoard.ellboolean=false;
                PaintBoard.curboolean=false;
                PaintBoard.isClear=false;
                changeBackColorForButton(0,1);
            }
            if(e.getSource()==rec)      //点击画矩形
            {
                PaintBoard.lineboolean=false;
                PaintBoard.rectboolean=true;
                PaintBoard.ellboolean=false;
                PaintBoard.curboolean=false;
                PaintBoard.isClear=false;
                changeBackColorForButton(1,1);
            }
            if(e.getSource()==ell)     //点击画椭圆
            {
                PaintBoard.lineboolean=false;
                PaintBoard.rectboolean=false;
                PaintBoard.ellboolean=true;
                PaintBoard.curboolean=false;
                PaintBoard.isClear=false;
                changeBackColorForButton(2,1);
            }
            if(e.getSource()==cur)   //点击画曲线
            {
                PaintBoard.location[0]=0;
                PaintBoard.location[1]=0;
                PaintBoard.location[2]=0;
                PaintBoard.location[3]=0;
                PaintBoard.lineboolean=false;
                PaintBoard.rectboolean=false;
                PaintBoard.ellboolean=false;
                PaintBoard.curboolean=true;
                PaintBoard.isClear=false;
                changeBackColorForButton(3,1);
            }

            if(e.getSource()==red)     //点击选择红色
            {
                PaintBoard.color=Color.red;
                changeBackColorForButton(1,0);
            }

            else if(e.getSource()==green)
            {
                PaintBoard.color=Color.green;
                changeBackColorForButton(3,0);
            }
            else if(e.getSource()==blue)
            {
                PaintBoard.color=Color.blue;
                changeBackColorForButton(2,0);
            }
            else if(e.getSource()==black) {
                PaintBoard.color=Color.black;
                changeBackColorForButton(0,0);
            }
            else if(e.getSource()==clear)          //清空画板
            {
                PaintBoard.isClear=true;
                pan.drawClear();
                pan.messCraetAndSend();
            }
        }
    }
    //被点击图形的高亮
    public void changeBackColorForButton(int clickedButton,int col) {
        boolean states[]= {false,false,false,false};//点击状态 初始都未被点击
        JButton buttons[]=new JButton[4];
        if(col==1) {
            buttons[0]=lin;
            buttons[1]=rec;
            buttons[2]=ell;
            buttons[3]=cur;//分别对应直线、矩形、椭圆、曲线的点击状态
        }
        else {
            buttons[0]=black;
            buttons[1]=red;
            buttons[2]=blue;
            buttons[3]=green;//对应黑色，红色，蓝色，绿色的点击状态
        }
        states[clickedButton]=true;
        for(int i=0;i<4;i++) {
            if(states[i]==true) {
                buttons[i].setBackground(new Color(0x09C7F7));
            }else {
                buttons[i].setBackground(new Color(0xFFFFFF));
            }
        }
    }
    public ServerGUI(ServerServer serverServer){
        this.serverServer = serverServer;
        pan=new PaintBoard(serverServer);
        jt=new JToolBar("工具栏");
        jp2=new JPanel(new BorderLayout());

        jp3=new JPanel();
        jp4=new JPanel(new FlowLayout());
        jp5=new JPanel(new FlowLayout());

        jt.setBorderPainted(true);
        jt.setLayout(new GridLayout(4,2)); //4行2列的图形或颜色标签
        jt.add(black);  jt.add(lin);
        jt.add(red);    jt.add(rec);
        jt.add(blue);   jt.add(ell);
        jt.add(green);  jt.add(cur);

        scrollBar=new JScrollPane(chat_record); //滚动条控件,chat_record存放聊天记录
        //设置聊天记录的多行文本框
        chat_record.setBorder(BorderFactory.createTitledBorder("聊天消息"));
        chat_record.setEditable(false);
        chat_record.setLineWrap(true);
        //设置聊天记录的多行文本框

        chat_mess.setColumns(18); //单行信息发送框

        //聊天记录与信息发送框放在同一个panel里面
        jp5.add(chat_mess);
        jp5.add(clear_record);
        //聊天记录与信息发送框放在同一个panel里面

        jp2.add(scrollBar,BorderLayout.CENTER);
        jp2.add(jp5,BorderLayout.PAGE_END);

        //jp3存放frame最上面的几个控件，包括用户名，port，IP等
        jp3.add(namelJLabel);
        jp3.add(name);
        jp3.add(portlLabel);
        jp3.add(port);
        jp3.add(pathLabel);
        jp3.add(path);
        jp3.add(sendButton);
        port.setColumns(20);
        path.setColumns(20);
        name.setColumns(20);

        setLabelShape(portlLabel);
        setLabelShape(namelJLabel);
        setLabelShape(pathLabel);

        jp4.add(clear); //清空画板

        //对在线列表和画板进行组合
        onlineArea = new JPanel();
        jp6 = new JPanel(new BorderLayout());
        onlineScroll = new JScrollPane(onlineArea);
        onlineArea.setPreferredSize(new Dimension(180, 0));
        onlineArea.setBorder(BorderFactory.createTitledBorder("在线用户"));
        jp6.add(pan, BorderLayout.CENTER);   jp6.add(onlineArea, BorderLayout.EAST);

        pan.setBorder(BorderFactory.createLineBorder(Color.black, 1));
        this.add(jt,BorderLayout.WEST); //顶层panel
        this.add(jp2,BorderLayout.EAST);
        this.add(jp3,BorderLayout.NORTH);
        this.add(jp4,BorderLayout.PAGE_END);
        this.add(jp6,BorderLayout.CENTER);

        setTextShape(port);
        setTextShape(path);
        setTextShape(name);
        setTextShape(chat_mess);
        //添加监听事件,添加说明文字
        lin.setToolTipText("直线");
        rec.setToolTipText("矩形");
        ell.setToolTipText("椭圆");
        cur.setToolTipText("曲线");


        red.setToolTipText("红色画笔");
        green.setToolTipText("绿色画笔");
        blue.setToolTipText("蓝色画笔");
        black.setToolTipText("黑色画笔");

        setButtonShape2(red);
        setButtonShape2(black);
        setButtonShape2(blue);
        setButtonShape2(green);
        setButtonShape2(lin);
        setButtonShape2(rec);
        setButtonShape2(ell);
        setButtonShape2(cur);

        clear.addActionListener(this);  //清空画板的监听
        sendButton.addActionListener(this);    //log为连接按钮
        chat_mess.addActionListener(this); //消息发送框
        clear_record.addActionListener(this); //清空记录按钮
        setButtonShape(clear);
        setButtonShape(clear_record);
        setButtonShape(sendButton);

        chat_record.setFont(new Font("宋体", Font.PLAIN, 15) );
        chat_record.setBackground(Color.WHITE);

        setTitle("绘画板");
        setSize(1200,500);                   //设置外部frame大小
        setLocationRelativeTo(null);      //参数值为null,窗口将置于屏幕的中央。
        setResizable(false);            //为true生成的窗体可以自由改变大小，false则不可调整
        setDefaultCloseOperation(serverServer.gui.EXIT_ON_CLOSE);  //设置关闭操作
        setVisible(true);                               //设置可见性
        Toolkit tool = getToolkit();    //得到一个Toolkit对象
        Image image = tool.getImage(configs.ICONFILE);
        setIconImage(image);          //给Frame设置图标
    }

    public int reFreshOnlineArea(HashSet<String> hashSet){
        int size = hashSet.size();
        onlineArea.removeAll();
        Iterator<String> it = hashSet.iterator();
        while (it.hasNext()) {
            String str = it.next();
            String id = str;
            JLabel label = new JLabel(id);
            label.setPreferredSize(new Dimension(175, 20));
            label.setBackground(Color.GRAY);
            label.setForeground(Color.WHITE);
            label.setHorizontalAlignment(JLabel.CENTER);
            label.setOpaque(true);
            onlineArea.add(label);
        }
        onlineArea.setPreferredSize(new Dimension(180, size * 22));
        this.repaint();
        this.validate();
        return 0;
    }

    /*public static void main(String[] args) throws IOException {
        try {
            new ServerServer(configs.PORT);
        }catch (IOException e){
            e.printStackTrace();
        }
    }*/
}

