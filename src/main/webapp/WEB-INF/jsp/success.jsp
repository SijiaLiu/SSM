<%--
  Created by IntelliJ IDEA.
  User: LiuSijia
  Date: 2017/8/28
  Time: 14:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>成功页面</title>
</head>
<body>

<!-- 用户修改的Modal -->
<div class="modal fade" id="cusUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <%--FirstName--%>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">firstName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="firstName_update_static"></p>
                        </div>
                    </div>
                        <%--LastName--%>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">lastName</label>
                            <div class="col-sm-10">
                                <p class="form-control-static" id="lastName_update_static"></p>
                            </div>
                        </div>
                    <%--cusEmail--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="cusEmail_update_input" placeholder="EmpEmail">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%--select   --%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Address</label>
                        <div class="col-sm-4">
                            <%--地址提交addressId即可--%>
                            <select class="form-control" name="addressId" id="address_update_select">

                            </select>
                        </div>
                    </div>

                </form>
            </div>
            <%--底部--%>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="cus_update_btn">Save changes</button>
            </div>
        </div>
    </div>
</div>


<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">刘斯佳</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="/logout"><span class="glyphicon glyphicon-user"></span>退出</a></li>
        </ul>
    </div>
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="span2  col-xs-12 col-sm-3 col-md-2">
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="success.jsp">Customer管理</a></li>
                <li><a href="../../film.jsp">Film设置</a></li>
            </ul>
        </div>
        <div class="col-xs-12 col-sm-9 col-md-10">
            <div class="row">
                <div class="col-md-2">
                    <p class="form-control-static">客户列表</p>
                </div>
                <div class="col-md-2">
                    <button class="btn btn-info" id="cus_add_btn">新增</button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-hover" id="cus_table">
                        <thead>
                        <tr>
                            <th>FirstName</th>
                            <th>LastName</th>
                            <th>Email</th>
                            <th>Address</th>
                            <th>CustomerId</th>
                            <th>LastUpdate</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row" id="page_div">
                <div class="col-md-6" id="page_info_area">
                </div>
                <div class="col-md-6" id="page_nav">
                </div>
            </div>
        </div>
        </div>
    </div>
</div>

