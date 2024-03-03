package com.example.demo.controller

import com.example.demo.dto.ResponseDTO
import com.example.demo.entity.Board
import com.example.demo.entity.BoardDTO
import com.example.demo.entity.PageDTO
import com.example.demo.service.BoardService
import com.example.demo.service.MemberService
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*
import org.springframework.web.service.annotation.PutExchange

@RestController
@RequestMapping("/api/boards")
class BoardController(
    private val boardService: BoardService,
    private val memberService: MemberService,
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

//        val responseData: ResponseDTO.Board = ResponseDTO.Board(page = result, board = boards)

        return ResponseEntity.ok()
            .body(response)
    }

    @PostMapping("")
    fun insertBoard(@RequestBody board: Board): ResponseEntity<String> {
        memberService.selectById(board.memberId)
        return ResponseEntity.ok()
            .body(boardService.insertBoard(board).msg)
    }

    @PatchMapping("")
    fun updateBoard(@RequestBody board: Board): ResponseEntity<String> {
        return ResponseEntity.ok()
            .body(boardService.updateBoard(board).msg)
    }


    @DeleteMapping("{id}")
    fun deleteBoard(@PathVariable id: Long): ResponseEntity<String> {
        return ResponseEntity.ok()
            .body(boardService.deleteBoard(id).msg)
    }

    @DeleteMapping("")
    fun deleteBoards(@RequestBody ids: List<Long>): ResponseEntity<String> {
        return ResponseEntity.ok()
            .body(boardService.deleteBoards(ids).msg)
    }

}