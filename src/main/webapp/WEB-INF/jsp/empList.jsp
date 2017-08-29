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
    <%--<%--%>
        <%--pageContext.setAttribute("WEB_PAth", request.getContextPath());--%>
    <%--%>--%>
    <script type="text/javascript">
        $(function(){
            $(".delete").click(function(){
                var href = $(this).attr("href");
                $("form").attr("action", href).submit();
                return false;
            });
            //alert("hello")
        });
        //        处理分页的js
        $(document).ready(function() {
        });
        function queryAllPerson(pageNum, pageSize) {
            $("#edit_area_div").load("<%=basePath%>/emps?pageNum=" + pageNum + "&pageSize=" + pageSize);
        }

    </script>

</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>SSM</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-md-2 col-md-offset-10">
            <button class="btn btn-info">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Gender</th>
                    <th>Department</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${empList.list}" var="emp">
                <tr>
                    <th>${emp.empId}</th>
                    <th>${emp.name}</th>
                    <th>${emp.email}</th>
                    <th>${emp.gender == "M"?"男":"女"}</th>
                    <th>${emp.deptName.deptName}</th>
                    <th>
                        <button class="btn btn-info" btn-xs>
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                编辑
                        </button>
                        <button class="btn btn-danger" btn-xs>
                            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                删除
                        </button>
                    </th>
                </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <div class="row" id="page_div">
        <%--&lt;%&ndash;//分页的插件&ndash;%&gt;--%>
        <%--<%@ include file="/WEB-INF/jsp/pagehelper.jsp"%>--%>
        <div class="col-md-6">
            共<i class="blue">${empList.total}</i>条记录，当前显示第&nbsp;<i
                class="blue">${empList.pageNum}/${empList.pages}</i>&nbsp;页
        </div>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="/emps?pn=1">首页</a></li>
                    <c:if test="${empList.hasPreviousPage}">
                        <li>
                            <a href="/emps?pn=${empList.pageNum - 1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach items="${empList.navigatepageNums}" var="page_Num">
                        <c:if test="${empList.pageNum == page_Num}">
                            <li class="active"><a href="/emps?pn=${page_Num}">${page_Num}</a></li>
                        </c:if>
                        <c:if test="${empList.pageNum != page_Num}">
                            <li><a href="/emps?pn=${page_Num}">${page_Num}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${empList.hasNextPage}">
                    <li>
                        <a href="/emps?pn=${empList.pageNum + 1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                    </c:if>
                    <li><a href="/emps?pn=${empList.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>


</body>
<link rel="stylesheet" href="/css/bootstrap.css"/>
<script src="/js/bootstrap.min.js"/>
<script src="/js/jquery-3.2.1.min.js"/>
</html>
