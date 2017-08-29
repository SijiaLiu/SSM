<%--
  Created by IntelliJ IDEA.
  User: LiuSijia
  Date: 2017/8/26
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>员工信息列表</title>
</head>
<body>
    <!-- 员工添加的Modal -->
    <div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">员工添加</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                            <%--EmpName--%>
                        <div class="form-group">
                            <label for="empName_add_input" class="col-sm-2 control-label">EmpName</label>
                            <div class="col-sm-10">
                                <input type="text" name="name" class="form-control" id="empName_add_input" placeholder="EmpName">
                                <span class="help-block"></span>
                            </div>
                        </div>
                            <%--EmpEmail--%>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">EmpEmail</label>
                            <div class="col-sm-10">
                                <input type="email" name="email" class="form-control" id="empEmail_add_input" placeholder="EmpEmail">
                                <span class="help-block"></span>
                            </div>
                        </div>
                              <%--Gender  --%>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Gender</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                                </label>
                            </div>
                        </div>
                             <%--select   --%>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Department</label>
                            <div class="col-sm-4">
                                <%--部门提交dId即可--%>
                                <select class="form-control" name="dId" id="dept_add_select">

                                </select>
                            </div>
                        </div>

                    </form>
                </div>
                <%--底部--%>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="emp_save_btn">Save changes</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 员工修改的Modal -->
    <div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">员工修改</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <%--EmpName--%>
                        <div class="form-group">
                            <label for="empName_update_static" class="col-sm-2 control-label">EmpName</label>
                            <div class="col-sm-10">
                                <p class="form-control-static" id="empName_update_static"></p>
                            </div>
                        </div>
                        <%--EmpEmail--%>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">EmpEmail</label>
                            <div class="col-sm-10">
                                <input type="email" name="email" class="form-control" id="empEmail_update_input" placeholder="EmpEmail">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <%--Gender  --%>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Gender</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                                </label>
                            </div>
                        </div>
                        <%--select   --%>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Department</label>
                            <div class="col-sm-4">
                                <%--部门提交dId即可--%>
                                <select class="form-control" name="dId" id="dept_update_select">

                                </select>
                            </div>
                        </div>

                    </form>
                </div>
                <%--底部--%>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="emp_update_btn">Save changes</button>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>SSM</h1>
            </div>
        </div>

        <div class="row">
            <div class="col-md-2 col-md-offset-10">
                <button class="btn btn-info" id="emp_add_modal_btn">新增</button>
                <button class="btn btn-danger">删除</button>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover" id="emps_table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Gender</th>
                            <th>Department</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
        <div class="row" id="page_div">
            <%--&lt;%&ndash;//分页的插件&ndash;%&gt;--%>
            <%--<%@ include file="/WEB-INF/jsp/pagehelper.jsp"%>--%>
            <div class="col-md-6" id="page_info_area">

            </div>
            <div class="col-md-6" id="page_nav">

            </div>
        </div>
    </div>

    <link rel="stylesheet" href="/css/bootstrap.css"/>
    <script src="./js/jquery-3.2.1.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script type="text/javascript">

        var totalRecord, currentPage;
        $(function () {
            to_page(1)
        });
        
        function to_page(pn) {
            $.ajax({
                url:"/emps",
                data:"pn="+pn,
                type:"GET",
                success:function (result) {
//                    显示表格数据
                    build_emps_table(result)
//                    显示分页信息
                    build_page_info(result)
//                    显示分页条
                    build_page_nav(result)
                }
            });
        }

        //解析显示表格内容
        function build_emps_table(result) {
            //清空
            $("#emps_table tbody").empty();

            var emps = result.extend.empList.list;
            $.each(emps,function (index,item) {
                var empIdTd = $("<td></td>").append(item.empId);
                var empNameTd = $("<td></td>").append(item.empName);
                var empEmailTd = $("<td></td>").append(item.email);
                var deptNameTd = $("<td></td>").append(item.deptName.deptName);
                var empGenderTd = $("<td></td>").append(item.gender == "M"?"男":"女");
                var editBtn = $("<button></button>").addClass("btn btn-info btn-xs edit_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                //为编辑按钮添加自定义的属性
                editBtn.attr("editBtn_id", item.empId)
                var delBtn = $("<button></button>").addClass("btn btn-danger btn-xs del_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
                //为删除按钮添加自定义的属性
                delBtn.attr("delBtn_id", item.empId)
                var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
                //append方法返回的还是原来的对象
                $("<tr></tr>").append(empIdTd)
                    .append(empNameTd)
                    .append(empEmailTd)
                    .append(deptNameTd)
                    .append(empGenderTd)
                    .append(btnTd)
                    .appendTo("#emps_table tbody");
            })
        }

        //解析显示分页
        function build_page_info(result) {
            //清空
            $("#page_info_area").empty();

            $("#page_info_area").append("共"+result.extend.empList.total+"条记录,"
            +"当前显示第 "+result.extend.empList.pageNum+"/"+result.extend.empList.pages+" 页");
            totalRecord = result.extend.empList.total;
            currentPage = result.extend.empList.pageNum;
        }
        
        //解析显示分页条
        function build_page_nav(result) {
            //清空
            $("#page_nav").empty();

            var ul = $("<ul></ul>").addClass("pagination");

            //构建元素
            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
            var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#"));

            if (result.extend.empList.isFirstPage == false){
                var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
                var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#"));
                ul.append(firstPageLi).append(prePageLi);
            }
            //为元素添加点击事件
            firstPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page(result.extend.empList.pageNum - 1)
            });
            //设置按钮不能按
//            if (result.extend.empList.hasPreviousPage == false){
//                firstPageLi.addClass("disabled")
//                prePageLi.addClass("disabled")
//            }
            //遍历navigatepageNums
            $.each(result.extend.empList.navigatepageNums, function (index, item) {
                var numLi = $("<li></li>").append($("<a></a>").append(item));
                if(result.extend.empList.pageNum == item){
                    numLi.addClass("active");
                }
                numLi.click(function () {
                    to_page(item);
                });
                ul.append(numLi);
            });

            var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"));
            var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
            if (result.extend.empList.isLastPage == false){
                var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"));
                var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
                ul.append(nextPageLi).append(lastPageLi);
            }
            //为元素添加点击事件
            nextPageLi.click(function () {
                to_page(result.extend.empList.pageNum + 1)
            });
            lastPageLi.click(function () {
                to_page(result.extend.empList.pages)
            });

            var nav = $("<nav></nav>").append(ul);
            nav.appendTo("#page_nav")
        }
