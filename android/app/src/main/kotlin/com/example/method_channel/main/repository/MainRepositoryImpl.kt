package com.example.method_channel.main.repository

import com.example.method_channel.data.DiaryCard
import com.example.method_channel.data.DiarySubCard

class MainRepositoryImpl: MainRepository {

     override fun getDiaryDetails(): List<DiaryCard> {
            return diaryCard
        }

    //Sample data set
    private val diaryCard = mutableListOf(
        DiaryCard(
            cardColor = "#ADD8E6",
            cardTitle = "Personal Goals",
            subDiary = listOf(
                DiarySubCard(
                    cardTitle = "Daily Checkup",
                    imageUrl = "https://img.freepik.com/free-vector/lighthouse-ocean-sea-beach-illustration_1284-52847.jpg",
                    description = "Hello 1"
                ),
                DiarySubCard(
                    cardTitle = "What is CBT?",
                    imageUrl = null,
                    description = "Hello 2"
                )
            )
        ),
        DiaryCard(
            cardColor = "#90EE90",
            cardTitle = "Activities",
            subDiary = listOf(
                DiarySubCard(
                    cardTitle = "Mindful Exercise",
                    imageUrl = "https://img.freepik.com/free-vector/lighthouse-ocean-sea-beach-illustration_1284-52847.jpg",
                    description = "Hello 3"
                ),
                DiarySubCard(
                    cardTitle = "Meditation",
                    imageUrl = null,
                    description = "Hello 4"
                )
            )
        ),
        DiaryCard(
            cardColor = "#E6E6FA",
            cardTitle = "Completed Today",
            subDiary = listOf(
                DiarySubCard(
                    cardTitle = "Learning to act",
                    imageUrl = "https://img.freepik.com/free-vector/lighthouse-ocean-sea-beach-illustration_1284-52847.jpg",
                    description = "Hello 5"
                ),
                DiarySubCard(
                    cardTitle = "Assessment",
                    imageUrl = null,
                    description = "Hello 6"
                )
            )
        ),
        DiaryCard(
            cardColor = "#E0FFFF",
            cardTitle = "Personal Goals",
            subDiary = listOf(
                DiarySubCard(
                    cardTitle = "Daily Checkup",
                    imageUrl = "https://img.freepik.com/free-vector/lighthouse-ocean-sea-beach-illustration_1284-52847.jpg",
                    description = "Hello 6"
                ),
                DiarySubCard(
                    cardTitle = "What is CBT?",
                    imageUrl = null,
                    description = "Hello 8"
                )
            )
        )
    )

}