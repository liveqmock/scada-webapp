<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户管理</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/dhtmlx/dhtmlx.css">
    <script src="${ctx}/static/jquery/jquery-1.7.1.min.js"></script>
    <script src="${ctx}/static/jquery/jquery.form.js"></script>
    <script src="${ctx}/static/dhtmlx/dhtmlx.js"></script>
    <style>
        html, body {
            width: 100%;
            height: 100%;
            margin: 0px;
            overflow: hidden;
            font-size: 12px;
        }

        a:link {
            color: #0065ce;
            text-decoration: none
        }

        a:visited {
            color: #0065ce;
            text-decoration: none
        }

        a:hover {
            color: #ff0000;
            text-decoration: underline
        }
    </style>
    <script>
        var objUrl = '${ctx}';
        window.dhx_globalImgPath = "${ctx}/static/dhtmlx/imgs/";
    </script>
    <script src="${ctx}/static/userManage.js"></script>
</head>

<body onload="doOnLoad()">
<div id="addUser" style=" display:none;line-height:15px;">
    <form id="addForm" name="addForm" action="${ctx}/admin/user/addUser" method="post" autocomplete=off>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="30%" height="30" align="right" valign="middle" style="padding-right:10px;">用户名：</td>
                <td><input type="text" name="user.username" id="userName" style="width: 135px"/>&nbsp;注：用户名一旦注册不能修改</td>
            </tr>
            <tr>
                <td height="30" align="right" valign="middle" style="padding-right:10px;">姓名：</td>
                <td><input type="text" name="realName" id="relName" style="width: 135px"/></td>
            </tr>
            <tr>
                <td height="30" align="right" valign="middle" style="padding-right:10px;">性别：</td>
                <td>
                    <input name="gender" type="radio" value="1" checked/>男
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input name="gender" type="radio" value="0"/>女
                </td>
            </tr>
            <tr>
                <td height="30" align="right" valign="middle" style="padding-right:10px;">部门：</td>
                <td><input type="text" name="department" id="department" style="width: 135px"/></td>
            </tr>
            <tr>
                <td height="30" align="right" valign="middle" style="padding-right:10px;">地址：</td>
                <td><input type="text" name="address" id="address" style="width: 135px"/></td>
            </tr>
            <tr>
                <td height="30" align="right" valign="middle" style="padding-right:10px;">E-mail：</td>
                <td><input type="text" name="email" id="email" style="width: 135px"/></td>
            </tr>
            <tr>
                <td height="30" align="right" valign="middle" style="padding-right:10px;">电话：</td>
                <td><input type="text" name="telphone" id="telphone" style="width: 135px"/></td>
            </tr>
            <tr>
                <td height="30" align="right" valign="middle" style="padding-right:10px;">角色：</td>
                <td valign="middle" style="padding-top:3px">
                    <input type="hidden" name="role_id" id="description" value=""/>

                    <div id="combo_zone4" style="width:100px; height:25px;"></div>
                </td>
            </tr>
            <tr>
                <td height="30" align="right" valign="middle" style="padding-right:10px;">密码：</td>
                <td><input type="password" name="user.shaPassword" id="newPassword" style="width: 135px"/></td>
            </tr>
            <tr>
                <td height="30" align="right" valign="middle" style="padding-right:10px;">确认密码：</td>
                <td><input type="password" name="relPass" id="relPassword" style="width: 135px"/></td>
            </tr>
            <tr>
                <td height="30" align="right" valign="middle" style="padding-right:10px;">是否为负责人：</td>
                <td>
                    <input name="headflg" type="radio" value="1" checked/>是
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input name="headflg" type="radio" value="0"/>否
                </td>
            </tr>
            <tr>
                <td height="30" align="right" valign="middle" style="padding-right:10px;">是否接收信息：</td>
                <td>
                    <input name="receiveflg" type="radio" value="1" checked/>是
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input name="receiveflg" type="radio" value="0"/>否
                </td>
            </tr>
            <tr>
                <td colspan="2" height="30" align="center">
                    <input id="submit_btn" type="button" onclick="addUserFormSubmit()" value="提交"/>
                </td>
            </tr>
        </table>
    </form>
