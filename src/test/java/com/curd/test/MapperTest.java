package com.curd.test;

import com.crud.mapper.DepartmentMapper;
import com.crud.mapper.EmployeeMapper;
import com.crud.pojo.Department;
import com.crud.pojo.Employee;
import com.crud.pojo.EmployeeExample;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;


/**
 * @author caishihao
 * @version 2021.1
 * @date 2022/7/13 22:12
 * 推荐spring项目就可以使用spring的单元测试，可以自动注入我们需要的组件
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class MapperTest {

    @Autowired
    private DepartmentMapper departmentMapper;

    @Autowired
    private EmployeeMapper employeeMapper;

    @Autowired
    private SqlSession SqlSession;

    /**
     * 测试DepartmentMapper
     */
    @Test
    public void testCRUD() {
          //1.创建springIOC容器
//        ClassPathXmlApplicationContext ioc =
//                new ClassPathXmlApplicationContext("applicationContext.xml");
          //2.从容器中获取mapper
//        DepartmentMapper bean = ioc.getBean(DepartmentMapper.class);

//        departmentMapper.insertSelective(new Department(null,"开发部"));
//        departmentMapper.insertSelective(new Department(null,"测试部"));

        //2.生成员工数据，测试员工插入
//        employeeMapper.insertSelective(new Employee(null, "Jerry", "M", "Jerry@163.com", 1));
        //3.批量插入多个员工
//        EmployeeMapper mapper = SqlSession.getMapper(EmployeeMapper.class);
//        for (int i = 0; i < 100; i++) {
//            String uid = UUID.randomUUID().toString().substring(0,4) + i;
//            mapper.insertSelective(new Employee(null, uid, "M", uid+"@163.com", 1));
//        }

//        employeeMapper.updateByPrimaryKeySelective(new Employee(2,"jack",null,"jack@163.com",null));
          //employeeMapper.deleteByPrimaryKey(101);
    }
}
