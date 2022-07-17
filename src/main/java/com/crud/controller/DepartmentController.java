package com.crud.controller;

import com.crud.pojo.Department;
import com.crud.pojo.Msg;
import com.crud.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author caishihao
 * @version 2021.1
 * @date 2022/7/15 21:17
 * 处理和部门有关的请求
 */
@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    /**
     * 查出的所有部门信息
     * @return
     */
    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDepts() {
        //查出的所有部门信息
        List<Department> list = departmentService.getDepts();
        return Msg.success().add("depts",list);
    }
}
