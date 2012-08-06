import flash.external.ExternalInterface;

class Player extends MovieClip{

  var speed, scale, tempState, pLeft, pRight;
  var cosa = true;

  function onLoad(){
    this.stop();
    speed = 20;
    scale = _xscale;
  }

  function playAnimation(val){
    _root.player.gotoAndStop(val);
  }

  function reiniciar(){
    _root.controller.health = 7;
    _root.controller.timeLimit = 45;
    _root.player.speed = 20;
    _root.player.cosa = true;
    _root.player.gotoAndStop(1);
    _root.controller.salir = false;
    _root.controller.relog(0);
    _root.controller.speed = _root.controller.speed2 = 15;
    _root.controller.world = _root.controller.pnts = _root.controller.timer = _root.controller.level = _root.controller.pState = _root.controller.cont = 0;
  }

  function die(){
    if( cosa ){ 
      _root.campo.text = String(ExternalInterface.call("publicarMensaje",_root.controller.pnts));
      cosa = false;
    }
    _root.player.onRelease=reiniciar
    _root.player.gotoAndStop(9);
    _root.player._x = 350;
    _root.player.speed = 0;
    _xscale = scale;
    _root.controller.relog(1);
  }

  function onEnterFrame(){
    tempState = _root.controller.pState;
    if(tempState == 5) die();
    pLeft = Key.isDown(Key.LEFT);
    pRight = Key.isDown(Key.RIGHT);

    if( pLeft || pRight ){
      if( pLeft && tempState!=5 ){ 
        _xscale = -scale; 
        if( (_x-speed) > 78 ) _x -= speed;
        }else if( tempState!=5 ){ 
          _xscale = scale; 
          if( (_x+speed) < 700 ) _x += speed;
        }

        if( tempState == 0 ) playAnimation(5);
        else if( tempState == 1 ) playAnimation(6);
        else if( tempState == 2 ) playAnimation(7);
        else if( tempState == 3 ) playAnimation(8);
      }
      if( !pLeft && !pRight ){
        if( tempState == 0 ) playAnimation(1);
        else if( tempState == 1 ) playAnimation(2);
        else if( tempState == 2 ) playAnimation(3);
        else if( tempState == 3 ) playAnimation(4);
      }
    }

  }