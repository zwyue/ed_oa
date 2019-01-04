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
			{ id: '1', name: '张三', leiBie: '音乐',zhuanYe:'二胡',banJi:'一班',tel:'19982783728',familytel:'15172839473',teacher:'周海' },
			{ id: '2', name: '张三', leiBie: '音乐',zhuanYe:'二胡',banJi:'一班',tel:'19982783728',familytel:'15172839473',teacher:'周海' },
			{ id: '3', name: '张三', leiBie: '音乐',zhuanYe:'二胡',banJi:'一班',tel:'19982783728',familytel:'15172839473',teacher:'周海' },
			{ id: '4', name: '张三', leiBie: '音乐',zhuanYe:'二胡',banJi:'一班',tel:'19982783728',familytel:'15172839473',teacher:'周海' },
			{ id: '5', name: '张三', leiBie: '音乐',zhuanYe:'二胡',banJi:'一班',tel:'19982783728',familytel:'15172839473',teacher:'周海' },
			{ id: '6', name: '张三', leiBie: '音乐',zhuanYe:'二胡',banJi:'一班',tel:'19982783728',familytel:'15172839473',teacher:'周海' },
			{ id: '7', name: '张三', leiBie: '音乐',zhuanYe:'二胡',banJi:'一班',tel:'19982783728',familytel:'15172839473',teacher:'周海' }
		  ];
		  $.each(tableList, function(){
            $('<tr id="'+this.id+'">' +
                '<td>'+this.id+'</td>' +
                '<td>'+this.name+'</td>' +
                '<td>'+this.leiBie+'</td>' +
                '<td>'+this.zhuanYe+'</td>' +
                '<td>'+this.banJi+'</td>' +
                '<td>'+this.tel+'</td>' +
                '<td>'+this.familytel+'</td>' +
                '<td>'+this.teacher+'</td>' +
                '<td><a href="JavaScript:;" class="bg bgActive del">删除</a><a href="yhgl_xsgl_xsxg.html" class="bg change">修改</a><a href="yhgl_xsgl_xsck.html" class="bg look">查看</a></td>'+
               '</tr>').appendTo('#list');                   	
          });
		//删除
		$('.del').click(function(){
          	if (confirm('确定要删除吗')){ 
                $(this).parents('tr').remove();
            }
        });	
