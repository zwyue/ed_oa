function deleteResource() {
    var resourceIds = document.getElementsByName("idList");
    var ids = [];
    for (var i=0;i<resourceIds.length;i++){
        if(resourceIds[i].checked){
            ids.push(resourceIds[i].value);
        }
    }
    deleteMethod(ids);

};

function deleteMethod(ids) {
    console.log(ids);

    if(ids.constructor===Array ){
        console.log("is array");
    }else {
        var temp = ids ;
        ids = [];
        ids.push(temp);
    }
    $.ajax({
        url:'/term/deleteTerm' ,
        async : true,
        type: 'post',
        // dataType: 'json',
        data: {
            idList:ids
        },
        success: function(data){
            console.log(1111111);
            for (var j = 0;j<ids.length;j++){
                document.getElementById(ids[j]+"").remove();
            }
        },
        error: function(data){
            console.log(2222222);
        }
    });
}

function showForm(id, width, height) {
    $("#overlay").height(winHeight);
    $("#overlay").width(winWidth);

    // fadeTo第一个参数为速度，第二个为透明度
    // 多重方式控制透明度，保证兼容性，但也带来修改麻烦的问题
    $("#overlay").fadeTo(200, 0.5);

    var obj  = document.getElementById(id);
    var winWidth = document.documentElement.clientWidth;
    var winHeight = document.documentElement.clientHeight;
    var offsetTop = document.documentElement.offsetTop;
    var left = (winWidth - width)/2;
    var top  = (winHeight - height)/2 + offsetTop;
    obj.style.top = top + "px";
    obj.style.left = left + "px";
    obj.style.display = "block";
}

function editCst(id, width, height,name,id,time) {
    $("#overlay").height(winHeight);
    $("#overlay").width(winWidth);

    // fadeTo第一个参数为速度，第二个为透明度
    // 多重方式控制透明度，保证兼容性，但也带来修改麻烦的问题
    $("#overlay").fadeTo(200, 0.5);

    var obj  = document.getElementById(id);
    var winWidth = document.documentElement.clientWidth;
    var winHeight = document.documentElement.clientHeight;
    var offsetTop = document.documentElement.offsetTop;
    var left = (winWidth - width)/2;
    var top  = (winHeight - height)/2 + offsetTop;
    obj.style.top = top + "px";
    obj.style.left = left + "px";
    obj.style.display = "block";

    var form = obj.childNodes[1];
    for(var i = 0 ;i<4 ;i++){
        var input = form[i];
        var name = input.attributes[1].value;
        if(name=='coursename'){
            input.value = term ;
        }
        if(name=='time'){
            input.value = time ;
        }
        if(name=='id'){
            input.value = termId ;
        }
    }
    console.log(form);
}

function subForm(id) {

}

function closeForm(id) {
    var obj  = document.getElementById(id);
    var ob = obj.childNodes[1].reset();
    obj.style.display = "none";
    $("#overlay").fadeOut(200);
}