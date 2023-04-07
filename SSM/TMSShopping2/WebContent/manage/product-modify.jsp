<%@ page language="java" import="java.util.*" pageEncoding="GBK" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>��̨����-�̳�</title>
    <link type="text/css" rel="stylesheet" href="../css/style.css"/>
    <link type="text/css" rel="stylesheet" href="../css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="../css/bootstrap-theme.min.css"/>
    <link type="text/css" rel="stylesheet" href="../css/bootstrap-theme.css"/>
    <link type="text/css" rel="stylesheet" href="../css/bootstrap.css"/>
    <link href="../css/materialdesignicons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/multitabs.min.css">
    <link href="../css/style.min.css" rel="stylesheet">
    <script type="text/javascript" src="../scripts/function-manage.js"></script>
    <script type="text/javascript" src="../scripts/npm.js"></script>
    <script type="text/javascript">
        function check() {
            var num = parseInt(document.getElementById("y").value);
            if (num < 0) {
                document.getElementById("yy").innerHTML = "<font color='red'>�۸���Ϊ����</font>";
                document.getElementById("sub").disabled = true;
            } else {
                document.getElementById("yy").innerHTML = "";
                document.getElementById("sub").disabled = false;
            }
        }

        function check2() {
            var num = parseInt(document.getElementById("k").value);
            if (num < 0) {
                document.getElementById("kk").innerHTML = "<font color='red'>��治��Ϊ����</font>";
                document.getElementById("sub").disabled = true;
            } else {
                document.getElementById("kk").innerHTML = "";
                document.getElementById("sub").disabled = false;
            }
        }
    </script>
</head>
<body>
<div id="header" style="padding-bottom: 6px">
    <div class="wrap">
        <div class="help">
            <a href="../indexSelect">
                ����ǰ̨ҳ��
            </a>
        </div>
        <a href="index.jsp">
            ��ҳ
        </a>
    </div>
</div>
<div id="childNav1">
    <div style="color: white;padding-top: 5px" class="welcome wrap">����Ա${name.EU_USER_ID}���ã���ӭ�ص�������̨��</div>
</div>
<div id="position" class="wrap">
    �����ڵ�λ�ã��̳�<a href="index.jsp">>������̨</a>
</div>
<div id="main" class="lefter">
    <div id="menu-mng" class="lefter">
        <div class="box">
            <div class="lyear-layout-sidebar-scroll">
                <nav class="sidebar-main">
                    <ul class="nav nav-drawer">
                        <li><a class="multitabs"><i
                                class="mdi mdi-home"></i><span>��̨��ҳ</span></a></li>
                        <li class="nav-item nav-item-has-subnav"><a href="javascript:void(0)"><i
                                class="mdi mdi-palette"></i><span>�˺Ź���</span></a>
                            <ul class="nav nav-subnav">
                                <li><a class="multitabs" href="user-add.jsp">����</a></li>
                                <li><a class="multitabs" href="user">�û�����</a></li>
                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav"><a href="javascript:void(0)"><i
                                class="mdi mdi-format-align-justify"></i>
                            <span>��Ʒ��Ϣ</span></a>
                            <ul class="nav nav-subnav">
                                <li><a class="multitabs" href="product-add.jsp">����</a></li>
                                <li><a class="multitabs" href="productSelect">��Ʒ����</a></li>
                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav"><a href="javascript:void(0)"><i
                                class="mdi mdi-format-align-justify"></i>
                            <span>������Ϣ</span></a>
                            <ul class="nav nav-subnav">
                                <li><a class="multitabs" href="productClass-add.jsp">����</a></li>
                                <li><a class="multitabs" href="productClass">�������</a></li>
                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav"><a href="javascript:void(0)"><i
                                class="mdi mdi-file-outline"></i>
                            <span>��������</span></a>
                            <ul class="nav nav-subnav">
                                <li><a class="multitabs" href="ordersel">��������</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
</div>
<div class="main">
    <h2>�޸���Ʒ</h2>
    <div class="manage">
        <form action="doProductUpdate" method="post"
              enctype="multipart/form-data">
            <table class="form">
                <tr>
                    <td class="field">��Ʒ���ƣ�</td>
                    <td><input type="text" class="text" name="productName"
                               value="${p.EP_NAME }"/></td>
                    <td><input type="hidden" name="id" value="${p.EP_ID }"/></td>
                </tr>
                <tr>
                    <td class="field">�������ࣺ</td>
                    <td><select name="parentId">
                        <c:forEach var="f" items="${flist}">
                            <option value="${f.EPC_ID }" disabled="disabled">${f.EPC_NAME }</option>
                            <c:forEach var="c" items="${clist}">
                                <c:if test="${f.EPC_ID==c.EPC_PARENT_ID}">
                                    <c:if test="${p.EPC_CHILD_ID==c.EPC_ID}">
                                        <option value="${f.EPC_ID }-${c.EPC_ID }"
                                                selected="selected">&nbsp;&nbsp;${c.EPC_NAME }</option>
                                    </c:if>
                                    <c:if test="${p.EPC_CHILD_ID!=c.EPC_ID}">
                                        <option value="${f.EPC_ID }-${c.EPC_ID }">&nbsp;&nbsp;${c.EPC_NAME }</option>
                                    </c:if>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                    </select></td>
                </tr>
                <tr>
                    <td class="field">��ƷͼƬ��</td>
                    <td><input type="file" class="text" name="photo"
                               value="${p.EP_FILE_NAME }"/></td>
                </tr>
                <tr>
                    <td class="field">��Ʒ�۸�</td>
                    <td><input type="text" class="text tiny" name="productPrice"
                               value="${p.EP_PRICE }" onblur="check()" id="y"/> Ԫ<span
                            id="yy"></span></td>
                </tr>
                <tr>
                    <td class="field">������</td>
                    <td><input type="text" class="text" name="productDesc"
                               value="${p.EP_DESCRIPTION }"/></td>
                </tr>
                <tr>
                    <td class="field">��棺</td>
                    <td><input type="text" class="text tiny" name="productStock"
                               value="${p.EP_STOCK }" onblur="check2()" id="k"/><span id="kk"></span></td>
                </tr>
                <tr>
                    <td></td>
                    <td><label class="ui-blue"><input type="submit"
                                                      name="submit" value="�޸�" id="sub"/></label></td>
                </tr>
            </table>
        </form>
    </div>
</div>
<div class="clear"></div>
</div>
<script type="text/javascript" src="../scripts/jquery.min.js"></script>
<script type="text/javascript" src="../scripts/bootstrap.min.js"></script>
<script type="text/javascript" src="../scripts/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="../scripts/bootstrap-multitabs/multitabs.js"></script>
<script type="text/javascript" src="../scripts/index.min.js"></script>
<script type="text/javascript">
    window.onload = function () {
        $('.dropdown-toggle').dropdown();
    }
</script>
</body>
</html>
