package com.wangpeng.controller;

import com.wangpeng.pojo.Manager;
import com.wangpeng.service.ManagerService;
import com.wangpeng.utils.JsonUtil;
import com.wangpeng.utils.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/manager")
public class ManagerController {

    @Autowired
    ManagerService service;

    @RequestMapping("queryManagers.do")
    public PageResult queryManagers(Integer page, Integer limit){
        //获取管理员数量
        int count = service.getManagersCount();
        //获取数据
        List<Manager> managers = service.findManagersByPage(page,limit);
        //返回结果
        return PageResult.success(count, managers);
    }

    @RequestMapping("queryAllManagers.do")
    public List<Manager> queryAllManagers(){
        return service.findAllManagers();
    }

    @RequestMapping("deleteManagers.do")
    public Integer deleteManagers(String json){
        if(json.charAt(0) != '[') json = '[' + json + ']';  //如果不是数组形式，变成数组形式
        List<Manager> managers = JsonUtil.parseList(json, Manager.class);
        return service.deleteManagers(managers);
    }

    @RequestMapping("addManager.do")
    public Integer addManager(String json){
        Manager manager = JsonUtil.parseObject(json, Manager.class);
        return service.addManager(manager);
    }

    @RequestMapping("updateManager.do")
    public Integer updateManager(String json){
        Manager manager = JsonUtil.parseObject(json, Manager.class);
        return service.updateManager(manager);
    }

    @RequestMapping("getAmount.do")
    public Integer getAmount() {
        return service.getManagersCount();
    }

    @RequestMapping("searchManagers.do")
    public PageResult searchManagers(Integer page, Integer limit, String json){
        //获得搜索的参数
        Map<String, Object> searchParam = JsonUtil.parseMap(json, String.class, Object.class);
        //获取查询个数
        int count = service.getSearchCount(searchParam);
        //查询数据
        List<Manager> managers = service.searchManagers(page, limit, searchParam);
        //返回结果
        return PageResult.success(count, managers);
    }

}
