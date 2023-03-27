package com.wangpeng.dao;

import com.wangpeng.pojo.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface StudentDao {

    int insertStudent(Student student);

    int deleteStudents(List<Student> list);

    int updateStudent(Student student);

    Student selectStudent(int sid);

    List<Student> selectStudentsByLimit(@Param("begin") int begin, @Param("size")int size);

    int getStudentsCount();

    List<Student> searchStudentsByLimit(Map<String,Object> map);

    int getSearchCount(Map<String,Object> map);

    Student checkByUsernameAndPassword(Map<String,Object> map);

    List<Student> selectStudents();

    int insertLocalPeople(Student student);

    int deleteLocalPeople(List<Student> list);

    int updateLocalPeople(Student student);

    Student selectLocalPeoples(int sid);

    List<Student> selectLocalPeoplesByLimit(@Param("begin") int begin, @Param("size")int size);

    int getLocalPeoplesCount();

    List<Student> searchLocalPeoplesByLimit(Map<String,Object> map);

    int getLocalPeoplesSearchCount(Map<String,Object> map);

    int insertOutPeople(Student student);

    int deleteOutPeople(List<Student> list);

    int updateOutPeople(Student student);

    Student selectOutPeoples(int sid);

    List<Student> selectOutPeoplesByLimit(@Param("begin") int begin, @Param("size")int size);

    int getOutPeoplesCount();

    List<Student> searchOutPeoplesByLimit(Map<String,Object> map);

    int getOutPeoplesSearchCount(Map<String,Object> map);

    List<Student> selectLocalPeople();
    List<Student> selectOutPeople();
}
