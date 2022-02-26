ORACLE_SDK = C:\Users\lenovo\oracle\instantclient_21_3\sdk
NAME = main
PREPPROC = proc
CCOMPILER = gcc
ORACLE_INCLUDE = ${ORACLE_SDK}\include
LIBRARY_NAME = -lorasql
LIBRARY_PATH = -L ${ORACLE_SDK}\lib\msvc
INCLUDEDIR = -I ${ORACLE_INCLUDE} -L ${ORACLE_INCLUDE}
PCFILES = ${NAME}.pc
SOURCES = ${PCFILES:.pc=.c}
OBJECTS = ${SOURCES:.c=.o}

TARGET = ${NAME}.exe

all: ${TARGET}
${SOURCES}: ${PCFILES}
	${PREPPROC} $<
${OBJECTS}: ${SOURCES}
	${CCOMPILER} -c $< -o $@ ${INCLUDEDIR}
${TARGET}: ${OBJECTS}
	${CCOMPILER} -o $@ -s $< ${LIBRARY_PATH} ${LIBRARY_NAME}
clean:
	del /F /S ${TARGET} ${OBJECTS} ${SOURCES}
