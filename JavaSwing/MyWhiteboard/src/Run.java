import config.configs;
import whiteboardClient.ClientServer;
import whiteboardServer.ServerServer;

import java.io.IOException;

public class Run {
    public static void main(String[] args) {
        Thread teacher = new Thread(new MyTeacherRunnable());
        Thread student1 = new Thread(new MyStudentRunnable());
//        Thread student2 = new Thread(new MyStudentRunnable());
        teacher.start();
        student1.start();
//        student2.start();
    }
    static class MyStudentRunnable implements Runnable{
        @Override
        public void run() {
            try {
                new ClientServer(configs.HOST, configs.PORT);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    static class MyTeacherRunnable implements Runnable{
        @Override
        public void run() {
            try {
                new ServerServer(configs.PORT);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
