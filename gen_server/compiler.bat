IF EXIST "C:\Program Files\erl5.9.2\bin\" (
cd C:\Program Files\erl5.9.2\bin
erlc -o C:\Users\LAB314\Documents\GitHub\ErlangCodes\GenServerTutorial\out\production\server ^
C:\Users\LAB314\Documents\GitHub\ErlangCodes\GenServerTutorial\src\client.erl ^
C:\Users\LAB314\Documents\GitHub\ErlangCodes\GenServerTutorial\src\server.erl ^
C:\Users\LAB314\Documents\GitHub\ErlangCodes\GenServerTutorial\src\factorial_logic.erl ^
C:\Users\LAB314\Documents\GitHub\ErlangCodes\GenServerTutorial\src\server_supervisor.erl ^
C:\Users\LAB314\Documents\GitHub\ErlangCodes\GenServerTutorial\src\factorial_system.erl
cls
) else (
cd C:\Program Files\erl5.10.1\bin
erlc -o C:\Users\ola\Documents\GitHub\ErlangCodes\GenServerTutorial\out\production\server ^
C:\Users\ola\Documents\GitHub\ErlangCodes\GenServerTutorial\src\client.erl ^
C:\Users\ola\Documents\GitHub\ErlangCodes\GenServerTutorial\src\server.erl ^
C:\Users\ola\Documents\GitHub\ErlangCodes\GenServerTutorial\src\factorial_logic.erl ^
C:\Users\ola\Documents\GitHub\ErlangCodes\GenServerTutorial\src\server_supervisor.erl ^
C:\Users\ola\Documents\GitHub\ErlangCodes\GenServerTutorial\src\factorial_system.erl
cls
)
