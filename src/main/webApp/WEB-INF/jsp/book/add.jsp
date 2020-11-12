<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>新增书籍</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <!-- 加载Query文件-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.js">
    </script>


    <script type="text/javascript">
        $(document).ready(function () {
            $("#submit").click(function () {
                var id = $("#id").val();
                var name = $("#name").val();
                var price = $("#price").val();
                if ($.trim(name) == '') {
                    alert("书籍名称不能为空！");
                    return;
                }
                var params = {
                    id: id,
                    name: name,
                    price: price
                };
                $.post({
                    url: "./insert",
                    // 此处需要告知传递参数类型为JSON，不能缺少
                    contentType: "application/json",
                    // 将JSON转化为字符串传递
                    data: JSON.stringify(params),
                    // 成功后的方法
                    success: function (result) {
                        if (result == null || result.id == null) {
                            alert("插入失败");
                            return;
                        }
                        alert("插入成功" + result.name + ">>" + result.price);
                        window.location.href = "./details1";
                    }
                });
            });
        });

    </script>
    <style>
        .main {
            text-align: center; /*让div内部文字居中*/
            background-color: #fff;
            border-radius: 20px;
            width: 300px;
            height: 350px;
            margin: auto;
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
        }
    </style>
</head>

<body>
<div class="main">
    <form id="insertForm" >
        <div class="form-group">
            <label for="id">书籍id</label>
            <input type="text" class="form-control" id="id" name="id">
        </div>
        <div class="form-group">
            <label for="name">书籍名称</label>
            <input type="text" class="form-control" id="name" name="name">
        </div>
        <div class="form-group">
            <label for="price">书籍价格</label>
            <input type="text" class="form-control" id="price" name="price">
        </div>
        <div class="form-group">
            <form action="/file/upload" method="post" enctype="multipart/form-data" >
                <label for="file">书籍封面</label>
                <input type="file" class="form-control" name="file" id="file">
            </form>

        </div>
        <button type="button" class="btn btn-primary" value="提交" id="submit">Submit</button>
    </form>
</div>
</body>