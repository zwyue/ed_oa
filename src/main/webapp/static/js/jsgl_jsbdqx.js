//左侧导航
		    layui.use('element', function(){
		          var element = layui.element;
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
            var jsTableList = $('#jsTableList');
            //新增学生
			$('#tjjs').click(function(){
	            //显示添加界面
	            $('#bgDiv').show(); 
	            $('#jsFgDiv').show(); 
	            //清除文本框中的数据
	          $('#jsFgDiv :text,:hidden').val('');
	        });
              
        //保存      
        $('#btnSave').click(function (){ 
            var id = $('#hidId').val();
            if (id == '') { //如果是添加
            var trContent = $('<tr id="' + $('#hidId').val() + '">' +
                    '<td>' + $('#num').val() + '</td>' +
                    '<td>' + $('#role').val() + '</td>' +
                    '<td>' + $('#state').val() + '</td>' +                 
                    '<td><a href="JavaScript:;" class="bg bgActive del">删除</a><a href="JavaScript:;" class="bg change">修改</a><a href="JavaScript:;" class="bg look">查看</a></td>' +
                    '</tr>').appendTo('#jsTableList');
					trContent.find('td a:first-child').click(function(){
	                 	if (confirm('确定要删除吗')){
		                    $(this).parent().parent('tr').remove();		                    
		                }
		            });
		            trContent.find('td a:nth-of-type(1)').click(function(){//为修改按钮绑定事件
	                      //显示添加界面 
						$('#bgDiv').show();
	          			$('#jsFgDiv').show();
	                      //找到当前按钮所在td的之前的所有td，因为数据就在这些td中
	                      var tds = $(this).parent().prevAll();
	                      //设置文本框的值
	                      $('#hidId').val(tds.eq(2).text());//用于存放修改行的id。并用于判别是添加操作还是修改。
	                      $('#num').val(tds.eq(2).text());
	                      $('#role').val(tds.eq(1).text());
	                      $('#state').val(tds.eq(0).text());     
	                  });
	                  trContent.find('td a:last-child').click(function (){//为查看按钮绑定事件
//	                    	//显示添加界面
						$('#bgDiv').show();
			            $('#jsFgDivLook').show();
			            $('#close1').click(function(){
			            	$('#jsFgDivLook').hide();
			            	$('#bgDiv').hide();
			            });
			            //找到当前按钮所在td的之前的所有td，因为数据就在这些td中
			            var tds = $(this).parent().prevAll();
			            //设置文本框的值
			            $('#hidId1').val(tds.eq(2).text());//用于存放修改行的id。并用于判别是添加操作还是修改。
			            $('#num1').val(tds.eq(2).text());
			            $('#role1').val(tds.eq(1).text());
			            $('#state1').val(tds.eq(0).text());
	                  });   	
                }else{//否则是修改 
                    var tds = $('#' + id + '>td');
                    tds.eq(0).text($('#num').val());
                    tds.eq(1).text($('#role').val());
                    tds.eq(2).text($('#state').val());
                    //改tr的id属性，保持数据一致
                    $('#' + id).attr('id', $('#num').val());
                }
                //隐藏层 隐藏起来
                $('#bgDiv').hide();
                $('#jsFgDiv').hide();
                $('#close').click(function(){
                	$('#jsFgDiv').hide();
                	$('#bgDiv').hide();
                });
           });
           
		//修改
            $('.change').click(function(){
                //显示添加界面
				$('#bgDiv').show();
                $('#jsFgDiv').show();  
                $('#close').click(function(){
                	$('#jsFgDiv').hide();
                	$('#bgDiv').hide();
                });
                //找到当前按钮所在td的之前的所有td，因为数据就在这些td中
                var tds = $(this).parent().prevAll();
                //设置文本框的值
                $('#hidId').val(tds.eq(2).text());//用于存放修改行的id。并用于判别是添加操作还是修改。
                $('#num').val(tds.eq(2).text());
                $('#role').val(tds.eq(1).text());
                $('#state').val(tds.eq(0).text());
            });
            
        //查看
        $('.look').click(function(){
            //显示添加界面
			$('#bgDiv').show();
            $('#jsFgDivLook').show();
            $('#close1').click(function(){
            	$('#jsFgDivLook').hide();
            	$('#bgDiv').hide();
            });
            //找到当前按钮所在td的之前的所有td，因为数据就在这些td中
            var tds = $(this).parent().prevAll();
            //设置文本框的值
            $('#hidId1').val(tds.eq(2).text());//用于存放修改行的id。并用于判别是添加操作还是修改。
            $('#num1').val(tds.eq(2).text());
            $('#role1').val(tds.eq(1).text());
            $('#state1').val(tds.eq(0).text());
        });
		//删除
		$('.del').click(function(){
          	if (confirm('确定要删除吗')){
                $.ajax({
                    type:"post",
                    url:"/role/deleteRole",
                    data:{roleId:this.id},
                    async:true,
                    success: function (result) {
                        console.log("log 13.2 异步调用返回成功,result:"+result);
                        if(result.msg=="success"){
                            // window.location.href="<%=basePath%>classes/list";
                            $(this).parents('tr').remove();
                        }
                    },
                    error: function (XMLHttpResponse, textStatus, errorThrown) {
                        window.location.href="<%=basePath%>classes/list";
                        console.log("1 异步调用返回失败,XMLHttpResponse.readyState:"+XMLHttpResponse.readyState);
                        console.log("2 异步调用返回失败,XMLHttpResponse.status:"+XMLHttpResponse.status);
                        console.log("3 异步调用返回失败,textStatus:"+textStatus);
                        console.log("4 异步调用返回失败,errorThrown:"+errorThrown);
                    }
                });
            }
        });		  