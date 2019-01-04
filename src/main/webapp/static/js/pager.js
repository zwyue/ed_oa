var pageSize =6;     //每页显示多少条记录
var total;           //总共多少记录
$(function() {
    Init(0); //注意参数，初始页面默认传到后台的参数，第一页是0;
    $("#Pagination").pagination(total, {   //total不能少
        callback: PageCallback,
        prev_text: '上一页',
        next_text: '下一页',
        items_per_page: pageSize,
        num_display_entries: 4,        //连续分页主体部分显示的分页条目数
        num_edge_entries: 1,           //两侧显示的首尾分页的条目数
    });
    function PageCallback(index, jq) {     //前一个表示您当前点击的那个分页的页数索引值，后一个参数表示装载容器。
        Init(index);
    }
});

function Init(pageIndex){      //这个参数就是点击的那个分页的页数索引值，第一页为0，上面提到了，下面这部分就是AJAX传值了。
    $.ajax({
        type: "post",
        url:"../getContentPaixuServ?Cat="+str+"&rows="+pageSize+"&page="+pageIndex,
        async: false,
        dataType: "json",
        success: function (data) {
            $(".neirong").empty();
            /*             total = data.total; */
            var array = data.rows;
            for(var i=0;i<array.length;i++){
                var info=array[i];

                if(info.refPic != null){
                    $(".neirong").append('<dl><h3><a href="'+info.CntURL+'?ContentId='+info.contentId+'" title="'+info.caption+'" >'+info.caption+'</a></h3><dt><a href="sjjm.jsp?ContentId='+info.contentId+'" title="'+info.caption+'" ><img src="<%=basePathPic%>'+info.refPic+'" alt="'+info.caption+' width="150" height="95""></a></dt>  <dd class="shortdd">'+info.text+'</dd><span>发布时间：'+info.createDate+'</span></dl>')
                }else{
                    $(".neirong").append('<dl ><h3><a href="'+info.CntURL+'?ContentId='+info.contentId+'" title="'+info.caption+'" >'+info.caption+'</a></h3><dd class="shortdd">'+info.text+'</dd><span>发布时间：'+info.createDate+'</span></dl>');
                };
            }
        },
        error: function () {
            alert("请求超时，请重试！");
        }
    });
};