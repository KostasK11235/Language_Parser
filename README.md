# Language_Parser


  A compiler that checks for errors in a .json file that contains lotterie results from ΟΠΑΠ ΑΕ. The compiler consists of two parts, a lexical analyzer (Flex) and a syntax analyzer (Bison).

  The project.l file contains the lexical analyzer code that reads the .json file and produces the tokens that are fed to the syntax analyzer. The project.y file contains the syntax analyzer code that reads the tokens that the lexical analyzer provides and matches them with rules, to finaly conclude that the file contains any errors or not. 
  
  After the .json file has been parsed, we get printed the number and the position of the errors, if any occured and the content of the .json file. 

  To compile the files: 
  $ bison -ydt project.y
  $ flex project.l
  $ gcc -o parser.exe y.tab.c lex.yy.c -lfl
  
  e.g.
  # We check is there are any errors on the file range_result.txt, that contains no errors.

  $ ./parser.exe range_result.txt

-----------------------------------------------
#Errors: 0
No errors found in the input file.
-----------------------------------------------


{"content":[{"gameId":5104,"drawId":2414,"drawTime":1647374400000,"status":"results","drawBreak":1800000,"visualDraw":2414,"pricePoints":{"amount":0.5},"winningNumbers":{"list":[2,38,23,25,32],"bonus":[9]},"prizeCategories":[{"id":1,"divident":0.0,"winners":0,"distributed":253146.35,"jackpot":1089396.17,"fixed":0.0,"categoryType":0,"gameType":"Normal","minimumDistributed":0.0},{"id":2,"divident":93990.61,"winners":1,"distributed":39141.1,"jackpot":54849.51,"fixed":0.0,"categoryType":0,"gameType":"Normal"},{"id":3,"divident":2500.0,"winners":16,"distributed":40000.0,"jackpot":0.0,"fixed":2500.0,"categoryType":1,"gameType":"Normal"},{"id":4,"divident":2500.0,"winners":16,"distributed":40000.0,"jackpot":0.0,"fixed":2500.0,"categoryType":1,"gameType":"Normal"},{"id":5,"divident":50.0,"winners":803,"distributed":40150.0,"jackpot":0.0,"fixed":50.0,"categoryType":1,"gameType":"Normal"},{"id":6,"divident":2.0,"winners":11148,"distributed":22296.0,"jackpot":0.0,"fixed":2.0,"categoryType":1,"gameType":"Normal"},{"id":7,"divident":2.0,"winners":9917,"distributed":19834.0,"jackpot":0.0,"fixed":2.0,"categoryType":1,"gameType":"Normal"},{"id":8,"divident":1.5,"winners":46429,"distributed":69643.5,"jackpot":0.0,"fixed":1.5,"categoryType":1,"gameType":"Normal"}],"wagerStatistics":{"columns":2033304,"wagers":359687,"addOn":[]}},{"gameId":5104,"drawId":2413,"drawTime":1647201600000,"status":"results","drawBreak":1800000,"visualDraw":2413,"pricePoints":{"amount":0.5},"winningNumbers":{"list":[36,44,16,31,38],"bonus":[8]},"prizeCategories":[{"id":1,"divident":0.0,"winners":0,"distributed":354740.96,"jackpot":734655.21,"fixed":0.0,"categoryType":0,"gameType":"Normal","minimumDistributed":0.0},{"id":2,"divident":0.0,"winners":0,"distributed":54849.51,"jackpot":0.0,"fixed":0.0,"categoryType":0,"gameType":"Normal"},{"id":3,"divident":2500.0,"winners":17,"distributed":42500.0,"jackpot":0.0,"fixed":2500.0,"categoryType":1,"gameType":"Normal"},{"id":4,"divident":50.0,"winners":271,"distributed":13550.0,"jackpot":0.0,"fixed":50.0,"categoryType":1,"gameType":"Normal"},{"id":5,"divident":50.0,"winners":796,"distributed":39800.0,"jackpot":0.0,"fixed":50.0,"categoryType":1,"gameType":"Normal"},{"id":6,"divident":2.0,"winners":11150,"distributed":22300.0,"jackpot":0.0,"fixed":2.0,"categoryType":1,"gameType":"Normal"},{"id":7,"divident":2.0,"winners":12080,"distributed":24160.0,"jackpot":0.0,"fixed":2.0,"categoryType":1,"gameType":"Normal"},{"id":8,"divident":1.5,"winners":68804,"distributed":103206.0,"jackpot":0.0,"fixed":1.5,"categoryType":1,"gameType":"Normal"}],"wagerStatistics":{"columns":2849325,"wagers":498453,"addOn":[]}},{"gameId":5104,"drawId":2412,"drawTime":1646942400000,"status":"results","drawBreak":1800000,"visualDraw":2412,"pricePoints":{"amount":0.5},"winningNumbers":{"list":[23,16,17,27,40],"bonus":[16]},"prizeCategories":[{"id":1,"divident":0.0,"winners":0,"distributed":230875.17,"jackpot":519124.83,"fixed":0.0,"categoryType":0,"gameType":"Normal","minimumDistributed":0.0},{"id":2,"divident":56795.63,"winners":2,"distributed":35697.57,"jackpot":77893.7,"fixed":0.0,"categoryType":0,"gameType":"Normal"},{"id":3,"divident":2500.0,"winners":7,"distributed":17500.0,"jackpot":0.0,"fixed":2500.0,"categoryType":1,"gameType":"Normal"},{"id":4,"divident":50.0,"winners":191,"distributed":9550.0,"jackpot":0.0,"fixed":50.0,"categoryType":1,"gameType":"Normal"},{"id":5,"divident":50.0,"winners":571,"distributed":28550.0,"jackpot":0.0,"fixed":50.0,"categoryType":1,"gameType":"Normal"},{"id":6,"divident":2.0,"winners":9782,"distributed":19564.0,"jackpot":0.0,"fixed":2.0,"categoryType":1,"gameType":"Normal"},{"id":7,"divident":2.0,"winners":7047,"distributed":14094.0,"jackpot":0.0,"fixed":2.0,"categoryType":1,"gameType":"Normal"},{"id":8,"divident":1.5,"winners":31989,"distributed":47983.5,"jackpot":0.0,"fixed":1.5,"categoryType":1,"gameType":"Normal"}],"wagerStatistics":{"columns":1854419,"wagers":338607,"addOn":[]}},{"gameId":5104,"drawId":2411,"drawTime":1646769600000,"status":"results","drawBreak":1800000,"visualDraw":2411,"pricePoints":{"amount":0.5},"winningNumbers":{"list":[16,2,3,14,39],"bonus":[7]},"prizeCategories":[{"id":1,"divident":0.0,"winners":0,"distributed":191738.84,"jackpot":408261.16,"fixed":0.0,"categoryType":0,"gameType":"Normal","minimumDistributed":0.0},{"id":2,"divident":0.0,"winners":0,"distributed":29646.37,"jackpot":48247.33,"fixed":0.0,"categoryType":0,"gameType":"Normal"},{"id":3,"divident":2500.0,"winners":11,"distributed":27500.0,"jackpot":0.0,"fixed":2500.0,"categoryType":1,"gameType":"Normal"},{"id":4,"divident":50.0,"winners":202,"distributed":10100.0,"jackpot":0.0,"fixed":50.0,"categoryType":1,"gameType":"Normal"},{"id":5,"divident":50.0,"winners":572,"distributed":28600.0,"jackpot":0.0,"fixed":50.0,"categoryType":1,"gameType":"Normal"},{"id":6,"divident":2.0,"winners":8301,"distributed":16602.0,"jackpot":0.0,"fixed":2.0,"categoryType":1,"gameType":"Normal"},{"id":7,"divident":2.0,"winners":8441,"distributed":16882.0,"jackpot":0.0,"fixed":2.0,"categoryType":1,"gameType":"Normal"},{"id":8,"divident":1.5,"winners":40987,"distributed":61480.5,"jackpot":0.0,"fixed":1.5,"categoryType":1,"gameType":"Normal"}],"wagerStatistics":{"columns":1540071,"wagers":283493,"addOn":[]}}],"totalPages":1,"totalElements":4,"last":true,"numberOfElements":7,"sort":[{"direction":"DESC","property":"id.drawId","ignoreCase":false,"nullHandling":"NATIVE","descending":true,"ascending":false}],"first":true,"size":10,"number":0}


