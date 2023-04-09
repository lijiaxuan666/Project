package whiteboardClient;

import config.configs;
import whiteboardSend.Send;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.IOException;


/*
 *
 * 角色：客户端
 * 功能：提供GUI界面，共享白板
 */
public class ClientGUI extends JFrame implements ActionListener {
    ClientServer clientServer;
    boolean ifConnected = false;
    ClientBoard pan;
    JPanel jp2;
    JPanel jp3;
    JPanel jp4;
    JPanel jp5;

    JButton clear_record= new JButton("清空记录");

    JButton log=new JButton("连接");              //与服务器建立或断开连接

    JLabel portlLabel=new JLabel("port:");
    JLabel ipLabel=new JLabel("IP:");
    JLabel namelJLabel=new JLabel("用户名:");

    JTextField port=new JTextField(""+configs.PORT);         //服务器端口号
    JTextField ip=new JTextField(configs.HOST);           //服务器IP
    JTextField name=new JTextField();
    JTextField chat_mess=new JTextField("回车发送");
    static JTextArea chat_record =new JTextArea(20,20);   //存放聊天记录

    JScrollPane scrollBar;        //滚动条控件
    /*
     * 连接所用资源
     */

    //设置按钮样式
    public void setButtonShape(JButton jButton) {
        jButton.setPreferredSize(new Dimension(100,30));
        jButton.setBackground(new Color(0x57B1ED));
        jButton.setBorder(BorderFactory.createRaisedBevelBorder());
        jButton.setFont(new  Font("宋体",Font.BOLD,16));
    }
    //设置文本域样式
    public void setTextShape(JTextField jTextField) {
        jTextField.setFont(new Font("宋体", Font.PLAIN, 15) );
        jTextField.setBackground(new Color(255, 255, 255));
    }

    //设置标签样式
    public void setLabelShape(JLabel jLabel) {
        jLabel.setFont(new Font("黑体", Font.BOLD, 15) );
        jLabel.setBackground(new Color(0xEDED89));
    }

    //事件响应
    public void actionPerformed(ActionEvent e)
    {
        //根据被点击的按钮资源判断
        if(e.getSource()==clear_record)         //未建立连接时只有清空记录按钮和连接按钮有效
        {
            //清除聊天记录
            chat_record.setText(null);
        }
        else if(e.getSource()==log) {//log按钮的设置
            Send sendClient = new Send();
            sendClient.connect(configs.HOST, configs.PORT, 1000);
            if (!ifConnected) {
                String ret = sendClient.send("log" + ":" + name.getText() + ":" + clientServer.getMyServerPort());
                if (ret.compareTo("yes") == 0) {
                    Thread thread = new Thread(clientServer);
                    thread.start();
                    chat_record.append("您成功登录！\n");
                    log.setText("断开");
                    ifConnected = true;
                } else {
                    chat_record.append("名字重叠\n");
                }
            }
            else{
                String ret = sendClient.send("off" + ":" + name.getText());
                chat_record.append("您成功退出！\n");
                log.setText("连接");
                ifConnected = false;
            }
        }
        else if(e.getSource()==chat_mess)
        {
            if(!ifConnected){
                chat_record.append("您还未登录！\n");
            }
            else {
                String s = name.getText() + ":" + chat_mess.getText();
                if (!chat_mess.getText().equals("")) {
                    //发送聊天消息
                    chat_mess.setText(null);
                    Send sendClient = new Send();
                    sendClient.connect(configs.HOST, configs.PORT, 1000);
                    sendClient.send("msg" + ":" + s);
                } else if (chat_mess.getText().equals("")) {
                    chat_record.append("请输入至少一个字符！\n");
                }
            }
        }
    }

    public ClientGUI(ClientServer clientServer){
        this.clientServer = clientServer;
        pan=new ClientBoard(clientServer);
        jp2=new JPanel(new BorderLayout());

        jp3=new JPanel();
        jp4=new JPanel(new FlowLayout());
        jp5=new JPanel(new FlowLayout());

        scrollBar=new JScrollPane(chat_record); //滚动条控件,chat_record存放聊天记录
        //设置聊天记录的多行文本框
        chat_record.setBorder(BorderFactory.createTitledBorder("聊天消息"));
        chat_record.setEditable(false);
        chat_record.setLineWrap(true);
        //设置聊天记录的多行文本框

        chat_mess.setColumns(18); //单行信息发送框

        //输入框与清空按钮
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
        jp3.add(ipLabel);
        jp3.add(ip);
        jp3.add(log);
        port.setColumns(20);
        ip.setColumns(20);
        name.setColumns(20);
        pan.setBorder(BorderFactory.createLineBorder(Color.black, 1));

        setLabelShape(portlLabel);
        setLabelShape(namelJLabel);
        setLabelShape(ipLabel);

        this.add(jp2,BorderLayout.EAST);
        this.add(jp3,BorderLayout.NORTH);
        this.add(jp4,BorderLayout.PAGE_END);
        this.add(pan,BorderLayout.CENTER);

        setTextShape(port);
        setTextShape(ip);
        setTextShape(name);
        setTextShape(chat_mess);

        log.addActionListener(this);    //log为连接按钮
        chat_mess.addActionListener(this); //消息发送框
        clear_record.addActionListener(this); //清空记录按钮
        setButtonShape(clear_record);
        setButtonShape(log);

        chat_record.setFont(new Font("宋体", Font.PLAIN, 15) );
        chat_record.setBackground(new Color(255,255,255));

        setTitle("绘画板");
        setSize(900,500);                   //设置外部frame大小
        setLocationRelativeTo(null);      //参数值为null,窗口将置于屏幕的中央。
        setResizable(false);            //为true生成的窗体可以自由改变大小，false则不可调整
        setDefaultCloseOperation(clientServer.gui.EXIT_ON_CLOSE);  //设置关闭操作
        setVisible(true);                               //设置可见性
        Toolkit tool = getToolkit();    //得到一个Toolkit对象
        Image image = tool.getImage(configs.ICONFILE);
        setIconImage(image);          //给Frame设置图标

        this.addWindowListener(new WindowAdapter() {//使用适配器
            public void windowClosing(WindowEvent e) {//点击关闭按钮时发送下线消息
                if(clientServer.gui.ifConnected) {
                    Send sendClient = new Send();
                    sendClient.connect(configs.HOST, configs.PORT, 1000);
                    String ret = sendClient.send("off" + ":" + name.getText());
                    ifConnected = false;
                }
                System.exit(0);
            }
        });
    }
    public static void main(String[] args) throws IOException {
        new ClientServer(configs.HOST, configs.PORT);
    }
}