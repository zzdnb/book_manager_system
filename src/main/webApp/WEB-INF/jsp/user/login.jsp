<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>login</title>

    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
        body {
            background: url("https://src.mcool.com/data/attachment/forum/201801/13/134628ev2b2juv08z9u92x.jpg-photo");
            animation-name: myfirst;
            animation-duration: 12s;
            /*变换时间*/
            animation-delay: 2s;
            /*动画开始时间*/
            animation-iteration-count: infinite;
            /*下一周期循环播放*/
            animation-play-state: running;
            /*动画开始运行*/
        }

        @keyframes myfirst {
            0% {
                background: url("https://src.mcool.com/data/attachment/forum/201801/13/134355wjb5ec4pcuwu1jpj.jpg-photo");
            }
            34% {
                background: url("https://src.mcool.com/data/attachment/forum/201801/14/155521e6eo8nh76o9p6sem.jpg-photo");
            }
            67% {
                background: url("https://src.mcool.com/data/attachment/forum/201801/13/141730isvfgsrlsj5gkz5e.jpg-photo");
            }
            100% {
                background: url("https://src.mcool.com/data/attachment/forum/201801/14/160629q5kxbmmzkzkvbkxp.jpg-photo");
            }
        }

        .form {
            background: rgba(255, 255, 255, 0.2);
            width: 400px;
            margin: 120px auto;
        }

        /*阴影*/
        .fa {
            display: inline-block;
            top: 27px;
            left: 6px;
            position: relative;
            color: #ccc;
        }

        input[type="text"], input[type="password"] {
            padding-left: 26px;
        }

        .checkbox {
            padding-left: 21px;
        }

        　　　　　　</style>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#submit").click(function () {
                var username = $("#username").val();
                var password = $("#password").val();
                if ($.trim(username) == '') {
                    alert("用户名称不能为空！");
                    return;
                }
                var params = {
                    username: username,
                    password: password,
                };
                $.post({
                    url: "/users/loginUser",
                    // 此处需要告知传递参数类型为JSON，不能缺少
                    contentType: "application/json",
                    // 将JSON转化为字符串传递
                    data: JSON.stringify(params),
                    // 成功后的方法
                    success: function (result) {
                        if (result == "success") {
                            alert("恭喜" + username + "登录成功");
                            window.location.href = "/books/details1";
                        } else {
                            alert("登录失败,用户名密码错误");
                            window.location.href = "/index"
                        }
                    }
                });
            });
        });
    </script>
</head>
<body>
<div class="container">
    <div class="form row">
        <div class="form-horizontal col-md-offset-3" id="login_form">
            <h3 class="form-title">LOGIN</h3>
            <form id="login">
                <div class="col-md-9">
                    <div class="form-group">
                        <i class="fa fa-user fa-lg"></i>
                        <label for="username"></label><input class="form-control required" type="text"
                                                             placeholder="Username" id="username" name="username"
                                                             autofocus="autofocus" maxlength="20"/>
                    </div>
                    <div class="form-group">
                        <i class="fa fa-lock fa-lg"></i>
                        <label for="password"></label><input class="form-control required" type="password"
                                                             placeholder="Password" id="password" name="password"
                                                             maxlength="8"/>
                    </div>
                    <div class="form-group">
                        <label class="checkbox">
                            <input type="checkbox" name="remember" value="1"/>记住我
                        </label>
                    </div>
                    <div class="form-group col-md-offset-9">
                        <button type="button" class="btn btn-success pull-right" id="submit">登录</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>