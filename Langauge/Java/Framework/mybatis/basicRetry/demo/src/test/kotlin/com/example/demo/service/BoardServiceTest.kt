package com.example.demo.service

import com.example.demo.entity.Board
import com.example.demo.entity.BoardDTO
import com.example.demo.entity.Member
import com.example.demo.entity.PageDTO
import org.junit.jupiter.api.Test
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.boot.test.mock.mockito.SpyBean


@SpringBootTest
class BoardServiceTest {

    @SpyBean
    private lateinit var boardService: BoardService

    @SpyBean
    private lateinit var memberService: MemberService

    @Test
    fun selectBoards() {
        val page: PageDTO<BoardDTO> = PageDTO(page = 0, size = 10)
        page.page = if(page.page > 0) page.page - 1 else 0
//        page.offset = page.page * page.size
//        val board: BoardDTO = BoardDTO(title= "", member = Member(name = "4"))
        val board: BoardDTO = BoardDTO(title= "4")

        val result = boardService.selectBoards(page, board)
        println(result)
    }

    @Test
    fun selectById() {
        val result = boardService.selectById(1)
        println(result)
    }

    @Test
    fun insertBoard() {
        val member: Member = memberService.selectById(1)

        val board: Board = Board(title= "test", content= "test", memberId = member.id)

//        for(i in 1..10) {
//            board.title = "test$i"
//            board.content = "test$i"
//            val result = boardService.insertBoard(board)
//        }

        val result = boardService.insertBoard(board)
        println(result)
    }




}