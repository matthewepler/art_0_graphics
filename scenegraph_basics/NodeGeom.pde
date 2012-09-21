class NodeGeom extends NodeBase {
  
 PVector mPosition, mRotation, mScale;
 color mColor;
 float mSideLength; 
  
 NodeGeom(){    // ah ha, two different constructors? If you know stuff, use the one below?
  super();
  mPosition   = new PVector( 0.0, 0.0, 0.0 );
  mRotation   = new PVector( 0.0, 0.0, 0.0);
  mScale      = new PVector( 1.0, 1.0, 1.0);
  mColor      = color( 255, 255, 255 );
  mSideLength = 1.0;
 } 
 
 NodeGeom(PVector iPosition, PVector iRotation, PVector iScale){
  super();
  mPosition   = iPosition.get();
  mRotation   = iRotation.get();  
  mScale      = iScale.get();
  mColor      = color( 255, 255, 255 );
  mSideLength = 1.0; 
 }
 
 void draw() {
  if( getVisibility() ) {
   pushMatrix();
   translate( mPosition.x, mPosition.y, mPosition.z ); 
   scale( mScale.x, mScale.y, mScale.z );
   rotateX( mRotation.x );
   rotateY( mRotation.y );
   rotateZ( mRotation.z );
   
   noStroke();
   fill( mColor );
   rect( -mSideLength/2.0, -mSideLength/2.0, mSideLength, mSideLength );
   int tChildCount = getChildCount();
   for(int i = 0; i < tChildCount; i++ ) {
    getChild(i).draw(); 
   }
   popMatrix();
  } 
 }
 
 // Access 
 PVector getPosition() {
  return mPosition; 
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
 
 float getSideLength() {
  return mSideLength; 
 }
 
 
 // Control
 void setPosition(PVector iValue) {
  mPosition.set( iValue ); 
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

 void setSideLength(float iLength) {
  mSideLength = iLength; 
 } 
}
