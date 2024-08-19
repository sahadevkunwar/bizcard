((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_1008",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var A,E,F,B={rL:function rL(d,e){this.a=d
this.b=e},
nDW(d){var x=B.kuv(),w=x.a
w.toString
A.BS(w,d,E.c3)
return x},
kuv(){var x=new B.bKY()
x.U()
return x},
bKY:function bKY(){this.a=null},
f_Q(d,e){var x,w,v,u,t,s=null,r=" and a width between ",q=" (landscape) or ",p=" (portrait), and each side must be between "
switch(d.a.k(0)){case D.ay0:x=y.g
if(d.a.F(1,x).a.length!==2)A.a1(A.av(A.aL("Expected 2 parameters for image too large",s),s))
x=d.a.F(1,x).a
if(0>=x.length)return A.F(x,0)
x=B.vZE(x[0])
x.toString
return A.b("File size must be "+x+" or smaller",s,"_fileSizeTooLargeMessage",A.a([x],y.h),s)
case D.ay1:x=y.g
if(d.a.F(1,x).a.length!==2)A.a1(A.av(A.aL("Expected 2 parameters for invalid dimensions",s),s))
w=d.a.F(1,x).a
if(0>=w.length)return A.F(w,0)
w=w[0]
x=d.a.F(1,x).a
if(1>=x.length)return A.F(x,1)
x=x[1]
return A.b("Image dimensions must be "+A.E(w)+" px by "+A.E(x)+" px",s,"_exactDimensionsError",A.a([w,x],y.h),s)
case D.ay2:x=y.g
if(d.a.F(1,x).a.length!==3)A.a1(A.av(A.aL("Expected 3 parameters for invalid dimension range",s),s))
if(e===C.R8){w=d.a.F(1,x).a
if(0>=w.length)return A.F(w,0)
w=w[0]
v=d.a.F(1,x).a
if(1>=v.length)return A.F(v,1)
v=v[1]
u=d.a.F(1,x).a
if(2>=u.length)return A.F(u,2)
u=B.c1n(u[2],!1)
x=d.a.F(1,x).a
if(2>=x.length)return A.F(x,2)
x=B.c1n(x[2],!0)
return A.b("Screenshot aspect ratio can't exceed "+u+q+x+p+A.E(w)+" px and "+A.E(v)+" px",s,"_screenshotDimensionRangeError",A.a([w,v,u,x],y.h),s)}w=d.a.F(1,x).a
if(0>=w.length)return A.F(w,0)
w=w[0]
v=d.a.F(1,x).a
if(1>=v.length)return A.F(v,1)
v=v[1]
u=d.a.F(1,x).a
if(2>=u.length)return A.F(u,2)
u=B.c1n(u[2],!1)
x=d.a.F(1,x).a
if(2>=x.length)return A.F(x,2)
x=B.c1n(x[2],!0)
return A.b("Image aspect ratio can't exceed "+u+q+x+p+A.E(w)+" px and "+A.E(v)+" px",s,"_genericDimensionRangeError",A.a([w,v,u,x],y.h),s)
case D.Hx:return $.unW()
case D.ay3:x=y.g
if(d.a.F(1,x).a.length!==3)A.a1(A.av(A.aL("Expected 3 parameters for invalid aspect ratio",s),s))
if(e===C.bxj){w=d.a.F(1,x).a
if(2>=w.length)return A.F(w,2)
t=A.We(w[2])
w=t==null?!0:t>1
v=y.h
u=d.a
if(w){w=u.F(1,x).a
if(0>=w.length)return A.F(w,0)
w=w[0]
u=d.a.F(1,x).a
if(1>=u.length)return A.F(u,1)
u=u[1]
x=d.a.F(1,x).a
if(2>=x.length)return A.F(x,2)
x=B.c1n(x[2],!1)
v=A.b("Landscape screenshots must have an aspect ratio of "+x+r+A.E(w)+" px and "+A.E(u)+" px",s,"_landscapeScreenshotAspectRatioInvalidMessage",A.a([w,u,x],v),s)
x=v}else{w=u.F(1,x).a
if(0>=w.length)return A.F(w,0)
w=w[0]
u=d.a.F(1,x).a
if(1>=u.length)return A.F(u,1)
u=u[1]
x=d.a.F(1,x).a
if(2>=x.length)return A.F(x,2)
x=B.c1n(x[2],!1)
v=A.b("Portrait screenshots must have an aspect ratio of "+x+r+A.E(w)+" px and "+A.E(u)+" px",s,"_portraitScreenshotAspectRatioInvalidMessage",A.a([w,u,x],v),s)
x=v}return x}w=d.a.F(1,x).a
if(0>=w.length)return A.F(w,0)
w=w[0]
v=d.a.F(1,x).a
if(1>=v.length)return A.F(v,1)
v=v[1]
x=d.a.F(1,x).a
if(2>=x.length)return A.F(x,2)
x=B.c1n(x[2],!1)
return A.b("Image must have an aspect ratio of "+x+r+A.E(w)+" px and "+A.E(v)+" px",s,"_aspectRatioInvalidMessage",A.a([w,v,x],y.h),s)
case D.a6I:throw A.P(A.av("Error without key, "+d.ab(0),s))}throw A.P(A.av("Unknown validation error: "+d.ab(0),s))},
vZE(d){var x=A.We(d)
if(x==null)return null
return F.l2(x,2)},
c1n(d,e){var x=B.vZD(d,e),w=C.eZx.A(0,x)
return w==null?x:w},
vZD(d,e){var x=A.We(d)
if(x==null)return""
if(e)x=1/x
return x>1?B.om3(x)+":1":"1:"+B.om3(1/x)},
om3(d){return d===E.J.hI(d)?E.J.iE(d,0):E.J.iE(d,2)}},C,D
A=c[0]
E=c[2]
F=c[1249]
B=a.updateHolder(c[1141],B)
C=c[2068]
D=c[1827]
B.rL.prototype={}
B.bKY.prototype={
S(d){var x=B.kuv()
x.T(this)
return x},
gR(){return $.qUT()}}
var z=a.updateTypes(["bKY()","o(zO{imageType:rL?})"]);(function installTearOffs(){var x=a._static_0,w=a.installStaticTearOff
x(B,"xdV","kuv",0)
w(B,"kNu",1,function(){return{imageType:null}},["$2$imageType","$1"],["f_Q",function(d){return B.f_Q(d,null)}],1,0)})();(function inheritance(){var x=a.inherit
x(B.rL,A.ae)
x(B.bKY,A.B)})()
A.ah(b.typeUniverse,JSON.parse('{"rL":{"ae":[]},"bKY":{"B":[]}}'))
var y={h:A.f("t<C>"),g:A.f("o")};(function constants(){C.bxj=new B.rL(12,"IMAGE_TYPE_STORE_LISTING_BATTLESTAR_SCREENSHOT")
C.R8=new B.rL(5,"IMAGE_TYPE_STORE_LISTING_SCREENSHOT")
C.hKM={"1.78:1":0,"1:1.78":1,"1.33:1":2,"1:1.33":3}
C.eZx=new A.w(C.hKM,["16:9","9:16","4:3","3:4"],A.f("w<o*,o*>"))
C.hM5=new A.dH("play.console.apps.api.imageupload")})();(function lazyInitializers(){var x=a.lazyFinal
x($,"DI1","qUT",()=>{var w=A.D("ImageUploadResponse",B.xdV(),null,C.hM5,null,null)
w.M(1,"uploadedImage",A.oB(),A.f("hw"))
return w})
x($,"GGr","unW",()=>{var w=null
return A.b("File type must be PNG or JPEG",w,w,w,w)})})()};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_1008",e:"endPart",h:b})})($__dart_deferred_initializers__,"rvGcb6aeUCCdl2YqStrM8MzavPw=");
//# sourceMappingURL=main.dart.js_1008.part.js.map