# Now we run the parser again for the same file but with some errors.

$ ./parser.exe range_results.txt

Syntax error in line: 1 - column: 647
Syntax error in line: 1 - column: 1396

-----------------------------------------------
#Errors: 2
Syntax is incorrect!
-----------------------------------------------


{"content":[{"gameId":5104,"drawId":2414,"drawTime":1647374400000,"status":"results","drawBreak":1800000,"visualDraw":2414,"pricePoints":{"amount":0.5},"winningNumbers":{"list":[2,38,23,25,32],"bonus":[9]},"prizeCategories":[{"id":1,"divident":0.0,"winners":0,"distributed":253146.35,"jackpot":1089396.17,"fixed":0.0,"categoryType":0,"gameType":"Normal","minimumDistributed":0.0},{"id":2,"divident":93990.61,"winners":1,"distributed":39141.1,"jackpot":54849.51,"fixed":0.0,"categoryType":0,"gameType":"Normal"},{"id":3,"divident":2500.0,"winners":16,"distributed":40000.0,"jackpot":0.0,"fixed":2500.0,"categoryType":1,"gameType":"Normal"},{"id":,"divident":2500.0,"winners":16,"distributed":40000.0,"jackpot":0.0,"fixed":2500.0,"categoryType":1,"gameType":"Normal"},{"id":5,"divident":50.0,"winners":803,"distributed":40150.0,"jackpot":0.0,"fixed":50.0,"categoryType":1,"gameType":"Normal"},{"id":6,"divident":2.0,"winners":11148,"distributed":22296.0,"jackpot":0.0,"fixed":2.0,"categoryType":1,"gameType":"Normal"},{"id":7,"divident":2.0,"winners":9917,"distributed":19834.0,"jackpot":0.0,"fixed":2.0,"categoryType":1,"gameType":"Normal"},{"id":8,"divident":1.5,"winners":46429,"distributed":69643.5,"jackpot":0.0,"fixed":1.5,"categoryType":1,"gameType":"Normal"}],"wagerStatistics":{"columns":2033304,"wagers":359687,"addOn":[]}},{"gameId":5104,"drawId":2413,"drawTime":1647201600000,"status""results","drawBreak":1800000,"visualDraw":2413,"pricePoints":{"amount":0.5},"winningNumbers":{"list":[36,44,16,31,38],"bonus":[8]},"prizeCategories":[{"id":1,"divident":0.0,"winners":0,"distributed":354740.96,"jackpot":734655.21,"fixed":0.0,"categoryType":0,"gameType":"Normal","minimumDistributed":0.0},{"id":2,"divident":0.0,"winners":0,"distributed":54849.51,"jackpot":0.0,"fixed":0.0,"categoryType":0,"gameType":"Normal"},{"id":3,"divident":2500.0,"winners":17,"distributed":42500.0,"jackpot":0.0,"fixed":2500.0,"categoryType":1,"gameType":"Normal"},{"id":4,"divident":50.0,"winners":271,"distributed":13550.0,"jackpot":0.0,"fixed":50.0,"categoryType":1,"gameType":"Normal"},{"id":5,"divident":50.0,"winners":796,"distributed":39800.0,"jackpot":0.0,"fixed":50.0,"categoryType":1,"gameType":"Normal"},{"id":6,"divident":2.0,"winners":11150,"distributed":22300.0,"jackpot":0.0,"fixed":2.0,"categoryType":1,"gameType":"Normal"},{"id":7,"divident":2.0,"winners":12080,"distributed":24160.0,"jackpot":0.0,"fixed":2.0,"categoryType":1,"gameType":"Normal"},{"id":8,"divident":1.5,"winners":68804,"distributed":103206.0,"jackpot":0.0,"fixed":1.5,"categoryType":1,"gameType":"Normal"}],"wagerStatistics":{"columns":2849325,"wagers":498453,"addOn":[]}},{"gameId":5104,"drawId":2412,"drawTime":1646942400000,"status":"results","drawBreak":1800000,"visualDraw":2412,"pricePoints":{"amount":0.5},"winningNumbers":{"list":[23,16,17,27,40],"bonus":[16]},"prizeCategories":[{"id":1,"divident":0.0,"winners":0,"distributed":230875.17,"jackpot":519124.83,"fixed":0.0,"categoryType":0,"gameType":"Normal","minimumDistributed":0.0},{"id":2,"divident":56795.63,"winners":2,"distributed":35697.57,"jackpot":77893.7,"fixed":0.0,"categoryType":0,"gameType":"Normal"},{"id":3,"divident":2500.0,"winners":7,"distributed":17500.0,"jackpot":0.0,"fixed":2500.0,"categoryType":1,"gameType":"Normal"},{"id":4,"divident":50.0,"winners":191,"distributed":9550.0,"jackpot":0.0,"fixed":50.0,"categoryType":1,"gameType":"Normal"},{"id":5,"divident":50.0,"winners":571,"distributed":28550.0,"jackpot":0.0,"fixed":50.0,"categoryType":1,"gameType":"Normal"},{"id":6,"divident":2.0,"winners":9782,"distributed":19564.0,"jackpot":0.0,"fixed":2.0,"categoryType":1,"gameType":"Normal"},{"id":7,"divident":2.0,"winners":7047,"distributed":14094.0,"jackpot":0.0,"fixed":2.0,"categoryType":1,"gameType":"Normal"},{"id":8,"divident":1.5,"winners":31989,"distributed":47983.5,"jackpot":0.0,"fixed":1.5,"categoryType":1,"gameType":"Normal"}],"wagerStatistics":{"columns":1854419,"wagers":338607,"addOn":[]}},{"gameId":5104,"drawId":2411,"drawTime":1646769600000,"status":"results","drawBreak":1800000,"visualDraw":2411,"pricePoints":{"amount":0.5},"winningNumbers":{"list":[16,2,3,14,39],"bonus":[7]},"prizeCategories":[{"id":1,"divident":0.0,"winners":0,"distributed":191738.84,"jackpot":408261.16,"fixed":0.0,"categoryType":0,"gameType":"Normal","minimumDistributed":0.0},{"id":2,"divident":0.0,"winners":0,"distributed":29646.37,"jackpot":48247.33,"fixed":0.0,"categoryType":0,"gameType":"Normal"},{"id":3,"divident":2500.0,"winners":11,"distributed":27500.0,"jackpot":0.0,"fixed":2500.0,"categoryType":1,"gameType":"Normal"},{"id":4,"divident":50.0,"winners":202,"distributed":10100.0,"jackpot":0.0,"fixed":50.0,"categoryType":1,"gameType":"Normal"},{"id":5,"divident":50.0,"winners":572,"distributed":28600.0,"jackpot":0.0,"fixed":50.0,"categoryType":1,"gameType":"Normal"},{"id":6,"divident":2.0,"winners":8301,"distributed":16602.0,"jackpot":0.0,"fixed":2.0,"categoryType":1,"gameType":"Normal"},{"id":7,"divident":2.0,"winners":8441,"distributed":16882.0,"jackpot":0.0,"fixed":2.0,"categoryType":1,"gameType":"Normal"},{"id":8,"divident":1.5,"winners":40987,"distributed":61480.5,"jackpot":0.0,"fixed":1.5,"categoryType":1,"gameType":"Normal"}],"wagerStatistics":{"columns":1540071,"wagers":283493,"addOn":[]}}],"totalPages":1,"totalElements":4,"last":true,"numberOfElements":7,"sort":[{"direction":"DESC","property":"id.drawId","ignoreCase":false,"nullHandling":"NATIVE","descending":true,"ascending":false}],"first":true,"size":10,"number":0}
