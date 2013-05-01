IF EXIST "C:\Program Files\erl5.9.2\bin\" (
cd C:\Program Files\erl5.9.2\bin
cls
erlc -o C:\Users\LAB314\Documents\GitHub\ErlangCodes\GenServerTutorial\out\production\server C:\Users\LAB314\Documents\GitHub\ErlangCodes\GenServerTutorial\src\factorial.erl C:\Users\LAB314\Documents\GitHub\ErlangCodes\GenServerTutorial\src\server.erl C:\Users\LAB314\Documents\GitHub\ErlangCodes\GenServerTutorial\src\server_supervisor.erl
erl -pa C:\Users\LAB314\Documents\GitHub\ErlangCodes\GenServerTutorial\out\production\server -name bar@192.168.1.10 -setcookie 123 -s server_supervisor start_link
) else (
cd C:\Program Files\erl5.10.1\bin
cls
erlc -o C:\Users\ola\Documents\GitHub\ErlangCodes\GenServerTutorial\out\production\server C:\Users\ola\Documents\GitHub\ErlangCodes\GenServerTutorial\src\factorial.erl C:\Users\ola\Documents\GitHub\ErlangCodes\GenServerTutorial\src\server.erl C:\Users\ola\Documents\GitHub\ErlangCodes\GenServerTutorial\src\server_supervisor.erl
erl -pa C:\Users\ola\Documents\GitHub\ErlangCodes\GenServerTutorial\out\production\server -name bar@192.168.1.10 -setcookie 123 -s server_supervisor start_link
)
	