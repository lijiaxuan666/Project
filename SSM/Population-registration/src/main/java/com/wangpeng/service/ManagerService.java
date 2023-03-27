package com.wangpeng.service;

import com.wangpeng.pojo.Manager;

import java.util.List;
import java.util.Map;

public interface ManagerService {

    List<Manager> findAllManagers();

    List<Manager> findManagersByPage(int page, int size);

    int getManagersCount();

    int deleteManagers(List<Manager> users);

    int addManager(Manager user);

    int updateManager(Manager user);

    List<Manager> searchManagers(Integer page, Integer size, Map<String, Object> searchParam);

    int getSearchCount(Map<String, Object> searchParam);

}
