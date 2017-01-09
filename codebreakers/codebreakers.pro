TEMPLATE = app
TARGET = codebreakers

QT += qml quick

# enables/disabled the extra targets to build a snapcraft package
# also tells the IDE this is a snapcraft project
CONFIG += snapcraft

SOURCES += main.cpp

RESOURCES += codebreakers.qrc

QML_FILES += $$files(*.qml,true)              $$files(*.js,true)

CONF_FILES +=  codebreakers.png

AP_TEST_FILES += tests/autopilot/run                  $$files(tests/*.py,true)

#show all the files in QtCreator
OTHER_FILES += $${CONF_FILES}                $${QML_FILES}                $${AP_TEST_FILES}                codebreakers.desktop                codebreakers.wrapper

snapcraft {
    #specify where the config files are installed to
    config_files.path = /setup/gui
    config_files.files += $${CONF_FILES}
    INSTALLS+=config_files

    #install the desktop file
    desktop_file.path = /setup/gui
    desktop_file.files = $$PWD/codebreakers.desktop
    desktop_file.CONFIG += no_check_exist
    INSTALLS+=desktop_file

    # Default rules for deployment.

    wrapper.files = codebreakers.wrapper
    wrapper.path  = /deploy/bin

    target.path = /deploy/bin
    INSTALLS+=target wrapper
}
