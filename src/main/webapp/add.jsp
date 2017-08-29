<%--
  Created by IntelliJ IDEA.
  User: LiuSijia
  Date: 2017/8/28
  Time: 21:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增用户</title>
</head>
<body>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">刘斯佳</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span>退出</a></li>
        </ul>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="span2  col-xs-12 col-sm-3 col-md-2">
            <ul class="nav nav-pills nav-stacked">
                <li><a href="#">Dashboard</a></li>
                <li class="active"><a href="add.jsp">应用设置</a></li>
                <li><a href="#">管理设置</a></li>
                <li><a href="#">数据配置</a></li>
                <li><a href="#">主数据管理</a></li>
                <li><a href="#">客户订单管理</a></li>
                <li><a href="#">发货单管理</a></li>
            </ul>
        </div>
        <div class="col-xs-12 col-sm-9 col-md-10">
            <div class="row">
                <div class="col-md-2">
                    <p class="form-control-static">客户列表</p>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-sm-9 col-md-10">
            <div class="row">
                <div class="col-md-2">
                    <p class="form-control-static">主要信息</p>
                </div>
            </div>
        </div>
        <br>
        <br>
        <div class="col-xs-12 col-sm-9 col-md-10">
            <form class="form-horizontal" id="addForm">
                <%--FirstName--%>
                <div class="form-group">
                    <label for="firstName_add_input" class="col-sm-2 control-label">FirstName</label>
                    <div class="col-xs-3">
                        <input type="text" name="firstName" class="form-control" id="firstName_add_input" placeholder="FirstName">
                        <span class="help-block"></span>
                    </div>
                </div>
                    <%--LastName--%>
                <div class="form-group">
                    <label for="lastName_add_input" class="col-sm-2 control-label">LastName</label>
                    <div class="col-xs-3">
                        <input type="text" name="lastName" class="form-control" id="lastName_add_input" placeholder="LastName">
                        <span class="help-block"></span>
                    </div>
                </div>
                <%--EmpEmail--%>
                <div class="form-group">
                    <label class="col-sm-2 control-label">EmpEmail</label>
                    <div class="col-xs-3">
                        <input type="email" name="email" class="form-control" id="addressEmail_add_input" placeholder="Email">
                        <span class="help-block"></span>
                    </div>
                </div>
                <%--select--%>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Address</label>
                    <div class="col-xs-3">
                        <select class="form-control" name="addressId" id="address_add_select">
                        </select>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-xs-12 col-sm-9 col-md-2 col-md-offset-1">
            <button type="button" class="btn btn-primary" id="cus_add_btn">保存</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        </div>
    </div>
</div>

<link rel="stylesheet" href="/css/bootstrap.css"/>
<script src="./js/jquery-3.2.1.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script>

    $(function () {
        getAddress("#address_add_select")
    });
    //查出地址信息
    function getAddress(ele) {
//            清空之前下拉列表的值
        $(ele).empty();
        $.ajax({
            url:"/address",
            type:"GET",
            success:function (result) {
// "extend":{"depts":[{"deptId":1,"deptName":"技术部"},{"deptId":2,"deptName":"人事部"}
//                    $("#dept_add_select").
                $.each(result.extend.add,function () {
                    var optionEle = $("<option></option>>")
                        .append(this.address).attr("value", this.addressId);
                    optionEle.appendTo(ele)
                });
            }
        });
    }
  //        点击保存按钮
    $("#cus_add_btn").click(function () {
//            校验表单数据
        if(!validate_add_form()){
            return false
        }
//            将表单的数据传给服务器进行保存
        $.ajax({
            url:"/cus",
            type:"POST",
            //传的数据
            data:$("#empAddModal form").serialize(),
            success:function (result) {
                //alert(result.msg);
                //关闭模态框
                $("#empAddModal").modal('hide');
                //到最后一页查看数据
                to_page(totalRecord)
            }
        });
    });

    //      校验新增表单数据
    function validate_add_form() {
//            校验name
        var firstName = $("#firstName_add_input").val();
        var lastName = $("#lastName_add_input").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/
        if (!regName.test(firstName)){
            show_validate("#firstName_add_input", "error", "请输入6-16位英文或者2-5位中文");
            return false;
        }else {
            show_validate("#firstName_add_input" ,"success", " ");
        }
        if (!regName.test(lastName)){
            show_validate("#lastName_add_input", "error", "请输入6-16位英文或者2-5位中文");
            return false;
        }else {
            show_validate("#lastName_add_input" ,"success", " ");
        }
//            校验邮箱
        var email = $("#addressEmail_add_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)){
            show_validate("#addressEmail_add_input", "error", "邮箱格式不正确")
            return false;
        }else {
            show_validate("#addressEmail_add_input", "success", " ");
        }
        return true;
    }
    //        显示校验结果的提示信息
    function show_validate(ele, status, msg) {
        //清除元素的状态
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next().text("");

        if (status == "success"){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }
        if (status == "error"){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }
</script>
</body>
</html>
