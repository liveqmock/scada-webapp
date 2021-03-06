<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>系统管理</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/dhtmlx/dhtmlx.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/style/css.css">
    <script src="${ctx}/static/jquery/jquery-1.7.1.min.js"></script>
    <script src="${ctx}/static/dhtmlx/dhtmlx.js"></script>
    <script type="text/javascript">
        var objUrl = '${ctx}';
        var username = '${username}';
    </script>
    <script type="text/javascript" src="${ctx}/static/js/util.js"></script>
    <script>
        var dhxLayout, dhxAccord, dhxTabbar;
        var item = [
            {id: 'a1', name: '实时监控'}
        ];
        function doOnLoad() {
            createLayout();
            creatAccor();
            creatTabbar();
            creatDataView();
        }
        function createLayout() {
            dhxLayout = new dhtmlXLayoutObject(document.body, "3T");
            dhxLayout.cells("a").setHeight(80);
            dhxLayout.cells("b").setWidth(200);
            dhxLayout.cells("a").hideHeader();
            dhxLayout.cells("a").attachObject("head_div");
            dhxLayout.cells("b").setText("菜单栏");
            dhxLayout.cells("c").hideHeader();
            dhxLayout.cells("a").fixSize(true, true);
        }
        function creatAccor() {
            dhxAccord = dhxLayout.cells("b").attachAccordion();
            for (var i = 0; i < item.length; i++) {
                dhxAccord.addItem(item[i].id, item[i].name);
            }
        }
        function creatDataView() {
            for (var i = 0; i < item.length; i++) {
                dhxAccord.cells(item[i].id).attachObject("menuMain" + i);
            }
        }
        function creatTabbar() {
            dhxTabbar = dhxLayout.cells("c").attachTabbar();
            dhxTabbar.setHrefMode("iframes");
            dhxTabbar.setImagePath("${ctx}/static/dhtmlx/imgs/");
            dhxTabbar.enableTabCloseButton(true);
            dhxTabbar.addTab("welcome", "欢迎", "100px");
            dhxTabbar.setTabActive("welcome");
           // dhxTabbar.setText("欢迎使用SCADA系统！");
        }
        function openTab(id, text, url) {
            if (dhxTabbar.cells(id)) {
                dhxTabbar.setTabActive(id);
                return;
            }
            dhxTabbar.addTab(id, text, "100px");
            dhxTabbar.setContentHref(id, url);
            dhxTabbar.setTabActive(id);
        }
    </script>

    <style>
        a:-webkit-any-link {
            text-decoration: none;
        }
        a:hover {
            color: #FF2F2F;
        }
        #menuMain0>div {
            padding-top: 10px;
            padding-left: 20px;
            height:15px;
            color: #0000ff;
            /*border-bottom: 2px solid #000;*/
        }
    </style>
</head>
<body>
<div id="menuMain0">
    <div id="menu1">
        <a onclick="openTab(1,'用户管理','${ctx}/admin/user/userManage')">用户管理</a>
    </div>
    <div id="menu2">
        <a  onclick="openTab(3,'角色管理','${ctx}/admin/role')">角色管理</a>
    </div>
    <div id="menu3" >
        <a onclick="openTab(4,'地图坐标','${ctx}/admin/map')">地图坐标</a>
    </div>
    <div id="menu4">
        <a onclick="openTab(5,'设备管理','${ctx}/admin/device')">设备管理</a>
    </div>
    <!--<div id="menu2" style="padding-left: 20px;padding-top: 5px;height:15px;"><a href="#" onclick="openTab(4,'权限管理','${ctx}/admin/role/roleMenu')">权限管理</a></div>-->
</div>
<div id="head_div" style="float:left;width: 100%;height:83px;">
    <img src="${ctx}/static/img/head.png" usemap="#planetmap" style="border: 0px; width: 100%"/>

    <div id="sztitle"></div>
    <div id="szda" style="width:300px;"></div>
    <div id="szan">
        <a href="${ctx}/main"><img border="0" src="${ctx}/static/img/fh.png"/></a>
    </div>
    <div id="tcan">
        <a href="${ctx}/logout"><img border="0" src="${ctx}/static/img/tc.png"/></a>
    </div>
</div>
</body>
</html>