//          //新增学生
//			$('#xzxs').click(function(){
//	            //显示添加界面
//	            $('#bgDiv').show(); 
//	            $('#fgDiv').show(); 
//	            //清除文本框中的数据
//	          $('#fgDiv :text,:hidden').val('');
//	        });
//            
//      //保存      
//      $('#btnSave').click(function (){ 
//          var id = $('#hidId').val();
//          if (id == '') { //如果是添加
//          var trContent = $('<tr id="' + $('#hidId').val() + '">' +
//                  '<td>' + $('#num2').val() + '</td>' +
//                  '<td>' + $('#name2').val() + '</td>' +
//                  '<td>' + $('#leiBie2').val() + '</td>' +
//                  '<td>' + $('#zhuanYe2').val() + '</td>' +
//                  '<td>' + $('#banJi2').val() + '</td>' +
//                  '<td>' + $('#tel2').val() + '</td>' +
//                  '<td>' + $('#familyTel2').val() + '</td>' +
//                  '<td>' + $('#teacher2').val() + '</td>' +
//                  '<td><a href="JavaScript:;" class="bg bgActive del">删除</a><a href="JavaScript:;" class="bg change">修改</a><a href="JavaScript:;" class="bg look">查看</a></td>' +
//                  '</tr>').appendTo('#list');
//                  trContent.find('td a:first-child').click(function(){
//	//                       	alert(33);
//	                 	if(confirm('确定要删除吗')){
//		                    $(this).parent().parent('tr').remove();
//		                }  	
//		            });		            
//		            trContent.find('td a:nth-of-type(1)').click(function(){
//		            	  //显示添加界面
//						$('#bgDiv').show();
//		                $('#fgDiv').show();  
//		                $('#close').click(function(){
//		                	$('#fgDiv').hide();
//		                	$('#bgDiv').hide();
//		                });
//		                //找到当前按钮所在td的之前的所有td，因为数据就在这些td中
//		                var tds = $(this).parent().prevAll();
//		                //设置文本框的值
//		                $('#hidId').val(tds.eq(7).text());//用于存放修改行的id。并用于判别是添加操作还是修改。
//		                $('#num2').val(tds.eq(7).text());
//		                $('#name2').val(tds.eq(6).text());
//		                $('#leiBie2').val(tds.eq(5).text());
//		                $('#zhuanYe2').val(tds.eq(4).text());
//		                $('#banJi2').val(tds.eq(3).text());
//		                $('#tel2').val(tds.eq(2).text());
//		                $('#familyTel2').val(tds.eq(1).text());
//		                $('#teacher2').val(tds.eq(0).text());
//		            });
//		            trContent.find('td a:last-child').click(function(){
//	                    //显示添加界面
//						$('#bgDiv').show();
//			            $('#fgDivLook').show();
//			            $('#close1').click(function(){
//			            	$('#fgDivLook').hide();
//			            	$('#bgDiv').hide();
//			            });
//			            //找到当前按钮所在td的之前的所有td，因为数据就在这些td中
//			            var tds = $(this).parent().prevAll();
//			            //设置文本框的值
//			            $('#hidId1').val(tds.eq(7).text());//用于存放修改行的id。并用于判别是添加操作还是修改。
//			            $('#num1').val(tds.eq(7).text());
//			            $('#name1').val(tds.eq(6).text());
//			            $('#leiBie1').val(tds.eq(5).text());
//			            $('#zhuanYe1').val(tds.eq(4).text());
//			            $('#banJi1').val(tds.eq(3).text());
//			            $('#tel1').val(tds.eq(2).text());
//			            $('#familyTel1').val(tds.eq(1).text());
//			            $('#teacher1').val(tds.eq(0).text());			                 		
//		            });
//              }else{//否则是修改 
//                  var tds = $('#' + id + '>td');
//                  tds.eq(0).text($('#num2').val());
//                  tds.eq(1).text($('#name2').val());
//                  tds.eq(2).text($('#leiBie2').val());
//                  tds.eq(3).text($('#zhuanYe2').val());
//                  tds.eq(4).text($('#banJi2').val());
//                  tds.eq(5).text($('#tel2').val());
//                  tds.eq(6).text($('#familyTel2').val());
//                  tds.eq(7).text($('#teacher2').val());
//                  //改tr的id属性，保持数据一致
//                  $('#' + id).attr('id', $('#num2').val());
//              }
//              //隐藏层 隐藏起来
//              $('#bgDiv').hide();
//              $('#fgDiv').hide();
//              $('#close').click(function(){
//              	$('#fgDiv').hide();
//              	$('#bgDiv').hide();
//              });
//         });
//         
//		//修改
//          $('.change').click(function(){
//              //显示添加界面
//				$('#bgDiv').show();
//              $('#fgDiv').show();  
//              $('#close').click(function(){
//              	$('#fgDiv').hide();
//              	$('#bgDiv').hide();
//              });
//              //找到当前按钮所在td的之前的所有td，因为数据就在这些td中
//              var tds = $(this).parent().prevAll();
//              //设置文本框的值
//              $('#hidId').val(tds.eq(7).text());//用于存放修改行的id。并用于判别是添加操作还是修改。
//              $('#num2').val(tds.eq(7).text());
//              $('#name2').val(tds.eq(6).text());
//              $('#leiBie2').val(tds.eq(5).text());
//              $('#zhuanYe2').val(tds.eq(4).text());
//              $('#banJi2').val(tds.eq(3).text());
//              $('#tel2').val(tds.eq(2).text());
//              $('#familyTel2').val(tds.eq(1).text());
//              $('#teacher2').val(tds.eq(0).text());
//          });
//          
//      //查看
//      $('.look').click(function(){
//          //显示添加界面
//			$('#bgDiv').show();
//          $('#fgDivLook').show();
//          $('#close1').click(function(){
//          	$('#fgDivLook').hide();
//          	$('#bgDiv').hide();
//          });
//          //找到当前按钮所在td的之前的所有td，因为数据就在这些td中
//          var tds = $(this).parent().prevAll();
//          //设置文本框的值
//          $('#hidId1').val(tds.eq(7).text());//用于存放修改行的id。并用于判别是添加操作还是修改。
//          $('#num1').val(tds.eq(7).text());
//          $('#name1').val(tds.eq(6).text());
//          $('#leiBie1').val(tds.eq(5).text());
//          $('#zhuanYe1').val(tds.eq(4).text());
//          $('#banJi1').val(tds.eq(3).text());
//          $('#tel1').val(tds.eq(2).text());
//          $('#familyTel1').val(tds.eq(1).text());
//          $('#teacher1').val(tds.eq(0).text());
//      });
	  