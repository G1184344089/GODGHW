package cn.edu.sict.service.impl;

import cn.edu.sict.mapper.AppCategoryMapper;
import cn.edu.sict.pojo.AppCategory;
import cn.edu.sict.service.AppCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("appCategoryService")
public class AppCategoryServiceImpl implements AppCategoryService {
    @Autowired
    private AppCategoryMapper appCategoryMapper;

    @Override
    public List<AppCategory> queryAllLevel1One() {
        return appCategoryMapper.queryAllLevel1One();
    }

    @Override
    public List<AppCategory> queryLevelTwoByLevelOne(Long id) {
        return appCategoryMapper.queryLevelByParentId(id);
    }

    @Override
    public List<AppCategory> queryLevelTwoByLevelTwo(Long id) {
        return appCategoryMapper.queryLevelByParentId(id);
    }

}
