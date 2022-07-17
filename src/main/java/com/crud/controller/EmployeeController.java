package com.crud.controller;

import com.crud.pojo.Employee;
import com.crud.pojo.Msg;
import com.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author caishihao
 * @version 2021.1
 * @date 2022/7/14 20:59
 * 处理CRUD请求
 */
@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    /**
     * 单个批量二合一
     * @param ids
     * @return
     */
    @DeleteMapping("/emp/{ids}")
    @ResponseBody
    public Msg deleteEmp(@PathVariable("ids")String ids){
        if (ids.contains("-")){
            //批量删除
            List<Integer> del_ids = new ArrayList<>();
            String[] str_ids = ids.split("-");
            for (String id :str_ids) {
                int idNum = Integer.parseInt(id);
                del_ids.add(idNum);
            }
            employeeService.deleteBatch(del_ids);
        }else{
            //单个删除
            int id = Integer.parseInt(ids);
            employeeService.deleteEmpById(id);
        }
        return Msg.success();
    }

    @PutMapping("/emp/{empId}")
    @ResponseBody
    public Msg saveEmp(Employee employee){
        employeeService.updateEmp(employee);
        return Msg.success();
    }


    /**
     * 根据id查询员工
     * @param id
     * @return
     */
    @GetMapping("/emp/{id}")
    @ResponseBody
    public Msg getEmp(@PathVariable("id") Integer id){
       Employee employee = employeeService.getEmp(id);
        return Msg.success().add("emp",employee);
    }

    /**
     * 检查用户名是否可用
     * @param empName
     * @return
     */
    @PostMapping("/checkuser")
    @ResponseBody
    public Msg checkUser(@RequestParam("empName") String empName){
        //先判断用户名是否是合法的表达式;
        String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})";
        if(!empName.matches(regx)){
            return Msg.fail().add("va_msg", "用户名必须是6-16位数字和字母的组合或者2-5位中文");
        }
        boolean b = employeeService.checkUser(empName);
        if (b){
            return Msg.success();
        }else {
            return Msg.fail().add("va_msg", "用户名不可用");
        }
    }

    /**
     * 员工保存
     * @return
     */
    @PostMapping("/emp")
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result){
        if (result.hasErrors()){
            Map<String, Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError fieldError :errors) {
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields",map);
        }else{
            employeeService.saveEmp(employee);
            return Msg.success();
        }
    }


    /**
     * 导入jackson包
     * @param pn
     * @return
     */
    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn, 5);
        List<Employee> emps = employeeService.getAll();
        //使用PageInfo包装查询后的结果，只需要将PageInfo交给页面就行了
        PageInfo<Employee> page = new PageInfo<>(emps,5);

        return Msg.success().add("pageInfo",page);
    }


    /**
     * 查询员工数据（分页查询）
     * @return
     */
    //@RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model) {
        PageHelper.startPage(pn, 5);
        List<Employee> emps = employeeService.getAll();
        //使用PageInfo包装查询后的结果，只需要将PageInfo交给页面就行了
        PageInfo<Employee> page = new PageInfo<>(emps,5);
        model.addAttribute("pageInfo",page);
        return "list";
    }
}
