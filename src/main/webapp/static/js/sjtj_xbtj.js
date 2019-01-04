//JavaScript代码区域
layui.use('element', function(){
    var element = layui.element;
});



//饼图
// 基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('main'));

// 指定图表的配置项和数据
var option = {
    title : {
        text: '天津老年大学性别统计',
        x:'center',
        y:'5%',
    },
    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    legend: {
        orient: 'vertical',
        y:"15%",
        x:'5%',
        data: ['女性','男性'],
        pageTextStyle:{
            fontsize:18,
            fontStyle:'微软雅黑',
        }
    },
    series : [
        {
            type: 'pie',
            radius : '55%',
            //center: ['50%', '60%'],

            data: [{
                value:630,
                name: '女性',
                itemStyle:{
                    color:'#fc9a49',
                },
            }, {
                value:400,
                name:'男性',
                itemStyle:{
                    color:'#f2796c',
                },
               },
            ],
            itemStyle: {
                // 设置扇形的颜色
                //color: '#c23531',
                //shadowBlur: 200,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
            }
        }
    ]
};

// 使用刚指定的配置项和数据显示图表。
myChart.setOption(option);
