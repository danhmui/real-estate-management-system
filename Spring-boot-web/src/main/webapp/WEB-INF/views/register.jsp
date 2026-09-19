<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Đăng ký tài khoản</title>

    <link rel="stylesheet" href="<c:url value='/admin/assets/css/bootstrap.min.css'/>" />
    <link rel="stylesheet" href="<c:url value='/admin/assets/font-awesome/4.2.0/css/font-awesome.min.css'/>" />
    <link rel="stylesheet" href="<c:url value='/admin/assets/css/ace.min.css'/>" />

    <script src="<c:url value='/admin/assets/js/jquery.2.1.1.min.js'/>"></script>
    <script type="text/javascript">
        if (typeof jQuery === 'undefined') {
            var script = document.createElement('script');
            script.src = "<c:url value='/admin/assets/js/jquery.min.js'/>";
            script.type = 'text/javascript';
            document.getElementsByTagName('head')[0].appendChild(script);
        }
    </script>
</head>
<body>
<div class="container">
    <div class="login-form">
        <div class="main-div">
            <div class="container-fluid">
                <section class="gradient-custom">
                    <div class="page-wrapper">
                        <div class="row d-flex justify-content-center align-items-center">
                            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                                <div class="card text-white" style="border-radius: 1rem; background-color: #35bf76;">
                                    <div class="card-body p-5">
                                        <div class="mb-md-5 mt-md-4 pb-5 text-center">
                                            <h2 class="fw-bold mb-2 text-uppercase">Register</h2>
                                            <p class="text-white-50 mb-5">Please fill in the form to create an account!</p>

                                            <form id="formRegister">
                                                <div class="form-outline form-white mb-4">
                                                    <label class="form-label" for="fullname">Fullname</label>
                                                    <input type="text" class="form-control" id="fullname" name="fullName" placeholder="Họ và tên">
                                                </div>
                                                <div class="form-outline form-white mb-4">
                                                    <label class="form-label" for="username">Username</label>
                                                    <input type="text" class="form-control" id="username" name="userName" placeholder="Tên đăng nhập">
                                                </div>

                                                <div class="form-outline form-white mb-4">
                                                    <label class="form-label" for="password">Password</label>
                                                    <input type="password" class="form-control" id="password" name="passWord" placeholder="Mật khẩu">
                                                </div>

                                                <div class="form-outline form-white mb-4">
                                                    <label class="form-label" for="confirmpassword">Confirm your password</label>
                                                    <input type="password" class="form-control" id="confirmpassword" name="confirmPassword" placeholder="Xác nhận mật khẩu">
                                                </div>

                                                <div class="form-check d-flex justify-content-center mb-5">
                                                    <div><input class="form-check-input me-2" type="checkbox" value="" id="chkTerms" name="terms" /></div>
                                                    <div><label class="form-check-label" for="chkTerms">
                                                        I agree to all statements in <p><a href="#!">Terms of Service</a></p>
                                                    </label></div>
                                                </div>

                                                <button type="button" id="btnRegister" class="btn btn-primary">Đăng ký</button>
                                            </form>

                                            <!-- Khung thông báo -->
                                            <div id="alertMessage" class="alert d-none mt-3" role="alert"></div>

                                            <div class="d-flex justify-content-center text-center mt-2 pt-1">
                                                <a href="#!" class="login-extension text-white"><i class="fa fa-facebook fa-lg"></i></a>
                                                <a href="#!" class="login-extension text-white"><i class="fa fa-twitter fa-lg mx-4 px-2"></i></a>
                                                <a href="#!" class="login-extension text-white"><i class="fa fa-google fa-lg"></i></a>
                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <p class="mb-0 text-center account">Already have an account? <a href="<c:url value='/login'/>" class="text-white-50 fw-bold">Sign In</a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</div>

<!-- Script xử lý Form -->
<script>
    $(document).ready(function() {
        $('#btnRegister').click(function (e){
            e.preventDefault();
            var data = {};
            var formData = $('#formRegister').serializeArray();
            $.each(formData, function (i, it){
                data["" + it.name + ""] = it.value;
            });
            console.log(data);

            if (!data.userName || !data.passWord || !data.fullName || !data.confirmPassword) {
                showAlert("Vui lòng điền đầy đủ thông tin!", "danger");
                return;
            }
            if (data.passWord.length < 6){
                showAlert("Mật khẩu ít nhất phải 6 kí tự !", "danger");
                return;
            }
            if (data.passWord !== data.confirmPassword) {
                showAlert("Mật khẩu xác nhận không khớp!", "danger");
                return;
            }
            if (!$('chkTerms').is(':checked')){
                showAlert("Vui lòng đồng ý với các điều khoản dịch vụ (Terms of Service)!", "danger");
                return;
            }

            $.ajax({
                type: 'POST',
                url: '<c:url value="/register"/>',
                contentType: 'application/json',
                data: JSON.stringify(data),
                success: function (response) {
                    showAlert("Đăng ký thành công! Đang chuyển hướng sang trang đăng nhập...", "success");
                    setTimeout(function() {
                        window.location.href = "<c:url value='/login?registerSuccess'/>";
                    }, 2000);
                },
                error: function (error) {
                    var msg = "Đăng ký thất bại!";
                    if (error.responseText) {
                        msg = error.responseText;
                    }
                    showAlert(msg, "danger");
                }
            });
        });

        function showAlert(msg, type) {
            $('#alertMessage').removeClass('d-none alert-danger alert-success')
                .addClass('alert-' + type)
                .html(msg);
        }
    });
</script>
</body>
</html>