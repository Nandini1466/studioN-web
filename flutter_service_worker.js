'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "40ac202d5fd63f7494f7a933277b86f8",
"version.json": "73b8fe3febe3f28c93f683baf774962c",
"index.html": "fc4631b04ec6ba1439a7da09b88640f2",
"/": "fc4631b04ec6ba1439a7da09b88640f2",
"main.dart.js": "ba542b0dc98cf7d97ef1d9f05d0dcb88",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "b6a4a901b46fa3344f6384ca5b23b6b4",
"assets/AssetManifest.json": "8e6cf27e61909c111a4f8a8fcf83e07c",
"assets/NOTICES": "c6fdb37b38490c9c08a2ae8bafb6ec3d",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/AssetManifest.bin.json": "68ca7223cf2e623f96d5ca24d3599996",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "1cb06cb5609da0bb3a5564eb14abba66",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/assets/images/product_frame_with_candle.jpg": "9e26fb636dc7a768db9ba277602de897",
"assets/assets/images/whatsapp_logo.svg": "9c267728cc56c578f21115cf196f2ec1",
"assets/assets/images/nstudio_logo_small.png": "f729b2df02b3d5ed846859c9f3066ca4",
"assets/assets/images/product_all_candles.jpg": "7293ac2ba80a7c49fa4ad56d5dfb1556",
"assets/assets/images/product_travel_collage.jpeg": "1c22a4480d4d99b00a3d1d41f09bd4c0",
"assets/assets/images/product_jar_candle.jpg": "c2fe6f7cd2c9de079293dd3ddf69bc01",
"assets/assets/images/product_family_collage_1.jpeg": "9d9fc799826bc86b67a1a77782b30d4d",
"assets/assets/images/product_lyrics_hinglish_1.jpeg": "d1e3051381b050d49cbc1ca14310a3fd",
"assets/assets/images/product_lyrics_english.jpg": "045a29edcfaacf2ad2354124d1d714fa",
"assets/assets/images/product_flower_candle_2.JPG": "361562358ab75c64b8be2d7c46927626",
"assets/assets/images/mail_logo.svg": "9f4c50bce504e7b5e6a9f447c4491d4b",
"assets/assets/images/product_flower_candle_1.jpg": "66586dad8d313c11ae4ddcf371acd39a",
"assets/assets/images/product_lyrics_hinglish_2.jpeg": "f48c2e555a0b051ffb112b30971f646b",
"assets/assets/images/product_bubble_candle.JPG": "e77b4218e55e7673cf652b4d335fbc71",
"assets/assets/images/product_lyrics_hindi.jpeg": "4a826c1c2329b206a2607ad7862ff78a",
"assets/assets/images/instagram_logo.svg": "306d4b38fdea66f32989333705d76d56",
"assets/assets/images/product_baby_collage.jpg": "4f001cf9bdf985a7cad2772a55599fc0",
"assets/assets/images/product_family_collage_3.jpg": "a2bef4bdf7ec8d7fefba9eab59432c94",
"assets/assets/images/product_family_collage_2.jpg": "81dc69b10f04dacd2131d530b038ab49",
"assets/assets/images/product_wall_collage.jpg": "b14766e6ce79ac4a3e4a3e2075437673",
"assets/assets/images/nstudio_logo.png": "295c159d5550ca22de0520738f49d111",
"assets/assets/images/product_yarn_candle.jpg": "a45e752564274a203c4b8ea297838f27",
"assets/assets/images/product_coffee_candle_1.jpg": "cfa1141bb499875f6a91fddd5ebdce72",
"assets/assets/images/product_coffee_candle_2.JPG": "d71b348f2a345893d3b8467fd2453006",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
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
