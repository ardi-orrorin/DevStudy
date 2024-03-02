package com.example.demo.dto

import com.example.demo.entity.Board
import com.example.demo.entity.BoardDTO
import com.example.demo.entity.Member
import com.example.demo.entity.PageDTO
import kotlin.math.log

class ResponseDTO<T> {

    private var page: PageDTO<T>? = null
    private var list: List<T> = listOf()

    class Builder<T> {
        private var page: PageDTO<T>? = null
        private var list: List<T>? = listOf()

        fun page(page: PageDTO<T>?): Builder<T> {
            this.page = page
            return this
        }

        fun list(list: List<T>?): Builder<T> {
            this.list = list
            return this
        }

        fun build(): ResponseDTO<T> {
            val responseDTO = ResponseDTO<T>()
            responseDTO.page = this.page
            responseDTO.list = this.list ?: listOf()
            return responseDTO
        }
    }

    fun getPage(): PageDTO<T>? {
        return page
    }
    fun getList(): List<T> {
        return list
    }

    override fun toString(): String {
        return "ResponseDTO(page=$page, list=$list)"
    }


}