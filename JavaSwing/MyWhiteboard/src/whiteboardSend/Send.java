package whiteboardSend;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetSocketAddress;
import java.net.Socket;
import whiteboardUtil.WhiteboardUtil;

//Send类
//发送类 申请一个用于发送的socket  通过传入IP 、 port 、 timeout调用connect函数建立连接
//然后调用send函数传入message发送即可   （send函数内包括发送一次消息  接收一次消息   关闭socket）
public class Send {
    Socket socket;
    public Send() {
        super();
        socket = new Socket();
    }
    public int connect(String IP, int port, int timeout) {//连接
        try {
            socket.connect(new InetSocketAddress(IP, port), timeout);
/*            System.out.println("success");*/
        } catch (IOException e) {
            return -1;
        }
        return 0;
    }
    public String send(String message) {
        PrintWriter writer= WhiteboardUtil.putMesgToSocket(socket, message);
        StringBuffer buffer=new StringBuffer();
        BufferedReader reader=WhiteboardUtil.getMsgFromSocket(socket,buffer);
        String rMessage = buffer.toString();
        WhiteboardUtil.closeSocket(socket,reader,writer);
        return rMessage;
    }
}