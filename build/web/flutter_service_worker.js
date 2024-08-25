'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "53c2a62699a9305e92c36c38e663b0cd",
"version.json": "9b7df833d9f3018b279680f344d491e3",
"index.html": "b5abb67acb4556ab96b7ed089b4a8628",
"/": "b5abb67acb4556ab96b7ed089b4a8628",
"main.dart.js": "d39cdc1fdad10d1a0ecedca19afc316a",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "3d284ae1f9edab80d7e1188cd7740075",
"assets/AssetManifest.json": "ec03606e35d44bc2c57e72ddc17152d0",
"assets/NOTICES": "17de535ddbf6aa7d409b2a77589b2226",
"assets/FontManifest.json": "2d073fbf77f976ddf33bdf4e603e5bb6",
"assets/AssetManifest.bin.json": "a79c8ae235650d65325bb01ae0cef03f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "1d4b7f32bd35ef4ff92309682abd451d",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/assets/images/anim/seaweed-anim7.png": "f42a52486b34b0aae43c505b004b8aec",
"assets/assets/images/anim/seaweed-anim6.png": "53d6f8f6dce1c25e1d846b6f222cf441",
"assets/assets/images/anim/crab_idle.png": "aad6c6eb7c3a23d73131b06bb4a8608d",
"assets/assets/images/anim/seaweed-anim4.png": "5a95954a29fa61d7fdc2c0e419710ddc",
"assets/assets/images/anim/seaweed-anim5.png": "00fdd48bc89c8e4f81016d4ddab77696",
"assets/assets/images/anim/crab_move.png": "bd3a2f2f7a3dae68bece85d2dfc2a444",
"assets/assets/images/anim/seaweed-anim1.png": "f1906fc559b07b550e94de0b6df163e6",
"assets/assets/images/anim/seaweed-anim2.png": "7cd8b2567bf390e1c3daa3742bea6847",
"assets/assets/images/anim/seaweed-anim3.png": "4a508bf361f1528140f27dcd68b1e615",
"assets/assets/images/duoigai.png": "59992ffe177078826dad0edc8f3db9ef",
"assets/assets/images/maotien.png": "e4f63ba8be5b3d1a124c7624d322a8ac",
"assets/assets/images/vogia.png": "a0b57342f99059eacf61ef440f45b246",
"assets/assets/images/nguvayxanh.png": "ca46a6d2ab8046348c86762ef1baa669",
"assets/assets/images/thantien.png": "2dc02ff59b43cb42f409e66237fad4da",
"assets/assets/images/buommonhon.png": "edf648cde2c9121b6bd0a7b62658bddc",
"assets/assets/images/moi.png": "fc4ee532fbdb828da44c4e9523713fec",
"assets/assets/images/bapnexanh.png": "d9717af82def010a6d5c55edf1addfbd",
"assets/assets/images/nguvayvang.png": "6e0e8b21a8337d83affb529f83522d5b",
"assets/assets/images/static/Coral9.png": "044c9ab9c5bc87779a8105fa799127ba",
"assets/assets/images/static/Corallayer2.png": "7679cc7fa730dcd9955c580fa6fdd52e",
"assets/assets/images/static/Corallayer3.png": "a3cad921800d617951f4a9f8a6e43d29",
"assets/assets/images/static/Starfish1.png": "3022fe6dc54f00e06667cffd4c21e6a6",
"assets/assets/images/static/Coral8.png": "45bd64b69647095dd60a668b33b06101",
"assets/assets/images/static/Coral19.png": "8aa7749a6e9a83c42c407b9444f17802",
"assets/assets/images/static/Starfish3.png": "bf8fab31ceb5369d7da2d2f966460122",
"assets/assets/images/static/Corallayer1.png": "410dbe9a694c1b886c51b9b9db38073f",
"assets/assets/images/static/Starfish2.png": "2de4e6769c42fe601cfd2ac0614566fb",
"assets/assets/images/static/Coral18.png": "cf9fd692bbcee90d35fcf15a88a1934b",
"assets/assets/images/static/Coral20.png": "262b6892afa821ed341391b19a016ed8",
"assets/assets/images/static/Corallayer4.png": "2fcbabe5cffb22882eb4bdba6b14f5f5",
"assets/assets/images/static/Coral21.png": "3a504878c34d656f792c462bec2580a2",
"assets/assets/images/static/seaweed2.png": "07eb24fe67ae0714ccc156f47b595cd6",
"assets/assets/images/static/Starfish4.png": "7bc75a31b8f986bf082f46430c02c196",
"assets/assets/images/static/Coral22.png": "27257b644e7eb4e8539014066dbbc78b",
"assets/assets/images/static/seaweed1.png": "41ebc64c3605070438d0152c789438e4",
"assets/assets/images/static/rock3.png": "50c05ed05740be80e922bc5a501ff18d",
"assets/assets/images/static/bubble.png": "b80c7a584a1fbaafb33ac7afa7a6a770",
"assets/assets/images/static/cat1.png": "9a779de186bf0915e7fd3b7fece46372",
"assets/assets/images/static/rock2.png": "251b542745f36f20452d2294c30e0314",
"assets/assets/images/static/cat2.png": "a0892792a34ec74d9de91e043753522f",
"assets/assets/images/static/cat3.png": "69d2f76d365569f811de3c21696ab1d7",
"assets/assets/images/static/rock1.png": "75887526c46f8f393d0eac3ea5f94f35",
"assets/assets/images/static/Shell8.png": "4f93de2ed068d3058c670172c8da4a50",
"assets/assets/images/static/Shell9.png": "98eedeac44c09803f3b9f263434ea3bf",
"assets/assets/images/static/Shell7.png": "8290351aaa23c2a0683f0ba792549de0",
"assets/assets/images/static/Shell6.png": "05ff44f0aa7afb2395c3fec45f75b5f1",
"assets/assets/images/static/Shell4.png": "b5f29ae8184f51e25b05506ac093c834",
"assets/assets/images/static/farsea.jpg": "fa3c86c2785bff6a7087eca44703aa17",
"assets/assets/images/static/Shell14.png": "4eac729150f27a88ac162a1e3f21baf6",
"assets/assets/images/static/Shell5.png": "b82da8a87a7cdc9080263e5425e86cbb",
"assets/assets/images/static/Shell1.png": "7cb89755f69b67a8ac4f4804e523429c",
"assets/assets/images/static/Shell10.png": "6bfa947a7f71f5e8e5e15f2cb5c9a526",
"assets/assets/images/static/Shell11.png": "1abecbdabce5138ffc94908c03c1c885",
"assets/assets/images/static/Shell2.png": "833031686f7b981c6b6e6b399eaa0e85",
"assets/assets/images/static/Shell12.png": "204d8a4bf06df033f271226926d66e5e",
"assets/assets/images/static/Shell3.png": "07d071e244f15a383319a1f780450772",
"assets/assets/images/static/closesea.jpg": "d96d34d55f1e27efffc67da773e66763",
"assets/assets/images/static/Coral13.png": "bdfd279c34eccc27f7d41fc50e3587f3",
"assets/assets/images/static/Coral12.png": "50e0fafc3f07a693facbabf962070042",
"assets/assets/images/static/coral1.png": "7af428436e64afae2dfb57a073e9a451",
"assets/assets/images/static/coral3.png": "7a4bd19c60845f5a75067b2646c76f91",
"assets/assets/images/static/Coral10.png": "c735f4cda7cd46139a478eb3e2428f80",
"assets/assets/images/static/Coral11.png": "b9ad855ad015814a2a37e20d9e03d574",
"assets/assets/images/static/coral2.png": "4e8c922621842f19d820b1bf296b88f4",
"assets/assets/images/static/Coral6.png": "8e617adfe5d29aa201ed23e9b416eb1c",
"assets/assets/images/static/Coral15.png": "13d63fcc38e2b068fa66270816dd378c",
"assets/assets/images/static/Coral14.png": "ffb7598bd685d8b295fba4402bd9c70a",
"assets/assets/images/static/Coral7.png": "02209d3e6cc14e444e69746f6238d50e",
"assets/assets/images/static/Coral5.png": "62e4953f18defd13b882e08f4d5831e5",
"assets/assets/images/static/Coral16.png": "59a6559bbee8fcded81baa4018191675",
"assets/assets/images/static/Coral17.png": "9f91e274792cb6c4bb69519e22346479",
"assets/assets/images/static/Coral4.png": "e851e10277663f2f2a81c7b57c07c727",
"assets/assets/images/quest/seaweed1.png": "045b1622b9bc2c1921a0b301ad006271",
"assets/assets/images/quest/questbg.jpg": "e9e13c248faa7b46aa22be3923e4cb25",
"assets/assets/images/quest/qmark.png": "9dce0f83e047441093d19f7ffe4eef9b",
"assets/assets/images/thu.png": "7a4f4c935f0c0a2911f0e24d1d4d6f2d",
"assets/assets/images/ngua.png": "b2908d789db97a37653dac6eff618ce1",
"assets/assets/images/maptrang.png": "99a7bd6d329ea47fc9e9320cee5c55fd",
"assets/assets/images/speech.png": "e57622dfa3cbfe74a70241dd0ad8563b",
"assets/assets/Brixton-Regular.otf": "ec80d59a0a8a1ca4297cc5f26682ae20",
"assets/assets/menubtn.png": "fe467f3af703811bdb55efb48eb089ad",
"assets/assets/main_menu.mp4": "c376ec647894ed9cb2183f24c25efce3",
"assets/assets/audio/voidocean.mp3": "c8948e5bc069b02076145894b6b866b3",
"assets/assets/audio/nobody.mp3": "78c2b4e27d227bef55d539e2831d2e58",
"assets/assets/Shell-Mera-Stamp.otf": "08a7e3c1d0543d6cba1eb2712ecb6494",
"assets/assets/Shell-Mera-Regular.otf": "67b1587438a3c90f10bc82ab51fd2368",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
