<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>书籍详情</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<body>

<div align="center">
    <table class="table">

        <thead>
        <tr>
            <th>标签</th>
            <th>值</th>

        </tr>
        </thead>
        <tbody>
        <tr class="active">
            <td>书籍编号</td>
            <td><c:out value="${book.id}"></c:out></td>
        </tr>
        <tr class="active">
            <td>书籍名称</td>
            <td><c:out value="${book.name}"></c:out></td>
        </tr>
        <tr class="active">
            <td>书籍价格</td>
            <td><c:out value="${book.price}"></c:out></td>
        </tr>

        <tr class="active">
            <td>书籍封面</td>
             <c:if test="${book.cover}!=null">
                <img src="${book.cover}" alt="xixi">
            </c:if>
                <c:if test="${book.cover}==null">
                    <td>请先去上传</td>
                </c:if>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>