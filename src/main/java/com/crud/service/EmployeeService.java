package com.crud.service;

import com.crud.pojo.Employee;

import java.util.List;

/**
 * @author caishihao9
 */
public interface EmployeeService {

    List<Employee> getAll();

    void saveEmp(Employee employee);

    boolean checkUser(String empName);

    Employee getEmp(Integer id);

    void updateEmp(Employee employee);

    void deleteEmpById(Integer id);

    void deleteBatch(List<Integer> ids);
}
