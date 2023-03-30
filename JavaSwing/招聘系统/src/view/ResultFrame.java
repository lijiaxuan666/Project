package view;

import domain.Result;
import service.QuestionService;
import util.MySpring;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.util.ArrayList;

public class ResultFrame extends JFrame {


    private static ResultFrame resultFrame;
    private QuestionService service = MySpring.getBean("service.QuestionService");

    //分割线
    private ArrayList<JLabel> arr = new ArrayList<>();

    protected ResultFrame(ArrayList<Result> list) {

        // 创建表格
        JTable table = new JTable();
        //设置表格
        table.setModel(new DefaultTableModel(
                new Object[][]{}, new String[]{"序号", "公司名称", "公司简介", "录取率", "权重"}
        ));
        table.setRowHeight(20);
        table.getColumnModel().getColumn(0).setPreferredWidth(50);
        table.getColumnModel().getColumn(1).setPreferredWidth(150);
        table.getColumnModel().getColumn(2).setPreferredWidth(300);
        table.getColumnModel().getColumn(3).setPreferredWidth(100);
        table.getColumnModel().getColumn(4).setPreferredWidth(50);
        DefaultTableModel model = (DefaultTableModel) table.getModel();

        //从文件查找数据放入表格中
        if (!list.isEmpty()) {
            int index = 1;
            for (Result res : list) {
                String weight="";
                if(Double.parseDouble(res.getScore())>80) weight = "保";
                else if(Double.parseDouble(res.getScore())>60) weight = "稳";
                else weight = "冲";
                model.addRow(new Object[]{index++, res.getQuestion().getName(),res.getQuestion().getIntro(), res.getScore()+"%", weight});
            }
        }

        // 创建table滚动窗体
        JScrollPane scrollPane = new JScrollPane(table);
        scrollPane.setBounds(10, 10, 650, 350);

        JPanel container = new JPanel();

        container.add(scrollPane);

        container.setLayout(null);
        container.setBackground(Color.LIGHT_GRAY);
        this.add(container);

        this.setTitle("匹配结果");
        this.setVisible(true);
        this.setSize(685, 410);
        //this.setResizable(false);//不想让窗体拖拽大小
        this.setLocationRelativeTo(null);// 设置居中显示
        // 设置Jframe窗体关闭时 程序结束
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }

    public synchronized static ResultFrame getResultFrame(ArrayList<Result> list) {
        if (resultFrame == null) {
            resultFrame = new ResultFrame(list);
        }
        return resultFrame;
    }
}

