package com.wangpeng.controller;

import com.wangpeng.pojo.Student;
import com.wangpeng.service.StudentService;
import com.wangpeng.utils.JsonUtil;
import com.wangpeng.utils.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/student")
public class StudentController {

    @Autowired
    StudentService service;

    @RequestMapping("queryStudents.do")
    public PageResult queryOutsidePeoples(Integer page, Integer limit, String type) {
        System.out.println(type);
        int count = service.getStudentsCount();
        List<Student> students = new ArrayList<>();
        if (type.equals("outside"))
            students = service.findStudentsByPage(page, limit);
        else if (type.equals("local"))
            students = service.findLocalPeoplesByPage(page, limit);
        else if (type.equals("goout"))
            students = service.findOutPeoplesByPage(page, limit);
        return PageResult.success(count, students);
    }

    @RequestMapping({"queryStudent.do"})
    public Student queryOutsidePeople(Integer sid, String type) {
        Student student = new Student();
        if (type.equals("outside"))
            student = service.findStudentBySid(sid);
        else if (type.equals("local"))
            student = service.findLocalPeopleBySid(sid);
        else if (type.equals("goout"))
            student = service.findOutPeopleBySid(sid);

        return student;
    }

    @RequestMapping("deleteStudents.do")
    public Integer deleteOutsidePeoples(String json, String type) {
        if (json.charAt(0) != '[') json = '[' + json + ']';  //如果不是数组形式，变成数组形式
        List<Student> students = JsonUtil.parseList(json, Student.class);
        int i = 0;
        if (type.equals("outside"))
            i = service.deleteStudents(students);
        else if (type.equals("local"))
            i = service.deleteLocalPeoples(students);
        else if (type.equals("goout"))
            i = service.deleteOutPeoples(students);
        return i;
    }

    @RequestMapping("addStudent.do")
    public Integer addOutsidePeople(String json, String type) {
        Student student = JsonUtil.parseObject(json, Student.class);
        int i = 0;
        if (type.equals("outside"))
            i = service.addStudent(student);
        else if (type.equals("local"))
            i = service.addLocalPeople(student);
        else if (type.equals("goout"))
            i = service.addOutPeople(student);
        return i;
    }

    @RequestMapping("updateStudent.do")
    public Integer updateOutsidePeople(String json, String type) {
        Student student = JsonUtil.parseObject(json, Student.class);
        int i = 0;
        if (type.equals("outside"))
            i = service.updateStudent(student);
        else if (type.equals("local"))
            i = service.updateLocalPeople(student);
        else if (type.equals("goout"))
            i = service.updateOutPeople(student);
        return i;
    }

    @RequestMapping("getAmount.do")
    public Integer getAmount(String type) {
        int i = 0;
        if (type.equals("outside"))
            i = service.getStudentsCount();
        else if (type.equals("local"))
            i = service.getLocalPeoplesCount();
        else if (type.equals("goout"))
            i = service.getOutPeoplesCount();
        return i;
    }

    @RequestMapping("searchStudents.do")
    public PageResult searchOutsidePeoples(Integer page, Integer limit, String json, String type) {
        Map<String, Object> searchParam = JsonUtil.parseMap(json, String.class, Object.class);
        int count = 0;
        List<Student> students = new ArrayList<>();
        if (type.equals("outside")) {
            count = service.getSearchCount(searchParam);
            students = service.searchStudents(page, limit, searchParam);
        } else if (type.equals("local")) {
            count = service.getLocalPeoplesSearchCount(searchParam);
            students = service.searchLocalPeoples(page, limit, searchParam);
        } else if (type.equals("goout")) {
            count = service.getOutSearchCount(searchParam);
            students = service.searchOutPeoples(page, limit, searchParam);
        }
        return PageResult.success(count, students);
    }

}
