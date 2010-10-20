QT += dbus

CONFIG += warn_on
DEFINES = QT_FATAL_WARNINGS QT_NO_DEBUG_OUTPUT

devel {
  DEFINES -= QT_NO_DEBUG_OUTPUT
}

OBJECTS_DIR += build
MOC_DIR += build

isEmpty(PREFIX):PREFIX=/usr/local

TARGET = antico

TRANSLATIONS = \
 ../../language/it_IT.ts \
 ../../language/cs_CZ.ts \
 ../../language/ru_RU.ts \
 ../../language/pl_PL.ts \
 ../../language/de_DE.ts \
 ../../language/es_ES.ts \
 ../../language/pt_BR.ts

translations.name = Translations ${QMAKE_FILE_BASE}
translations.CONFIG += no_link target_predeps
unix:translations.commands = @$$[QT_INSTALL_BINS]/lrelease ${QMAKE_FILE_IN} -qm ${QMAKE_FILE_OUT} &> /dev/null
translations.input = TRANSLATIONS
translations.output = ${QMAKE_FILE_BASE}.qm
translations.clean = ${QMAKE_FILE_BASE}.qm
QMAKE_EXTRA_COMPILERS += translations

include(../../xsessions/xsessions.pri)

SOURCES = \
 main.cpp \
 antico.cpp \
 border.cpp \
 colordialog.cpp \
 colorsel.cpp \
 dateclock.cpp \
 desk.cpp \
 deskapp.cpp \
 deskdev.cpp \
 deskfile.cpp \
 deskfolder.cpp \
 deskicon.cpp \
 dockapp.cpp \
 dockbar.cpp \
 dockicon.cpp \
 dockmenu.cpp \
 effects.cpp \
 filedialog.cpp \
 frame.cpp \
 header.cpp \
 launcher.cpp \
 manager.cpp \
 msgbox.cpp \
 runner.cpp \
 settings.cpp \
 sysicon.cpp \
 systray.cpp \
 trash.cpp \
 trashdialog.cpp \
 utils.cpp 

HEADERS = \
 antico.h \
 border.h \
 colordialog.h \
 colorsel.h \
 dateclock.h \
 defs.h \
 desk.h \
 deskapp.h \
 deskdev.h \
 deskfile.h \
 deskfolder.h \
 deskicon.h \
 dockapp.h \
 dockbar.h \
 dockicon.h \
 dockmenu.h \
 effects.h \
 filedialog.h \
 frame.h \
 header.h \
 launcher.h \
 manager.h \
 msgbox.h \
 runner.h \
 settings.h \
 sysicon.h \
 systray.h \
 trash.h \
 trashdialog.h \
 utils.h 
 


target.path = $$PREFIX/bin/

xsession_files.CONFIG = no_check_exist
xsession_files.files = *.desktop
xsession_files.path = /usr/share/xsessions/

qm.files = *.qm
qm.path = $$PREFIX/share/antico/language
qm.CONFIG += no_check_exist

INSTALLS += target qm xsession_files
