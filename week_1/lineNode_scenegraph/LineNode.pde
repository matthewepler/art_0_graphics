class NodeGeom extends NodeBase {
  
 PVector mOrigin, mTerminal, mRotation, mScale;
 color mColor;

 NodeGeom(){    // ah ha, two different constructors? If you know stuff, use the one below?
  super();
  mOrigin     = new PVector( 0.0, 0.0, 0.0 );
  mTerminal   = new PVector( mOrigin.x + random(-300, 300), mOrigin.y + random(-300, 300), 0.0 );
  mRotation   = new PVector( random(0, TWO_PI), random(0, TWO_PI), 0.0 );
  mScale      = new PVector( 1.0, 1.0, 1.0 );
  mColor      = color( 255 );  
 } 
 
 NodeGeom(PVector iOrigin, PVector iTerminal, PVector iRotation, PVector iScale){
  super();
  mOrigin   = iOrigin.get();
  mTerminal   = iTerminal.get();
  mRotation   = iRotation.get();  // oh, this is the way to grab a PVector object from the input variables?
  mScale      = iScale.get();
  mColor      = color( 255, 100);
 }
 
 void draw() {
  if( getVisibility() ) {
   //translate( mOrigin.x, mOrigin.y, mOrigin.z );
   scale( mScale.x, mScale.y, mScale.z );
   rotateX( mRotation.x );
   rotateY( mRotation.y );
   rotateZ( mRotation.z );
   
   noStroke();
   stroke( mColor );
   line( mOrigin.x, mOrigin.y, mTerminal.x, mTerminal.y );
   int tChildCount = getChildCount();
   for(int i = 0; i < tChildCount; i++ ) {
    getChild(i).draw(); 
   }
  } 
 }
 
 // Access 
 PVector getOrigin() {
  return mOrigin; 
 }
 
 PVector getTerminal() {
  return mTerminal; 
 }
 
 PVector getRotation() {
  return mRotation; 
 }
 
 PVector getScale() {
   return mScale;
 }
 
 color getColor() {
  return mColor; 
 }

 
 
 // Control
 void setOrigin(PVector iValue) {
  mOrigin.set( iValue ); 
 }
 
 void setTerminal(PVector iValue) {
  mTerminal.set( iValue ); 
 }
 
 void setRotation(PVector iValue) {
  mRotation.set( iValue ); 
 }
 
 void setScale(PVector iValue) {
  mScale.set( iValue ); 
 }
 
 void setColor(color iColor) {
    mColor = iColor;
  }

}
