


function execute(colors,playerindex) {

    //console.log(numofcolumns,colors,playerindex);

    column0[turn] = colors[0];
    column1[turn] = colors[1];
    column2[turn] = colors[2];
    column3[turn] = colors[3];
    column4[turn] = colors[4];
    column5[turn] = colors[5];
    column6[turn] = colors[6];
    column7[turn] = colors[7];

    fillLine(0,playerindex);
    fillLine(1,playerindex);
    fillLine(2,playerindex);
    fillLine(3,playerindex);
    fillLine(4,playerindex);
    fillLine(5,playerindex);
    fillLine(6,playerindex);
    fillLine(7,playerindex);

    if(turn == 0) {

        filledLine0.remove(0);
        filledLine1.remove(0);
        filledLine2.remove(0);
        filledLine3.remove(0);
        filledLine4.remove(0);
        filledLine5.remove(0);
        filledLine6.remove(0);
        filledLine7.remove(0);
    }

    checkscore(colors);
    fillCodeEntry(playerindex);
    turn = turn + 1;



}

function check(colors,playerindex) {
    var num = 0;
    while(numofcolumns > num) {

        if(colors[num] == undefined || colors[num] == 0) {
         //   console.log("incomplete");
            executeEnable = 0;
            break;
        } else {
            executeEnable = 1;
        }

        num = num + 1;
    }
}


function fillLine(printindex,playerindex) {
    //filledLine.clear();
    switch(printindex) {
              case 0: if(column0[turn] == code[0]) {filledLine0.append(
                          {colorpicked:column0[turn],
                           correct:1})} else {filledLine0.append(
                                                  {colorpicked:column0[turn],
                                                   correct:0})} ;break;

              case 1: if(column1[turn] == code[1]) {filledLine1.append(
                          {colorpicked:column1[turn],
                           correct:1})} else {filledLine1.append(
                                                  {colorpicked:column1[turn],
                                                   correct:0})} ;break;

              case 2: if(column2[turn] == code[2]) {filledLine2.append(
                          {colorpicked:column2[turn],
                           correct:1})} else {filledLine2.append(
                                                  {colorpicked:column2[turn],
                                                   correct:0})} ;break;

              case 3: if(column3[turn] == code[3]) {filledLine3.append(
                          {colorpicked:column3[turn],
                           correct:1})} else {filledLine3.append(
                                                  {colorpicked:column3[turn],
                                                   correct:0})} ;break;

              case 4: if(column4[turn] == code[4]) {filledLine4.append(
                          {colorpicked:column4[turn],
                           correct:1})} else {filledLine4.append(
                                                  {colorpicked:column4[turn],
                                                   correct:0})} ;break;

              case 5: if(column5[turn] == code[5]) {filledLine5.append(
                          {colorpicked:column5[turn],
                           correct:1})} else {filledLine5.append(
                                                  {colorpicked:column5[turn],
                                                   correct:0})} ;break;

              case 6: if(column6[turn] == code[6]) {filledLine6.append(
                          {colorpicked:column6[turn],
                           correct:1})} else {filledLine6.append(
                                                  {colorpicked:column6[turn],
                                                   correct:0})} ;break;

              case 7: if(column7[turn] == code[7]) {filledLine7.append(
                          {colorpicked:column7[turn],
                           correct:1})} else {filledLine7.append(
                                                  {colorpicked:column7[turn],
                                                   correct:0})} ;break;

          }
        }

