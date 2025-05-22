cmake_minimum_required(VERSION 3.15)
project(appsec_hw1 C)

# Use C99 and no optimizations so you can debug step-by-step
set(CMAKE_C_FLAGS   "-g -O0")
set(CMAKE_C_FLAGS_ASAN   "-g -O0 -fsanitize=address")
set(CMAKE_C_FLAGS_UBSAN  "-g -O0 -fsanitize=undefined")

# Plain build (no sanitizer)
add_executable(giftcardreader_original
        giftcardreader.c
)

# ASan build
add_executable(giftcardreader_asan
        giftcardreader.c
)
target_compile_options(giftcardreader_asan PRIVATE ${CMAKE_C_FLAGS_ASAN})

# UBSan build
add_executable(giftcardreader_ubsan
        giftcardreader.c
)
target_compile_options(giftcardreader_ubsan PRIVATE ${CMAKE_C_FLAGS_UBSAN})
