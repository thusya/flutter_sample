package com.example.method_channel.di

import com.example.method_channel.main.MainViewModel
import com.example.method_channel.main.repository.MainRepository
import com.example.method_channel.main.repository.MainRepositoryImpl
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.dsl.module

val appModule = module {
    // ViewModel definition
    viewModel { MainViewModel(get()) }

    // Repository definition
    single<MainRepository> { MainRepositoryImpl() }
}