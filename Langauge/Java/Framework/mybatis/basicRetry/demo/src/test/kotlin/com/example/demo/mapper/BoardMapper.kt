package com.example.demo.mapper

import com.example.demo.entity.Board
import org.junit.jupiter.api.Test
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.boot.test.mock.mockito.SpyBean

@SpringBootTest
class BoardMapperTest {

    @SpyBean
    private lateinit var boardMapper: BoardMapper

    @Test
    fun insertBoard1() {
        var board = Board(title= "test", content= "test", memberId = 15771715)
        for(i in 1..10) {
            board.title = "test$i"
            board.content = "test$i"
            boardMapper.insertBoard(board)
        }
    }

    @Test
    fun insertBoard2() {
        var board = Board(title= "test", content= "test", memberId = 15771715)
        for(i in 1..1000) {
            board.title = "test$i"
            board.content = "test$i"

        }
        boardMapper.insertBoard(board)
    }
}