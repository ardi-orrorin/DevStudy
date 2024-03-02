package com.example.demo.service

import com.example.demo.entity.Board
import com.example.demo.entity.BoardDTO
import com.example.demo.entity.PageDTO
import com.example.demo.mapper.BoardMapper
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.stereotype.Service

@Service
class BoardService(
    private val boardMapper: BoardMapper
) {

    val log: Logger = LoggerFactory.getLogger(this::class.java)
    fun selectBoards(pageDTO: PageDTO<BoardDTO>, board: BoardDTO): PageDTO<BoardDTO> {
        pageDTO.total = boardMapper.selectBoardTotalCount(board)
        pageDTO.list  = boardMapper.selectBoards(pageDTO, board)
        log.info("pageDTO: $pageDTO")
        return pageDTO
    }

    fun selectById(id: Long): BoardDTO {
        val result = boardMapper.selectById(id)
        result == null && throw RuntimeException("board is null !!!!!")
        return result
    }

    fun insertBoard(board: Board): String {
        val result: Int = boardMapper.insertBoard(board)
        return if (result == 1) "success" else "fail"
    }
}