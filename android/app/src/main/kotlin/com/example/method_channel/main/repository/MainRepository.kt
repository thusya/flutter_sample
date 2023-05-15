package com.example.method_channel.main.repository

import com.example.method_channel.data.DiaryCard

interface MainRepository {
    fun getDiaryDetails(): List<DiaryCard>
}