function createCode() {

        code = [0];

    switch(mode) {

    case 3:  numofcolumns = Math.floor((Math.random() * 2) + 4);
                maxcolors = Math.floor((Math.random() * 3) + 4);
                       for(var num = 0;num < numofcolumns;num = num+1) {
                             code[num] = Math.floor((Math.random() * maxcolors)+1);

        };break;

    default: if(level < 8) { numofcolumns = 4;} else if(level < 16) { numofcolumns = 6;}

        for(var num = 0;num < numofcolumns;num = num+1) {

            switch(level) {
            case 1:code[num] = Math.floor((Math.random() * 3) + 1);maxcolors = 3;break;
            case 2:code[num] = Math.floor((Math.random() * 4) + 1);maxcolors = 4;break;
            case 3:code[num] = Math.floor((Math.random() * 5) + 1);maxcolors = 5;break;
            case 4:code[num] = Math.floor((Math.random() * 6) + 1);maxcolors = 6;break;
            case 5:code[num] = Math.floor((Math.random() * 7) + 1);maxcolors = 7;break;
            default:code[num] = Math.floor((Math.random() * 7) + 1);maxcolors = 7;break;
            }
        };break;
    }

   switch(mode) {
   case 2: if(level == 10) {
           endScreen.mode = 1;
           endScreen.visible = true;
           game.visible = false;

   };break;
   default:if(level == 16) {
           endScreen.mode = 1;
           endScreen.visible = true;
          game.visible = false;

       };break;
   }



}

function checkscore(colors,playerindex) {
    var num = 0;
   //console.log("The code is:"+ code);
   //console.log("The Colors are: "+colors);


    while(num < numofcolumns) {


        if (code[num] == colors[num]) {

            if(previous[num] != colors[num]) {
                //console.log("Point!");
                score = score + (10*combo)
                 combo = combo + 1;
                    }
                    combo = 1;
                previous[num] = colors[num];

        }

        num = num + 1;
    }

    if (hiscore <= score) {hiscore = score}


    if (colors.toString() == code.toString()) {
        //console.log ("WINNER");
        if (turn < numofcolumns) {
            score = score + (100*((numofcolumns*2) -turn));
        }
        nextlevel(playerindex);

    }

 colors = [0];

}

function nextlevel(playerindex) {

    filledLine0.clear();
    filledLine1.clear();
    filledLine2.clear();
    filledLine3.clear();
    filledLine4.clear();
    filledLine5.clear();
    filledLine6.clear();
    filledLine7.clear();

    level = level +1;

    turn = 1;

    //infoWindow.state = "Show"
    infoWindow.played = 0;
    previous = [0];
    colors = [0];
    islocked = 0;
    secondspast = 0;
    createCode();
    fillCodeEntry(playerindex);



}

function fillCodeEntry(playerindex) {
    var num = 0;

  //  console.log(playerindex);

   // if(playerindex == 0) {
    codeEntry.clear();

    while(num < numofcolumns) {

        if(previous[num] > 0 ) {codeEntry.append({colorpicked:previous[num],correct:1,incolumn:0});} else
        {codeEntry.append({colorpicked:previous[num],correct:0,incolumn:0});}

        num = num + 1;
    }

   // }
}

function clearColumns() {

    for(var num = 0;num < filledLine0.count;num = num +1) {
        filledLine0.remove(num);
        filledLine1.remove(num);
        filledLine2.remove(num);
        filledLine3.remove(num);
      //  filledLine4.remove(num);
      //  filledLine5.remove(num);
      //  filledLine6.remove(num);
      //  filledLine7.remove(num);


    }

}

function others(color) {
        var num = 0;

    while(num < numofcolumns) {

        if(color == code[num]) {
            dupls = dupls +1;
        }

        num = num +1;
    }
}

