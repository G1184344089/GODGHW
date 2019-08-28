package cn.edu.sict.service;

import cn.edu.sict.pojo.AppCategory;

import java.util.List;

public interface AppCategoryService {
    List<AppCategory> queryAllLevel1One();

    List<AppCategory> queryLevelTwoByLevelOne(Long id);

    List<AppCategory> queryLevelTwoByLevelTwo(Long id);

}
