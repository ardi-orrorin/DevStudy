package com.example.demo.mapper

import com.example.demo.entity.Board
import com.example.demo.entity.BoardDTO
import com.example.demo.entity.PageDTO
import org.apache.ibatis.annotations.Mapper
import org.apache.ibatis.annotations.Param
import org.springframework.transaction.annotation.Transactional

@Mapper
interface BoardMapper {

    fun selectBoardTotalCount(@Param("param")board: BoardDTO): Int

    fun selectBoards(
        @Param("page")page: PageDTO<BoardDTO>,
        @Param("param")board: BoardDTO
    ): List<BoardDTO>

    fun selectById(id: Long): BoardDTO

    @Transactional
    fun insertBoard(board: Board): Int

    @Transactional
    fun updateBoard(board: Board): Int

    @Transactional
    fun deleteBoard(id: Long): Int

}