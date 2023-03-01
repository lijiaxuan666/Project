package view;

import service.UserService;
import util.BaseFrame;
import util.MySpring;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;


public class LoginFrame extends BaseFrame {

    private LoginFrame(){
        super("登录窗口");
        this.init();
    }
    private static LoginFrame loginFrame;
    public synchronized static LoginFrame getLoginFrame(){
        if (loginFrame == null){
            loginFrame = new LoginFrame();
        }
        return loginFrame;
    }

    private UserService service = MySpring.getBean("service.UserService");

    //创建一个面板
    private JPanel mainPanel = new JPanel();
    //创建title显示标题
    private JLabel titleLabel = new JLabel("心 理 测 试 系 统");
    //创建账号和密码的标题
    private JLabel accountLabel = new JLabel("账 户：");
    private JLabel passwordLabel = new JLabel("密 码：");
    private JLabel labDo = new JLabel("权 限：");
    private String[] labs = {"管理员","用户"};
    private JComboBox labCombo = new JComboBox(labs);
    //创建输入账号和密码的文本框/密码框
    private JTextField accountField = new JTextField();
    private JPasswordField passwordField = new JPasswordField();
    //创建两个按钮
    private JButton loginButton = new JButton("登 录");
    private JButton registerButton = new JButton("注 册");

    //设置每一个组件的位置 大小 字体 布局等等
    protected void setFontAndSoOn(){
        //设置组件的位置----布局管理
        //设置panel的布局管理为自定义方式
        mainPanel.setLayout(null);
        //设置标题组件的位置和字体大小
        titleLabel.setBounds(120,40,340,35);
        titleLabel.setFont(new Font("黑体",Font.BOLD,34));
        //设置用户名label位置和字体大小
        accountLabel.setBounds(94,124,90,30);
        accountLabel.setFont(new Font("黑体",Font.BOLD,24));
        //设置用户名filed位置和字体大小
        accountField.setBounds(204,124,260,30);
        accountField.setFont(new Font("黑体",Font.BOLD,24));
        //设置密码label位置和字体大小
        passwordLabel.setBounds(94,174,90,30);
        passwordLabel.setFont(new Font("黑体",Font.BOLD,24));
        //设置密码field位置和字体大小
        passwordField.setBounds(204,174,260,30);
        passwordField.setFont(new Font("黑体",Font.BOLD,24));

        labDo.setBounds(94,214,90,30);
        labDo.setFont(new Font("黑体",Font.BOLD,24));
        labCombo.setBounds(204,214,120,30);


        //设置登录按钮的位置和文字大小
        loginButton.setBounds(154,292,100,30);
        loginButton.setFont(new Font("黑体",Font.BOLD,22));
        //设置退出按钮的位置和文字大小
        registerButton.setBounds(304,292,100,30);
        registerButton.setFont(new Font("黑体",Font.BOLD,22));
    }

    //将所有的组件添加在窗体上
    protected void addElement(){
        //将所有的组件添加至窗体上
        mainPanel.add(titleLabel);
        mainPanel.add(accountLabel);
        mainPanel.add(accountField);
        mainPanel.add(passwordLabel);
        mainPanel.add(passwordField);
        mainPanel.add(loginButton);
        mainPanel.add(registerButton);
        mainPanel.add(labCombo);
        mainPanel.add(labDo);
        this.add(mainPanel);
    }

    //绑定事件监听
    protected void addListener(){

        loginButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                //1.获取用户输入的账号和密码
                //  从登录窗口上的组件内获取   文本框  密码框
                String account = accountField.getText();
                String password = new String(passwordField.getPassword());
                String power= (String) labCombo.getSelectedItem();

                if(power.equals("管理员")){
                    if(account.equals("admin")&&password.equals("admin")){
                        LoginFrame.this.setVisible(false);//将登录窗口隐藏
                        AdminFrame.getAdminFrame();
                    }else{
                        //弹出一个警告框 告诉登录失败啦
                        JOptionPane.showMessageDialog(LoginFrame.this,"用户名或密码错误");
                        //设置文本框和密码框的值为空
                        accountField.setText("");
                        passwordField.setText("");
                    }
                }else{
                    String result = service.login(account,password);
                    if (result.equals("登录成功")){//用户登录成功
                        LoginFrame.this.setVisible(false);//将登录窗口隐藏
                        ExamFrame.getExamFrame(account);
                    }else{
                        //弹出一个警告框 告诉登录失败啦
                        JOptionPane.showMessageDialog(LoginFrame.this,result);
                        //设置文本框和密码框的值为空
                        accountField.setText("");
                        passwordField.setText("");
                    }
                }

            }
        });

        registerButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                LoginFrame.this.setVisible(false);//将登录窗口隐藏
                RegisterFrame.getRegisterFrame();
            }
        });

    }

    protected void setFrameSelf(){
        //设置窗体起始位置和大小
        this.setBounds(600,280,560,400);
        //设置点击关闭退出程序
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        //设置窗体大小不可拖拽
        this.setResizable(false);
        //设置窗体显示状态
        this.setVisible(true);
    }

}
