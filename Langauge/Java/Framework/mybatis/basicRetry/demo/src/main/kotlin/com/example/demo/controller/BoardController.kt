package com.example.demo.controller

import com.example.demo.dto.ResponseDTO
import com.example.demo.entity.BoardDTO
import com.example.demo.entity.PageDTO
import com.example.demo.service.BoardService
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api/boards")
class BoardController(
    private val boardService: BoardService
) {

    @GetMapping("")
    fun selectAll(pageDTO: PageDTO<BoardDTO>): ResponseEntity<ResponseDTO<BoardDTO>> {
        val result = boardService.selectBoards(pageDTO)
        val boards = result.list
        result.list = listOf()

        val response = ResponseDTO.Builder<BoardDTO>()
            .page(result)
            .list(boards)
            .build()

        println(response)
//        val responseData: ResponseDTO.Board = ResponseDTO.Board(page = result, board = boards)

        return ResponseEntity.ok()
            .body(response)
    }

}