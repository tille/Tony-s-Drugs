class Controller extends MovieClip{

  var speed, world, timer, level, pState, health, timeLimit, cont, speed2, pnts;
  var salir = false;

  function onLoad(){
    health = 7;
    world = 1;
    pnts = 0;
    speed = speed2 = 15;
    timeLimit = 45;
    timer = level = pState = cont = 0;
    _root.world1.stop();
  }

  function onEnterFrame(){
    timer ++;
    _root.score.text = pnts;
    if( timer == int(timeLimit/2) ){
      var drug = _root.attachMovie("BadDrug","BadDrug" + _root.getNextHighestDepth(),_root.getNextHighestDepth());
      drug._x = Math.random()*713; 
      var drug = _root.attachMovie("BadDrug","BadDrug" + _root.getNextHighestDepth(),_root.getNextHighestDepth());
      drug._x = Math.random()*713; 
    }
    if( timer > timeLimit ){
      var good = _root.attachMovie("GoodThing","GoodThing" + _root.getNextHighestDepth(),_root.getNextHighestDepth());
      good._x = Math.random()*713;
      timer = 0;
    }
    if( cont++ > (60*10*world)  ) changeWorld();
  }

  function changeState(i){
    if( i == 0 ) detect(0);
    else if( i == 1 ) detect(1);
  }

  function changeLives(){
    _root.controller.relog(1);
    var val = 0;
    while( val <= health ){
      if( val == 0 ) _root.live0._visible = true;
      else if( val == 1 ) _root.live1._visible = true;
      else if( val == 2 ) _root.live2._visible = true;
      else if( val == 3 ) _root.live3._visible = true;
      else if( val == 4 ) _root.live4._visible = true;
      else if( val == 5 ) _root.live5._visible = true;
      else if( val == 6 ) _root.live6._visible = true;
      else if( val == 7 ) _root.live7._visible = true;
      val++;
    }
  }

  function relog(temp1){
    if( temp1 == 1 ){
      _root.live0._visible = false;
      _root.live1._visible = false;
      _root.live2._visible = false;
      _root.live3._visible = false;
      _root.live4._visible = false;
      _root.live5._visible = false;
      _root.live6._visible = false;
      _root.live7._visible = false;
      }else{
        _root.live0._visible = true;
        _root.live1._visible = true;
        _root.live2._visible = true;
        _root.live3._visible = true;
        _root.live4._visible = true;
        _root.live5._visible = true;
        _root.live6._visible = true;
        _root.live7._visible = true;
      }
    }

    function detect(val){
      if( val == 1 ){
        pnts += 5;
        if( health < 7 ) health++;
        }else{
          health--;
          if( health < 0 ){ 
            salir = true;
            pState = 5;
            timeLimit = 9999999;
          }
        }
        changeLives();
        if(!salir) pState = (4-((int(health/2)+1)));
      }

      function changeWorld(){
        timeLimit = timeLimit - 10;
        health = 7;
        cont = 0;
        world++;
        _root.world1.gotoAndStop(world);
        speed += 5;
        speed2 += 5;
      }

    }