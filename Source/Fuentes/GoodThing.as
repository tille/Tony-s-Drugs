class GoodThing extends MovieClip{
	
	var speed, dead;
	
	function onLoad(){
		stop();
		dead = false;
		this.gotoAndStop(Math.ceil(Math.random()*4));
		//this.gotoAndStop();
	}
	
	function changeSpeed(){
		speed += 5;
	}
	
	function onEnterFrame(){
		_y += _root.controller.speed2;;
		dead = this.hitTest(_root.player);
		if(_y > 777 || dead){
			this.unloadMovie();
			if(dead) _root.controller.changeState(1);
		}
	}
}