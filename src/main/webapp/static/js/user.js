function allocate(userid) {
    $ajax({
        type:"post",
        url:'/role/allocateRole',
        asyn:false,
        data:{userids:userid},
        // dataType:'json',
        success:function (data) {
            console.log(data);
        },
        error:function (data) {
            console.log(data);
        }
    })
}