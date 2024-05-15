@echo off
setlocal

set DEFAULT_JVM_OPTS="-Dorg.gradle.appname=gradlew" "-Xmx512m"

rem Determine the location of the script...
set DIRNAME=%~dp0
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%

set CLASSPATH=%APP_HOME%\gradle\wrapper\gradle-wrapper.jar

rem Execute Gradle
"%JAVA_HOME%\bin\java.exe" %DEFAULT_JVM_OPTS% "-Dorg.gradle.wrapper.properties=%APP_HOME%\gradle\wrapper\gradle-wrapper.properties" org.gradle.wrapper.GradleWrapperMain %CMD_LINE_ARGS%

endlocal
