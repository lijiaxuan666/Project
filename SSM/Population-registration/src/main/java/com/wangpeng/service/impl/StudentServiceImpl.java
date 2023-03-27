package com.wangpeng.service.impl;

import com.wangpeng.dao.StudentDao;
import com.wangpeng.pojo.Student;
import com.wangpeng.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    StudentDao studentDao;

    @Override
    public List<Student> findStudentsByPage(int page, int size) {
        int begin = (page - 1) * size;
        List<Student> students = studentDao.selectStudentsByLimit(begin, size);
        return students;
    }

    @Override
    public int getStudentsCount() {
        return studentDao.getStudentsCount();
    }

    @Override
    public int deleteStudents(List<Student> students) {
        return studentDao.deleteStudents(students);
    }

    @Override
    public int addStudent(Student student) {
        return studentDao.insertStudent(student);
    }

    @Override
    public int updateStudent(Student student) {
        return studentDao.updateStudent(student);
    }

    @Override
    public List<Student> searchStudents(Integer page, Integer size, Map<String, Object> searchParam) {
        int begin = (page - 1) * size;
        //在搜索的基础上添加2个参数
        Map<String, Object> map = searchParam;
        map.put("begin", begin);
        map.put("size", size);
        List<Student> students = studentDao.searchStudentsByLimit(map);
        return students;
    }

    @Override
    public int getSearchCount(Map<String, Object> searchParam) {
        return studentDao.getSearchCount(searchParam);
    }

    @Override
    public Student findStudentBySid(Integer sid) {
        Student student = studentDao.selectStudent(sid);
        return student;
    }

    @Override
    public List<Student> findLocalPeoplesByPage(int page, int size) {
        int begin = (page - 1) * size;
        List<Student> students = studentDao.selectLocalPeoplesByLimit(begin, size);
        return students;
    }

    @Override
    public int getLocalPeoplesCount() {
        return studentDao.getLocalPeoplesCount();
    }

    @Override
    public int deleteLocalPeoples(List<Student> students) {
        return studentDao.deleteLocalPeople(students);
    }

    @Override
    public int addLocalPeople(Student student) {
        System.out.println(student);
        return studentDao.insertLocalPeople(student);
    }

    @Override
    public int updateLocalPeople(Student student) {
        return studentDao.updateLocalPeople(student);
    }

    @Override
    public List<Student> searchLocalPeoples(Integer page, Integer size, Map<String, Object> searchParam) {
        int begin = (page - 1) * size;
        //在搜索的基础上添加2个参数
        Map<String, Object> map = searchParam;
        map.put("begin", begin);
        map.put("size", size);
        List<Student> students = studentDao.searchLocalPeoplesByLimit(map);
        return students;
    }

    @Override
    public int getLocalPeoplesSearchCount(Map<String, Object> searchParam) {
        return studentDao.getLocalPeoplesSearchCount(searchParam);
    }

    @Override
    public Student findLocalPeopleBySid(Integer sid) {
        Student student = studentDao.selectLocalPeoples(sid);
        return student;
    }

    @Override
    public List<Student> findOutPeoplesByPage(int page, int size) {
        int begin = (page - 1) * size;
        List<Student> students = studentDao.selectOutPeoplesByLimit(begin, size);
        return students;
    }

    @Override
    public int getOutPeoplesCount() {
        return studentDao.getOutPeoplesCount();
    }

    @Override
    public int deleteOutPeoples(List<Student> students) {
        return studentDao.deleteOutPeople(students);
    }

    @Override
    public int addOutPeople(Student student) {
        return studentDao.insertOutPeople(student);
    }

    @Override
    public int updateOutPeople(Student student) {
        return studentDao.updateOutPeople(student);
    }

    @Override
    public List<Student> searchOutPeoples(Integer page, Integer size, Map<String, Object> searchParam) {
        int begin = (page - 1) * size;
        //在搜索的基础上添加2个参数
        Map<String, Object> map = searchParam;
        map.put("begin", begin);
        map.put("size", size);
        List<Student> students = studentDao.searchOutPeoplesByLimit(map);
        return students;
    }

    @Override
    public int getOutSearchCount(Map<String, Object> searchParam) {
        return studentDao.getOutPeoplesSearchCount(searchParam);
    }

    @Override
    public Student findOutPeopleBySid(Integer sid) {
        Student student = studentDao.selectOutPeoples(sid);
        return student;
    }

}
