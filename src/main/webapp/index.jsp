<%--
  Created by IntelliJ IDEA.
  User: caishihao9
  Date: 2022/7/14
  Time: 21:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script language="JavaScript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" />
    <script src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js" ></script>
</head>
<body>

<!-- 员工修改的模态框 -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@atguigu.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <!-- 部门提交部门id即可 -->
                            <select class="form-control" name="dId">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>

<!-- 员工添加的模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@163.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <!-- 部门提交部门id即可 -->
                            <select class="form-control" name="dId" id="dept_add_select">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 搭建显示页面 -->
<div class="container">
    <!-- 标题 -->
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <!-- 按钮 -->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
        </div>
    </div>
    <!-- 显示表格数据 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all"/>
                    </th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>

    <!-- 显示分页信息 -->
    <div class="row">
        <!--分页文字信息  -->
        <div class="col-md-6" id="page_info_area"></div>
        <!-- 分页条信息 -->
        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>

</div>
    <script type="text/javascript">

        var totalRecord,currentNum;
        $(function () {
            to_page(1)
        })
        function to_page(pn) {
            $.ajax({
                url:"${APP_PATH}/emps",
                data:"pn=" + pn,
                type:"GET",
                success:function (result) {
                    //console.log(result)
                    //1.解析并显示员工数据
                    build_emps_table(result)
                    //2.解析并显示分页信息
                    build_page_info(result)
                    //3.解析并显示分页条数据
                    build_page_nav(result)
                }
            })
        }
        
        function build_emps_table(result) {
            //清空table表
            $("#emps_table tbody").empty()
            var emps = result.returnData.pageInfo.list;
            $.each(emps,function (index,item) {
                var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>")
                var empIdTd = $("<td></td>").append(item.empId)
                var empNameTd = $("<td></td>").append(item.empName)
                var genderTd = $("<td></td>").append(item.gender == 'M'?"男":"女")
                var emailTd = $("<td></td>").append(item.email)
                var deptNameTd = $("<td></td>").append(item.department.deptName)
                var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑")
                editBtn.attr("edit-id",item.empId)
                var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除")
                delBtn.attr("del-id",item.empId)
                var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn)
                $("<tr></tr>").append(checkBoxTd)
                    .append(empIdTd)
                    .append(empNameTd)
                    .append(genderTd)
                    .append(emailTd)
                    .append(deptNameTd)
                    .append(btnTd)
                    .appendTo("#emps_table tbody")
            })
        }

        //解析显示分页信息
        function build_page_info(result) {
            $("#page_info_area").empty()
            var pageInfo = result.returnData.pageInfo
            $("#page_info_area").append("当前 "+pageInfo.pageNum+"页,总"+pageInfo.pages+"页,总"+pageInfo.total+"条记录")
            totalRecord = pageInfo.total
            currentNum = pageInfo.pageNum
        }

        //解析显示分页条
        function build_page_nav(result) {
            $("#page_nav_area").empty()
            var ul = $("<ul></ul>").addClass("pagination")
            //构建元素
            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"))
            var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"))
            if(result.returnData.pageInfo.hasPreviousPage == false){
                firstPageLi.addClass("disabled")
                prePageLi.addClass("disabled")
            }else{
                //为元素添加点击翻页的事件
                firstPageLi.click(function(){
                    to_page(1);
                })
                prePageLi.click(function(){
                    to_page(result.returnData.pageInfo.pageNum -1)
                })
            }

            var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"))
            var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"))

            if(result.returnData.pageInfo.hasNextPage == false){
                nextPageLi.addClass("disabled");
                lastPageLi.addClass("disabled");
            }else{
                nextPageLi.click(function(){
                    to_page(result.returnData.pageInfo.pageNum +1)
                })
                lastPageLi.click(function(){
                    to_page(result.returnData.pageInfo.pages)
                })
            }
            ul.append(firstPageLi).append(prePageLi)
            $.each(result.returnData.pageInfo.navigatepageNums,function(index,item){

                var numLi = $("<li></li>").append($("<a></a>").append(item))
                if(result.returnData.pageInfo.pageNum == item){
                    numLi.addClass("active")
                }
                numLi.click(function(){
                    to_page(item)
                })
                ul.append(numLi)
            })
            //添加下一页和末页 的提示
            ul.append(nextPageLi).append(lastPageLi)

            //把ul加入到nav
            var navEle = $("<nav></nav>").append(ul)
            navEle.appendTo("#page_nav_area")
        }

        //清空表单样式及内容
        function reset_form(ele){
            $(ele)[0].reset();
            //清空表单样式
            $(ele).find("*").removeClass("has-error has-success");
            $(ele).find(".help-block").text("");
        }

        //点击新增按钮弹出模态框
        $("#emp_add_modal_btn").click(function () {
            //清除表单数据（表单完整重置（表单的数据，表单的样式））
            reset_form("#empAddModal form");
            //发送ajax请求，查出部门信息，显示在下拉列表中
            getDepts("#dept_add_select")
            //弹出模态框
            $("#empAddModal").modal({
                backdrop:"static"
            })
        })

        //储查出所有的部门信息并显示在下拉列表中
        function getDepts(ele) {
            $(ele).empty()
            $.ajax({
                url:"${APP_PATH}/depts",
                type:"get",
                success:function(result){
                    //console.log(result)
                    //显示部门信息在下拉列表中
                    //$("#dept_add_select").append("<option></option>")
                    $.each(result.returnData.depts,function () {
                        var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId)
                        optionEle.appendTo(ele)
                    })
                }
            })
        }

        //校验表单数据
        function validate_add_form() {
            //1.要拿到需要校验的数据，使用正则表达式
            var empName = $("#empName_add_input").val()
            var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/
            if(!regName.test(empName)){
                show_validate_msg("#empName_add_input", "error", "用户名可以是2-5位中文或者6-16位英文和数字的组合")
                return false
            }else{
                show_validate_msg("#empName_add_input", "success", "")
            }

            //2、校验邮箱信息
            var email = $("#email_add_input").val()
            var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if(!regEmail.test(email)){
                //alert("邮箱格式不正确")
                //应该清空这个元素之前的样式
                show_validate_msg("#email_add_input", "error", "邮箱格式不正确")
                /* $("#email_add_input").parent().addClass("has-error")
                $("#email_add_input").next("span").text("邮箱格式不正确") */
                return false
            }else{
                show_validate_msg("#email_add_input", "success", "")
            }
            return true
        }

        //显示校验结果的提示信息
        function show_validate_msg(ele,status,msg){
            //清除当前元素的校验状态
            $(ele).parent().removeClass("has-success has-error")
            $(ele).next("span").text("")
            if("success"==status){
                $(ele).parent().addClass("has-success")
                $(ele).next("span").text(msg)
            }else if("error" == status){
                $(ele).parent().addClass("has-error")
                $(ele).next("span").text(msg)
            }
        }

        //校验用户名是否可用
        $("#empName_add_input").change(function(){
            //发送ajax请求校验用户名是否可用
            var empName = this.value;
            $.ajax({
                url:"${APP_PATH}/checkuser",
                data:"empName="+empName,
                type:"POST",
                success:function(result){
                    if(result.code==100){
                        show_validate_msg("#empName_add_input","success","用户名可用")
                        $("#emp_save_btn").attr("ajax-va","success")
                    }else{
                        show_validate_msg("#empName_add_input","error",result.returnData.va_msg)
                        $("#emp_save_btn").attr("ajax-va","error")
                    }
                }
            })
        })

        //点击保存员工
        $("#emp_save_btn").click(function () {
            //1.模态框中填写的表单数据提交给服务器进行保存
            //2.先对要提交给服务器的数据进行校验
            /*if(!validate_add_form()){
                return false;
            }*/
            //1、判断之前的ajax用户名校验是否成功。如果成功。
            if($(this).attr("ajax-va")==="error"){
                return false;
            }
            //3.发送ajax请求保存员工
            $.ajax({
                url:"${APP_PATH}/emp",
                type:"POST",
                data: $("#empAddModal form").serialize(),
                success:function (result) {
                    //alert(result)
                    if (result.code === 100){
                        //1.关闭模态框
                        $("#empAddModal").modal('hide')
                        //2.来到最后一页显示刚才保存的数据
                        to_page(totalRecord)
                    }else{
                        //显示失败信息
                        //console.log(result)
                        if(undefined !== result.returnData.errorFields.email){
                            //显示邮箱错误信息
                            show_validate_msg("#email_add_input", "error", result.returnData.errorFields.email)
                        }
                        if(undefined !== result.returnData.errorFields.empName){
                            //显示员工名字的错误信息
                            show_validate_msg("#empName_add_input", "error", result.returnData.errorFields.empName)
                        }
                    }
                }
            })
        })
        $(document).on("click",".edit_btn",function () {
            //1、查出部门信息，并显示部门列表
            getDepts("#empUpdateModal select")
            //2、查出员工信息，显示员工信息
            getEmp($(this).attr("edit-id"))

            $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"))
            $("#empUpdateModal").modal({
                backdrop:"static"
            })
        })

        function getEmp(id) {
            $.ajax({
                url:"${APP_PATH}/emp/" + id,
                type:"GET",
                success:function (result) {
                    var empData = result.returnData.emp
                    $("#empName_update_static").text(empData.empName)
                    $("#email_update_input").val(empData.email)
                    $("#empUpdateModal input[name=gender]").val([empData.gender])
                    $("#empUpdateModal select").val([empData.dId])
                }

            })
        }

        //点击更新，更新员工信息
        $("#emp_update_btn").click(function () {
            //校验邮箱验证
            var email = $("#email_update_input").val()
            var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if(!regEmail.test(email)){
                show_validate_msg("#email_update_input", "error", "邮箱格式不正确")
                return false
            }else{
                show_validate_msg("#email_update_input", "success", "")
            }

            //发送ajax请求保存更新的数据
            $.ajax({
                url:"${APP_PATH}/emp/" + $(this).attr("edit-id"),
                type:"PUT",
                data:$("#empUpdateModal form").serialize() ,
                success:function () {
                    $("#empUpdateModal").modal('hide')
                    to_page(currentNum)
                }
            })
        })

        //单个删除
        $(document).on("click",".delete_btn",function () {
            //弹出是否删除对话框
           var empName = $(this).parents("tr").find("td:eq(2)").text()
           if(confirm("确认删除【"+empName+"】吗？")){
               //确认，发送ajax请求删除即可
               $.ajax({
                   url:"${APP_PATH}/emp/" + $(this).attr("del-id"),
                   type:"DELETE",
                   success:function (result) {
                        if (result.code === 100){
                            to_page(currentNum)
                        }else{
                            alert("删除失败")
                        }
                   }
               })
           }
        })

        //完成全选/全不选功能
        $("#check_all").click(function(){
            //attr获取checked是undefined;
            //我们这些dom原生的属性；attr获取自定义属性的值；
            //prop修改和读取dom原生属性的值
            $(".check_item").prop("checked",$(this).prop("checked"))
        })

        //check_item
        $(document).on("click",".check_item",function(){
            //判断当前选择中的元素是否5个
            var flag = $(".check_item:checked").length==$(".check_item").length
            $("#check_all").prop("checked",flag)
        })

        //点击全部删除，就批量删除
        $("#emp_delete_all_btn").click(function () {
            var empNames = "",del_idstr = ""
            $.each($(".check_item:checked"),function () {
                empNames += $(this).parents("tr").find("td:eq(2)").text() + ","
                del_idstr += $(this).parents("tr").find("td:eq(1)").text() + "-"
            })
            empNames = empNames.substring(0,empNames.length-1)
            del_idstr = del_idstr.substring(0,del_idstr.length-1)
            if(confirm("确认删除【"+empNames+"】吗？")){
                //确认，发送ajax请求删除即可
                $.ajax({
                    url:"${APP_PATH}/emp/" + del_idstr,
                    type:"DELETE",
                    success:function (result) {
                        if (result.code === 100){
                            alert(result.msg)
                            $("#check_all").prop("checked",false)
                            to_page(currentNum)
                        }else{
                            alert("删除失败")
                        }
                    }
                })
            }
        })

    </script>
</body>
</html>
