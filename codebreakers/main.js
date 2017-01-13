
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

   if(level < 10) { numofcolumns = 4;} else if(level < 20) { numofcolumns = 6;} else if (level < 40) {numofcolumns = 8;}

   for(var num = 0;num < numofcolumns;num = num+1) {
       code[num] = Math.floor((Math.random() * 7) + 1);
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
        console.log ("WINNER");
        if (turn < numofcolumns) {
            score = score + (100*((numofcolumns*2) -turn));
        }
        nextlevel();
    }

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

    infoWindow.state = "Show"

    createCode();
    fillCodeEntry();
    previous = [0];


}

function fillCodeEntry() {
    var num = 0;
    codeEntry.clear();

    while(num < numofcolumns) {

        if(previous[num] > 0 ) {codeEntry.append({colorpicked:previous[num],correct:1});} else
        {codeEntry.append({colorpicked:previous[num],correct:0});}

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
