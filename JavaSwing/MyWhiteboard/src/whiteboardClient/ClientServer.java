package whiteboardClient;

import whiteboardUtil.Server;
import whiteboardUtil.WhiteboardUtil;

import java.awt.*;
import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
import java.text.SimpleDateFormat;
import java.util.Date;

//客户端 负责接收发来的指令信息
//不可进行操作
public class ClientServer extends Server implements Runnable{
    private int myPort;
    ClientGUI gui;
    public ClientServer(String serverIP, int serverPort) throws IOException {
        super();
        gui = new ClientGUI(this);
        myPort = init();
    }
    int getMyServerPort() {
        return myPort;
    }
    private int createServerSocket(int i) throws IOException {//绑定端口i
        if (i >= 65536) {
            WhiteboardUtil.showErrorBox("ClientServer无端口可绑定");
            System.exit(-1);
        }
        try {//如果该端口已经被占用
            sSocket = new ServerSocket(i);
        } catch (IOException e) {
            return createServerSocket(i + 1);
        }
        return i;
    }
    private int init() throws IOException {
        int port = createServerSocket(1025);
        return port;
    }

    @Override
    protected String handle(Socket ots, String rMessage) {
        String[] strs=rMessage.split(":");	                //“：”作为分隔符，第一个冒号之前的内容为消息的类型
        String str;
        switch (strs[0]) {
            case "clear":{
                //清除画版消息
                gui.pan.drawClear();
                break;
            }
            case "msg":{
                //聊天消息
                //判断发送消息的角色
                if(strs[1].equals(gui.name.getText()))
                {
                    gui.chat_record.append("我说: \n"+rMessage.substring("msg".length() + strs[1].length() + 2) + "\n");
                }
                else
                {
                    gui.chat_record.append(strs[1]+"说: \n"+ rMessage.substring("msg".length() + strs[1].length() + 2) +"\n");
                }
                break;
            }
            case "file":{
                //"file" + “：” + "path" + “：” + "内容"
                //创建文件
                String path = "src/receive";
                String filename = strs[1];
                File file = new File(path, filename);
                PrintWriter writer = null;
                try {
                    writer = new PrintWriter(new FileOutputStream(file));
                } catch (FileNotFoundException e) {
                    WhiteboardUtil.showErrorBox("文件打开输入错误！");
                }
                writer.print(strs[2]);
                writer.close();
                gui.chat_record.append("收到文件:" + filename +"!请到receive中查收\n");
                break;
            }
            default:{
                //其他为绘画消息
                //存放坐标
                int x1=Integer.valueOf(strs[1]);
                int y1=Integer.valueOf(strs[2]);
                int x2=Integer.valueOf(strs[3]);
                int y2=Integer.valueOf(strs[4]);
                str=strs[5];                        //存放颜色类型
                if(strs[0].equals("line"))          //类型为line则画直线
                    ClientBoard.mode=1;
                else if(strs[0].equals("rect"))
                    ClientBoard.mode=2;
                else if(strs[0].equals("ell"))
                    ClientBoard.mode=3;
                else if(strs[0].equals("cur"))
                    ClientBoard.mode=4;
                if(str.equals("red"))       //颜色类型为red时设置画笔颜色为红色,并把当前颜色显示为红色
                {
                    ClientBoard.color= Color.red;
                }
                else if(str.equals("green"))
                {
                    ClientBoard.color=Color.green;
                }
                else if(str.equals("blue"))
                {
                    ClientBoard.color=Color.blue;
                }
                else if(str.equals("black"))
                {
                    ClientBoard.color=Color.black;
                }
                gui.pan.drawReceive(x1, y1, x2, y2);    //调用drawReceive方法
                gui.pan.repaint();
                break;
            }
        }
        return "getm";
    }

    @Override
    public void run() {
        listen();
    }
}
