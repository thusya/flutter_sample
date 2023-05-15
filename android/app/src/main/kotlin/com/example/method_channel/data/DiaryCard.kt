package com.example.method_channel.data

import android.os.Parcelable
import kotlinx.android.parcel.Parcelize

@Parcelize
data class DiaryCard(val cardColor: String,
                     val cardTitle: String,
                     val subDiary: List<DiarySubCard>): Parcelable

@Parcelize
data class DiarySubCard(
    val cardTitle: String,
    val imageUrl: String?,
    val description: String
): Parcelable
