'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"flutter.js": "1cfe996e845b3a8a33f57607e8b09ee4",
"main.dart.js": "7dd22bd2a2a45bc847aef6e4d9ddd0b1",
"version.json": "d912738be9e14bb70a4baeb303e9f372",
"assets/lib/examples/custom_dashed_divider.dart": "4ac2e919f0b7cc0463a8f1982675527a",
"assets/lib/examples/custom_grooved_divider_1.dart": "303f3545db31f72b86fc30bd9c1118a8",
"assets/lib/examples/custom_grooved_divider_2.dart": "7c20a5b8849b5d389a942922dfa8a694",
"assets/lib/examples/dashed_divider.dart": "b8fca8f520bc330aac916757eb652b0a",
"assets/lib/examples/divider_color.dart": "90397f465bf07f2e6e7b4ef56295f172",
"assets/lib/examples/divider_custom_widget.dart": "88d3110d5d88166a33fd6915094dbcc8",
"assets/lib/examples/divider_highlighted_color.dart": "2bedcdd1eb6b860b603569edfc9a6ba7",
"assets/lib/examples/divider_painter_from_scratch.dart": "3b216552608f10bda307405c31f09037",
"assets/lib/examples/divider_tap_gestures.dart": "d5d852658dc01126c4b80e76f1fd7d42",
"assets/lib/examples/divider_thickness.dart": "637be3729198a39ddcd38f2d2b911285",
"assets/lib/examples/example_widget.dart": "1df4999ab72e49c35f152d33bba7076b",
"assets/lib/examples/get_started.dart": "c65eff43e27daf8595b701865e86ac01",
"assets/lib/examples/grooved_divider_1.dart": "069549235764029276ae7583f573ca9e",
"assets/lib/examples/grooved_divider_2.dart": "a9907193aeacd812b45524416a79ee35",
"assets/lib/examples/horizontal.dart": "ab88fd9e8a61fa468162e3afe1bb675c",
"assets/lib/examples/horizontal_vertical.dart": "aa785b7cd49bbba4545922454a33f066",
"assets/lib/examples/listener.dart": "bfe521270d2a6f078853e94cd7606b00",
"assets/lib/examples/minimal_sizes.dart": "a371b5d33a578cf89177c26cd538c296",
"assets/lib/examples/minimal_weights.dart": "dfdb3dbc1c6e667a1765da3d634e4974",
"assets/lib/examples/programmatically.dart": "4f0b83448281f3ecc24d32007d30e9ca",
"assets/lib/examples/resizable.dart": "3392a9df8ea78227c065ada993424058",
"assets/lib/examples/setting_weight_stateful.dart": "8b08861827422fd045794324d469a8df",
"assets/lib/examples/setting_weight_stateless.dart": "350d1b7722c716bfa2ab6c6724c6d0cf",
"assets/lib/examples/vertical.dart": "29630c6674ce0858ad7e71c8e4cfb760",
"assets/lib/examples/add_remove.dart": "a2474d1af63ce30722e24f8f0af98e63",
"assets/packages/flex_color_picker/assets/opacity.png": "49c4f3bcb1b25364bb4c255edcaaf5b2",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/AssetManifest.json": "cb573a9edc59b4b31817424d8c99d727",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/NOTICES": "fdd386b9b2a4caff5c56c0fc56e8c8b4",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"manifest.json": "36c56deb53bbb9b5db03d53cfadc1537",
"index.html": "8cfe972c7e92ec5a11277a012f918d0b",
"/": "8cfe972c7e92ec5a11277a012f918d0b"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
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
