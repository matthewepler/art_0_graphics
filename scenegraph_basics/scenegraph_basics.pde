// see AoGP_SE_001A_Scenegraph in class folder for original + comments

NodeGeom root;

void setup() {
 size( 500, 500, P3D);
 
  root = new NodeGeom();  // Will we ever need to initialize a NodeBase or is that done automagically now?
  root.setName( "root" );
  root.setColor( color( 255, 255, 255 ) );
  root.setPosition( new PVector( 0.0, 0.0, 0.0 ) );
  root.setSideLength( 50.0 );
  
  NodeGeom childA = new NodeGeom();
  childA.setName( "childA" );
  childA.setColor( color( 255, 0, 0 ) );
  childA.setPosition( new PVector( -100.0, 0.0, 0.0 ) );
  childA.setSideLength( 25.0 );
  root.addChild( childA );
  
  NodeGeom childB = new NodeGeom();
  childB.setName( "childB" );
  childB.setColor( color( 0, 255, 0 ) );
  childB.setPosition( new PVector( 0.0, 100.0, 0.0 ) );
  childB.setSideLength( 25.0 );
  root.addChild( childB );
  
  NodeGeom childC = new NodeGeom();
  childC.setName( "childC" );
  childC.setColor( color( 0, 0, 255 ) );
  childC.setPosition( new PVector( 100.0, 0.0, 0.0 ) );
  childC.setSideLength( 25.0 );
  root.addChild( childC );
  
  NodeGeom childA1 = new NodeGeom();
  childA1.setName( "childA1" );
  childA1.setColor( color( 255, 128, 0 ) );
  childA1.setPosition( new PVector( -50.0, 0.0, 0.0 ) );
  childA1.setSideLength( 12.5 );
  childA.addChild( childA1 );
  
  NodeGeom childA2 = new NodeGeom();
  childA2.setName( "childA2" );
  childA2.setColor( color( 255, 0, 128 ) );
  childA2.setPosition( new PVector( 0.0, 50.0, 0.0 ) );
  childA2.setSideLength( 12.5 );
  childA.addChild( childA2 );
  
  NodeGeom childB1 = new NodeGeom();
  childB1.setName( "childB1" );
  childB1.setColor( color( 0, 255, 128 ) );
  childB1.setPosition( new PVector( 0.0, 50.0, 0.0 ) );
  childB1.setSideLength( 12.5 );
  childB.addChild( childB1 );
  
  NodeGeom childC1 = new NodeGeom();
  childC1.setName( "childC1" );
  childC1.setColor( color( 0, 128, 255 ) );
  childC1.setPosition( new PVector( 50.0, 0.0, 0.0 ) );
  childC1.setSideLength( 12.5 );
  childC.addChild( childC1 );
  
  NodeGeom childA1A = new NodeGeom();
  childA1A.setName( "childA1A" );
  childA1A.setColor( color( 255, 128, 128 ) );
  childA1A.setPosition( new PVector( -25.0, 0.0, 0.0 ) );
  childA1A.setSideLength( 6.25 );
  childA1.addChild( childA1A );
}


void draw() {
 background(0);
 translate( width/2, height/2, 0.0 );
 root.draw();
 root.getRotation().z += 0.01;  // why not setRotation? Ah, I think I see it. But explain anyway, please. 
  
 if( frameCount % 60 == 0) {  // every 1 second (or 60 frames), do the following:
  println("______________________");
  root.print(0);
  NodeBase childA = root.getChild(0);
  if( childA != null ) {
   childA.toggleVisibility(); 
  }
 } 
}
