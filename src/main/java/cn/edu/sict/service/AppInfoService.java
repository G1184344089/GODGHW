package cn.edu.sict.service;

import cn.edu.sict.dto.AppinfoDTO;
import cn.edu.sict.pojo.AppInfo;
import cn.edu.sict.pojo.DataDictionary;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface AppInfoService {


    PageInfo<AppInfo> queryByDevUserId(Long id,PageInfo pageInfo);

    PageInfo<AppInfo> query(AppinfoDTO appinfoDTO);

    boolean add(AppInfo appInfo, long userId);

    boolean delete(Long id);

    AppInfo queryById(Long id);

    void updateById(AppInfo appInfo);

    AppInfo queryDetailById(Long id);
}
