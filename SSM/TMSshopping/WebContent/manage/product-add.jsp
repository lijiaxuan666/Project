<%@ page language="java" import="java.util.*" pageEncoding="GBK" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>��̨���� -�̳�</title>
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
</head>
<body>
<div id="header" class="wrap">
    <div class="help">
        <a href="../indexSelect">
            <button>����ǰ̨ҳ��</button>
        </a>
    </div>
    <a href="index.jsp">
        <button>��ҳ</button>
    </a>
</div>
<div id="childNav1">
    <div class="welcome wrap">����Ա${name.EU_USER_ID}���ã���ӭ�ص������̨��</div>
</div>
<div id="position" class="wrap">
    �����ڵ�λ�ã��̳�<a href="index.jsp">>�����̨</a>
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
                                <li><a class="multitabs" href="productClassAdd">����</a></li>
                                <li><a class="multitabs" href="productSelect">�������</a></li>
                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav"><a href="javascript:void(0)"><i
                                class="mdi mdi-file-outline"></i>
                            <span>��������</span></a>
                            <ul class="nav nav-subnav">
                                <li><a class="multitabs" href="ordersel">��������</a></li>
                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav"><a href="javascript:void(0)"><i
                                class="mdi mdi-format-align-justify"></i>
                            <span>���Թ���</span></a>
                            <ul class="nav nav-subnav">
                                <li><a class="multitabs" href="SelManage">���Թ���</a></li>
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
    <h2>�����Ʒ</h2>
    <div class="manage">
        <form action="doProductAdd" method="post"
              enctype="multipart/form-data">
            <table class="form">
                <tr>
                    <td class="field">��Ʒ���ƣ�</td>
                    <td><input type="text" class="text" name="productName"/></td>
                </tr>
                <tr>
                    <td class="field">�������ࣺ</td>
                    <td><select name="parentId">
                        <c:forEach var="f" items="${flist}">
                            <option value="${f.EPC_ID }" disabled="disabled">${f.EPC_NAME }</option>
                            <c:forEach var="c" items="${clist}">
                                <c:if test="${f.EPC_ID==c.EPC_PARENT_ID}">
                                    <option value="${f.EPC_ID }-${c.EPC_ID }">&nbsp;&nbsp;${c.EPC_NAME }</option>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                    </select></td>
                </tr>
                <tr>
                    <td class="field">��ƷͼƬ��</td>
                    <td><input type="file" class="text" name="photo"/></td>
                </tr>
                <tr>
                    <td class="field">��Ʒ�۸�</td>
                    <td><input type="text" class="text tiny" name="productPrice"/>
                        Ԫ(����)
                    </td>
                </tr>
                <tr>
                    <td class="field">������</td>
                    <td><input type="text" class="text" name="productDesc"/></td>
                </tr>
                <tr>
                    <td class="field">��棺</td>
                    <td><input type="text" class="text tiny" name="productStock"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><label class="ui-blue"><input type="submit"
                                                      name="submit" value="���"/></label></td>
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

