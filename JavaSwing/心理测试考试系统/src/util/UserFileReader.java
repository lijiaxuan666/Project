package util;

import domain.User;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

//程序启动的时候将User.txt文件中的所有信息 一次性读出来
public class UserFileReader {

    //缓存
    private static HashMap<String, User> userBox = new HashMap<>();

    //在当前类加载的时候先执行
    static {
        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader("src\\dbfile\\User.txt"));
            String value = br.readLine();
            while (value != null) {
                String[] userValue = value.split("-");
                User user = new User(userValue[0], userValue[1]);
                userBox.put(user.getAccount(), user);
                value = br.readLine();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (br != null) {
                    br.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    //从缓存中获取用户信息
    public static User getUser(String account) {
        return userBox.get(account);
    }

    public static void register(String account, String password) {
        BufferedWriter out = null;
        try {//FileOutputStream构造函数中的第二个参数true表示以追加形式写文件
            out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File("src\\dbfile\\User.txt"), true)));
            String conent = account + "-" + password + "\n";
            out.write(conent);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public static ArrayList<String> getStu() {
        ArrayList<String> arr=new ArrayList<>();
        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader("src\\dbfile\\Student.txt"));
            String value = br.readLine();
            while (value != null) {
                arr.add(value);
                value = br.readLine();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (br != null) {
                    br.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return arr;
    }

    public static void saveStu(String name, String num,String major,String class1) {
        BufferedWriter out = null;
        try {
            out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File("src\\dbfile\\Student.txt"), true)));
            String conent =name + " " + num + " " + major+ " " + class1+ "\n";
            out.write(conent);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
