var tableInfo = document.getElementById("pageInfo");  /*获取table中的内容*/
var totalRow = tableInfo.rows.length;   /*计算出总条数(这种方法用来获取table行数，获取列数用var cells = departmentsInfo.rows[0].cells.length;*/
var pagesize = 3;   /*每页条数*/
var totalPage = Math.ceil(totalRow/pagesize);  /*计算出总页数*/
var currentPage;
var startRow;
var lastRow;
function pagination(i){
    currentPage = i;/*当前页*/
    document.getElementById("numPage").value="第"+currentPage+"页";   /*显示页码*/
    startRow = (currentPage-1)*pagesize;/*每页显示第一条数据的行数*/
    lastRow = currentPage*pagesize;/*每页显示的最后一条数据的行数,因为表头也算一行，所以这里不需要减1，这种情况以自己的实际情况为准*/
    if(lastRow>totalRow){
        lastRow=totalRow;/*如果最后一页的最后一条数据显示的行数大于总条数，那么就让最后一条的行数等于总条数*/
    }
    for(var i = 0;i<totalRow;i++){   /*将数据遍历出来*/
        var hrow = tableInfo.rows[i];
        if(i>=startRow&&i<lastRow){
            hrow.style.display="table-row";
        }else{
            hrow.style.display="none";
        }
    }
}
$(function(){
    firstPage();
});
function firstPage(){
    var i = 1;
    pagination(i);
}
function prevPage(){
    var i= currentPage-1;
    if(i<1){
        i=currentPage;
    }
    pagination(i);
}
function pnextPage(){
    var i= currentPage+1;
    if(i>totalPage){
        i= currentPage;
    }
    pagination(i);
}
function lastPage(){
    var i = totalPage;
    pagination(i);
}