function nextLine() {
    if(gameBoard1.mode == 0) {
    switch(level) {
    case 1: message = "hello there. Lets start with something easy.";emotion = 1;messagedur = 6000;break;
    case 2: message = "well done! lets make this more interesting and add more colors!!!";emotion = 2;messagedur = 6000;break;
    case 3: message = "so you want to make me work huh? very well human. more colors!!!!";emotion = 3;messagedur = 7000;break;
    case 4: message = "more colors!!!!";emotion = 2;messagedur = 4000;break;
    case 5: message = "you're almost computer like!!";emotion = 5;messagedur = 4000;break;
    case 6: message = "this will stop you, for sure"; emotion = 1;messagedur = 4000;break;
    case 7: message = "how can this be!!!"; emotion = 6;messagedur = 4000;break;

    case 8: message = "i shouldn't be upset, i should be happy...";emotion = 1;messagedur = 6000;break;
    case 9: message = "see...happy...i'm happy for you";emotion = 5;messagedur = 6000;break;
    case 10: message = "did you know there are still 6 more croma locks after this one";emotion = 1;messagedur = 7000;break;
    case 11: message = "you should just stop while you're ahead";emotion = 4;messagedur = 4000;break;
    case 12: message = "hey i have an idea...stop and i'll give you whatever money i have on me";emotion = 5;messagedur = 6000;break;
    case 13: message = "this will stop you, for sure"; emotion = 1;messagedur = 4000;break;
    case 14: message = "how can this be?!!!"; emotion = 6;messagedur = 4000;break;
    default: message = "i told them that croma locks were a bad idea"; emotion = 6;messagedur = 4000;break;
}}

    if(gameBoard1.mode == 2) {
    switch(level) {
    case 1: message = "45 seconds on the clock annnnddd go!";emotion = 1;messagedur = 6000;break;
    case 2: message = "well done! lets make this more interesting and add more colors!!!";emotion = 2;messagedur = 6000;break;
    case 3: message = "Not bad human lets add even more colors!!!";emotion = 3;messagedur = 7000;break;
    case 4: message = "more colors!!!!";emotion = 2;messagedur = 4000;break;
    case 5: message = "you're almost computer like!!";emotion = 5;messagedur = 4000;break;
    case 6: message = "I did this one in 10 seconds flat"; emotion = 1;messagedur = 4000;break;
    case 7: message = "how can this be!!!"; emotion = 6;messagedur = 4000;break;

    case 8: message = "Tick-tock goes the clock. Can you get it done in time?";emotion = 1;messagedur = 6000;break;
    case 9: message = "RB1 was right you are good at these!";emotion = 5;messagedur = 6000;break;
    case 10: message = "last one! time to bring it home";emotion = 1;messagedur = 7000;break;
    default: message = "i told them that croma locks were a bad idea"; emotion = 6;messagedur = 4000;break;
}}



}

function scoreboardSave(name,score) {

    var d = new Date();

    var date = d.getDate()+"/"+(d.getMonth() + 1)+"/"+d.getFullYear()+"::"+d.getHours()+":"+d.getMinutes();

   // console.log(date);

  /*  var userStr = "INSERT INTO SCORES VALUES(?,?,?)";
    var data = [name,score,date];

    var testStr = "SELECT * FROM SCORES WHERE name = '"+name+"' AND date = '"+date+"'";


   db.transaction(function(tx) {
       //tx.executeSql("DROP TABLE Card");
        tx.executeSql('CREATE TABLE IF NOT EXISTS SCORES(name TEXT, score INT,date TEXT)');


                    var test = tx.executeSql(testStr);


                        if(test.rows.length == 0) {

                            tx.executeSql(userStr, data);
                        } else {

                        //tx.executeSql(updateUser);
                            }

    }); */


    var http = new XMLHttpRequest();

    var url = "http://openseed.vagueentertainment.com/devs/Vag-01001011/sys76Cod-0115/update.php";
  // console.log(url)
    http.onreadystatechange = function() {
        if (http.readyState == 4) {
            //console.log(http.responseText);
            //userid = http.responseText;
            if(http.responseText == 100) {
                console.log("Incorrect DevID");
            } else if(http.responseText == 101) {
                console.log("Incorrect AppID");
            } else {
                console.log(http.responseText);
                //scores = http.responseText;

            }

        }
    }
    http.open('POST', url.trim(), true);
    //http.send(null);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    http.send("devid=" + devId + "&appid=" + appId + "&mode=save" + "&game=" +gamemode+ "&name=" +name+ "&score=" +score+ "&date=" +date);




    scoreboardLoad();

}

