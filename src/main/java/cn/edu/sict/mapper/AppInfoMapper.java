package cn.edu.sict.mapper;

import cn.edu.sict.dto.AppinfoDTO;
import cn.edu.sict.pojo.AppInfo;
import org.apache.ibatis.annotations.Param;

import javax.ws.rs.Path;
import java.util.List;

public interface AppInfoMapper {

//
//    List<AppInfo> queryByDevUserId(@Param("devUserId") Long id);

    List<AppInfo> query(AppinfoDTO appinfoDTO);

    int add(AppInfo appInfo);

    int deleteById(@Param("id") Long id);

    AppInfo queryById(@Param("id") Long id);

    void updateById(AppInfo appInfo);

    AppInfo queryDetailById(@Param("id") Long id);
}