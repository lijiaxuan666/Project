package view;

import domain.Question;
import service.QuestionService;
import util.MySpring;
import util.QuestionFileReader;
import util.UserFileReader;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.HashSet;

public class AdminFrame extends JFrame {


    private static AdminFrame adminFrame;
    private QuestionService service = MySpring.getBean("service.QuestionService");
    private HashSet<Question> list;

    //分割线
    private ArrayList<JLabel> arr = new ArrayList<>();

    protected AdminFrame() {
        //创建试卷管理按钮
        JButton man_qu = new JButton("试卷管理");
        man_qu.setBounds(5, 50, 90, 30);

        //创建学生管理按钮
        JButton man_stu = new JButton("学生管理");
        man_stu.setBounds(5, 150, 90, 30);

        //创建测评结果管理按钮
        JButton res_stu = new JButton("测评结果");
        res_stu.setBounds(5, 250, 90, 30);

        JTextField title = new JTextField("试题列表");
        title.setBounds(330, 15, 135, 35);
        title.setFont(new Font("黑体", Font.BOLD, 30));

        // 创建编号与编号输入框
        JLabel quest = new JLabel("问题：");
        JTextField questionTextField = new JTextField();
        quest.setBounds(100, 430, 50, 25);
        questionTextField.setBounds(160, 430, 200, 25);

        //选项A
        JLabel aLable = new JLabel("选项A：");
        JTextField aTextField = new JTextField();
        aLable.setBounds(100, 460, 50, 25);
        aTextField.setBounds(160, 460, 200, 25);

        //选项B
        JLabel bLable = new JLabel("选项B：");
        JTextField bTextField = new JTextField();
        bLable.setBounds(100, 490, 50, 25);
        bTextField.setBounds(160, 490, 200, 25);

        //选项C
        JLabel cLable = new JLabel("选项C：");
        JTextField cTextField = new JTextField();
        cLable.setBounds(100, 520, 50, 25);
        cTextField.setBounds(160, 520, 200, 25);

        // 删除的问题序号
        JLabel delnum = new JLabel("删除序号：");
        JTextField delnumTextField = new JTextField();
        delnum.setBounds(470, 460, 70, 25);
        delnumTextField.setBounds(550, 460, 100, 25);

        //创建增加按钮
        JButton addQuestion = new JButton("添加试题");
        addQuestion.setBounds(180, 560, 150, 30);

        //创建删除按钮
        JButton delQuestion = new JButton("删除试题");
        delQuestion.setBounds(500, 560, 150, 30);

        // 创建表格
        JTable table = new JTable();
        //设置表格
        table.setModel(new DefaultTableModel(
                new Object[][]{}, new String[]{"序号", "题目", "选项A", "选项B", "选项C"}
        ));
        table.setRowHeight(16);
        table.getColumnModel().getColumn(0).setPreferredWidth(40);
        table.getColumnModel().getColumn(1).setPreferredWidth(360);
        table.getColumnModel().getColumn(2).setPreferredWidth(100);
        table.getColumnModel().getColumn(3).setPreferredWidth(100);
        table.getColumnModel().getColumn(4).setPreferredWidth(100);
        DefaultTableModel model = (DefaultTableModel) table.getModel();
        list = QuestionFileReader.getQuestion();

        //从文件查找数据放入表格中
        if (!list.isEmpty()) {
            int index = 1;
            for (Question question : list) {
                String[] str = question.getTitle().split(" ");
                //去除掉选项前面的ABC以及换行符<br>
                if (str[0].length() >= 4 && str[1].length() >= 4 && str[2].length() >= 4 && str[3].length() >= 2)
                    model.addRow(new Object[]{index++, str[0].substring(0, str[0].length() - 4), str[1].substring(2, str[1].length() - 4), str[2].substring(2, str[2].length() - 4), str[3].substring(2)});
            }
        }

        // 创建table滚动窗体
        JScrollPane scrollPane = new JScrollPane(table);
        scrollPane.setBounds(50, 60, 700, 350);
        //创建监听器
        addQuestion.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                //获取输入的问题和选项
                String question = questionTextField.getText();
                String A = aTextField.getText();
                String B = bTextField.getText();
                String C = cTextField.getText();
                String res = question + "<br> A." + A + "<br> B." + B + "<br> C." + C;
                service.saveQuestion(res);

                JOptionPane.showMessageDialog(AdminFrame.this, "保存成功");
                Object[] data = new Object[]{list.size() + 1, question, A, B, C};
                //将题添加到缓存
                list.add(new Question(res));
                //将新数据显示在表格中
                model.addRow(data);

                //增加后清空数据
                questionTextField.setText("");
                aTextField.setText("");
                bTextField.setText("");
                cTextField.setText("");
            }
        });

        delQuestion.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

                int num = Integer.valueOf(delnumTextField.getText());
                //删除序号对应的行的数据
                for (int i = 0; i < model.getRowCount(); i++) {
                    int number = (Integer) model.getValueAt(i, 0);
                    if (num == number) {
                        model.removeRow(i);
                    }
                    if (i == model.getRowCount() - 1) {
                        JOptionPane.showMessageDialog(AdminFrame.this, "该序号不存在");
                    }
                }

                //增加后清空数据
                delnumTextField.setText("");
            }
        });

        JTextField title2 = new JTextField("学生列表");
        title2.setBounds(330, 15, 135, 35);
        title2.setFont(new Font("黑体", Font.BOLD, 30));

        JLabel name = new JLabel("姓名：");
        JTextField nameTextField = new JTextField();
        name.setBounds(100, 430, 50, 25);
        nameTextField.setBounds(160, 430, 200, 25);

        JLabel num = new JLabel("学号：");
        JTextField numTextField = new JTextField();
        num.setBounds(100, 460, 50, 25);
        numTextField.setBounds(160, 460, 200, 25);

        JLabel major = new JLabel("专业：");
        JTextField majorTextField = new JTextField();
        major.setBounds(100, 490, 50, 25);
        majorTextField.setBounds(160, 490, 200, 25);

        JLabel class1 = new JLabel("班级：");
        JTextField class1TextField = new JTextField();
        class1.setBounds(100, 520, 50, 25);
        class1TextField.setBounds(160, 520, 200, 25);

        // 删除的问题序号
        JLabel delnum1 = new JLabel("删除序号：");
        JTextField delnumTextField1 = new JTextField();
        delnum1.setBounds(470, 460, 70, 25);
        delnumTextField1.setBounds(550, 460, 100, 25);

        JTable table2 = new JTable();
        //设置表格
        table2.setModel(new DefaultTableModel(
                new Object[][]{}, new String[]{"序号", "姓名", "学号", "专业", "班级"}
        ));
        table2.setRowHeight(16);
        DefaultTableModel model2 = (DefaultTableModel) table2.getModel();
        ArrayList<String> arr1 = UserFileReader.getStu();

        //从文件查找数据放入表格中
        if (!arr1.isEmpty()) {
            int index = 1;
            for (String strs : arr1) {
                String[] str = strs.split(" ");
                model2.addRow(new Object[]{index++, str[0], str[1], str[2], str[3]});
            }
        }

        // 创建学生table滚动窗体
        JScrollPane scrollPane2 = new JScrollPane(table2);
        scrollPane2.setBounds(50, 60, 700, 350);
        //创建增加按钮
        JButton addStu = new JButton("添加学生信息");
        addStu.setBounds(180, 560, 150, 30);
        //创建删除按钮
        JButton delStu = new JButton("删除学生信息");
        delStu.setBounds(500, 560, 150, 30);

        addStu.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                //获取输入的问题和选项
                String name = nameTextField.getText();
                String num = numTextField.getText();
                String major = majorTextField.getText();
                String class1 = class1TextField.getText();
                UserFileReader.saveStu(name, num, major, class1);
                Object[] data = new Object[]{arr1.size() + 1, name, num, major, class1};
                JOptionPane.showMessageDialog(AdminFrame.this, "保存成功");
                //将新数据显示在表格中
                model2.addRow(data);

                //增加后清空数据
                questionTextField.setText("");
                aTextField.setText("");
                bTextField.setText("");
                cTextField.setText("");
            }
        });

        delStu.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

                int num = Integer.valueOf(delnumTextField1.getText());
                //删除序号对应的行的数据
                for (int i = 0; i < model2.getRowCount(); i++) {
                    int number = (Integer) model2.getValueAt(i, 0);
                    if (num == number) {
                        model2.removeRow(i);
                        JOptionPane.showMessageDialog(AdminFrame.this, "删除成功");
                        break;
                    }
                    if (i == model2.getRowCount() - 1) {
                        JOptionPane.showMessageDialog(AdminFrame.this, "该序号不存在");
                    }
                }

                //增加后清空数据
                delnumTextField.setText("");
            }
        });

        //心里测试结果
        JTextField title3 = new JTextField("测评结果列表");
        title3.setBounds(300, 15, 200, 35);
        title3.setFont(new Font("黑体", Font.BOLD, 30));

        JTable table3 = new JTable();
        //设置表格
        table3.setModel(new DefaultTableModel(
                new Object[][]{}, new String[]{"序号", "姓名", "评分", "评价"}
        ));
        table3.setRowHeight(16);
        table3.getColumnModel().getColumn(0).setPreferredWidth(40);
        table3.getColumnModel().getColumn(1).setPreferredWidth(70);
        table3.getColumnModel().getColumn(2).setPreferredWidth(70);
        table3.getColumnModel().getColumn(3).setPreferredWidth(520);
        DefaultTableModel model3 = (DefaultTableModel) table3.getModel();
        ArrayList<String> arr2 = QuestionFileReader.readResult();

        //从文件查找数据放入表格中
        if (!arr2.isEmpty()) {
            int index = 1;
            for (String strs : arr2) {
                String[] str = strs.split(":");
                String[] str2=str[2].split("。");
                model3.addRow(new Object[]{index++, str[0], str2[0], str2[1]+str[3]});
            }
        }

        // 创建测评结果table滚动窗体
        JScrollPane scrollPane3 = new JScrollPane(table3);
        scrollPane3.setBounds(50, 60, 700, 350);



        JPanel container = new JPanel();//试卷管理内容页
        JPanel buttons = new JPanel();//按钮页
        JPanel stupanl = new JPanel();//学生内容页
        JPanel resultpanl = new JPanel();//学生内容页
        JPanel mainpanl = new JPanel();//总页面
        buttons.add(man_qu);
        buttons.add(man_stu);
        buttons.add(res_stu);
        stupanl.add(scrollPane2);
        stupanl.add(title2);
        stupanl.add(addStu);
        stupanl.add(delStu);
        stupanl.add(name);
        stupanl.add(nameTextField);
        stupanl.add(num);
        stupanl.add(numTextField);
        stupanl.add(major);
        stupanl.add(majorTextField);
        stupanl.add(class1);
        stupanl.add(class1TextField);
        stupanl.add(delnum1);
        stupanl.add(delnumTextField1);

        container.add(title);
        container.add(scrollPane);
        container.add(quest);
        container.add(questionTextField);
        container.add(aLable);
        container.add(aTextField);
        container.add(bLable);
        container.add(bTextField);
        container.add(addQuestion);
        container.add(cTextField);
        container.add(cLable);
        container.add(delQuestion);
        container.add(delnum);
        container.add(delnumTextField);

        resultpanl.add(scrollPane3);
        resultpanl.add(title3);
        //设置button区域的位置
        buttons.setLayout(null);
        buttons.setBounds(10, 10, 100, 600);
        buttons.setBorder(BorderFactory.createLineBorder(Color.GRAY));
        //内容区域位置
        container.setLayout(null);
        container.setBounds(120, 10, 780, 600);
        container.setBorder(BorderFactory.createLineBorder(Color.GRAY));
        //内容区域位置
        stupanl.setLayout(null);
        stupanl.setBounds(120, 10, 780, 600);
        stupanl.setBorder(BorderFactory.createLineBorder(Color.GRAY));

        //内容区域位置
        resultpanl.setLayout(null);
        resultpanl.setBounds(120, 10, 780, 600);
        resultpanl.setBorder(BorderFactory.createLineBorder(Color.GRAY));

        mainpanl.add(container);
        mainpanl.add(buttons);
        mainpanl.add(stupanl);
        mainpanl.add(resultpanl);
        stupanl.setVisible(false);
        resultpanl.setVisible(false);

        man_qu.addActionListener(new AbstractAction() {
            @Override
            public void actionPerformed(ActionEvent e) {
                container.setVisible(true);
                stupanl.setVisible(false);
                resultpanl.setVisible(false);
            }
        });
        man_stu.addActionListener(new AbstractAction() {
            @Override
            public void actionPerformed(ActionEvent e) {
                container.setVisible(false);
                stupanl.setVisible(true);
                resultpanl.setVisible(false);
            }
        });
        res_stu.addActionListener(new AbstractAction() {
            @Override
            public void actionPerformed(ActionEvent e) {
                container.setVisible(false);
                stupanl.setVisible(false);
                resultpanl.setVisible(true);
            }
        });

        mainpanl.setLayout(null);
        mainpanl.setBackground(Color.LIGHT_GRAY);
        this.add(mainpanl);

        this.setTitle("后台数据管理");
        this.setVisible(true);
        this.setSize(925, 658);
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
}
