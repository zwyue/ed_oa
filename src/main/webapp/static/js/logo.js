
$(function() {
    var hintText = {
        user_name: {
            hint: "⚠️请输入3-12个字符的用户名（包括字母/数字/下划线）",
            right: "√用户名格式正确", wrong: "×用户名格式有误，请重新输入"
        },
        password: {hint: "⚠️请输入6位以上密码", right: "√密码格式正确", wrong: "×请输入符合格式的密码"},
    }
    var regEvent = function (node, event, func) {
        if (node.addEventListener)
            node.addEventListener(event, func); else if (node.attachEvent)
            node.attachEvent("on" + event, func); else
            node["on" + event] = func;
    };
    function regValue(id, i) {
        var flag = false, input = document.getElementById(id), value = input.value;
        switch (id) {
            case "user_name":
            case "login_user_name":
            case "info_user_name":
                flag = /^[a-zA-Z0-9_]{4,16}$/.test(value.replace(/[\u0391-\uFFE5]/g, "nn"));
                id = "user_name";
                break;
            case "password":
            case "login_password":
            case "info_password":
                flag = /^\S{6,16}$/.test(value);
                id = "password";
                break;
            default:
                break;
        }
        if (flag) {
            index = 0;
            input.className = "right input";
            hint[i].className = "hint hint_right";
            hint[i].innerHTML = hintText[id].right;
        } else {
            input.className = "wrong input";
            hint[i].className = "hint hint_wrong";
            hint[i].innerHTML = hintText[id].wrong;
            index = 1;
        }
    };
    var inputs = document.getElementsByClassName("input"), id, hint = document.getElementsByClassName("hint"),
        index = 0;
    for (var j = 0; j < inputs.length; j++) {
        (function (i) {
            regEvent(inputs[i], "focus", function () {
                hint[i].style.visibility = "visible";
                id = inputs[i].id;
            });
            regEvent(inputs[i], "blur", function () {
                regValue(id, i);
            });
        })(j)
    }
  });

 //aiax请求数据
   $(document).ready(function () {
       $(".btn_login").click(function () {
           var UserName=$(".username").val();
           var PassWord=$(".passward").val();

           $.ajax({
               url:"http://192.168.0.146:8088/index/login",
               data:{
                   tnumber:UserName,
                   password:PassWord,
               },
               type:'post',
               dataType:'text',
               success:function (data) {
                   window.location.href="jsgl_jsbdqx.html";
               },
               error:function (data) {
                   console.log("错误");
               }
           })
       })
   })
 

