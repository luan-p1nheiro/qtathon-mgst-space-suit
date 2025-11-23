cmake_minimum_required(VERSION 3.16)

project(tricorder VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Core Quick QuickControls2)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(apptricorder
    main.cpp
)

set_source_files_properties(Env.qml Style.qml
    PROPERTIES QT_QML_SINGLETON_TYPE TRUE)

qt_add_qml_module(apptricorder
    URI tricorder
    QML_FILES
        Main.qml
        SuitData.qml
        Style.qml
        Env.qml
        SuitDataPane.qml
        MissionScreen.qml
        MissionTasks.qml
        TimerPanel.qml
        TasksScreen.qml
    RESOURCES
        fonts/Silkscreen/Silkscreen-Regular.ttf
        fonts/Silkscreen/Silkscreen-Bold.ttf
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(apptricorder PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.apptricorder
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(apptricorder
    PRIVATE Qt6::Quick Qt6::Core Qt6::QuickControls2
)

if(ANDROID OR IOS)
    # Intermix Controls plugin's initializeEngine() is not invoked in iOS
    target_link_libraries(emile PRIVATE Qt6::Multimedia)
    if(IOS)
        qt_add_ios_ffmpeg_libraries(emile)
    endif()
endif()

include(GNUInstallDirs)
install(TARGETS apptricorder
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
