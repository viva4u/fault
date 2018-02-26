<%--
  Created by IntelliJ IDEA.
  User: yanxj
  Date: 2018/2/8
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="utf-8">
    <title>Title</title>
    <!-- jq -->
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <!-- bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <!-- 分页插件 -->
    <link href="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table-locale-all.min.js"></script>
    <style>
        #table {
            height: 200px;
        }
    </style>
</head>
<body>
    <input id="basepath" name="basepath" value="<%=request.getContextPath()%>" style="display: none">
    <div class="container" style="margin-top: 100px">
        <div class="row">
            <div class="col-xs-6 pull-right">
                <div class="input-group">
                    <input type="text" class="form-control" name="age" placeholder="请输入年龄">
                    <input type="text" class="form-control" name="name" placeholder="请输入姓名">
                    <span class="input-group-btn">
                        <button class="btn btn-default search" type="button">Go</button>
                    </span>
                </div>
            </div>
            <div class="col-xs-12">
                <table id="table" class="table table-striped table-bordered table-hover"></table>
            </div>
        </div>
    </div>
    <%--<script type="text/javascript">
        class btspTable{
            constructor(obj){
                this.obj = obj;
            }
            start(searchArgs){
                this.obj.bootstrapTable('destroy');
                this.obj.bootstrapTable({
                    url:'/pageQuery',
                    method:'post',
                    contentType:'application/x-www-form-urlencoded',
                    // queryParamsType:'',
                    // queryParams:function queryParams(params) {
                    //     var param = {
                    //         pageNumber: params.pageNumber,
                    //         pageSize: params.pageSize
                    //     };
                    //     for(var key in searchArgs){
                    //         param[key]=searchArgs[key]
                    //     }
                    //     return param;
                    // },
                    //【其它设置】
                    locale:'zh-CN',//中文支持
                    pagination: true,//是否开启分页（*）
                    pageNumber:1,//初始化加载第一页，默认第一页
                    pageSize: 3,//每页的记录行数（*）
                    pageList: [2,3,4],//可供选择的每页的行数（*）
                    sidePagination: "server", //分页方式：client客户端分页，server服务端分页（*）
                    showRefresh:true,//刷新按钮

                    //【样式设置】
                    height: 300,//table的高度
                    //按需求设置不同的样式：5个取值代表5中颜色['active', 'success', 'info', 'warning', 'danger'];
                    // rowStyle: function (row, index) {
                    //     var style = "";
                    //     if (row.name=="小红") {style='success';}
                    //     return { classes: style }
                    // },

                    //【设置列】
                    columns: [
                        {field: 'id',title: 'id'},
                        {field: 'name',title: '姓名'},
                        {field: 'age',title: '年龄'},
                        {field: 'tool',title: '操作', align: 'center'/*,
                            formatter:function(value,row,index){
                                var element =
                                    "<a class='edit' data-id='"+row.id +"'>编辑</a> "+
                                    "<a class='delet' data-id='"+row.id +"'>删除</a> ";
                                return element;
                            }*/
                        }
                    ]
                });
            }
        }
        var btspTable = new btspTable($("table"));
        btspTable.start({});
    </script>--%>
    <script type="text/javascript">
        var path = $("#basepath").val();

        var $table = $('#table');
        $table.bootstrapTable({
            url: path+"/pageQuery",
            dataType: "json",
            pagination: true, //分页
            data_local: "zh-US",
            pageIndex:1,
            pageSize:5,
            queryParamsType:'',
            queryParams: function (params) {//自定义参数，这里的参数是传给后台的，
                alert(params.pageNumber);
                return{//这里的params是table提供的
                    //每页多少条数据
                    pageSize: params.pageSize,
                    //请求第几页
                    pageNumber:params.pageNumber,
                    // Name:$('#search_name').val(),
                    // Tel:$('#search_tel').val()
                };
            },
            singleSelect: false,

            search: true, //显示搜索框
            sidePagination: "server", //服务端处理分页
            columns: [
            {
                title: 'ID',
                field: 'id',
                align: 'center',
                valign: 'middle'
            },
            {
                title: '姓名',
                field: 'name',
                align: 'center',
                valign: 'middle',
            },
            {
                title: '部门',
                field: 'deptment',
                align: 'center'
            },
            {
                title: '操作',
                field: 'id',
                align: 'center',
                formatter:function(value,row,index){
                    var e = '<a href="#" mce_href="#" onclick="edit(\''+ row.id + '\')">编辑</a> ';
                    var d = '<a href="#" mce_href="#" onclick="del(\''+ row.id +'\')">删除</a> ';
                    return e+d;
                }
            }
        ]
        });
    </script>
</body>
</html>
