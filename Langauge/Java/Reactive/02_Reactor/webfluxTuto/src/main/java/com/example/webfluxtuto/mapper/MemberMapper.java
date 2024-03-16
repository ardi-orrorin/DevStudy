package com.example.webfluxtuto.mapper;


import com.example.webfluxtuto.dto.MemberRequest;
import com.example.webfluxtuto.model.Member;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MemberMapper {

    List<Member> findAll();

    Member findById(int id);

    int insert(MemberRequest.Member member);

    int delete(long[] ids);

}
