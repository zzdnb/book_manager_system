<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>书籍详情</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<script>
    if(${msg!=null}){
        alert(msg);
    }
</script>
<body>

<div align="center">
    <table class="table">

        <thead>
        <tr>
            <th>书籍编号</th>
            <th>书籍姓名</th>
            <th>书籍价格</th>
            <th>书籍封面</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${books1}" var="book">
        <tr class="active">
            <td><c:out value="${book.id}"/></td>
            <td><c:out value="${book.name}"/></td>
            <td><c:out value="${book.price}"/></td>
            <td>
                <c:if test="${book.cover!=null}">
                    <img src="${book.cover}" alt="OKK" width="200px" height="100px">
                </c:if>
                <c:if test="${book.cover==null}">
                    <form action="/file/upload" method="post" enctype="multipart/form-data" >
                        <input type="hidden" name="id" value="${book.id}">
                    <input type="file" class="form-control" name="file" id="file">
                    <input type="submit" value="添加头像"/>
                </form>
                </c:if>
            </td>
        </tr>
            </c:forEach>

        </tbody>
    </table>


    <button type="button" class="btn btn-primary" value="增加图书"
            onclick="javascript:window.location.href='http://localhost:80/books/add'">增加书籍
    </button>


</div>
</body>
</html>