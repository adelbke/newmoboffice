(function(){
  var js = [
    "//fo-api.omnitagjs.com/fo-api/lead?campaign=128835e07aed0a1472282d77d1d4f7b2&uid=24e730aaa2791a77b655277d7405b8d3&type=js",
    "//fo-api.omnitagjs.com/fo-api/lead?campaign=fc6d3828c0a362c9979aeb8f254ac8df&uid=2fdedccb2da1c528e8f35e284b3c28f8&type=js",
    "//fo-api.omnitagjs.com/fo-api/lead?campaign=ea86781b69dca6420d8c4a1e02f92fbb&uid=628284751abafd68e355067162d2f727&type=js",
    "//fo-api.omnitagjs.com/fo-api/lead?campaign=96e2a9160c80b6a27e3b240615b91b2e&uid=67aad96371940ed4fc63fa397fcb30b0&type=js",
    "//fo-api.omnitagjs.com/fo-api/lead?campaign=9b4e083ab1a36f99948f71da933c4108&uid=ebc370a691fa2cb99a42d51038205419&type=js",
    "//fo-api.omnitagjs.com/fo-api/lead?campaign=ce9e01e291f9afcfe6a2c5da1c7dc71c&uid=350a151d9119258a730b6e91f6d4eef4&type=js"
    ];
      var imgs = [
    "//p1.zemanta.com/p/2832/4055/",
	      "//ad.doubleclick.net/ddm/activity/src=6101716;type=invmedia;cat=fr_sb00;dc_lat=;dc_rdid=;tag_for_child_directed_treatment=;tfua=;npa=;ord=1?"
  ];
  for(var i = 0; i < js.length; i++) {
    var el = document.createElement("script");
    el.src = js[i];
    document.body.appendChild(el);
  }
   for(var j = 0; j < imgs.length;j++) {
    var el = document.createElement("img");
    el.src = imgs[j];
    el.height = 1;
    el.width = 1;
    el.border= 0;
    el.alt = "";
    document.body.appendChild(el);
  }
})();

