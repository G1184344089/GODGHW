package cn.edu.sict.service;

import cn.edu.sict.pojo.DataDictionary;

import java.util.List;

public interface DataDictionaryService {
    List<DataDictionary> queryAllFlatform();

    List<DataDictionary> queryAllStatus();
}
