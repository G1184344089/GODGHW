package cn.edu.sict.service.impl;

import cn.edu.sict.constant.CommonCodeConstant;
import cn.edu.sict.dto.AppinfoDTO;
import cn.edu.sict.mapper.AppInfoMapper;
import cn.edu.sict.mapper.DataDictionaryMapper;
import cn.edu.sict.pojo.AppInfo;
import cn.edu.sict.pojo.DataDictionary;
import cn.edu.sict.pojo.DevUser;
import cn.edu.sict.service.AppInfoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("appInfoService")
public class AppInfoServiceImpl implements AppInfoService {

    @Autowired
    private AppInfoMapper appInfoMapper;

    @Autowired
    private DataDictionaryMapper dataDictionaryMapper;

    @Override
    public PageInfo<AppInfo> queryByDevUserId(Long id, PageInfo pageInfo) {
        //去第几页以及页码大小
        PageHelper.startPage(pageInfo.getPageSize(), pageInfo.getPageNum());
        AppinfoDTO appinfoDTO = new AppinfoDTO();
        appinfoDTO.setDevUserId(id);
        List<AppInfo> appInfos = appInfoMapper.query(appinfoDTO);
        //  List<AppInfo> appInfos = appInfoMapper.queryByDevUserId(id);

        PageInfo page = new PageInfo<AppInfo>(appInfos);
        return page;
    }

    @Override
    public PageInfo<AppInfo> query(AppinfoDTO appinfoDTO) {

        if (appinfoDTO.getPageNum() == null) {
            appinfoDTO.setPageNum(1);
        }
        PageHelper.startPage(appinfoDTO.getPageNum(), CommonCodeConstant.PAGE_SIZE);
        List<AppInfo> list = appInfoMapper.query(appinfoDTO);
        PageInfo<AppInfo> page = new PageInfo<AppInfo>(list);
        return page;

    }

    @Override
    public boolean add(AppInfo appInfo, long userId) {
        //
        appInfo.setCreationDate(new Date());
        DevUser devUser = new DevUser();
        devUser.setId(userId);
        appInfo.setDevUser(devUser);
        appInfo.setCreatedBy(userId);
        DataDictionary dataDictionary = new DataDictionary();
        dataDictionary.setValueId(CommonCodeConstant.APP_STATUS);
        appInfo.setAppStatus(dataDictionary);
        int row = appInfoMapper.add(appInfo);
        return row == 1 ? true : false;
    }

    @Override
    public boolean delete(Long id) {
        if(id != null){
            int row = appInfoMapper.deleteById(id);
            return row ==1 ? true :false;
        }
        else{
            return false;
        }

    }

    @Override
    public AppInfo queryById(Long id) {
        return appInfoMapper.queryById(id);
    }

    @Override
    public void updateById(AppInfo appInfo) {
        appInfo.setModifyDate(new Date());
        appInfo.setUpdateDate(new Date());
        appInfoMapper.updateById(appInfo);
    }

    @Override
    public AppInfo queryDetailById(Long id) {
        return appInfoMapper.queryDetailById(id);
    }
}
