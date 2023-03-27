package com.wangpeng.service.impl;

import com.wangpeng.dao.*;
import com.wangpeng.service.WelcomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class WelcomeServiceImpl implements WelcomeService {

    @Autowired
    StudentDao studentDao;
    @Autowired
    ManagerDao managerDao;


    @Override
    public Map<String, Integer> getAllCount() {
        Map<String,Integer> res = new HashMap<>();

        int outsideCount = studentDao.getStudentsCount();
        int localCount = studentDao.getLocalPeoplesCount();
        int gooutCount = studentDao.getOutPeoplesCount();
        int managerCount = managerDao.getManagersCount();

        res.put("outsideCount",outsideCount);
        res.put("localCount",localCount);
        res.put("gooutCount",gooutCount);
        res.put("managerCount",managerCount);

        return res;
    }

}
