//JavaScript代码区域
layui.use('element', function(){
    var element = layui.element;
});


   //统计图
   // 基于准备好的dom，初始化echarts实例
   var myChart = echarts.init(document.getElementById('main'));

   // 指定图表的配置项和数据
   var option = {
      title: {
         text: '天津老年大学问题统计',
         x: 'center',

      },
      tooltip : {
          trigger: 'axis'
      },
       legend: {
          orient: 'vertical',
           data:['退学','休学','退班'],
           x:'right'
       },
       calculable : true,
       xAxis : [
           {
               type : 'category',
               name:'时间（年）',
               data : ['2014','2015','2016','2017','2018']
           }
       ],
           yAxis : [
               {
                   type : 'value',
                   max:'400',
                   name:'数量（个）',
               }
           ],
           series : [
               {
                   name:'退学',
                   color:'#ff9227',
                   type:'bar',
                   barWidth: '18%',
                   label: {
                       normal: {
                           show: true,
                           position: 'top'
                       }
                   },
                   data:[255,244, 100, 69,20],

               },
               {
                   name:'休学',
                   color:'#ffd927',
                   type:'bar',
                   data:[260, 264 ,90, 59,20 ],
                   barWidth: '18%',
                   label: {
                       normal: {
                           show: true,
                           position: 'top'
                       }
                   },
               },
               {
                   name:'退班',
                   color:'#ff5614',
                   type:'bar',
                   data:[256,232,70,69,21 ],
                   barWidth: '18%',
                       label: {
                           normal: {
                               show: true,
                               position: 'top'
                           }
                       },
               }
           ]
   };
   // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
