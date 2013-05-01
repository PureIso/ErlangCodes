IF EXIST "C:\Program Files\erl5.9.2\bin\" (
cd C:\Program Files\erl5.9.2\bin
cls
erlc C:\Users\LAB314\Documents\GitHub\ErlangCodes\factorial\src\server.erl C:\Users\LAB314\Documents\GitHub\ErlangCodes\factorial\src\factorialCalculation.erl
) else (
cd C:\Program Files\erl5.10.1\bin
cls
erlc -o C:\Users\ola\Documents\GitHub\ErlangCodes\factorial\ebin\ C:\Users\ola\Documents\GitHub\ErlangCodes\factorial\src\server.erl C:\Users\ola\Documents\GitHub\ErlangCodes\factorial\src\factorialCalculation.erl
)