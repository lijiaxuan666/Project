package view;

import domain.Question;
import service.QuestionService;
import util.BaseFrame;
import util.MySpring;
import util.QuestionFileReader;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;


public class ExamFrame extends BaseFrame {

    private static ExamFrame examFrame;
    //当前登录的用户
    private static String account;
    private QuestionService service = MySpring.getBean("service.QuestionService");
    //试卷
    private ArrayList<Question> paper = service.getPaper(20);
    //答题卡
    private String[] answers = new String[paper.size() + 1];
    private int totalCount = paper.size();//题目总数
    private int unanswerCount = totalCount;//未答

    //控制窗体右侧的数值显示
    private int nowNumber = 0;//当前题号
    private int answerCount = 0;//已答

    //记录倒计时事件, 分钟为单位
    private int time = 20;

    //内部类 - 线程对象, 处理事件倒计时
    private TimeControlThread timeControlThread = new TimeControlThread();

    //添加三个panel 区域的分割
    private JPanel mainPanel = new JPanel();//负责答题主页面展示
    private JPanel messagePanel = new JPanel();//负责右侧信息展示
    private JPanel buttonPanel = new JPanel();//负责下方按钮的展示

    //添加主要答题的组件
    private JTextArea examArea = new JTextArea();//考试文本域 展示题目
    private JScrollPane scrollPane = new JScrollPane(examArea);//滚动条

    //添加右侧信息的组件
    private JLabel pictureLabel = new JLabel();//展示图片信息
    private JLabel nowNumLabel = new JLabel("当前题号：");//提示当前的题号
    private JLabel totalCountLabel = new JLabel("题目总数：");//提示题目的总数
    private JLabel answerCountLabel = new JLabel("已答题数：");//提示已经答过的题目数量
    private JLabel unanswerCountLabel = new JLabel("未答题数：");//提示未答题数量
    private JTextField nowNumField = new JTextField();//展示题号
    private JTextField totalCountField = new JTextField();//展示总数
    private JTextField answerCountField = new JTextField();//展示已答数
    private JTextField unanswerCountField = new JTextField();//展示未答数
    private JLabel timeLabel = new JLabel("剩余答题时间");//提示剩余时间
    private JLabel realTimeLabel = new JLabel();//倒计时真实时间
    //添加下方按钮的组件
    private JButton aButton = new JButton("A");//a按钮
    private JButton bButton = new JButton("B");//b按钮
    private JButton cButton = new JButton("C");//c按钮
    private JButton prevButton = new JButton("上一题");//previous题
    private JButton nextButton = new JButton("下一题");//next题
    private JButton submitButton = new JButton("提交试卷");//提交按钮

    private ExamFrame() {
        super("考试窗口");
        this.init();
    }

    public synchronized static ExamFrame getExamFrame(String user) {
        if (examFrame == null) {
            examFrame = new ExamFrame();
        }
        account = user;
        return examFrame;
    }