//        点击新增按钮
        $("#emp_add_modal_btn").click(function () {
            //获取部门信息
            getDept("#dept_add_select");
            //弹出模态框
            $("#empAddModal").modal({
                backdrop:"static"
            });
        });
        function getDept(ele) {
//            清空之前下拉列表的值
            $(ele).empty();
            $.ajax({
                url:"/depts",
                type:"GET",
                success:function (result) {
// "extend":{"depts":[{"deptId":1,"deptName":"技术部"},{"deptId":2,"deptName":"人事部"}
//                    $("#dept_add_select").
                    $.each(result.extend.depts,function () {
                        var optionEle = $("<option></option>>")
                            .append(this.deptName).attr("value", this.deptId);
                        optionEle.appendTo(ele)
                    });
                }
            });
        }
//      校验新增表单数据
        function validate_add_form() {
//            校验name
            var empName = $("#empName_add_input").val();
            var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/
            if (!regName.test(empName)){
                show_validate("#empName_add_input", "error", "请输入6-16位英文或者2-5位中文");
                return false;
            }else {
                show_validate("#empName_add_input" ,"success", " ");
            }
//            校验邮箱
            var email = $("#empEmail_add_input").val();
            var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if (!regEmail.test(email)){
                show_validate("#empEmail_add_input", "error", "邮箱格式不正确")
                return false;
            }else {
                show_validate("#empEmail_add_input", "success", " ");
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
//        点击modal框里的保存按钮
        $("#emp_save_btn").click(function () {
//            校验表单数据
            if(!validate_add_form()){
                return false
            }
//            将表单的数据传给服务器进行保存
            $.ajax({
                url:"/emp",
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
        //        点击Update按钮
        $(document).on("click", ".edit_btn", function () {
            //查出Emp信息
            getEmp($(this).attr("editBtn_id"));
            //把员工的id传给模态框的更新按钮
            $("#emp_update_btn").attr("editBtn_id",$(this).attr("editBtn_id"))
            //查出部门信息
            getDept("#dept_update_select");
            //弹出模态框
            $("#empUpdateModal").modal({
                backdrop:"static"
            });
            //alert("hello")
        });
        function getEmp(id) {
            $.ajax({
                url:"/emp/"+id,
                type:"GET",
                success:function (result) {
                    //console.log(result)
                    var empData = result.extend.emp;
                    $("#empName_update_static").text(empData.empName);
                    $("#empEmail_update_input").val(empData.email);
                    $("#empUpdateModal input[name=gender]").val([empData.gender]);
                    $("#empUpdateModal select").val([empData.dId]);
                }
            })
        }
//        点击更新按钮
        $("#emp_update_btn").click(function () {
//            校验邮箱
            var email = $("#empEmail_update_input").val();
            var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if (!regEmail.test(email)){
                show_validate("#empEmail_update_input", "error", "邮箱格式不正确")
                return false;
            }else {
                show_validate("#empEmail_update_input", "success", " ");
            }

            $.ajax({
                url:"/emp/"+$(this).attr("editBtn_id"),
//                type:"POST",
//                data:$("#empUpdateModal form").serialize()+"&_method=PUT",
                type:"PUT",
                data:$("#empUpdateModal form").serialize(),
                success:function (result) {
                    $("#empUpdateModal").modal("hide");
                    to_page(currentPage);
                }
            })
        })

//        点击删除按钮
        $(document).on("click",".del_btn", function () {
            var empName = $(this).parents("tr").find("td:eq(1)").text;
            var empId = $(this).attr("delBtn_id");
            if (confirm("确认删除 "+empName+" 吗")){
                $.ajax({
                    url:"/emp/"+empId,
                    type:"DELETE",
                    success:function (result) {
                        //alert(result.msg);
                        to_page(currentPage);
                    }
                });
            }
        })
    </script>
</body>
</html>
