package view;

import domain.Question;
import domain.Result;
import service.QuestionService;
import util.CreateUtil;
import util.MySpring;
import util.QuestionFileReader;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;

public class MyFrame extends JFrame {

    private static HashSet<Question> questionBox = QuestionFileReader.getQuestion();
    private static MyFrame myFrame;
    private QuestionService service = MySpring.getBean("service.QuestionService");
    private CreateUtil myutil=new CreateUtil();

    protected MyFrame() {

        JLabel title = myutil.new Create_label("个人简历",Color.BLACK,30);
        title.setBounds(150, 20, 150, 35);

        JLabel quest = myutil.new Create_label("姓名：",Color.BLACK);
        URL url0 = getClass().getResource("/img/name.png");
        quest.setIcon(new ImageIcon(url0));
        JTextField questionTextField = new JTextField();
        quest.setBounds(60, 90, 150, 35);
        questionTextField.setBounds(220, 95, 200, 30);

        JLabel sexLable = myutil.new Create_label("性别：",Color.BLACK);
        URL url1 = getClass().getResource("/img/sex.png");
        sexLable.setIcon(new ImageIcon(url1));
        URL url8 = getClass().getResource("/img/men.png");
        URL url9 = getClass().getResource("/img/women.png");
        JRadioButton jrb1 = new JRadioButton("男",new ImageIcon(url8),true);
        JRadioButton jrb2 = new JRadioButton("女",new ImageIcon(url9));

        jrb1.setActionCommand(jrb1.getText());
        jrb2.setActionCommand(jrb2.getText());
        ButtonGroup bg = new ButtonGroup();
        bg.add(jrb1);
        bg.add(jrb2);
        sexLable.setBounds(60, 140, 150, 35);
        jrb1.setBounds(220, 143, 50, 30);
        jrb2.setBounds(280, 143, 50, 30);

        JLabel highLable = myutil.new Create_label("身高：",Color.BLACK);
        URL url2 = getClass().getResource("/img/high.png");
        highLable.setIcon(new ImageIcon(url2));
        JTextField hightTextField = new JTextField();
        highLable.setBounds(60, 190, 150, 35);
        hightTextField.setBounds(220, 195, 200, 30);

        JLabel weightLable = myutil.new Create_label("体重：",Color.BLACK);
        URL url3 = getClass().getResource("/img/weight.png");
        weightLable.setIcon(new ImageIcon(url3));
        JTextField weightTextField = new JTextField();
        weightLable.setBounds(60, 240, 150, 35);
        weightTextField.setBounds(220, 245, 200, 30);

        JLabel believeLable = myutil.new Create_label("个人爱好：",Color.BLACK);
        URL url4 = getClass().getResource("/img/hobby.png");
        believeLable.setIcon(new ImageIcon(url4));
        JTextField hobbyTextField = new JTextField();
        believeLable.setBounds(60, 290, 150, 35);
        hobbyTextField.setBounds(220, 295, 200, 30);

        JLabel sickLable = myutil.new Create_label("遗传病史：",Color.BLACK);
        URL url5 = getClass().getResource("/img/sick.png");
        sickLable.setIcon(new ImageIcon(url5));
        JRadioButton jrb3 = new JRadioButton("无");
        JRadioButton jrb4 = new JRadioButton("有");
        jrb3.setActionCommand(jrb3.getText());
        jrb4.setActionCommand(jrb4.getText());
        jrb3.setSelected(true);
        ButtonGroup bg2 = new ButtonGroup();
        bg2.add(jrb3);
        bg2.add(jrb4);
        sickLable.setBounds(60, 350, 150, 35);
        jrb3.setBounds(220, 353, 50, 30);
        jrb4.setBounds(280, 353, 50, 30);

        JButton addQuestion = myutil.new Create_Login_Button("投递简历信息");

        addQuestion.setFocusPainted(false);
        addQuestion.setPreferredSize(new Dimension(50, 30));
        addQuestion.setBackground(new Color(0,131,255));
        addQuestion.setBounds(170, 420, 150, 30);

        //创建监听器
        addQuestion.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String name = questionTextField.getText();
                if (name == null || name.equals("")) {
                    JOptionPane.showMessageDialog(MyFrame.this, "公司名称不能为空");
                    return;
                }
                String high = hightTextField.getText();
                if (high == null || (int) Double.parseDouble(high) != Integer.parseInt(high)) {
                    JOptionPane.showMessageDialog(MyFrame.this, "身高不能为空或小数");
                    return;
                }
                String weight = weightTextField.getText();
                if (weight == null || (int) Double.parseDouble(weight) != Integer.parseInt(weight)) {
                    JOptionPane.showMessageDialog(MyFrame.this, "体重不能为空或小数");
                    return;
                }
                String hobby = hobbyTextField.getText();
                if (hobby == null || hobby.equals("")) {
                    JOptionPane.showMessageDialog(MyFrame.this, "爱好不能为空");
                    return;
                }
                String sick = bg2.getSelection().getActionCommand();
                String sex = bg.getSelection().getActionCommand();
                Question qu = new Question(name, sex, Integer.parseInt(high), Integer.parseInt(weight), hobby, sick);
                ArrayList<Result> list = new ArrayList<>();
                for (Question q : questionBox) {
                    String res = q.equals(qu);
                    list.add(new Result(q, res));
                }
                Collections.sort(list, new Comparator() {
                    public int compare(Object a, Object b) {
                        return -1*Double.compare(Double.parseDouble(((Result) a).getScore()), Double.parseDouble(((Result) b).getScore()));
                    }

                });
                ResultFrame resultFrame=new ResultFrame(list);
                resultFrame.setVisible(true);
                myFrame.setVisible(false);
                questionTextField.setText("");
                hightTextField.setText("");
                weightTextField.setText("");
                hobbyTextField.setText("");
            }
        });

        JPanel mainpanl = new JPanel();//总页面
        mainpanl.add(quest);
        mainpanl.add(title);
        mainpanl.add(questionTextField);
        mainpanl.add(sexLable);
        mainpanl.add(jrb1);
        mainpanl.add(jrb2);
        mainpanl.add(highLable);
        mainpanl.add(hightTextField);
        mainpanl.add(addQuestion);
        mainpanl.add(weightTextField);
        mainpanl.add(weightLable);
        mainpanl.add(hobbyTextField);
        mainpanl.add(believeLable);
        mainpanl.add(jrb3);
        mainpanl.add(jrb4);
        mainpanl.add(sickLable);
        background();
        mainpanl.setOpaque(false);

        mainpanl.setLayout(null);
        mainpanl.setBackground(Color.LIGHT_GRAY);
        this.add(mainpanl);

        this.setTitle("招聘者信息管理");
        this.setVisible(true);
        this.setSize(500, 620);
        //this.setResizable(false);//不想让窗体拖拽大小
        this.setLocationRelativeTo(null);// 设置居中显示
        // 设置Jframe窗体关闭时 程序结束
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }

    public synchronized static MyFrame getMyFrame() {
        if (myFrame == null) {
            myFrame = new MyFrame();
        }
        return myFrame;
    }
    public void background(){
        ((JPanel)this.getContentPane()).setOpaque(false);
        ImageIcon img = new ImageIcon("src/img/back.png"); //添加图片
        JLabel background = new  JLabel(img);
        this.getLayeredPane().add(background, new Integer(Integer.MIN_VALUE));
        background.setBounds(0, 0, img.getIconWidth(), img.getIconHeight());
    }
}

