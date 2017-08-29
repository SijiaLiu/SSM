<%--
  Created by IntelliJ IDEA.
  User: LiuSijia
  Date: 2017/8/28
  Time: 12:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
</head>
<body style="background:url(/img/bg.jpg)">
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>15843 刘斯佳</h1>
        </div>
    </div>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <div class="row">
        <div class="col-md-5 col-md-offset-2">
            <p class="form-control-static">电影租赁系统</p>
        </div>
        <div class="col-md-5 col-md-offset-3">
            <form class="form-horizontal" id="loginForm" action="/login">
                <div class="form-group">
                    <label class="col-sm-2 control-label">账号</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="firstName" id="first_name" placeholder="账号">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" name="password" id="password" placeholder="Password">
                    </div>
                </div>
                <div class="col-md-offset-4">
                    <button type="submit" class="btn btn-primary" id="login_btn">登录</button>
                </div>
            </form>
        </div>
    </div>
</div>

<link rel="stylesheet" href="/css/bootstrap.css"/>
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<%--<script>--%>
    <%--$("#login_btn").click(function () {--%>
        <%--$.ajax({--%>
            <%--url:"/login",--%>
            <%--data:$("#loginForm").serialize(),--%>
            <%--success:function(result){--%>
               <%--if(result.msg == "success"){--%>
                   <%--window.location.href='success.jsp'--%>
               <%--}else{--%>
                   <%--window.location.href='login.jsp'--%>
               <%--}--%>
            <%--}--%>
        <%--})--%>
    <%--})--%>
<%--</script>--%>
</body>
</html>