<link rel="stylesheet" href="/css/bootstrap.css"/>
<script src="../../js/jquery-3.2.1.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script>
    var totalRecord, currentPage;
    $(function () {
        to_page(1)
    });

    function to_page(pn) {
        $.ajax({
            url:"/customer",
            data:"pn="+pn,
            type:"GET",
            success:function (result) {
//                    显示表格数据
                build_cus_table(result)
//                    显示分页信息
                build_page_info(result)
//                    显示分页条
                build_page_nav(result)
                //console.log(result);
            }
        });
    }
    function build_cus_table(result) {
        //清空
        $("#cus_table tbody").empty();

        var cus = result.extend.cusList.list;
        $.each(cus,function (index,item) {
            var cusIdTd = $("<td></td>").append(item.customerId);
            var cusFirstNameTd = $("<td></td>").append(item.firstName);
            var cusLastNameTd = $("<td></td>").append(item.lastName);
            var cusEmailTd = $("<td></td>").append(item.email);
            var cusAddressTd = $("<td></td>").append(item.address.address);
            var s = new Date(item.lastUpdate);
            var cusLastUpdateTd = $("<td></td>").append(s.toLocaleString());
            var editBtn = $("<button></button>").addClass("btn btn-info btn-xs edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            //为编辑按钮添加自定义的属性
            editBtn.attr("editBtn_id", item.customerId)
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-xs del_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加自定义的属性
            delBtn.attr("delBtn_id", item.customerId)
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            //append方法返回的还是原来的对象
            $("<tr></tr>")
                .append(cusFirstNameTd)
                .append(cusLastNameTd)
                .append(cusEmailTd)
                .append(cusAddressTd)
                .append(cusIdTd)
                .append(cusLastUpdateTd)
                .append(btnTd)
                .appendTo("#cus_table tbody");
        })
    }
    //毫秒数转化为日期
    Date.prototype.toLocaleString = function() {
        return this.getFullYear()
            + "/" + (this.getMonth() + 1)
            + "/" + this.getDate()
            + "/ " + this.getHours()
            + ":" + this.getMinutes()
            + ":" + this.getSeconds();
    };

//    显示分页信息
    function build_page_info(result){
        //清空
        $("#page_info_area").empty();

        $("#page_info_area").append("共"+result.extend.cusList.total+"条记录,"
            +"当前显示第 "+result.extend.cusList.pageNum+"/"+result.extend.cusList.pages+" 页");
        totalRecord = result.extend.cusList.total;
        currentPage = result.extend.cusList.pageNum;
    }

    //解析显示分页条
    function build_page_nav(result) {
        //清空
        $("#page_nav").empty();

        var ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#"));

        if (result.extend.cusList.isFirstPage == false){
            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
            var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#"));
            ul.append(firstPageLi).append(prePageLi);
        }
        //为元素添加点击事件
        firstPageLi.click(function () {
            to_page(1);
        });
        prePageLi.click(function () {
            to_page(result.extend.cusList.pageNum - 1)
        });

        //遍历navigatepageNums
        $.each(result.extend.cusList.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            //如果当前页被选中 高亮显示
            if(result.extend.cusList.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);
        });

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        if (result.extend.cusList.isLastPage == false){
            var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"));
            var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
            ul.append(nextPageLi).append(lastPageLi);
        }
        //为元素添加点击事件
        nextPageLi.click(function () {
            to_page(result.extend.cusList.pageNum + 1)
        });
        lastPageLi.click(function () {
            to_page(result.extend.cusList.pages)
        });

        var nav = $("<nav></nav>").append(ul);
        nav.appendTo("#page_nav")
    }
    //点击编辑按钮
    $(document).on("click", ".edit_btn", function () {
        //查出cus信息
        getCus($(this).attr("editBtn_id"));
        //把员工的id传给模态框的更新按钮
        $("#cus_update_btn").attr("editBtn_id",$(this).attr("editBtn_id"))
        //查出部门信息
        getAddress("#address_update_select");
        //弹出模态框
        $("#cusUpdateModal").modal({
            backdrop:"static"
        });
    });
//查出用户信息
    function getCus(id) {
        $.ajax({
            url:"/cus/"+id,
            type:"GET",
            success:function (result) {
                //console.log(result)
                var cusData = result.extend.cus;
                $("#firstName_update_static").text(cusData.firstName);
                $("#lastName_update_static").text(cusData.lastName);
                $("#cusEmail_update_input").val(cusData.email);
                //$("#cusUpdateModal select").val([cusData.addressId]);
            }
        })
    }
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

    //        点击更新按钮
    $("#cus_update_btn").click(function () {
//            校验邮箱
        var email = $("#cusEmail_update_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)){
            show_validate("#cusEmail_update_input", "error", "邮箱格式不正确")
            return false;
        }else {
            show_validate("#cusEmail_update_input", "success", " ");
        }

        $.ajax({
            url:"/cus/"+$(this).attr("editBtn_id"),
//                type:"POST",
//                data:$("#empUpdateModal form").serialize()+"&_method=PUT",
            type:"PUT",
            data:$("#cusUpdateModal form").serialize(),
            success:function (result) {
                $("#cusUpdateModal").modal("hide");
                to_page(currentPage);
            }
        })
    })

    //        点击删除按钮
    $(document).on("click",".del_btn", function () {
        var cusName = $(this).parents("tr").find("td:eq(1)").text;
        var cusId = $(this).attr("delBtn_id");
        if (confirm("确认删除 "+cusName+" 吗")){
            $.ajax({
                url:"/cus/"+cusId,
                type:"DELETE",
                success:function (result) {
                    //alert(result.msg);
                    to_page(currentPage);
                }
            });
        }
    })

    //点击新增按钮
    $("#cus_add_btn").click(function () {
        $.ajax({
            success:function () {
                window.location.href='add.jsp'
            }
        })
    })

</script>
</body>
</html>
