<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: JiangYuhao
  Date: 2019/5/28
  Time: 20:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>App信息管理系统</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <style>
        body {
            zoom: 0.8;
        }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="/jsp/commer/header.jsp"/>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <form class="layui-form" action="${ctx}/app/edit" method="post">
                <input type="hidden" name="id" value="${app.id}">
                <div class="layui-form-item">
                    <label class="layui-form-label">软件名称</label>
                    <div class="layui-input-inline">
                        <input type="text" disabled name="softwareName" lay-verify="title" autocomplete="off"
                               placeholder="请输入软件名称" value="${app.softwareName}"
                               class="layui-input">
                    </div>
                    <label class="layui-form-label">APK名称</label>
                    <div class="layui-input-inline">
                        <input type="text" disabled name="apkName" lay-verify="title" autocomplete="off"
                               placeholder="请输入APK名称" value="${app.apkName}"
                               class="layui-input">
                    </div>
                    <label class="layui-form-label">支持ROM</label>
                    <div class="layui-input-inline">
                        <input type="text" disabled name="supportROM" lay-verify="title" autocomplete="off"
                               placeholder="请输入支持ROM" value="${app.supportROM}"
                               class="layui-input">
                    </div>
                    <label class="layui-form-label">界面语言</label>
                    <div class="layui-input-inline">
                        <input type="text" disabled name="interfaceLanguage" lay-verify="title" autocomplete="off"
                               placeholder="请输入界面语言" value="${app.interfaceLanguage}"
                               class="layui-input">
                    </div>


                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">软件大小</label>
                    <div class="layui-input-inline">
                        <input type="text" disabled name="softwareSize" lay-verify="title" autocomplete="off"
                               placeholder="请输入软件大小" value="${app.softwareSize}"
                               class="layui-input">
                    </div>
                    <label class="layui-form-label">应用简介</label>
                    <div class="layui-input-inline">
                        <input type="text" disabled name="appInfo" lay-verify="title" autocomplete="off"
                               placeholder="请输入应用简介" value="${app.appInfo}"
                               class="layui-input">
                    </div>
                    <%--TODO所属平台--%>
                    <label class="layui-form-label">所属平台</label>
                    <div class="layui-input-inline">
                        <select disabled name="flatform.valueId" lay-filter="aihao">
                            <option value="" selected>--请选择--</option>

                            <c:forEach items="${appFlatform}" var="obj">
                                <option value="${obj.valueId}" <c:if
                                        test="${app.flatform.valueId eq obj.valueId}">
                                    selected
                                </c:if>>${obj.valueName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <%--TODO应用状态--%>
                    <%-- <label class="layui-form-label">APP状态</label>
                     <div class="layui-input-inline">
                         <select name="status" lay-filter="aihao">
                             <option value="" selected>--请选择--</option>
                             <c:forEach items="${appStatus}" var="obj">
                                 <option value="${obj.valueId}">${obj.valueName}</option>
                             </c:forEach>
                         </select>
                     </div>--%>


                </div>
                <div class="layui-form-item">


                    <%--TODO一级分类--%>
                    <%--TODO二级分类--%>
                    <%--TODO三级分类--%>
                    <label class="layui-form-label">一级分类</label>
                    <div class="layui-input-inline">
                        <select disabled name="categoryLevel1.id" lay-filter="levelOne" id="levelOne">
                            <option value="" selected>--请选择--</option>

                            <c:forEach items="${LevelOne}" var="obj">
                                <option value="${obj.id}"    <c:if test="${app.categoryLevel1.id eq obj.id}">
                                    selected
                                </c:if>>${obj.categoryName}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <label class="layui-form-label">二级分类</label>
                    <div class="layui-input-inline">
                        <select disabled name="categoryLevel2.id" lay-filter="levelTwo" id="levelTwo">
                            <option value="" selected>--请选择--</option>
                        </select>
                    </div>


                    <label class="layui-form-label">三级分类</label>
                    <div class="layui-input-inline">
                        <select disabled name="categoryLevel3.id" lay-filter="levelThree" id="levelThree">
                            <option value="" selected>--请选择--</option>

                        </select>
                    </div>
                </div>
            </form>
            <div style="padding-bottom: 15px">
                <div class="layui-input-block" style="float: left">
                    <form action="${ctx}/user/app/check/${app.id}" method="post">
                        <input hidden value="${app.id}" name="id">
                        <input hidden value="2" name="status">
                        <button class="layui-btn layui-btn-normal layui-btn-radius">审核通过</button>
                    </form>

                </div>
                <div class="layui-input-block" style="float: left;">
                    <form action="${ctx}/user/app/check/${app.id}" method="post">
                        <input hidden value="${app.id}" name="id">
                        <input hidden value="3" name="status">
                        <button class="layui-btn layui-btn-radius layui-btn-danger">审核不通过</button>
                    </form>
                </div>
                <div class="layui-input-block" style="float: left">
                    <a href="${ctx}/user/app/index/devId/${sessionScope.User.id}">
                        <button class="layui-btn layui-btn-radius layui-btn-warm">返回</button>
                    </a>
                </div>


            </div>

        </div>
        <div class="layui-table">
            <h2>历史版本信息 ${app.status}</h2>
            <table>
                <thead>
                <tr>
                    <th>版本编号</th>
                    <th>APK文件名称</th>
                    <th>APK位置</th>
                    <th>下载链接</th>
                    <th>版本大小</th>
                    <th>版本信息</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${app.appVersion}" var="obj">
                    <tr>
                        <td>${obj.versionNo}</td>
                        <td>${obj.apkFilename}</td>
                        <td>${obj.apklocPath}</td>
                        <td>${obj.downloadLink}</td>
                        <td>${obj.versionSize}</td>
                        <td>${obj.versionInfo}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <jsp:include page="/jsp/commer/fotter.jsp"/>
</div>
<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use(['form', 'element', 'layedit', 'laydate', 'jquery'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;
        var element = layui.element;
        var $ = layui.jquery;
        //保留分级目录
        $(function () {
            //取出一级分类的值
            var levelOne = $("#levelOne").val();
            if (levelOne != null && levelOne != '' && levelOne != 0) {
                var levelTwo = '${app.categoryLevel2.id}';
                if (levelTwo != null && levelTwo != '' && levelTwo != undefined) {
                    //  alert("levelOne已经选择了" + levelOne + "levelTwo已经选择了" + levelTwo);
                    //经过判断一级二级已经选择过  重新渲染二级selecte
                    $.ajax({
                        url: '${ctx}/category/queryLevelTwoByLevelOne/' + levelOne,
                        type: 'get',
                        success: function (data) {
                            //根据data修改数据render重新渲染
                            var html = '<option value="" selected>--请选择--</option>';
                            var len = data.length;
                            //  var levelTwo = '${app.categoryLevel2.id}';
                            for (var i = 0; i < len; i++) {
                                html += '<option value="' + data[i].id + '"';
                                if (data[i].id == levelTwo) {
                                    html += ' selected ';
                                }
                                html += '>' + data[i].categoryName + '</option>'
                            }
                            $("#levelTwo").html(html);
                            form.render();
                        }
                    })
                    var levelThree = '${app.categoryLevel3.id}';
                    //三级目录也不为空
                    $.ajax({
                        url: '${ctx}/category/queryLevelTwoByLevelTwo/' + levelTwo,
                        type: 'get',
                        success: function (data) {
                            //根据data修改数据render重新渲染
                            var html = '<option value="" selected>--请选择--</option>';
                            var len = data.length;
                            for (var i = 0; i < len; i++) {
                                html += '<option value="' + data[i].id + '"';

                                if (data[i].id == levelThree) {
                                    html += ' selected ';
                                }
                                html += '>' + data[i].categoryName + '</option>'
                            }
                            $("#levelThree").html(html);
                            form.render();
                        }
                    })
                }

            }
        });
        //保留分级目录end


    });
</script>
</body>


</html>
