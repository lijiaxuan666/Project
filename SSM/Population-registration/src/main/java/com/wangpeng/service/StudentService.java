package com.wangpeng.service;

import com.wangpeng.pojo.Student;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public interface StudentService {

    List<Student> findStudentsByPage(int page, int size);

    int getStudentsCount();

    int deleteStudents(List<Student> students);

    int addStudent(Student student);

    int updateStudent(Student student);

    List<Student> searchStudents(Integer page, Integer size, Map<String, Object> searchParam);

    int getSearchCount(Map<String, Object> searchParam);

    Student findStudentBySid(Integer sid);

    List<Student> findLocalPeoplesByPage(int page, int size);

    int getLocalPeoplesCount();

    int deleteLocalPeoples(List<Student> students);

    int addLocalPeople(Student student);

    int updateLocalPeople(Student student);

    List<Student> searchLocalPeoples(Integer page, Integer size, Map<String, Object> searchParam);

    int getLocalPeoplesSearchCount(Map<String, Object> searchParam);

    Student findLocalPeopleBySid(Integer sid);

    List<Student> findOutPeoplesByPage(int page, int size);

    int getOutPeoplesCount();

    int deleteOutPeoples(List<Student> students);

    int addOutPeople(Student student);

    int updateOutPeople(Student student);

    List<Student> searchOutPeoples(Integer page, Integer size, Map<String, Object> searchParam);

    int getOutSearchCount(Map<String, Object> searchParam);

    Student findOutPeopleBySid(Integer sid);
}
