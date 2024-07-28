@echo off

REM Set up the paths
set JAVA_HOME=C:\Program Files\Java\jdk-22
set TOMCAT_HOME=C:\Program Files\Apache Software Foundation\Tomcat 9.0
set CLASSPATH=.;%JAVA_HOME%\lib\tools.jar;%TOMCAT_HOME%\lib\servlet-api.jar;web\WEB-INF\lib\mysql-connector-j-9.0.0.jar

REM Display paths for debugging
echo JAVA_HOME is %JAVA_HOME%
echo TOMCAT_HOME is %TOMCAT_HOME%
echo CLASSPATH is %CLASSPATH%

REM Create build directory
if not exist build mkdir build

REM Compile Java classes
javac -d build -cp "%CLASSPATH%" src\dao\DBConnection.java src\dao\PassengerDAO.java src\model\Passenger.java src\model\Admin.java

REM Check if the build was successful
if %errorlevel% neq 0 (
    echo Compilation failed
    exit /b %errorlevel%
)

REM Copy compiled classes to WEB-INF/classes
xcopy build\* "web\WEB-INF\classes\" /E /Y

REM Check if the copy was successful
if %errorlevel% neq 0 (
    echo Failed to copy compiled classes
    exit /b %errorlevel%
)

REM Deploy to Tomcat's webapps directory
xcopy "web" "%TOMCAT_HOME%\webapps\PassengerManagementSystem\" /E /Y

REM Check if the deployment was successful
if %errorlevel% neq 0 (
    echo Failed to deploy to Tomcat's webapps directory
    exit /b %errorlevel%
)

echo Build and deployment completed.
pause
