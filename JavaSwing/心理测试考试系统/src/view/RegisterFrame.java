package view;

import service.UserService;
import util.BaseFrame;
import util.MySpring;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;


public class RegisterFrame extends BaseFrame {

    private static RegisterFrame registerFrame;
    private UserService service = MySpring.getBean("service.UserService");
    //创建一个面板
    private JPanel mainPanel = new JPanel();
    //创建title显示标题
    private JLabel titleLabel = new JLabel("用户注册");
    //创建账号和密码的标题
    private JLabel accountLabel = new JLabel("账 户：");
    private JLabel passwordLabel = new JLabel("密 码：");
    private JLabel acpasswordLabel = new JLabel("确认密码：");
    //创建输入账号和密码的文本框/密码框
    private JTextField accountField = new JTextField();
    private JPasswordField passwordField = new JPasswordField();
    private JPasswordField acpasswordField = new JPasswordField();
    //创建两个按钮
    private JButton registerbutton = new JButton("注 册");
    private RegisterFrame() {
        super("注册窗口");
        this.init();
    }

    public synchronized static RegisterFrame getRegisterFrame() {
        if (registerFrame == null) {
            registerFrame = new RegisterFrame();
        }
        return registerFrame;
    }

    //设置每一个组件的位置 大小 字体 布局等等
    protected void setFontAndSoOn() {
        //设置组件的位置----布局管理
        //设置panel的布局管理为自定义方式
        mainPanel.setLayout(null);
        //设置标题组件的位置和字体大小
        titleLabel.setBounds(200, 30, 340, 35);
        titleLabel.setFont(new Font("黑体", Font.BOLD, 34));
        //设置用户名label位置和字体大小
        accountLabel.setBounds(94, 104, 120, 30);
        accountLabel.setFont(new Font("黑体", Font.BOLD, 24));
        //设置用户名filed位置和字体大小
        accountField.setBounds(204, 104, 260, 30);
        accountField.setFont(new Font("黑体", Font.BOLD, 24));
        //设置密码label位置和字体大小
        passwordLabel.setBounds(94, 154, 120, 30);
        passwordLabel.setFont(new Font("黑体", Font.BOLD, 24));
        //设置密码field位置和字体大小
        passwordField.setBounds(204, 154, 260, 30);
        passwordField.setFont(new Font("黑体", Font.BOLD, 24));
        //设置确认密码label位置和字体大小
        acpasswordLabel.setBounds(94, 204, 120, 30);
        acpasswordLabel.setFont(new Font("黑体", Font.BOLD, 20));
        //设置确认密码field位置和字体大小
        acpasswordField.setBounds(204, 204, 260, 30);
        acpasswordField.setFont(new Font("黑体", Font.BOLD, 20));
        //设置登录按钮的位置和文字大小
        registerbutton.setBounds(220, 242, 100, 30);
        registerbutton.setFont(new Font("黑体", Font.BOLD, 22));
    }

    //将所有的组件添加在窗体上
    protected void addElement() {
        //将所有的组件添加至窗体上
        mainPanel.add(titleLabel);
        mainPanel.add(accountLabel);
        mainPanel.add(accountField);
        mainPanel.add(passwordLabel);
        mainPanel.add(passwordField);
        mainPanel.add(registerbutton);
        mainPanel.add(acpasswordField);
        mainPanel.add(acpasswordLabel);
        this.add(mainPanel);
    }

    //绑定事件监听
    protected void addListener() {
        registerbutton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                //获取用户输入的账号、密码和确认密码
                String account = accountField.getText();
                String password = new String(passwordField.getPassword());
                String acpassword = new String(acpasswordField.getPassword());

                if(account==null||account.equals("")||password==null||password.equals("")||acpassword==null||acpassword.equals("")){
                    //弹出一个警告框告诉注册失败
                    JOptionPane.showMessageDialog(RegisterFrame.this, "注册失败，请填写完整信息");
                    //设置文本框和密码框的值为空
                    accountField.setText("");
                    passwordField.setText("");
                    acpasswordField.setText("");
                }else if (account.equals("admin")) {
                    JOptionPane.showMessageDialog(RegisterFrame.this, "注册失败，管理员账号无法被注册");
                    accountField.setText("");
                    passwordField.setText("");
                    acpasswordField.setText("");
                }else if (!account.equals("admin")&&password.equals(acpassword)) {
                    JOptionPane.showMessageDialog(RegisterFrame.this, "注册成功");
                    service.register(account,password);
                    RegisterFrame.this.setVisible(false);//将注册窗口隐藏
                    ExamFrame.getExamFrame(account);
                } else {
                    JOptionPane.showMessageDialog(RegisterFrame.this, "注册失败，两次输入密码不同");
                    accountField.setText("");
                    passwordField.setText("");
                    acpasswordField.setText("");
                }
            }
        });


    }

    protected void setFrameSelf() {
        //设置窗体起始位置和大小
        this.setBounds(600, 280, 560, 340);
        //设置点击关闭退出程序
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        //设置窗体大小不可拖拽
        this.setResizable(false);
        //设置窗体显示状态
        this.setVisible(true);
    }

}
