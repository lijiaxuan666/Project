package util;

import javax.swing.*;
import java.awt.*;

public class CreateUtil {
    //自定义文本框
    public class Create_textfield extends JTextField {
        public Create_textfield(int n) {
            super(n);
            setFont(new Font("宋体", 1, 15));
            setPreferredSize(new Dimension(215, 30));
        }
    }
    //自定义密码框
    public class Create_codefield extends JPasswordField{
        public Create_codefield(int n) {
            super(n);
            setFont(new Font("宋体", 1, 15));
            setPreferredSize(new Dimension(215, 30));
        }
    }
    //自定义标签
    public class Create_label extends JLabel{
        public Create_label(String name,Color color) {
            super(name);
            setFont(new Font("微软雅黑", 1, 18));
            setForeground(color);
            setHorizontalAlignment(SwingConstants.CENTER);
        }
        public Create_label(String name,Color color,int size) {
            super(name);
            setFont(new Font("微软雅黑", 1, size));
            setForeground(color);
            setHorizontalAlignment(SwingConstants.CENTER);
        }
    }
    //自定义按钮
    public class Create_Login_Button extends JButton{
        public Create_Login_Button(String text) {
            super(text);
            setBackground(new Color(0,191,255));
            setPreferredSize(new Dimension(215, 37));
            setForeground(Color.white);
            setFocusPainted(false);
            setFont(new Font("微软雅黑", 1, 15));
            setHorizontalAlignment(SwingConstants.CENTER);
        }
        public Create_Login_Button(String text,int size) {
            super(text);
            setBackground(new Color(8, 255, 0));
            setPreferredSize(new Dimension(215, 37));
            setForeground(Color.white);
            setFocusPainted(false);
            setFont(new Font("微软雅黑", 1, size));
            setHorizontalAlignment(SwingConstants.CENTER);
        }
    }

}
