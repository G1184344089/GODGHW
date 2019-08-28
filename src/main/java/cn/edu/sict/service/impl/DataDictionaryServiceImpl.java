package cn.edu.sict.service.impl;


import cn.edu.sict.mapper.DataDictionaryMapper;
import cn.edu.sict.pojo.DataDictionary;
import cn.edu.sict.service.DataDictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("dataDictionaryService")
public class DataDictionaryServiceImpl implements DataDictionaryService {

    @Autowired
    private DataDictionaryMapper dataDictionaryMapper;

    @Override
    public List<DataDictionary> queryAllStatus() {
        return dataDictionaryMapper.queryAllStatus();
    }

    @Override
    public List<DataDictionary> queryAllFlatform() {
        return dataDictionaryMapper.queryAllFlatform();
    }

}
