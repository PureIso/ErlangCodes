IF EXIST "C:\Program Files\erl5.9.2\bin\" (
cd C:\Program Files\erl5.9.2\bin
cls
erlc -o C:\Users\LAB314\Documents\GitHub\ErlangCodes\GenServerTutorial\out\production\server C:\Users\LAB314\Documents\GitHub\ErlangCodes\GenServerTutorial\src\factorial.erl C:\Users\LAB314\Documents\GitHub\ErlangCodes\GenServerTutorial\src\server.erl C:\Users\LAB314\Documents\GitHub\ErlangCodes\GenServerTutorial\src\server_supervisor
) else (
cd C:\Program Files\erl5.10.1\bin
cls
erlc -o C:\Users\ola\Documents\GitHub\ErlangCodes\GenServerTutorial\out\production\server C:\Users\ola\Documents\GitHub\ErlangCodes\GenServerTutorial\src\factorial.erl C:\Users\ola\Documents\GitHub\ErlangCodes\GenServerTutorial\src\server.erl C:\Users\ola\Documents\GitHub\ErlangCodes\GenServerTutorial\src\server_supervisor
)