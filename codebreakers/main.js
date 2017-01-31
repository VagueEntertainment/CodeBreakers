


function execute(colors) {

   // console.log(numofcolumns,colors);

    column0[turn] = colors[0];
    column1[turn] = colors[1];
    column2[turn] = colors[2];
    column3[turn] = colors[3];
    column4[turn] = colors[4];
    column5[turn] = colors[5];
    column6[turn] = colors[6];
    column7[turn] = colors[7];

    fillLine(0);
    fillLine(1);
    fillLine(2);
    fillLine(3);
    fillLine(4);
    fillLine(5);
    fillLine(6);
    fillLine(7);

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
    fillCodeEntry();
    turn = turn + 1;


}

function check(colors) {
    var num = 0;
    while(numofcolumns > num) {

        if(colors[num] == undefined || colors[num] == 0) {
            //console.log("incomplete");
            executeEnable = 0;
            break;
        } else {
            executeEnable = 1;
        }

        num = num + 1;
    }
}


function fillLine(printindex) {
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

   if(level < 6) { numofcolumns = 4;} else if(level < 11) { numofcolumns = 6;} else if (level < 16) {numofcolumns = 8;}

   for(var num = 0;num < numofcolumns;num = num+1) {

       switch(level) {
       case 1:code[num] = Math.floor((Math.random() * 3) + 1);maxcolors = 3;break;
       case 2:code[num] = Math.floor((Math.random() * 4) + 1);maxcolors = 4;break;
       case 3:code[num] = Math.floor((Math.random() * 5) + 1);maxcolors = 5;break;
       case 4:code[num] = Math.floor((Math.random() * 6) + 1);maxcolors = 6;break;
       case 5:code[num] = Math.floor((Math.random() * 7) + 1);maxcolors = 7;break;
       default:code[num] = Math.floor((Math.random() * 7) + 1);maxcolors = 7;break;
       }
   }

   if(level == 17) {
        gameBoard.visible = false;
        endScreen.visible = true;
       talkingBox.visible = false;
       scoreBoard.visible = false;
       level = 0;
    }

}

function checkscore(colors) {
    var num = 0;
   // console.log(code);
   // console.log(colors);


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
        nextlevel();
    }

    colors = [0];

}

function nextlevel() {

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

    createCode();
    fillCodeEntry();
    infoWindow.played = 0;
    previous = [0];
    colors = [0];
    gameBoard.islocked = 0;



}

function fillCodeEntry() {
    var num = 0;
    codeEntry.clear();

    while(num < numofcolumns) {

        if(previous[num] > 0 ) {codeEntry.append({colorpicked:previous[num],correct:1,incolumn:0});} else
        {codeEntry.append({colorpicked:previous[num],correct:0,incolumn:0});}

        num = num + 1;
    }
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
    switch(level) {
    case 1: message = "hello there. this should be easy...even for a human.";emotion = 1;messagedur = 6000;break;
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


}

}

function scoreboardSave(name,score) {

    var d = new Date();

    var date = d.getDate()+"/"+d.getMonth() + 1+"/"+d.getFullYear()+"::"+d.getHours()+":"+d.getMinutes();

    var userStr = "INSERT INTO SCORES VALUES(?,?,?)";
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

    });

    scoreboardLoad();

}

function scoreboardLoad() {

   // var userStr = "INSERT INTO Card VALUES(?,?,?)";
   // var data = [name,score,date];
    scores.clear();

    db.transaction(function(tx) {
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

    });

}

function loadhi() {

    db.transaction(function(tx) {
       //tx.executeSql("DROP TABLE Card");
        tx.executeSql('CREATE TABLE IF NOT EXISTS SCORES(name TEXT, score INT,date TEXT)');
        var testStr = "SELECT * FROM SCORES WHERE 1 ORDER BY score DESC"
        var pull =  tx.executeSql(testStr);
       var num = 0;
                    if(pull.rows.length > 0) {
                       name = pull.rows.item(num).name;
                       hiscore = pull.rows.item(num).score;
                    }

    });

}

function cleargame() {

    reset = 0;
    numofcolumns = 6;
    turn= 0;
    level= 0;
    maxcolors= 3;

    score= 0;
    hiscore=0;
    combo=1;
    previous= [0];


    code = [0];
}