function scoreboardLoad() {

   // var userStr = "INSERT INTO Card VALUES(?,?,?)";
   // var data = [name,score,date];
    scores.clear();

  /*  db.transaction(function(tx) {
       //tx.executeSql("DROP TABLE Card");
        tx.executeSql('CREATE TABLE IF NOT EXISTS SCORES(name TEXT, score INT,date TEXT)');
        var testStr = "SELECT * FROM SCORES WHERE 1 ORDER BY score DESC"
        var pull =  tx.executeSql(testStr);
       var num = 0;



           while (pull.rows.length > num) {

                   if(num == 0) {
                       name = pull.rows.item(num).name;
                       hiscore = pull.rows.item(num).score;
                   }

                   scores.append ({

                                        thename:pull.rows.item(num).name,
                                        thedate:pull.rows.item(num).date.split("::")[0],
                                        thescore:pull.rows.item(num).score
                                         });


               num = num + 1;
           }

    }); */


    var http = new XMLHttpRequest();

    var url = "http://openseed.vagueentertainment.com/devs/Vag-01001011/sys76Cod-0115/update.php";
   //console.log(url)
    http.onreadystatechange = function() {
        if (http.readyState == 4) {
            //console.log(http.responseText);
            //userid = http.responseText;
            if(http.responseText == 100) {
                console.log("Incorrect DevID");
            } else if(http.responseText == 101) {
                console.log("Incorrect AppID");
            } else {
               // console.log(http.responseText);
                var rawscores = http.responseText;
                var num = 1;
                while(rawscores.split(">!<").length > num ) {
                    var lap1 = rawscores.split(">!<")[num];

                    if(num == 1) {
                      highestname = lap1.split(":retrieved:")[0];
                      highestscore = lap1.split(":retrieved:")[1];
                        console.log(highestname);
                        console.log(highestscore);

                    }
                    scores.append ({

                                         thename:lap1.split(":retrieved:")[0],
                                         thedate:lap1.split(":retrieved:")[2].split("::")[0],
                                         thescore:lap1.split(":retrieved:")[1]
                                          });

                    num = num + 1;
                }

            }

        }
    }
    http.open('POST', url.trim(), true);
    //http.send(null);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    http.send("devid=" + devId + "&appid=" + appId + "&mode=get" + "&game=" +gamemode);



}

function loadhi() {

   /* db.transaction(function(tx) {
       //tx.executeSql("DROP TABLE Card");
        tx.executeSql('CREATE TABLE IF NOT EXISTS SCORES(name TEXT, score INT,date TEXT)');
        var testStr = "SELECT * FROM SCORES WHERE 1 ORDER BY score DESC"
        var pull =  tx.executeSql(testStr);
       var num = 0;
                    if(pull.rows.length > 0) {
                       name = pull.rows.item(num).name;
                       hiscore = pull.rows.item(num).score;
                    }

    }); */



        var http = new XMLHttpRequest();

        var url = "http://openseed.vagueentertainment.com/devs/Vag-01001011/sys76Cod-0115/update.php";
     //  console.log(url)
        http.onreadystatechange = function() {
            if (http.readyState == 4) {
                //console.log(http.responseText);
                //userid = http.responseText;
                if(http.responseText == 100) {
                    console.log("Incorrect DevID");
                } else if(http.responseText == 101) {
                    console.log("Incorrect AppID");
                } else {
                 //   console.log(http.responseText);
                    var rawscores = http.responseText;
                       hiscore = rawscores.split(">!<")[1].split(":retrieved:")[1];
                }

            }
        }
        http.open('POST', url.trim(), true);
        //http.send(null);
        http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        http.send("devid=" + devId + "&appid=" + appId + "&mode=get" + "&game=" +gamemode);


}

function cleargame() {

    reset = 0;
    gameBoard1.numofcolumns = 6;
    gameBoard1.turn= 0;
    gameBoard1.level= 0;
    gameBoard1.maxcolors= 3;

    gameBoard1.score= 0;
    hiscore=0;
    gameBoard1.combo=1;
    gameBoard1.previous= [0];
    gamemode = -1;


    gameBoard1.code = [0];
}

function startgame(game) {

   switch (game) {
   case game: gamemode = 0;gameBoard1.visible = true;break;
   case game: gamemode = 1;gameBoard2.visible = true;break;
   }

}
