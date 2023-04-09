package whiteboardServer;

import config.configs;
import whiteboardSend.Send;
import whiteboardUtil.Server;
import whiteboardUtil.WhiteboardUtil;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Hashtable;

public class ServerServer extends Server {
    Hashtable<String, User> onlineTable = new Hashtable<String, User>();// 用户集合
    ServerGUI gui;
    // 用户内部类
    class User {
        String id;
        String IP;
        int port;
        User(String id, String IP, int port) {
            this.id = id;
            this.IP = IP;
            this.port = port;
        }
    }
    // 发送进程内部类  为每一次发送消息创建一个线程（这样可以保证可以同时发送消息）
    class sendThread implements Runnable {
        String mesg;
        String IP;
        int port;
        sendThread(String IP, int port, String mesg) {
            this.IP = IP;
            this.port = port;
            this.mesg = mesg;
        }
        @Override
        public void run() {
            Send sendClient = new Send();
            sendClient.connect(IP, port, 1000);
            sendClient.send(mesg);
        }
    };
    public ServerServer(int port) throws IOException {
        init(port);
        gui = new ServerGUI(this);
        listen();
    }
    private int init(int port) throws IOException {
        try {
            sSocket = new ServerSocket(port);//绑定指定端口
        } catch (IOException e) {
            WhiteboardUtil.showErrorBox("服务器初始化失败，无法绑定端口。");
            System.exit(-1);
        }
        return port;
    }
    int sendMsg(String msg){
        Enumeration<User> en = onlineTable.elements();
        while(en.hasMoreElements()){
            User f = en.nextElement();
            Thread thread = new Thread(new sendThread(f.IP, f.port, msg));
            thread.start();
        }
        return 0;
    }

    protected  String handle(Socket ots,String rMessage){
        System.out.println("handle");
        String[] strs = rMessage.split(":");
        if (strs[0].equals("log")) {//登录
            System.out.println("log");
            String id = strs[1];
            int port = Integer.parseInt(strs[2]);
            String IP = ots.getInetAddress().getHostAddress();//拆取信息完毕
            User f = onlineTable.get(id);
            if(f == null && !id.equals(gui.name.getText())){
                onlineTable.put(id, new User(id, IP, port));
                gui.reFreshOnlineArea(changeFromTableToSet(onlineTable));
                return "yes";
            }
            else
                return "no";
        }
        else if(strs[0].equals("off")){
            System.out.println("off");
            String id = strs[1];
            User f = onlineTable.get(id);
            if(f != null){
                onlineTable.remove(id);
                gui.reFreshOnlineArea(changeFromTableToSet(onlineTable));
            }
        }
        else if(strs[0].equals("msg")){
            System.out.println("msg");
            gui.chat_record.append(strs[1]+"说: \n"+ rMessage.substring("msg".length() + strs[1].length() + 2) +"\n");
            sendMsg(rMessage);
        }
        return "getm";
    }
    //将hashtable转换为hashset
    protected HashSet<String> changeFromTableToSet(Hashtable<String, User> hashtable){
        HashSet<String> hashSet = new HashSet<String>();
        Enumeration<User> fs = hashtable.elements();//修改GUI
        while(fs.hasMoreElements()){
            User u = fs.nextElement();
            hashSet.add(u.id);
        }
        return hashSet;
    }

    public static void main(String[] args) {
        try {
            new ServerServer(configs.PORT);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}