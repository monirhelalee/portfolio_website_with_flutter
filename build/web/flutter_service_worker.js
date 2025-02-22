'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "3d4d12e167e9a0f2b17ac5031088eb2d",
"version.json": "7e4083e0112546a3b487136927fa8912",
"index.html": "35325562bb95558517babf6c2bfadacb",
"/": "35325562bb95558517babf6c2bfadacb",
"main.dart.js": "d444459ea13d420049ad349b7156c989",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"favicon.png": "bc413328aa222c69a815b10462b4190e",
"icons/Icon-192.png": "78f54d9f18ef2667009643e45c2f0dd2",
"icons/Icon-maskable-192.png": "78f54d9f18ef2667009643e45c2f0dd2",
"icons/Icon-maskable-512.png": "714f6206339fc8a81f1d560813c49d6b",
"icons/Icon-512.png": "714f6206339fc8a81f1d560813c49d6b",
"manifest.json": "d6dcdfaca301f3a98c9412cdb6691374",
"assets/AssetManifest.json": "88ed8942748e5c2713de53b51256e834",
"assets/NOTICES": "673327b4e7fcf5d22eb2410278a91271",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "0339395b17daf805032b300e6a849609",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/lecle_bubble_timeline/assets/screenshot.png": "7f170b1d4053aa99d51fc5c635d454e4",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "4c2475a57f805db4843e82fe987dd6c3",
"assets/fonts/MaterialIcons-Regular.otf": "7192c5741f1375f12f1b81876b285653",
"assets/assets/email.png": "20927cf24c662c43e17bbae6d39dccbc",
"assets/assets/image_background2.json": "01e112fb58e1ffa76d9ba0a93f73ee83",
"assets/assets/instagram.png": "815849f59130b3008ea2cbdec8745fa1",
"assets/assets/x.png": "0d133ef21b5d30f36544a9b31db85774",
"assets/assets/github.png": "1a625d931f38222cb388fbb4568924bf",
"assets/assets/gitlab.png": "200fac6a3e727a567cba7fd6378df189",
"assets/assets/img.png": "fc668a602533bb30055cb741601fe455",
"assets/assets/my2.png": "4b595aeb6aa317012276cf1c93f58ee1",
"assets/assets/my_logo.png": "5c0132399397052ffcc183869a65130c",
"assets/assets/hive.png": "e7b2ff5773a10b36a5f771c39e813c32",
"assets/assets/linkedin.png": "025d2c9476ade5f31ba8b78d98aedbfd",
"assets/assets/app-store.svg": "0ca6d1bb79c22856c4941171b303425d",
"assets/assets/youtube.png": "48fa37b0b5d47d7e5dcefed70164819c",
"assets/assets/postman.svg": "e4434a630f12c2163929030928db4ecd",
"assets/assets/image_background.json": "2f8428c31510ddfc7e9e8a8e5bd4623e",
"assets/assets/provider.png": "7742b7bc3b6749ec7d902f53ae962b88",
"assets/assets/my.png": "636b4c446aacbbe98645d1801cb1d06f",
"assets/assets/whatsapp.png": "818fb77e4a8e662d85d97771fb8f63fb",
"assets/assets/getx.png": "cb152befc8070517aeb4378fa585c2e0",
"assets/assets/facebook.png": "41b636bacdd38d14cd297ffbd0bfb925",
"assets/assets/hive.svg": "f75ae51c80b0de66fcb91ce441af3869",
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
