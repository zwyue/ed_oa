	//左侧导航
		    layui.use('element', function(){
		          var element = layui.element;
		     });
		     
		    //查询事件
			$('#chaXun').click(function(){
				//验证真实姓名
				var name = $('#name').val();
			    var regName =/^[\u4e00-\u9fa5]{2,4}$/;			   
			    if(name==''){
			    	layer.alert('请输入姓名');  
			    	return false;
			    }else if(!regName.test(name)){
			    	layer.alert('真实姓名填写有误');
			         return false; 
			    }
				//验证身份证
				var idNo = $('#idCard').val();
				var regIdNo = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
				if(idNo==''){
					layer.alert('请输入身份证号');  
			    	return false;
				}else if(!regIdNo.test(idNo)){
					layer.alert('身份证号填写有误');  
			    	return false;
				};			 
			});
		     
		    //分页
			layui.use(['laypage', 'layer'], function(){
			  var laypage = layui.laypage,layer = layui.layer;			
			   laypage.render({
			    elem: 'demo5'
			    ,count: 500
			    ,curr: location.hash.replace('#!fenye=', '') //获取hash值为fenye的当前页
			    ,hash: 'fenye' //自定义hash值
			  });
			});

		//表格增删改查     
		var tableList = [
			{ id: '1', name: '张三', unit: '邮政局',age:'50',profession:'国画',time:'2018.6.4' },
			{ id: '2', name: '张三', unit: '邮政局',age:'50',profession:'国画',time:'2018.6.4' },
			{ id: '3', name: '张三', unit: '邮政局',age:'50',profession:'国画',time:'2018.6.4' },
			{ id: '4', name: '张三', unit: '邮政局',age:'50',profession:'国画',time:'2018.6.4' },
			{ id: '5', name: '张三', unit: '邮政局',age:'50',profession:'国画',time:'2018.6.4' },
			{ id: '6', name: '张三', unit: '邮政局',age:'50',profession:'国画',time:'2018.6.4' },
		];
		  $.each(tableList, function(){
            $('<tr id="'+this.id+'">' +
                '<td>'+this.id+'</td>' +
                '<td>'+this.name+'</td>' +
                '<td>'+this.unit+'</td>' +
                '<td>'+this.age+'</td>' +
                '<td>'+this.profession+'</td>' +
                '<td>'+this.time+'</td>' +
                '<td><a href="JavaScript:;" class="bdjs">绑定角色</a></td>'+
               '</tr>').appendTo('#yhTableList');                   	
          });
