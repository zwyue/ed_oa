   //JavaScript代码区域
   layui.use('element', function(){
      var element = layui.element;
   });

  /*下拉框*/
  layui.use(['element', 'tree', 'layer', 'form', 'upload'], function () {
     var $ = layui.jquery, tree = layui.tree;
     tree({
        elem: "#classtree",
        nodes: [{
            name: '舞蹈',
            id: 1,
            alias: 'changyong',
            children: [{name: '舞蹈一班', id: 11, href: 'http://www.layui.com/', alias: 'weidu'}, {
                name: '舞蹈二班',
                id: 12
            }, {name: '舞蹈三班', id: 13}]
        },
            {
            name: '唱歌',
            id: 2,
            // spread: true,
            children: [{
                name: '唱歌一班',
                id: 21,
                spread: true},{name:'唱歌二班', id:22
            },{name:'唱歌三班', id: 23}]
                // children: [{
                //     name: '唱歌二班',
                //     id: 211,
                //     children: [{name: '所有未读', id: 2111}, {name: '置顶邮件', id: 2112}, {name: '标签邮件', id: 2113}]
                // }, {name: '已发出的邮件', id: 212}, {name: '垃圾邮件', id: 213}]
        },
            {
                name: '其他',
                id: 2,
                // spread: true,
                children: [{
                    name: '',
                    id: 21,
                    spread: true,
                }]
            },
        ],
        click: function (node) {
            var $select = $($(this)[0].elem).parents(".layui-form-select");
            $select.removeClass("layui-form-selected").find(".layui-select-title span").html(node.name).end().find("input:hidden[name='selectID']").val(node.id);
        }
    });
    $(".downpanel").on("click", ".layui-select-title", function (e) {
        $(".layui-form-select").not($(this).parents(".layui-form-select")).removeClass("layui-form-selected");
        $(this).parents(".downpanel").toggleClass("layui-form-selected");
        layui.stope(e);
    }).on("click", "dl i", function (e) {
        layui.stope(e);
    });
    $(document).on("click", function (e) {
        $(".layui-form-select").removeClass("layui-form-selected");
    });
     //
      $(document).ready(function () {
          $(".layui-tree-branch").css('display','none');
          $(".layui-tree-leaf").css('display','none');
          $(".layui-show li cite").css('padding-left','2rem');
      })

});

//折线图
   // 基于准备好的dom，初始化echarts实例
   var myChart = echarts.init(document.getElementById('main'));
   // 指定图表的配置项和数据
   var option = {
       title: {
           text: '天津老年大学新生率',
           x: 'center',
              },
       legend: {
           data:['销量']
       },
       xAxis: {
           type: 'category',
           boundaryGap: false,
           data: ["2016年第一学期","2016年第二学期","2017年第一学期","2017年第二学期","2018年第一学期"]
       },
       yAxis: {
           type: 'value'
       },
       series: [{
           data: [30, 35, 45, 55, 80,90,100],
           type: 'line',
           areaStyle: {}
       }]
   };
   // 使用刚指定的配置项和数据显示图表。
   myChart.setOption(option);
