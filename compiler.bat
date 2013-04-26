IF EXIST C:\Program Files\erl5.9.2\bin goto dirExistOne else goto dirExistTwo
:dirExistOne
cd C:\Program Files\erl5.9.2\bin
goto tidyup

:dirExistTwo
cd C:\Program Files\erl5.9.2\bin
goto tidyup 

:tidyup
cls
erlc C:\Users\LAB314\Documents\GitHub\ErlangCodes\factorial\src\server.erl
erlc C:\Users\LAB314\Documents\GitHub\ErlangCodes\factorial\src\factorialCalculation.erl