import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MyComputer extends JFrame implements ActionListener {
    JTextArea memoryArea = new JTextArea(" ", 1, 3);
    JTextArea dispresult = new JTextArea("0. ", 1, 20);
    Font font = new Font("Arial Rounded MT Bold", Font.PLAIN, 15);

    JButton clear = new JButton("c");
    JButton[] jbuttons = new JButton[28];

    double result = 0, first = 0, second = 0;
    double memery = 0;
    char firstsymbol = '\0', secondsymbol = '\0';
    boolean prev = true, repeat = true, dot = true;

    MyComputer() {
        super("Calculator");
        try {
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        } catch (Exception e) {
            System.out.println(e);
        }
        JPanel resultField = new JPanel();
        JPanel buttonField = new JPanel();
        Container all = getContentPane();
        GridLayout gridl;
        gridl = new GridLayout(4, 6, 3, 3);
        clear.setFont(font);
        memoryArea.setFont(font);
        dispresult.setFont(font);
        memoryArea.setEditable(false);
        clear.addActionListener(this);
        dispresult.setEditable(false);
        resultField.add(memoryArea);
        resultField.add(clear);
        resultField.add(dispresult);
        all.setLayout(new FlowLayout());
        all.add(resultField);
        String[] buttonname = {"sin", "MC", "0", "1", "2", "+", "√X","cos", "MR", "3", "4", "5", "-", "X^2","tan", "MS", "6", "7", "8", "x", "+/-", "ln"," M+", "9", ".", "=", "/", "%"};
        buttonField.setLayout(gridl);
        for (int i = 0; i < 7; i++) {
            for (int j = 0; j < 4; j++) {
                jbuttons[i * 4 + j] = new JButton(buttonname[i * 4 + j]);
                jbuttons[i * 4 + j].addActionListener(this);
                jbuttons[i * 4 + j].setFont(font);
                buttonField.add(jbuttons[i * 4 + j]);
            }
        }
        all.add(buttonField);
        setSize(490, 220);
        setResizable(true);
        setVisible(true);
    }

    public static void main(String args[]) {
        MyComputer mc = new MyComputer();
    }

    public void pressNumber(String n) {
        if (prev) {
            dispresult.setText(n);
            prev = false;
        } else dispresult.append(n);
    }

    public boolean divide(double d) {
        if (d == 0) {
            dispresult.setText("除数不能为0!");
            prev = true;
            repeat = true;
            firstsymbol = '\0';
            secondsymbol = '\0';
            return true;
        }
        return false;
    }

    public void actionPerformed(ActionEvent e) //对按键事件的响应
    {
        Object source = e.getSource();//判断事件源，并进行相应的处理
        if (source == clear) {
            dispresult.setText("0.");
            firstsymbol = '\0';
            secondsymbol = '\0';
            prev = true;
            repeat = true;
            dot = true;
            return;
        }
        if (source == jbuttons[0]) {
            double temp = Math.sin(Double.parseDouble(dispresult.getText()));
            dispresult.setText(String.valueOf(temp));
            prev = true;
            repeat = false;
            dot = true;
            return;
        }
        if (source == jbuttons[1]) {
            memery = 0;
            memoryArea.setText(" ");
            prev = true;
            repeat = false;
            dot = true;
            return;
        }
        if (source == jbuttons[2]) {
            pressNumber("0");
            repeat = false;
            return;
        }
        if (source == jbuttons[3]) {
            pressNumber("1");
            repeat = false;
            return;
        }
        if (source == jbuttons[4]) {
            pressNumber("2");
            repeat = false;
            return;
        }
        if (source == jbuttons[6]) {
            double temp = Math.sqrt(Double.valueOf(dispresult.getText()));
            dispresult.setText(String.valueOf(temp));
            prev = true;
            repeat = false;
            dot = true;
            return;
        }
        if (source == jbuttons[7]) {
            double temp = Math.cos(Double.parseDouble(dispresult.getText()));
            dispresult.setText(String.valueOf(temp));
            prev = true;
            repeat = false;
            dot = true;
            return;
        }

        if (source == jbuttons[8]) {
            if (memoryArea.getText().equals(" M "))
                dispresult.setText(String.valueOf(memery));
            prev = true;
            repeat = false;
            dot = true;
            return;
        }
        if (source == jbuttons[9]) {
            pressNumber("3");
            repeat = false;
            return;
        }
        if (source == jbuttons[10]) {
            pressNumber("4");
            repeat = false;
            return;
        }
        if (source == jbuttons[11]) {
            pressNumber("5");
            repeat = false;
            return;
        }
        if (source == jbuttons[13]) {
            double temp = Math.pow(Double.valueOf(dispresult.getText()),2);
            dispresult.setText(String.valueOf(temp));
            prev = true;
            repeat = false;
            dot = true;
            return;
        }
        if (source == jbuttons[14]) {
            double temp = Math.tan(Double.parseDouble(dispresult.getText()));
            dispresult.setText(String.valueOf(temp));
            prev = true;
            repeat = false;
            dot = true;
            return;
        }
        if (source == jbuttons[15]) {
            memery = Double.parseDouble(dispresult.getText());
            if (memery != 0) memoryArea.setText("M");
            prev = true;
            repeat = false;
            dot = true;
            return;
        }
        if (source == jbuttons[16]) {
            pressNumber("6");
            repeat = false;
            return;
        }
        if (source == jbuttons[17]) {
            pressNumber("7");
            repeat = false;
            return;
        }
        if (source == jbuttons[18]) {
            pressNumber("8");
            repeat = false;
            return;
        }
        if (source == jbuttons[20]) {
            double temp = -Double.parseDouble(dispresult.getText());
            dispresult.setText(String.valueOf(temp));
            prev = true;
            repeat = false;
            dot = true;
            return;
        }
        if (source == jbuttons[21]) {
            double temp = Math.log(Double.valueOf(dispresult.getText()));
            dispresult.setText(String.valueOf(temp));
            prev = true;
            repeat = false;
            dot = true;
            return;
        }
        if (source == jbuttons[22]) {
            memery += Double.parseDouble(dispresult.getText());
            if (memery != 0) memoryArea.setText(" M ");
            prev = true;
            repeat = false;
            dot = true;
            return;
        }

        if (source == jbuttons[23]) {
            pressNumber("9");
            repeat = false;
            return;
        }
        if (source == jbuttons[24]) {
            if (dot) {
                pressNumber(".");
                dot = false;
                repeat = false;
            }
            return;
        }
        if (source == jbuttons[25]) {
            second = Double.parseDouble(dispresult.getText());
            dot = true;
            switch (secondsymbol) {
                case '*':
                    second *= first;
                    break;
                case '/':
                    if (divide(second)) return;
                    second = first / second;
            }// end of Switch ( secondsymbol )
            secondsymbol = '\0';
            switch (firstsymbol) {
                case '+':
                    result += second;
                    break;
                case '-':
                    result -= second;
                    break;
                case '*':
                    result *= second;
                    dispresult.setText(String.valueOf(result));
                    break;
                case '/':
                    if (divide(second)) return;
                    result /= second;
                    break;
                case '%':
                    result %= second;
                    dispresult.setText(String.valueOf(result));
                    break;
            }// end of switch (firstsymbo1)
            if (firstsymbol != '\0') dispresult.setText(String.valueOf(result));
            firstsymbol = '\0';
            prev = true;
            repeat = false;
            return;
        }
        if (source == jbuttons[5]) {
            dot = true;
            if (repeat) {
                firstsymbol = '+';
                return;
            }
            second = Double.parseDouble(dispresult.getText());
            switch (secondsymbol) {
                case '*':
                    second *= first;
                    break;
                case '/':
                    if (divide(second)) return;
                    second = first / second;
            }// end of switch (secondsymbol)
            secondsymbol = '\0';
            switch (firstsymbol) {
                case '\0':
                    result = second;
                    firstsymbol = '+';
                    break;
                case '+':
                    result += second;
                    dispresult.setText(String.valueOf(result));
                    break;
                case '-':
                    result -= second;
                    firstsymbol = '+';
                    dispresult.setText(String.valueOf(result));
                    break;
                case '*':
                    result *= second;
                    firstsymbol = '+';
                    dispresult.setText(String.valueOf(result));
                    break;
                case '/':
                    if (divide(second)) return;
                    result /= second;
                    firstsymbol = '+';
                    dispresult.setText(String.valueOf(result));
                case '%':
                    result %= second;
                    firstsymbol = '+';
                    dispresult.setText(String.valueOf(result));
            }//end of switch (firstsymbol)
            prev = true;
            repeat = true;
            return;
        }
        if (source == jbuttons[12]) {
            dot = true;
            if (repeat) {
                firstsymbol = '-';
                return;
            }
            second = Double.parseDouble(dispresult.getText());
            switch (secondsymbol) {
                case '*':
                    second *= first;
                    break;
                case '/':
                    if (divide(second)) return;
                    second = first / second;
                    break;
                case '%':
                    second %= first;
            }
            secondsymbol = '\0';
            switch (firstsymbol) {
                case '\0':
                    result = second;
                    firstsymbol = '-';
                    break;
                case '+':
                    result += second;
                    firstsymbol = '-';
                    dispresult.setText(String.valueOf(result));
                    break;
                case '-':
                    result -= second;
                    dispresult.setText(String.valueOf(result));
                    break;
                case '*':
                    result *= second;
                    firstsymbol = '-';
                    dispresult.setText(String.valueOf(result));
                    break;
                case '/':
                    if (divide(second)) return;
                    result /= second;
                    firstsymbol = '-';
                    dispresult.setText(String.valueOf(result));
                    break;
                case '%':
                    result %= second;
                    firstsymbol = '-';
                    dispresult.setText(String.valueOf(result));
            }
            prev = true;
            repeat = true;
            return;
        }
        if (source == jbuttons[19]) {
            dot = true;
            if (repeat) {
                if (secondsymbol == '\0') firstsymbol = '*';
                else secondsymbol = '*';
                return;
            }
            second = Double.parseDouble(dispresult.getText());
            switch (secondsymbol) {
                case '\0':
                    switch (firstsymbol) {
                        case '\0':
                            firstsymbol = '*';
                            result = second;
                            break;
                        case '+':
                        case '-':
                            first = second;
                            secondsymbol = '*';
                            break;
                        case '*':
                            result *= second;
                            dispresult.setText(String.valueOf(result));
                            break;
                        case '/':
                            if (divide(second)) return;
                            result /= second;
                            dispresult.setText(String.valueOf(result));
                            firstsymbol = '*';
                            break;
                        case '%':
                            result %= second;
                            firstsymbol = '*';
                            dispresult.setText(String.valueOf(result));
                    }
                    break;
                case '*':
                    first *= second;
                    dispresult.setText(String.valueOf(first));
                    break;
                case '/':
                    if (divide(second)) return;
                    first /= second;
                    secondsymbol = '*';
                    dispresult.setText(String.valueOf(first));
                    break;
                case '%':
                    result %= second;
                    firstsymbol = '*';
                    dispresult.setText(String.valueOf(result));
            }
            prev = true;
            repeat = true;
            return;
        }
        if (source == jbuttons[26]) {
            dot = true;
            if (repeat) {
                if (secondsymbol == '\0') firstsymbol = '/';
                else secondsymbol = '/';
                return;
            }
            second = Double.parseDouble(dispresult.getText());
            switch (secondsymbol) {
                case '\0':
                    switch (firstsymbol) {
                        case '\0':
                            firstsymbol = '/';
                            result = second;
                            break;
                        case '+':
                        case '-':
                            first = second;
                            secondsymbol = '/';
                            break;
                        case '*':
                            result *= second;
                            firstsymbol = '/';
                            dispresult.setText(String.valueOf(result));
                            break;
                        case '/':
                            if (divide(second)) return;
                            result /= second;
                            dispresult.setText(String.valueOf(result));
                            break;
                        case '%':
                            result %= second;
                            firstsymbol = '/';
                            dispresult.setText(String.valueOf(result));
                    }//end of switch ( first symbol)
                    break;
                case '*':
                    first *= second;
                    secondsymbol = '/';
                    dispresult.setText(String.valueOf(first));
                    break;
                case '/':
                    if (divide(second)) return;
                    first /= second;
                    dispresult.setText(String.valueOf(first));
                    break;
                case '%':
                    result %= second;
                    firstsymbol = '/';
                    dispresult.setText(String.valueOf(result));
            }// end of switch (secondsymbo1)
            prev = true;
            repeat = true;
            return;
        }


        if (source == jbuttons[27]) {
            dot = true;
            if (repeat) {
                if (secondsymbol == '\0') firstsymbol = '%';
                else secondsymbol = '%';
                return;
            }
            second = Double.parseDouble(dispresult.getText());
            switch (secondsymbol) {
                case '\0':
                    switch (firstsymbol) {
                        case '\0':
                            firstsymbol = '%';
                            result = second;
                            break;
                        case '+':
                        case '-':
                            first = second;
                            secondsymbol = '%';
                            break;
                        case '*':
                            result *= second;
                            firstsymbol = '%';
                            dispresult.setText(String.valueOf(result));
                            break;
                        case '/':
                            if (divide(second)) return;
                            result /= second;
                            firstsymbol = '%';
                            dispresult.setText(String.valueOf(result));
                            break;
                        case '%':
                            result %= second;
                            dispresult.setText(String.valueOf(result));
                    }//end of switch ( first symbol)
                    break;
                case '*':
                    first *= second;
                    secondsymbol = '%';
                    dispresult.setText(String.valueOf(first));
                    break;
                case '/':
                    if (divide(second)) return;
                    first /= second;
                    secondsymbol = '%';
                    dispresult.setText(String.valueOf(first));
                    break;
                case '%':
                    result %= second;
                    dispresult.setText(String.valueOf(result));
            }// end of switch (secondsymbo1)
            prev = true;
            repeat = true;
            return;
        }

    }
}
