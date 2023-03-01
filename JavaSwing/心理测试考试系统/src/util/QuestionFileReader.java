package util;

import domain.Question;

import java.io.*;
import java.util.ArrayList;
import java.util.HashSet;

public class QuestionFileReader {

    //缓存
    private static HashSet<Question> questionBox = new HashSet<>();

    static {
        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader("src\\dbfile\\Question.txt"));
            String value = br.readLine();
            while (value != null) {
                questionBox.add(new Question(value));
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

    //从缓存中获取问题信息
    public static HashSet<Question> getQuestion() {
        return questionBox;
    }

    public static void saveResult(String result) {
        BufferedWriter out = null;
        try {//FileOutputStream构造函数中的第二个参数true表示以追加形式写文件
            out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File("src\\dbfile\\Result.txt"), true)));
            String conent = result + "\n";
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

    public static void saveQuestion(String question) {
        BufferedWriter out = null;
        try {//FileOutputStream构造函数中的第二个参数true表示以追加形式写文件
            out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File("src\\dbfile\\Question.txt"), true)));
            String conent = question + "\n";
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

    public static ArrayList<String> readResult(String username) {
        ArrayList<String> result=new ArrayList<>();
        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader("src\\dbfile\\Result.txt"));
            String value = br.readLine();
            int i=1;
            while (value != null) {
                String[] res=value.split(":");
                if(res[0].equals(username)){
                    result.add(i+","+res[2]+res[3]);
                    i++;
                }

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
        return result;
    }

    public static ArrayList<String> readResult() {
        ArrayList<String> result=new ArrayList<>();
        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader("src\\dbfile\\Result.txt"));
            String value = br.readLine();
            while (value != null) {
                result.add(value);
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
        return result;
    }


}