</div>
<div id="updateUser" style="display:none;padding-top:40px;">
    <form id="updateForm" action="${ctx}/admin/user/updateUserExtInfo" method="post" autocomplete=off>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="30%" height="30" align="right" valign="middle" style="padding-right:10px;">用户名：</td>
                <td><input type="hidden" name="user_id" id="update_userid" value=""/>
                    <input type="text" name="user.username" id="update_uName" readonly="true" style="width: 135px">&nbsp;注：用户名一旦注册不能修改</input>
                </td>
            </tr>
            <tr>
                <td height="30" align="right" valign="middle" style="padding-right:10px;">姓名：</td>
                <td><input type="text" name="realName" id="update_rName" style="width: 135px"/></td>
            </tr>
            <tr>
                <td height="30" align="right" valign="middle" style="padding-right:10px;">性别：</td>
                <td><input name="gender" type="radio" value="1" checked/>男&nbsp;&nbsp;&nbsp;&nbsp;<input name="gender" type="radio" value="0"/>女</td>
            </tr>
            <tr>
                <td height="30" align="right" valign="middle" style="padding-right:10px;">部门：</td>
                <td><input type="text" name="department" id="update_department" style="width: 135px"/></td>
            </tr>
            <tr>
                <td height="30" align="right" valign="middle" style="padding-right:10px;">地址：</td>
                <td><input type="text" name="address" id="update_address" style="width: 135px"/></td>
            </tr>
            <tr>
                <td height="30" align="right" valign="middle" style="padding-right:10px;">E-mail：</td>
                <td><input type="text" name="email" id="update_email" style="width: 135px"/></td>
            </tr>
            <tr>
                <td height="30" align="right" valign="middle" style="padding-right:10px;">电话：</td>
                <td><input type="text" name="telphone" id="update_telphone" style="width: 135px"/></td>
            </tr>
            <tr>
                <td height="30" align="right" valign="middle" style="padding-right:10px;">角色：</td>
                <td valign="middle" style="padding-top:3px"><input type="hidden" name="role_id" id="update_description" value=""/>

                    <div id="combo_zone5" style="width:100px; height:25px;"></div>
                </td>
            </tr>
            <tr>
                <td height="30" align="right" valign="middle" style="padding-right:10px;">是否为负责人：</td>
                <td>
                    <input name="headflg" type="radio" value="1" checked/>是
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input name="headflg" type="radio" value="0"/>否
                </td>
            </tr>
            <tr>
                <td height="30" align="right" valign="middle" style="padding-right:10px;">是否接收信息：</td>
                <td>
                    <input name="receiveflg" type="radio" value="1" checked/>是
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input name="receiveflg" type="radio" value="0"/>否
                </td>
            </tr>
            <tr>
                <td colspan="2" height="30" align="center">
                    <input id="update_btn" type="button" onclick="updateUserFormSubmit()" value="提交"/>
                </td>
            </tr>
        </table>
    </form>
</div>
<div id="passUser" style=" display:none;text-align:center;padding:50px;line-height:50px">
    <form id="passForm">
        <div style=" margin: 5px;">
            <label for="newPass">新设密码:</label>
            <input type="hidden" name="userID" id="userid_pass" value="">
            <input type="password" name="newPass" id="newPass"/>
        </div>
        <div style=" margin: 5px;">
            <label for="rePass">确认密码:</label>
            <input type="password" name="rePass" id="rePass"/>
        </div>
        <div style=" margin: 10px; text-align: center">
            <input id="submit_btn" type="button" onclick="updatePass()" value="提交"/>
            <input id="btn" type="button" onclick="winClose();" value="取消"/>
        </div>
    </form>
</div>
</body>
</html>