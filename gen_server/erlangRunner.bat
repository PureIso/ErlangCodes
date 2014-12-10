IF EXIST "C:\Program Files\erl5.9.2\bin\" (
cd C:\Program Files\erl5.9.2\bin
erlc -o C:\Users\LAB314\Documents\GitHub\ErlangCodes\GenServerTutorial\out\production\server ^
C:\Users\LAB314\Documents\GitHub\ErlangCodes\GenServerTutorial\src\client.erl ^
C:\Users\LAB314\Documents\GitHub\ErlangCodes\GenServerTutorial\src\server.erl ^
C:\Users\LAB314\Documents\GitHub\ErlangCodes\GenServerTutorial\src\factorial_logic.erl ^
C:\Users\LAB314\Documents\GitHub\ErlangCodes\GenServerTutorial\src\server_supervisor.erl ^
C:\Users\LAB314\Documents\GitHub\ErlangCodes\GenServerTutorial\src\factorial_application.erl
cls
erl -pa C:\Users\LAB314\Documents\GitHub\ErlangCodes\GenServerTutorial\out\production\server -name bar@192.168.1.10 -setcookie 123 -s factorial_system start
) else (
cd C:\Program Files\erl5.10.1\bin
erlc -o C:\Users\ola\Documents\GitHub\ErlangCodes\GenServerTutorial\out\production\server ^
C:\Users\ola\Documents\GitHub\ErlangCodes\GenServerTutorial\src\client.erl ^
C:\Users\ola\Documents\GitHub\ErlangCodes\GenServerTutorial\src\server.erl ^
C:\Users\ola\Documents\GitHub\ErlangCodes\GenServerTutorial\src\factorial_logic.erl ^
C:\Users\ola\Documents\GitHub\ErlangCodes\GenServerTutorial\src\server_supervisor.erl ^
C:\Users\ola\Documents\GitHub\ErlangCodes\GenServerTutorial\src\factorial_system.erl
cls
erl -pa C:\Users\ola\Documents\GitHub\ErlangCodes\GenServerTutorial\out\production\server -name bar@192.168.1.10 -setcookie 123 -s factorial_system start
)
	