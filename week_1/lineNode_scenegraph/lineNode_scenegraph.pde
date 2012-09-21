// my first scenegraph, aka "LineNode Scenegraph"
// based on AoGP_SE_001A_Scenegraph by Patrick Hebron
// "Art of Graphics Programming" course, ITP, Fall 2012

// see AoGP_SE_001A_Scenegraph in class folder for original + comments

NodeGeom root;
int childCount = 900;
ArrayList<NodeGeom> allNodes = new ArrayList();

void setup() {
 size( 1400, 800, P3D);
 
  root = new NodeGeom();  // Will we ever need to initialize a NodeBase or is that done automagically now?
  root.setName( "root" );
  root.setOrigin( new PVector( 0.0, 0.0, 0.0 ) );
  allNodes.add( root );
  for( int i = 1; i < childCount; i++ ) {
   NodeGeom newChild = new NodeGeom();
   NodeGeom prevChild = allNodes.get(i-1);
   prevChild.addChild(newChild);
   newChild.setOrigin(prevChild.getTerminal());
   allNodes.add(newChild);    
  }
}



void draw() {
 background(0);
 translate( width/2, height/2, 0.0 );
 root.draw();
  
}
