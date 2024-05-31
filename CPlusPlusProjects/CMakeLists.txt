cmake_minimum_required(VERSION 3.28)
project(CPlusPlusProjects)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_PREFIX_PATH "C:\\Users\\Carlos\\Downloads\\Nouveau WinRAR archive (2)\\mingw81_64")
set(CMAKE_AUTOUIC ON) # If using CMake version 3.0 or later
set(CMAKE_AUTOUIC_SEARCH_PATHS path/to/ui)
list(APPEND CMAKE_PREFIX_PATH "C:/Qt/5.15.2/mingw81_64")
include_directories(${PROJECT_SOURCE_DIR}/DictionaryQT)

find_package(Qt5 COMPONENTS Core Gui Widgets REQUIRED)

add_executable(CPlusPlusProjects main.cpp
        DictionaryQT/DictionaryQT/mainwindow.cpp
        DictionaryQT/DictionaryQT/mainwindow.cpp
        DictionaryQT/DictionaryQT/MyDictionary.cpp)

target_link_libraries(CPlusPlusProjects Qt5::Core Qt5::Gui Qt5::Widgets)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

include_directories(
        ${CMAKE_CURRENT_SOURCE_DIR}
        ${CMAKE_CURRENT_SOURCE_DIR}/DictionaryQT
)


if (WIN32 AND NOT DEFINED CMAKE_TOOLCHAIN_FILE)
    set(DEBUG_SUFFIX)
    if (MSVC AND CMAKE_BUILD_TYPE MATCHES "Debug")
        set(DEBUG_SUFFIX "d")
    endif ()
    set(QT_INSTALL_PATH "${CMAKE_PREFIX_PATH}")
    if (NOT EXISTS "${QT_INSTALL_PATH}/bin")
        set(QT_INSTALL_PATH "${QT_INSTALL_PATH}/..")
        if (NOT EXISTS "${QT_INSTALL_PATH}/bin")
            set(QT_INSTALL_PATH "${QT_INSTALL_PATH}/..")
        endif ()
    endif ()
    if (EXISTS "${QT_INSTALL_PATH}/plugins/platforms/qwindows${DEBUG_SUFFIX}.dll")
        add_custom_command(TARGET CPlusPlusProjects POST_BUILD
                COMMAND ${CMAKE_COMMAND} -E make_directory
                "$<TARGET_FILE_DIR:CPlusPlusProjects>/plugins/platforms/")
        add_custom_command(TARGET CPlusPlusProjects POST_BUILD
                COMMAND ${CMAKE_COMMAND} -E copy
                "${QT_INSTALL_PATH}/plugins/platforms/qwindows${DEBUG_SUFFIX}.dll"
                "$<TARGET_FILE_DIR:CPlusPlusProjects>/plugins/platforms/")
    endif ()
    foreach (QT_LIB Core Gui Widgets)
        add_custom_command(TARGET CPlusPlusProjects POST_BUILD
                COMMAND ${CMAKE_COMMAND} -E copy
                "${QT_INSTALL_PATH}/bin/Qt5${QT_LIB}${DEBUG_SUFFIX}.dll"
                "$<TARGET_FILE_DIR:CPlusPlusProjects>")
    endforeach (QT_LIB)
endif ()
