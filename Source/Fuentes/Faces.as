class Faces extends MovieClip{

  var speed, dead, estado;

  function onLoad(){
    this.stop();
  }

  function onEnterFrame(){
    estado = _root.controller.pState;
    _root.faces.gotoAndStop(estado+1);
  }
}