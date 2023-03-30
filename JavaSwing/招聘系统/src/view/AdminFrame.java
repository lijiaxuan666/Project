package view;

import service.QuestionService;
import util.CreateUtil;
import util.MySpring;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.net.URL;


public class AdminFrame extends JFrame {

    private static AdminFrame adminFrame;
    private QuestionService service = MySpring.getBean("service.QuestionService");
    private CreateUtil myutil=new CreateUtil();

    protected AdminFrame() {

        JLabel title = myutil.new Create_label("招聘信息",Color.BLACK,30);
        title.setBounds(150, 20, 150, 35);

        JLabel quest = myutil.new Create_label("公司名称：",Color.BLACK);
        URL url0 = getClass().getResource("/img/name.png");
        quest.setIcon(new ImageIcon(url0));
        JTextField questionTextField = new JTextField();
        quest.setBounds(60, 90, 150, 35);
        questionTextField.setBounds(220, 95, 200, 30);
        JLabel intro = myutil.new Create_label("公司简介：",Color.BLACK);
        URL url6 = getClass().getResource("/img/intro.png");
        intro.setIcon(new ImageIcon(url6));
        JTextField introTextField = new JTextField();
        intro.setBounds(60, 140, 150, 35);
        introTextField.setBounds(220, 145, 200, 30);

        JLabel sexLable = myutil.new Create_label("性别要求：",Color.BLACK);
        URL url1 = getClass().getResource("/img/sex.png");
        sexLable.setIcon(new ImageIcon(url1));
        URL url7 = getClass().getResource("/img/mid.png");
        URL url8 = getClass().getResource("/img/men.png");
        URL url9 = getClass().getResource("/img/women.png");
        JRadioButton jrb0 = new JRadioButton("无",new ImageIcon(url7),true);
        JRadioButton jrb1 = new JRadioButton("男",new ImageIcon(url8));
        JRadioButton jrb2 = new JRadioButton("女",new ImageIcon(url9));
        jrb0.setActionCommand(jrb0.getText());
        jrb1.setActionCommand(jrb1.getText());
        jrb2.setActionCommand(jrb2.getText());
        ButtonGroup bg = new ButtonGroup();
        bg.add(jrb0);
        bg.add(jrb1);
        bg.add(jrb2);
        sexLable.setBounds(60, 190, 150, 35);
        jrb0.setBounds(220, 193, 50, 30);
        jrb1.setBounds(280, 193, 50, 30);
        jrb2.setBounds(340, 193, 50, 30);

        JLabel highLable = myutil.new Create_label("身高要求：",Color.BLACK);
        URL url2 = getClass().getResource("/img/high.png");
        highLable.setIcon(new ImageIcon(url2));
        JTextField hightTextField = new JTextField();
        highLable.setBounds(60, 240, 150, 35);
        hightTextField.setBounds(220, 245, 200, 30);

        JLabel weightLable = myutil.new Create_label("体重要求：",Color.BLACK);
        URL url3 = getClass().getResource("/img/weight.png");
        weightLable.setIcon(new ImageIcon(url3));
        JTextField weightTextField = new JTextField();
        weightLable.setBounds(60, 290, 150, 35);
        weightTextField.setBounds(220, 295, 200, 30);

        JLabel believeLable = myutil.new Create_label("个人爱好：",Color.BLACK);
        URL url4 = getClass().getResource("/img/hobby.png");
        believeLable.setIcon(new ImageIcon(url4));
        JTextField hobbyTextField = new JTextField();
        believeLable.setBounds(60, 340, 150, 35);
        hobbyTextField.setBounds(220, 345, 200, 30);

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
        sickLable.setBounds(60, 390, 150, 35);
        jrb3.setBounds(220, 393, 50, 30);
        jrb4.setBounds(280, 393, 50, 30);

        JButton addQuestion = myutil.new Create_Login_Button("发布招聘信息");
        addQuestion.setFocusPainted(false);
        addQuestion.setPreferredSize(new Dimension(50, 30));
        addQuestion.setBackground(new Color(0,131,255));
        addQuestion.setBounds(170, 470, 150, 30);

        //创建监听器
        addQuestion.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String name = questionTextField.getText();
                if (name == null || name.equals("")) {
                    JOptionPane.showMessageDialog(AdminFrame.this, "公司名称不能为空");
                    return;
                }
                String intro = introTextField.getText();
                if (intro == null || intro.equals("")) {
                    JOptionPane.showMessageDialog(AdminFrame.this, "公司简介不能为空");
                    return;
                }
                String high = hightTextField.getText();
                if (high == null || (int) Double.parseDouble(high) != Integer.parseInt(high)) {
                    JOptionPane.showMessageDialog(AdminFrame.this, "身高不能为空或小数");
                    return;
                }
                String weight = weightTextField.getText();
                if (weight == null || (int) Double.parseDouble(weight) != Integer.parseInt(weight)) {
                    JOptionPane.showMessageDialog(AdminFrame.this, "体重不能为空或小数");
                    return;
                }
                String hobby = hobbyTextField.getText();
                if (hobby == null || hobby.equals("")) {
                    JOptionPane.showMessageDialog(AdminFrame.this, "爱好不能为空");
                    return;
                }
                String sick = bg2.getSelection().getActionCommand();
                String sex = bg.getSelection().getActionCommand();
                String res = name + " " + intro + " " + sex + " " + high + " " + weight + " " + hobby + " " + sick;
                System.out.println(res);
                service.saveQuestion(res);
                JOptionPane.showMessageDialog(AdminFrame.this, "保存成功");
                questionTextField.setText("");
                introTextField.setText("");
                hightTextField.setText("");
                weightTextField.setText("");
                hobbyTextField.setText("");
            }
        });

        JPanel mainpanl = new JPanel();//总页面
        mainpanl.add(quest);
        mainpanl.add(title);
        mainpanl.add(questionTextField);
        mainpanl.add(intro);
        mainpanl.add(introTextField);
        mainpanl.add(sexLable);
        mainpanl.add(jrb0);
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

        mainpanl.setLayout(null);
        mainpanl.setBackground(Color.LIGHT_GRAY);
        background();
        mainpanl.setOpaque(false);
        this.add(mainpanl);

        this.setTitle("招聘者信息管理");
        this.setVisible(true);
        this.setSize(500, 600);
        //this.setResizable(false);//不想让窗体拖拽大小
        this.setLocationRelativeTo(null);// 设置居中显示
        // 设置Jframe窗体关闭时 程序结束
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }

    public synchronized static AdminFrame getAdminFrame() {
        if (adminFrame == null) {
            adminFrame = new AdminFrame();
        }
        return adminFrame;
    }

    public void background(){
        ((JPanel)this.getContentPane()).setOpaque(false);
        ImageIcon img = new ImageIcon("src/img/back.png"); //添加图片
        JLabel background = new  JLabel(img);
        this.getLayeredPane().add(background, new Integer(Integer.MIN_VALUE));
        background.setBounds(0, 0, img.getIconWidth(), img.getIconHeight());
    }
}
