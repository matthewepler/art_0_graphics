class NodeBase {
  
 String mName;
 NodeBase mParent;
 ArrayList<NodeBase> mChildren;
 boolean mVisibility;

 NodeBase(){
  mName = "untitled";  
  mVisibility = true;
  mParent = null;
  mChildren = new ArrayList();
 } 
 
 void setName(String iName){
  mName = iName; 
 }
 
 String getName(){
  return mName; 
 }
 
 void addChild(NodeBase iChild){
  iChild.setParent( this );      
  mChildren.add( iChild );
 }
 
 void removeChild(int iIndex){
  if(iIndex >=0 && iIndex < mChildren.size()){
   mChildren.get( iIndex ).setParent( null );  // two functions called on same object simultaneously?
   mChildren.remove( iIndex );                 // wouldn't this shift the index for all children after it in the ArrayList?
  }
 }
 
 NodeBase getChild(int iIndex){
  if( iIndex >= 0 && iIndex < mChildren.size() ) {
   return mChildren.get( iIndex );
  } 
  return null;
 }
 
 int getChildCount() {       
  return mChildren.size(); 
 }
 
 void setParent(NodeBase iParent) {
  mParent = iParent; 
 }
 
 NodeBase getParent() {   
  return mParent; 
 }
 
 boolean isRootNode(){
  return (mParent == null);   // is this a return statement with a condition test? 
 }
 
 NodeBase getRootNode() {
  if( isRootNode() ) {
   return this;
  } 
  return mParent.getRootNode();  // recursive check. nice.
 }
 
 boolean getVisibility() {
  return mVisibility; 
 }
 
 boolean getParentVisibility() {
  if( isRootNode() ) {
   return mVisibility;
  } 
  return(mParent.getVisibility() && mVisibility);
 }
 
 void setVisibility(boolean iVisibility) {
  mVisibility = iVisibility; 
 }
 
 void toggleVisibility() {
  mVisibility = !mVisibility; 
 }
 
 void print(int iIndent) {
  if( getVisibility() ) {
   String indent = " ";
   int len = indent.length() * iIndent;
   String indentStr = new String(new char[len]).replace( "\0", indent ); // ?? haven't seen this initializer for Strings before!
   println( indentStr + mName );                                         // I think it means put an array of " " equal to the length of len at the beginning of indent, thereby replacing the single space.
   int tChildCount = getChildCount(); 
   for(int i = 0; i < tChildCount; i++) {
     mChildren.get( i ).print( iIndent + 1 ); 
   }
  } 
 }
 
 void draw() {
  // "Stub method"   // what's a stub method?
  // how can we have two draw methods if NodeGeom extends this? Isn't that confusing? 
 }
  
}
