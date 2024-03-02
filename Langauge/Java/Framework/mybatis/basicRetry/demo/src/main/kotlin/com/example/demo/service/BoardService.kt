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
    fun selectBoards(pageDTO: PageDTO<BoardDTO>? = null,
                     board: BoardDTO? = null
    ): PageDTO<BoardDTO> {
        val data = pageDTO ?: PageDTO<BoardDTO>()
        data.total = boardMapper.selectBoardTotalCount(board)
        data.list  = boardMapper.selectBoards(pageDTO, board)
        return data
    }

    fun selectById(id: Long?): BoardDTO {
        id == null && throw RuntimeException("id is null !!!!!")
        val result = boardMapper.selectById(id!!)
        result == null && throw RuntimeException("board is null !!!!!")
        return result
    }

    fun insertBoard(board: Board): String {
        board.title.isEmpty() && throw RuntimeException("title is null !!!!!")
        val result: Int = boardMapper.insertBoard(board)
        return if (result == 1) "success" else "fail"
    }

    fun updateBoard(board: Board): String {
        board.updateAt = System.currentTimeMillis()
        val result: Int = boardMapper.updateBoard(board)
        return if (result == 1) "success" else "fail"
    }

    fun deleteBoard(id: Long): String {
        val result: Int = boardMapper.deleteBoard(id)
        return if (result == 1) "success" else "fail"
    }

    fun deleteBoards(ids: List<Long>): String {
        val result: Int = boardMapper.deleteBoards(ids)
        return if (result == 1) "success" else "fail"
    }
}