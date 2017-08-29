<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!--   -->
<head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</head>

<div class="container">
    <div class="row">
        <!-- 页数 -->
        <div class="message col-md-6">
            共<i class="blue">${empList.total}</i>条记录，当前显示第&nbsp;<i
                class="blue">${empList.pageNum}/${users.pages}</i>&nbsp;页
        </div>
        <%--分页按钮--%>
        <div class="col-md-6 col-md-offset-8">
                <ul class="pagination">
                    <!-- <li><a href="#">&laquo;</a></li> -->
                    <c:if test="${!empList.isFirstPage}">
                        <li><a href="javascript:queryAllPerson(${empList.firstPage}, ${empList.pageSize});">首页</a></li>
                        <li><a href="javascript:queryAllPerson(${empList.prePage}, ${empList.pageSize});">上一页</a></li>
                    </c:if>
                    <c:forEach items="${empList.navigatepageNums}" var="navigatepageNum">

                        <c:if test="${navigatepageNum == empList.pageNum}">
                            <li class="active"><a href="javascript:queryAllPerson(${navigatepageNum}, ${empList.pageSize});">${navigatepageNum}</a></li>
                        </c:if>
                        <c:if test="${navigatepageNum!=empList.pageNum}">
                            <li><a href="javascript:queryAllPerson(${navigatepageNum}, ${empList.pageSize});">${navigatepageNum}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${!pagehelper.isLastPage}">
                        <li><a href="javascript:queryAllPerson(${empList.nextPage}, ${empList.pageSize});">下一页</a></li>
                        <li><a href="javascript:queryAllPerson(${empList.lastPage}, ${empList.pageSize});">最后一页</a></li>
                    </c:if>
                    <!-- <li><a href="#">&raquo;</a></li> -->
                </ul>
        </div>
    </div>
</div>