    @Override
    protected void setFontAndSoOn() {
        //设置panel布局管理---->自定义
        mainPanel.setLayout(null);
        mainPanel.setBackground(Color.LIGHT_GRAY);

        //设置message区域的位置
        messagePanel.setLayout(null);
        messagePanel.setBounds(680, 10, 300, 550);
        messagePanel.setBorder(BorderFactory.createLineBorder(Color.GRAY));

        //设置button区域的位置
        buttonPanel.setLayout(null);
        buttonPanel.setBounds(16, 470, 650, 90);
        buttonPanel.setBorder(BorderFactory.createLineBorder(Color.GRAY));

        //手动设置每一个组件的位置 字体 背景
        scrollPane.setBounds(16, 10, 650, 450);

        examArea.setFont(new Font("黑体", Font.BOLD, 20));
        examArea.setEnabled(false);//文本域中的文字不能编辑
        this.showQuestion();//展示第一道题

        pictureLabel.setBounds(10, 10, 280, 230);
        pictureLabel.setBorder(BorderFactory.createLineBorder(Color.GRAY));
        //pictureLabel.setIcon(null);//展示图片信息

        nowNumLabel.setBounds(40, 270, 100, 30);
        nowNumLabel.setFont(new Font("黑体", Font.PLAIN, 20));
        nowNumField.setBounds(150, 270, 100, 30);
        nowNumField.setFont(new Font("黑体", Font.BOLD, 20));
        nowNumField.setBorder(BorderFactory.createLineBorder(Color.GRAY));
        nowNumField.setEnabled(false);
        nowNumField.setHorizontalAlignment(JTextField.CENTER);

        totalCountLabel.setBounds(40, 310, 100, 30);
        totalCountLabel.setFont(new Font("黑体", Font.PLAIN, 20));
        totalCountField.setBounds(150, 310, 100, 30);
        totalCountField.setFont(new Font("黑体", Font.BOLD, 20));
        totalCountField.setBorder(BorderFactory.createLineBorder(Color.GRAY));
        totalCountField.setEnabled(false);
        totalCountField.setHorizontalAlignment(JTextField.CENTER);

        answerCountLabel.setBounds(40, 350, 100, 30);
        answerCountLabel.setFont(new Font("黑体", Font.PLAIN, 20));
        answerCountField.setBounds(150, 350, 100, 30);
        answerCountField.setFont(new Font("黑体", Font.BOLD, 20));
        answerCountField.setBorder(BorderFactory.createLineBorder(Color.GRAY));
        answerCountField.setEnabled(false);
        answerCountField.setHorizontalAlignment(JTextField.CENTER);

        unanswerCountLabel.setBounds(40, 390, 100, 30);
        unanswerCountLabel.setFont(new Font("黑体", Font.PLAIN, 20));
        unanswerCountField.setBounds(150, 390, 100, 30);
        unanswerCountField.setFont(new Font("黑体", Font.BOLD, 20));
        unanswerCountField.setBorder(BorderFactory.createLineBorder(Color.GRAY));
        unanswerCountField.setEnabled(false);
        unanswerCountField.setHorizontalAlignment(JTextField.CENTER);

        timeLabel.setBounds(90, 460, 150, 30);
        timeLabel.setFont(new Font("黑体", Font.PLAIN, 20));
        timeLabel.setForeground(Color.BLUE);
        realTimeLabel.setBounds(108, 490, 150, 30);
        realTimeLabel.setFont(new Font("黑体", Font.BOLD, 20));
        realTimeLabel.setForeground(Color.BLUE);

        aButton.setBounds(110, 10, 120, 30);
        aButton.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        bButton.setBounds(260, 10, 120, 30);
        bButton.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        cButton.setBounds(410, 10, 120, 30);
        cButton.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        prevButton.setBounds(60, 50, 100, 30);
        prevButton.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        nextButton.setBounds(490, 50, 100, 30);
        nextButton.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        submitButton.setBounds(276, 50, 100, 30);
        submitButton.setForeground(Color.RED);
        submitButton.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));

        //设置控制窗体右侧的数值
        nowNumField.setText(nowNumber + 1 + "");
        totalCountField.setText(totalCount + "");
        answerCountField.setText(answerCount + "");
        unanswerCountField.setText(unanswerCount + "");

    }

    @Override
    protected void addElement() {
        messagePanel.add(pictureLabel);
        messagePanel.add(nowNumLabel);
        messagePanel.add(nowNumField);
        messagePanel.add(totalCountLabel);
        messagePanel.add(totalCountField);
        messagePanel.add(answerCountLabel);
        messagePanel.add(answerCountField);
        messagePanel.add(unanswerCountLabel);
        messagePanel.add(unanswerCountField);
        messagePanel.add(timeLabel);
        messagePanel.add(realTimeLabel);
        buttonPanel.add(aButton);
        buttonPanel.add(bButton);
        buttonPanel.add(cButton);
        buttonPanel.add(prevButton);
        buttonPanel.add(nextButton);
        buttonPanel.add(submitButton);
        mainPanel.add(scrollPane);
        mainPanel.add(messagePanel);
        mainPanel.add(buttonPanel);
        this.add(mainPanel);
    }

    @Override
    protected void addListener() {

        //4个选项按钮
        ActionListener option = new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                //清楚全部选项按钮的颜色
                ExamFrame.this.clearOptionButtonColor();
                //处理点击的按钮
                JButton button = (JButton) e.getSource();
                button.setBackground(Color.GREEN);
                //填写答题卡
                answers[nowNumber] = button.getText();
            }
        };
        aButton.addActionListener(option);
        bButton.addActionListener(option);
        cButton.addActionListener(option);

        //next按钮
        nextButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (nowNumber == 0) {
                    prevButton.setEnabled(true);
                }
                //清楚全部选项按钮的颜色
                ExamFrame.this.clearOptionButtonColor();
                //题号增加
                nowNumber++;
                //主界面与按钮界面变化
                if (nowNumber == totalCount) {//答完
                    examArea.setText("全部题目已经回答完毕\n请点击下方提交按钮");
                    //next按钮失效
                    nextButton.setEnabled(false);
                    //全部选项按钮失效
                    ExamFrame.this.setOptionButtonEnabled(false);
                } else {
                    ExamFrame.this.showQuestion();
                    //修改右侧题号
                    ExamFrame.this.nowNumField.setText(nowNumber + 1 + "");
                }
                //修改已答题 未答题
                ExamFrame.this.answerCountField.setText(++answerCount + "");
                ExamFrame.this.unanswerCountField.setText(--unanswerCount + "");
                //还原之前的选择
                ExamFrame.this.restoreButton();
            }
        });

        //prev按钮
        prevButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (nowNumber == totalCount) {
                    ExamFrame.this.setOptionButtonEnabled(true);
                    nextButton.setEnabled(true);
                }
                //清除全部选项按钮的颜色
                ExamFrame.this.clearOptionButtonColor();
                //题号减少
                nowNumber--;
                //按钮界面变化
                if (nowNumber == 0) {
                    prevButton.setEnabled(false);
                }
                //显示题目
                ExamFrame.this.showQuestion();
                //修改右侧题号 已答题 未答题
                nowNumField.setText(nowNumber + 1 + "");
                answerCountField.setText(--answerCount + "");
                unanswerCountField.setText(++unanswerCount + "");
                //还原之前的选择
                ExamFrame.this.restoreButton();
            }
        });

        //submit按钮
        submitButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                //0.显示确认框
                //是0 否1 取消2
                int value = JOptionPane.showConfirmDialog(ExamFrame.this, "确认提交？");
                if (value == 0) {
                    //1.倒计时停止
                    timeControlThread.stopTimeThread();
                    //2.所有按钮失效
                    setOptionButtonEnabled(false);
                    nextButton.setEnabled(false);
                    prevButton.setEnabled(false);
                    //3.选项按钮颜色清楚
                    clearOptionButtonColor();
                    //4.最终成绩的计算，并展示
                    float score = gradePaper();
                    StringBuffer sb1 = new StringBuffer();
                    String result = "";
                    if (score >= 61 && score <= 75) {
                        result = "你本次测试的最终得分是: " + score + "。\n" +
                                "儿童，儿童心理年龄的关键词是:幼稚。" + "\n" +
                                "你的心理年龄只有10岁左右，你对这个世界还充满了好奇心，一切在你看来" + "\n" +
                                "都是新鲜和有趣的。你对外界的反应很直接，对情绪的控制能力很差。如果" + "\n" +
                                "说你的生理年龄超过了心理年龄，那么你会很难适应周围的环境。";
                    } else if (score >= 51 && score <= 60) {
                        result = "你本次测试的最终得分是: " + score + "。\n" +
                                "年轻人，年轻人心理年龄的关键词是:冲突。" + "\n" +
                                "你的心理年龄在20~30岁，你已经有了自己的想法，也能控制一部分情绪和承担一定的" + "\n" +
                                "责任。当你的理想化和现实发生冲突的时候，你会感到很痛苦，正在不断地摸索解决的" + "\n" +
                                "办法。如果说你的生理年龄与你的心理年龄产生超 过10岁以上的差异，那么你的适应" + "\n" +
                                "能力有待调节。";
                    } else if (score >= 36 && score <= 50) {
                        result = "你本次测试的最终得分是: " + score + "。\n" +
                                "中年人，中年人心理年龄的关键词是:成熟。" + "\n" +
                                "你的心理年龄在35~50岁，你完全知道怎么处理各种矛盾，你也知道自己的问题出在哪" + "\n" +
                                "里，你有了丰富的社会经验和与人打交道的能力。对于生活中的大部分问题，你已经" + "\n" +
                                "有了解决的办法。如果说你的生理年龄与你的心理 年龄相差无几，那么你的适应能力" + "\n" +
                                "已经很好。";
                    } else {
                        result = "你本次测试的最终得分是: " + score + "。\n" +
                                "老人，老年人心理年龄的关键词是:固执。" + "\n" +
                                "你的心理年龄在50~70岁，你认为自己已经完全了解整个社会的所有问题，你形" + "\n" +
                                "成了自己的处世风格。遇到问题，你坚信只有你知道唯一的 正确答案。内心深处" + "\n" +
                                "已经逐渐拒绝接受改变。如果说你的生理年龄比你的心理年龄小，那么 你需要的" + "\n" +
                                "是打破固有的约束，跟上社会的步伐继续前进。";
                    }
                    sb1.append(result);
                    sb1.append("\n\n您以前的测试结果为：\n");
                    ArrayList<String> strings = QuestionFileReader.readResult(account);
                    for (String str : strings) {
                        sb1.append(str + "\n");
                    }
                    examArea.setText(sb1.toString());

                    //输出文件时去掉换行
                    String[] strs = result.split("\n");
                    StringBuffer sb = new StringBuffer();
                    for (String str : strs) {
                        sb.append(str);
                    }
                    service.saveResult(account + ":" + sb.toString());
                }
            }
        });
    }

    @Override
    protected void setFrameSelf() {
        this.setBounds(260, 130, 1000, 600);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setResizable(false);//不想让窗体拖拽大小
        this.setVisible(true);//最终展示整个窗体
        timeControlThread.start();//启动线程, 倒计时开始
    }

    //展示一道题目
    private void showQuestion() {
        Question question = paper.get(nowNumber);
        //展示图片
        pictureLabel.setIcon(this.drawPicture("src\\img\\" + "exam.jpg"));
        examArea.setText((nowNumber + 1) + "." + question.getTitle().replace("<br>", "\n   "));
    }

    //画图
    private ImageIcon drawPicture(String path) {
        ImageIcon imageIcon = new ImageIcon(path);
        imageIcon.setImage(imageIcon.getImage().getScaledInstance(280, 230, Image.SCALE_DEFAULT));
        return imageIcon;
    }

    //下一题时清除全部选项按钮的颜色
    private void clearOptionButtonColor() {
        aButton.setBackground(null);
        bButton.setBackground(null);
        cButton.setBackground(null);
    }

    //控制全部选项按钮是否可用
    private void setOptionButtonEnabled(boolean key) {
        aButton.setEnabled(key);
        bButton.setEnabled(key);
        cButton.setEnabled(key);
    }

    //还原上一题的选项
    private void restoreButton() {
        String answer = answers[nowNumber];
        if (answer == null) {
            return;
        }
        switch (answer) {
            case "A":
                aButton.setBackground(Color.GREEN);
                break;
            case "B":
                bButton.setBackground(Color.GREEN);
                break;
            case "C":
                cButton.setBackground(Color.GREEN);
                break;
        }
    }

    //计算最终成绩
    private float gradePaper() {
        float score = 0;
        for (int i = 0; i < paper.size(); i++) {
            if ("A".equals(answers[i])) {
                score += 3;
            } else if ("B".equals(answers[i])) {
                score += 2;
            } else if ("C".equals(answers[i])) {
                score += 1;
            } else {
                score += 0;
            }
        }
        return score;
    }

    //用来处理倒计时问题
    private class TimeControlThread extends Thread {

        private boolean flag = true;//此时正常执行线程处理

        public void stopTimeThread() {
            this.flag = false;
        }

        @Override
        public void run() {
            //time转化为   小时:分钟:秒
            int hour = time / 60;
            int minute = time % 60;
            int second = 0;
            while (flag) {
                //处理时分秒的显示
                StringBuilder builder = new StringBuilder();
                if (hour >= 0 && hour < 10) {
                    builder.append("0");
                }
                builder.append(hour);
                builder.append(":");
                if (minute >= 0 && minute < 10) {
                    builder.append("0");
                }
                builder.append(minute);
                builder.append(":");
                if (second >= 0 && second < 10) {
                    builder.append("0");
                }
                builder.append(second);
                //展示
                realTimeLabel.setText(builder.toString());
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                //改变时间
                if (second > 0) {
                    second--;
                } else {
                    if (minute > 0) {
                        second = 59;
                        minute--;
                    } else {
                        if (hour > 0) {
                            second = 59;
                            minute = 59;
                            hour--;
                        } else {
                            //考试结束
                            realTimeLabel.setForeground(Color.RED);
                            setOptionButtonEnabled(false);
                            nextButton.setEnabled(false);
                            prevButton.setEnabled(false);
                            JOptionPane.showMessageDialog(ExamFrame.this, "考试结束了");
                            break;
                        }
                    }
                }

            }
        }
    }

}
