cmake_minimum_required(VERSION 3.16)

# ##################################################################################################
# Project Settings
# ##################################################################################################
project(QTemplateProject VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

# ##################################################################################################
# Dependencies
# ##################################################################################################
# Flatten generation of all sub-dependent libraries
set(QT_QML_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/qml)

# Add any include directories
#include_directories( ${CMAKE_CURRENT_SOURCE_DIR}/Backend)

# Dependencies
add_subdirectory(QtQuickStream)

# Extra QML File properties
set_source_files_properties(
    Core/AppCore.qml
    Core/AppSpec.qml
    UiCore/AppStyle.qml
    UiCore/AppSettings.qml

    PROPERTIES
        QT_QML_SINGLETON_TYPE True
)

# ##################################################################################################
# Project Files
# ##################################################################################################
# Executable Definition
qt_add_executable(appQTemplateProject
    main.cpp
)

# Project Files
qt_add_qml_module(appQTemplateProject
    URI QTemplateProject
    VERSION 1.0
    QML_FILES
        Main.qml

        # Core

        # Primitive Components

        # UiSession+Popups

        # Widgets

        RESOURCES
            Fonts/Font\ Awesome\ 6\ Pro-Thin-100.otf
            Fonts/Font\ Awesome\ 6\ Pro-Solid-900.otf
            Fonts/Font\ Awesome\ 6\ Pro-Regular-400.otf
            Fonts/Font\ Awesome\ 6\ Pro-Light-300.otf
            Fonts/RobotoMono-Regular.ttf
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appQTemplateProject PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appQTemplateProject
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appQTemplateProject
    PRIVATE Qt6::Quick
    QtQuickStreamplugin
)

include(GNUInstallDirs)
install(TARGETS appQTemplateProject
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)


# ##################################################################################################
# Qt Creator Fixes
# ##################################################################################################
# Make Qt Creator aware of where the QML modules live
set(QML_IMPORT_PATH ${QT_QML_OUTPUT_DIRECTORY} CACHE STRING "QtCreator QML Modules Lookup")
