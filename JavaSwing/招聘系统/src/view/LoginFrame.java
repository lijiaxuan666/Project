package view;

import util.BaseFrame;
import util.CreateUtil;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.net.URL;


public class LoginFrame extends BaseFrame {

    private static LoginFrame loginFrame;
    //创建一个面板
    private JPanel mainPanel = new JPanel();
    //创建title显示标题
    private JLabel titleLabel = new JLabel("招 聘 系 统");
    private CreateUtil myutil=new CreateUtil();
    //创建两个按钮
    private JButton recruitButton = myutil.new Create_Login_Button("我要招聘",25);
    private JButton acceptButton = myutil.new Create_Login_Button("我要应聘",25);
    private LoginFrame() {
        super("登录窗口");
        this.init();
    }

    public synchronized static LoginFrame getLoginFrame() {
        if (loginFrame == null) {
            loginFrame = new LoginFrame();
        }
        return loginFrame;
    }

    //设置每一个组件的位置 大小 字体 布局等等
    protected void setFontAndSoOn() {
        //设置组件的位置----布局管理
        //设置panel的布局管理为自定义方式
        mainPanel.setLayout(null);
        //设置标题组件的位置和字体大小
        titleLabel.setBounds(140, 40, 340, 35);
        titleLabel.setFont(new Font("黑体", Font.BOLD, 34));
        recruitButton.setFocusPainted(false);
        recruitButton.setPreferredSize(new Dimension(50, 30));
        recruitButton.setBackground(new Color(0,131,255));
        recruitButton.setBounds(140, 300, 200, 30);
        recruitButton.setFont(new Font("黑体", Font.BOLD, 22));
        acceptButton.setBounds(140, 400, 200, 30);
        acceptButton.setFont(new Font("黑体", Font.BOLD, 22));
        acceptButton.setFocusPainted(false);
        acceptButton.setPreferredSize(new Dimension(50, 30));
        acceptButton.setBackground(new Color(0,131,255));
    }

    //将所有的组件添加在窗体上
    protected void addElement() {
        background();
        //将所有的组件添加至窗体上
        mainPanel.add(titleLabel);
        mainPanel.add(recruitButton);
        mainPanel.add(acceptButton);
        mainPanel.setOpaque(false);
        this.add(mainPanel);
    }

    //绑定事件监听
    protected void addListener() {

        recruitButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                LoginFrame.this.setVisible(false);
                AdminFrame.getAdminFrame();
            }
        });

        acceptButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                LoginFrame.this.setVisible(false);
                MyFrame.getMyFrame();
            }
        });

    }

    protected void setFrameSelf() {


        //设置窗体起始位置和大小
        this.setBounds(650, 280, 500, 600);
        //设置点击关闭退出程序
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        //设置窗体大小不可拖拽
        this.setResizable(false);
        //设置窗体显示状态
        this.setVisible(true);
    }

    public void background(){
        ((JPanel)this.getContentPane()).setOpaque(false);
        ImageIcon img = new ImageIcon("src/img/back.png"); //添加图片
        JLabel background = new  JLabel(img);
        this.getLayeredPane().add(background, new Integer(Integer.MIN_VALUE));
        background.setBounds(0, 0, img.getIconWidth(), img.getIconHeight());
    }

}
