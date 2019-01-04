
//JavaScript代码区域 左侧列表部分
 layui.use('element', function(){
    var element = layui.element;
 });

//内嵌网页
function jump_page(jump_uri) {
    var iframe = '<iframe frameborder="0" src="'+jump_uri+'" width="100%" height="800px" scrolling="yes" class="x-iframe"></iframe>';
    // var div = document.getElementsByName('insert_page') ;
   // $("<iframe frameborder=\"0\" src=\"'+jump_uri+'\" width=\"100%\" height=\"800px\" scrolling=\"yes\" class=\"x-iframe\"></iframe>").appendTo("#insert_page");
    $(iframe).appendTo("#insert_page")
}