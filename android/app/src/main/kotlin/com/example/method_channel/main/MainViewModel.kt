package com.example.method_channel.main

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.example.method_channel.data.DiaryCard
import com.example.method_channel.main.repository.MainRepository

class MainViewModel(private val repository: MainRepository): ViewModel() {

    private val _diaryDetails = MutableLiveData<List<DiaryCard>>()
    val diaryDetails: LiveData<List<DiaryCard>> = _diaryDetails

    init {
        getDiaryDetails()
    }

    private fun getDiaryDetails() {
        val details = repository.getDiaryDetails()
        _diaryDetails.value = details
    }

    fun getLocationDetails(): MutableMap<String, String>  {
        val data = mutableMapOf<String, String>()
        data["distance"] = "3.08 Miles"
        data["date"] = "5th May"
        data["time"] = "10:02 - 18:32 (30 Minutes)"
        data["start_point"] = "The Hil and Central"
        data["end_point"] = "Melrose & Brighton"

        return data
    }

}