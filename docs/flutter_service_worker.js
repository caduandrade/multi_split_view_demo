'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "canvaskit/canvaskit.js": "43fa9e17039a625450b6aba93baf521e",
"canvaskit/canvaskit.wasm": "04ed3c745ff1dee16504be01f9623498",
"canvaskit/profiling/canvaskit.js": "f3bfccc993a1e0bfdd3440af60d99df4",
"canvaskit/profiling/canvaskit.wasm": "a9610cf39260f60fbe7524a785c66101",
"main.dart.js": "c08a8f0391d8b800a4b01772311e47ca",
"version.json": "4b54b4b9d4244d580051352f7e7eff87",
"assets/lib/horizontal.dart": "c903d8a943782b2cf4c989faed578f7f",
"assets/lib/vertical.dart": "e335b5f6643071a854144eb624f3ea18",
"assets/lib/horizontal_vertical.dart": "d9bca248d65a4864555736bf48ec29dc",
"assets/lib/listener.dart": "dd839805255c4feb4501e663773717d2",
"assets/lib/resizable.dart": "3ad1551a1faea0b8e298f8b5519cec2d",
"assets/lib/divider_color.dart": "eec5d8143ac4e165f2dfdd8c6d5a9e93",
"assets/lib/divider_highlighted_color.dart": "8b318c1b73cd23166461c8395028f8da",
"assets/lib/dashed_divider.dart": "1f67a5860df87bf632524b461c134f90",
"assets/lib/custom_dashed_divider.dart": "873b5fe3fd582bf3dfa50d373ffc2e59",
"assets/lib/grooved_divider_1.dart": "d8aa0c1b7a70845a10742eb3f70c5919",
"assets/lib/custom_grooved_divider_1.dart": "c418458e97f3ad6a995eb2911d8b5aca",
"assets/lib/grooved_divider_2.dart": "a48ac7395cd67ac0815c23cb36c3c9bc",
"assets/lib/custom_grooved_divider_2.dart": "9bf5728b7e3ca72725f9efeef409e00c",
"assets/lib/divider_thickness.dart": "2248e1ecc9e9bf52ead76a4a1e3a3a59",
"assets/lib/divider_custom_widget.dart": "65616ea8b9b4c053eefda584f00c06b4",
"assets/lib/get_started.dart": "83c0b53fcb5854259597e65e5a7d7bb6",
"assets/lib/setting_weight_stateful.dart": "857d832832e8df9e1d9add75970c2df8",
"assets/lib/setting_weight_stateless.dart": "17b51afee5f2de03cbcb5b38e8ee8ff7",
"assets/lib/minimal_weight.dart": "eb5d7c824452a22ffc813ceac3712697",
"assets/lib/minimal_size.dart": "3ba66b6a14c5bfcc48ee3c9a3c10e771",
"assets/lib/add_remove.dart": "7994b71b9de02442636028cde3c3100c",
"assets/packages/flex_color_picker/assets/opacity.png": "49c4f3bcb1b25364bb4c255edcaaf5b2",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/AssetManifest.json": "31e13f9bad7cec2a1466c227ac2c8c91",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/NOTICES": "1dc3cb8fc0bcb610492d492f3375e483",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "d6efb24c183086b463594c3a2be6b220",
"/": "d6efb24c183086b463594c3a2be6b220",
"manifest.json": "b3b4999ffcf5c4e0855e1b26263d3524"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
