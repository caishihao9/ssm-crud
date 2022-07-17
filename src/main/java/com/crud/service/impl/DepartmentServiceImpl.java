package com.crud.service.impl;

import com.crud.mapper.DepartmentMapper;
import com.crud.pojo.Department;
import com.crud.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author caishihao
 * @version 2021.1
 * @date 2022/7/15 21:19
 */
@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;

    @Override
    public List<Department> getDepts() {
        List<Department> departments = departmentMapper.selectByExample(null);
        return departments;
    }

}
