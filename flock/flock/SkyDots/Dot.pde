class Dot{

  PVector pos;
  PVector vel;
  PVector acc;
  color c;
  int s;
  
  float maxSpeed = 0.1;
  float avoidScale = 0.0001;
  float avoidDist = 40;
  float drag = 0.95;
  
  float coherenceScale = 0.01;
  float coherenceDist = 100;
  
  float alignmeVntScale = 0.01;
  float alignmentDist = 100;

  Dot(PVector _pos, color _c, int _s){
    pos = _pos;
    c = _c;
    s = _s;
    vel = new PVector(random(-0.1, 0.1), random(-0.1, 0.1));
    acc = new PVector();
  }
  
  void render(){
    fill(c);
    ellipse(pos.x, pos.y, s, s);
  }
  
  void avoid(){
    PVector av = new PVector();
    for(int i=0; i<Dots.size(); i++){
      Dot D = (Dot) Dots.get(i);
      float dis = pos.dist(D.pos);
      if (dis < avoidDist){
        PVector p = PVector.sub(pos, D.pos);
        float sc = avoidScale * (avoidDist - dis/avoidDist);
        p.mult(sc);
        av.add(p);
      }
    
    }
    acc.add(av);
  }
  
  
  void coherence(){
    PVector ave = new PVector();
    int count = 0;
    for(int i = 0; i < Dots.size(); i++){
      Dot D = (Dot) Dots.get(i);
      if (pos.dist(D.pos) < coherenceDist){
        ave.add(D.pos);
        count++;
      
      }
    }ave.div(count);
    PVector p = PVector.sub(ave, pos);
    p.normalize();
    p.mult(coherenceScale);
    acc.add(p);
  }
  
  void alignment(){
    PVector ave = new PVector();
    int count = 0;
    for(int i = 0; i < Dots.size(); i++){
      Dot D = (Dot) Dots.get(i);
      if (pos.dist(D.pos) < alignmentDist){
        ave.add(D.vel);
        count++;
      
      }
    }
    ave.div(count);
    ave.normalize();
    acc.add(ave);
  }
  
  void move(){
    vel.limit(5);
    pos.add(vel);
    vel.add(acc);
    acc.mult(0);
  }
  
  void bounce(){
    if(pos.x > width - (s/2)){
      vel.x = vel.x * -0.9;
    }
    if(pos.x < (s/2)){
      vel.x = vel.x * -0.9;
    }
    if(pos.y > height - (s/2)){
      vel.y = vel.y * -0.9;
    }
    if(pos.y < (s/2)){
      vel.y = vel.y * -0.9;
    }
  }
}
