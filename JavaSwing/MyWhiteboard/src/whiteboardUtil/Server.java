package whiteboardUtil;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

//为ServerSocket封装的抽象类，accept后获得了socket，为该socket创建线程（线程函数为将发送给sSocket的信息通过socket接收下来，处理后返回一个信息）
public abstract class Server {
    protected ServerSocket sSocket;
    public Server() {
    }
    protected int listen() {//每个服务器都需要监听
        while (true) {
            Socket ots = null;
            try {
                ots = sSocket.accept();//服务器socket返回一个socket用来与客户端进行通信
            } catch (IOException e) {
                WhiteboardUtil.showErrorBox("服务器Accept错误");
                System.exit(-1);
            }
            Thread hThread = new Thread(new handleThread(ots));//为每个socket 即每个客户端建立一个线程用来接收消息
            hThread.start();
        }
    }
    // 处理消息的进程
    class handleThread implements Runnable {
        Socket ots;
        handleThread(Socket ots) {
            this.ots = ots;
        }
        @Override
        public void run() {
            handleMessage(ots);
        }
    };
    protected abstract String handle(Socket ots,String rMessage);//处理函数，输入收到的消息，返回要发送的消息
    private String handleMessage(Socket ots) {
        StringBuffer buffer=new StringBuffer();
        BufferedReader reader=WhiteboardUtil.getMsgFromSocket(ots,buffer);//获取消息
        String rMessage = buffer.toString();
        String message=handle(ots,rMessage);//处理消息   返回要发送的message
        PrintWriter writer=WhiteboardUtil.putMesgToSocket(ots, message);//发送消息
        WhiteboardUtil.closeSocket(ots,reader,writer);//关闭
        if(message == "forc"){//如果是被强制关闭了
            System.exit(0);
        }
        return null;
    }
}